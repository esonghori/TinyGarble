/*
 This file is part of JustGarble.

 JustGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 JustGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with JustGarble.  If not, see <http://www.gnu.org/licenses/>.

 */
/*
 This file is part of TinyGarble. It is modified version of JustGarble
 under GNU license.

 TinyGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 TinyGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with TinyGarble.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "garbled_circuit/garbled_circuit.h"

#include "../util/log.h"
#include "crypto/aes.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

uint64_t garble(GarbledCircuit *garbledCircuit, block* inputLabels,
            block* initialDFFLabels, block* outputLabels, block R,
            int connfd) {
  uint64_t n = garbledCircuit->n;
  uint64_t m = garbledCircuit->m;
  uint64_t p = garbledCircuit->p;
  uint64_t q = garbledCircuit->q;
  uint64_t c = garbledCircuit->c;
  DUMP("r_key.g", R);
  DUMP("r_key.g", garbledCircuit->globalKey);

  uint64_t startTime = RDTSC;

  AES_KEY AES_Key;
  AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128,
                      &AES_Key);

  for (uint64_t cid = 0; cid < c; cid++) {  //for each clock cycle
    for (uint64_t i = 0; i < n; i++) {  //inputs
      garbledCircuit->wires[i].label0 = inputLabels[2
          * (cid * garbledCircuit->n + i)];
      garbledCircuit->wires[i].label1 = inputLabels[2
          * (cid * garbledCircuit->n + i) + 1];

      if (cid == 0)
        DUMP("input.e", inputLabels[2 * (cid * garbledCircuit->n + i)]);
    }

    if (cid == 0) {  //dff initial value
      for (uint64_t i = 0; i < p; i++) {
        garbledCircuit->wires[n + i].label0 = initialDFFLabels[2
            * i];
        garbledCircuit->wires[n + i].label1 = initialDFFLabels[2
            * i + 1];

        DUMP("dff.g",  initialDFFLabels[2 * i]);
      }

    } else {  //copy latched labels
      for (uint64_t i = 0; i < p; i++) {
        uint64_t wireIndex = garbledCircuit->D[i];
        garbledCircuit->wires[n + i].label0 = garbledCircuit
            ->wires[wireIndex].label0;
        garbledCircuit->wires[n + i].label1 = garbledCircuit
            ->wires[wireIndex].label1;
      }
    }

    for (uint64_t i = 0; i < q; i++) {  //for each gates
      GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);

      uint64_t input0 = garbledGate->input0;
      uint64_t input1 = garbledGate->input1;
      uint64_t output = garbledGate->output;

      if (garbledGate->type == XORGATE) {
        garbledCircuit->wires[output].label0 = xorBlocks(
            garbledCircuit->wires[input0].label0,
            garbledCircuit->wires[input1].label0);
        garbledCircuit->wires[output].label1 = xorBlocks(
            garbledCircuit->wires[input0].label1,
            garbledCircuit->wires[input1].label0);

        continue;
      } else if (garbledGate->type == XNORGATE) {
        garbledCircuit->wires[output].label0 = xorBlocks(
            garbledCircuit->wires[input0].label1,
            garbledCircuit->wires[input1].label0);
        garbledCircuit->wires[output].label1 = xorBlocks(
            garbledCircuit->wires[input0].label0,
            garbledCircuit->wires[input1].label0);

        continue;
      } else if (garbledGate->type == NOTGATE) {
        garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0]
            .label1;
        garbledCircuit->wires[output].label1 = garbledCircuit->wires[input0]
            .label0;

        continue;
      }

      block A1;
      block A0;
      unsigned short v = type2V(garbledGate->type);
      if (v & 1) {
        A1 = (garbledCircuit->wires[input0].label0);
        A0 = (garbledCircuit->wires[input0].label1);
      } else {
        A0 = (garbledCircuit->wires[input0].label0);
        A1 = (garbledCircuit->wires[input0].label1);
      }

      block B1;
      block B0;
      if (v & 2) {
        B1 = (garbledCircuit->wires[input1].label0);
        B0 = (garbledCircuit->wires[input1].label1);
      } else {
        B0 = (garbledCircuit->wires[input1].label0);
        B1 = (garbledCircuit->wires[input1].label1);
      }

      unsigned short pa = getLSB(A0);
      unsigned short pb = getLSB(B0);

      block tweak0 = makeBlock(cid, 2 * i + 0);
      block tweak1 = makeBlock(cid, 2 * i + 1);

      block keys[4];
      keys[0] = xorBlocks(A0, tweak0);
      keys[1] = xorBlocks(A1, tweak0);
      keys[2] = xorBlocks(B0, tweak1);
      keys[3] = xorBlocks(B1, tweak1);

      block mask[4];
      mask[0] = keys[0];
      mask[1] = keys[1];
      mask[2] = keys[2];
      mask[3] = keys[3];
      AES_ecb_encrypt_blks(keys, 4, &(AES_Key));

      mask[0] = xorBlocks(mask[0], keys[0]);
      mask[1] = xorBlocks(mask[1], keys[1]);
      mask[2] = xorBlocks(mask[2], keys[2]);
      mask[3] = xorBlocks(mask[3], keys[3]);

      block table[2];
      table[0] = xorBlocks(mask[0], mask[1]);
      if (pb)
        table[0] = xorBlocks(table[0], R);

      block G = mask[0];
      if (pa)
        G = xorBlocks(G, table[0]);

      table[1] = xorBlocks(mask[2], mask[3]);
      table[1] = xorBlocks(table[1], A0);

      block E = mask[2];
      if (pb) {
        E = xorBlocks(E, table[1]);
        E = xorBlocks(E, A0);
      }

      block C0;
      block C1;
      if (v & 4) {
        C1 = xorBlocks(G, E);
        C0 = xorBlocks(R, C1);
      } else {
        C0 = xorBlocks(G, E);
        C1 = xorBlocks(R, C0);
      }

      garbledCircuit->wires[garbledGate->output].label0 = C0;
      garbledCircuit->wires[garbledGate->output].label1 = C1;

      for (uint64_t j = 0; j < 2; j++) {
        send_data(connfd, &table[j], sizeof(block));
        DUMP("table.g", table[j]);
      }
    }

    for (uint64_t i = 0; i < m; i++) {
      block o0 = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
      block o1 = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
      outputLabels[cid * 2 * m + 2 * i] = o0;
      outputLabels[cid * 2 * m + 2 * i + 1] = o1;

      if (cid == c - 1)
        DUMP("output.g", o0);
    }
  }
  return (RDTSC - startTime);
}

uint64_t evaluate(GarbledCircuit *garbledCircuit, block* inputLabels,
              block* initialDFFLable, block *outputLabels, int connfd) {
  uint64_t n = garbledCircuit->n;
  uint64_t m = garbledCircuit->m;
  uint64_t p = garbledCircuit->p;
  uint64_t c = garbledCircuit->c;
  DUMP("r_key.e", garbledCircuit->globalKey);

  uint64_t startTime = RDTSC;

  AES_KEY AES_Key;
  AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128,
                      &AES_Key);

  for (uint64_t cid = 0; cid < c; cid++) {  //for each clock cycle
    for (uint64_t i = 0; i < n; i++) {  //inputs
      garbledCircuit->wires[i].label0 =
          inputLabels[cid * n + i];
      if (cid == 0)
        DUMP("input.e", inputLabels[cid * n + i]);
    }
    if (cid == 0) {  //dff initial value
      for (uint64_t i = 0; i < p; i++) {
        garbledCircuit->wires[n + i].label0 =
            initialDFFLable[i];
        DUMP("dff.e", initialDFFLable[i]);
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < p; i++) {
        uint64_t wireIndex = garbledCircuit->D[i];
        garbledCircuit->wires[n + i].label0 = garbledCircuit
            ->wires[wireIndex].label0;
      }
    }

    for (uint64_t i = 0; i < garbledCircuit->q; i++) {  // for each gates
      GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);
      uint64_t input0 = garbledGate->input0;
      uint64_t input1 = garbledGate->input1;
      uint64_t output = garbledGate->output;

      if (garbledGate->type == XORGATE || garbledGate->type == XNORGATE) {
        garbledCircuit->wires[output].label0 = xorBlocks(
            garbledCircuit->wires[input0].label0,
            garbledCircuit->wires[input1].label0);
      } else if (garbledGate->type == NOTGATE) {
        garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0]
            .label0;
      } else {
        block A = (garbledCircuit->wires[input0].label0);
        block B = (garbledCircuit->wires[input1].label0);

        unsigned short sa = getLSB(A);
        unsigned short sb = getLSB(B);

        block tweak0 = makeBlock(cid, 2 * i + 0);
        block tweak1 = makeBlock(cid, 2 * i + 1);

        block table[2];
        for (uint64_t j = 0; j < 2; j++) {
          recv_data(connfd, &(table[j]), sizeof(block));
          DUMP("table.e", table[j]);
        }

        block keys[2];
        keys[0] = xorBlocks(A, tweak0);
        keys[1] = xorBlocks(B, tweak1);

        block mask[2];
        mask[0] = keys[0];
        mask[1] = keys[1];
        AES_ecb_encrypt_blks(keys, 2, &(AES_Key));

        mask[0] = xorBlocks(mask[0], keys[0]);
        mask[1] = xorBlocks(mask[1], keys[1]);

        block G = mask[0];
        if (sa)
          G = xorBlocks(G, table[0]);

        block E = mask[1];
        if (sb) {
          E = xorBlocks(E, table[1]);
          E = xorBlocks(E, A);
        }

        block C = xorBlocks(E, G);

        garbledCircuit->wires[output].label0 = C;

      }
    }

    for (uint64_t i = 0; i < m; i++) {
      outputLabels[cid * m + i] =
          garbledCircuit->wires[garbledCircuit->outputs[i]].label0;

      if (cid == c - 1)
        DUMP("output.e", outputLabels[cid * m + i]);
    }
  }
  return (RDTSC - startTime);
}

void createInputLabels(block* inputLabels, block R, uint64_t n) {
  for (uint64_t i = 0; i < 2 * n; i += 2) {
    inputLabels[i] = randomBlock();
    inputLabels[i + 1] = xorBlocks(R, inputLabels[i]);
  }
}

void removeGarbledCircuit(GarbledCircuit *garbledCircuit) {
  delete[] garbledCircuit->garbledGates;
  delete[] garbledCircuit->wires;
  delete[] garbledCircuit->outputs;
  delete[] garbledCircuit->I;
  delete[] garbledCircuit->D;
}

