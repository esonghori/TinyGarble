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

#include "garbled_circuit.h"

#include "aes.h"
#include "common.h"
#include "tcpip.h"
#include "util.h"

long garble(GarbledCircuit *garbledCircuit, block* inputLabels,
            block* initialDFFLabels, block* outputLabels, block* R,
            int connfd) {
  AES_KEY AES_Key;
  long i, j, cid;

  long startTime = RDTSC;

  AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128,
                      &AES_Key);

  for (cid = 0; cid < garbledCircuit->c; cid++)  //for each clock cycle
      {

    for (i = 0; i < garbledCircuit->n; i++)  //inputs
        {
      garbledCircuit->wires[i].label0 = inputLabels[2
          * (cid * garbledCircuit->n + i)];
      garbledCircuit->wires[i].label1 = inputLabels[2
          * (cid * garbledCircuit->n + i) + 1];
    }

    if (cid == 0)  //dff initial value
        {
      for (i = 0; i < garbledCircuit->p; i++) {
        garbledCircuit->wires[garbledCircuit->n + i].label0 = initialDFFLabels[2
            * i];
        garbledCircuit->wires[garbledCircuit->n + i].label1 = initialDFFLabels[2
            * i + 1];
      }

    } else  //copy latched labels
    {
      for (i = 0; i < garbledCircuit->p; i++) {
        int wireIndex = garbledCircuit->D[i];
        garbledCircuit->wires[garbledCircuit->n + i].label0 = garbledCircuit
            ->wires[wireIndex].label0;
        garbledCircuit->wires[garbledCircuit->n + i].label1 = garbledCircuit
            ->wires[wireIndex].label1;
      }
    }

    for (i = 0; i < garbledCircuit->q; i++)  //for each gates
        {
      int input0, input1, output;
      GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);

      input0 = garbledGate->input0;
      input1 = garbledGate->input1;
      output = garbledGate->output;

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

      block A0, A1, B0, B1, C0, C1;
      block tweak0, tweak1;
      unsigned short pa, pb;
      block keys[4];
      block mask[4];
      block table[2];
      block G, E;

      unsigned short v = type2V(garbledGate->type);
      if (v & 1) {
        A1 = (garbledCircuit->wires[input0].label0);
        A0 = (garbledCircuit->wires[input0].label1);
      } else {
        A0 = (garbledCircuit->wires[input0].label0);
        A1 = (garbledCircuit->wires[input0].label1);
      }

      if (v & 2) {
        B1 = (garbledCircuit->wires[input1].label0);
        B0 = (garbledCircuit->wires[input1].label1);
      } else {
        B0 = (garbledCircuit->wires[input1].label0);
        B1 = (garbledCircuit->wires[input1].label1);
      }

      pa = getLSB(A0);
      pb = getLSB(B0);

      tweak0 = makeBlock(cid, 2 * i + 0);
      tweak1 = makeBlock(cid, 2 * i + 1);

      keys[0] = xorBlocks(A0, tweak0);
      keys[1] = xorBlocks(A1, tweak0);
      keys[2] = xorBlocks(B0, tweak1);
      keys[3] = xorBlocks(B1, tweak1);

      mask[0] = keys[0];
      mask[1] = keys[1];
      mask[2] = keys[2];
      mask[3] = keys[3];
      AES_ecb_encrypt_blks(keys, 4, &(AES_Key));

      mask[0] = xorBlocks(mask[0], keys[0]);
      mask[1] = xorBlocks(mask[1], keys[1]);
      mask[2] = xorBlocks(mask[2], keys[2]);
      mask[3] = xorBlocks(mask[3], keys[3]);

      table[0] = xorBlocks(mask[0], mask[1]);
      if (pb)
        table[0] = xorBlocks(table[0], *R);

      G = mask[0];
      if (pa)
        G = xorBlocks(G, table[0]);

      table[1] = xorBlocks(mask[2], mask[3]);
      table[1] = xorBlocks(table[1], A0);

      E = mask[2];
      if (pb) {
        E = xorBlocks(E, table[1]);
        E = xorBlocks(E, A0);
      }

      if (v & 4) {
        C1 = xorBlocks(G, E);
        C0 = xorBlocks(*R, C1);
      } else {
        C0 = xorBlocks(G, E);
        C1 = xorBlocks(*R, C0);
      }

      garbledCircuit->wires[garbledGate->output].label0 = C0;
      garbledCircuit->wires[garbledGate->output].label1 = C1;

      for (j = 0; j < 2; j++) {
        send_block(connfd, table[j]);
      }
    }

    for (i = 0; i < garbledCircuit->m; i++) {
      block o0 = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
      block o1 = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
      outputLabels[cid * 2 * garbledCircuit->m + 2 * i] = o0;
      outputLabels[cid * 2 * garbledCircuit->m + 2 * i + 1] = o1;
    }
  }
  return (RDTSC - startTime);
}

long evaluate(GarbledCircuit *garbledCircuit, block* inputLables,
              block* initialDFFLable, block *outputLabels, int connfd) {
  int n = garbledCircuit->n;
  int m = garbledCircuit->m;
  int p = garbledCircuit->p;
  int c = garbledCircuit->c;
  long i, j, cid;
  AES_KEY AES_Key;

  long startTime = RDTSC;

  AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128,
                      &AES_Key);

  for (cid = 0; cid < garbledCircuit->c; cid++)  //for each clock cycle
      {
    for (i = 0; i < garbledCircuit->n; i++)  //inputs
        {
      garbledCircuit->wires[i].label0 =
          inputLables[cid * garbledCircuit->n + i];
    }
    if (cid == 0)  //dff initial value
        {
      for (i = 0; i < garbledCircuit->p; i++) {
        garbledCircuit->wires[garbledCircuit->n + i].label0 =
            initialDFFLable[i];
      }
    } else  //copy latched labels
    {
      for (i = 0; i < garbledCircuit->p; i++) {
        int wireIndex = garbledCircuit->D[i];
        garbledCircuit->wires[garbledCircuit->n + i].label0 = garbledCircuit
            ->wires[wireIndex].label0;
      }
    }

    for (i = 0; i < garbledCircuit->q; i++)  // for each gates
        {
      int input0, input1, output;
      GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);
      input0 = garbledGate->input0;
      input1 = garbledGate->input1;
      output = garbledGate->output;

      if (garbledGate->type == XORGATE || garbledGate->type == XNORGATE) {
        garbledCircuit->wires[output].label0 = xorBlocks(
            garbledCircuit->wires[input0].label0,
            garbledCircuit->wires[input1].label0);
      } else if (garbledGate->type == NOTGATE) {
        garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0]
            .label0;
      } else {
        block A, B, C, G, E;
        unsigned short sa, sb;
        block keys[2];
        block mask[2];
        block table[2];
        block tweak0, tweak1;

        A = (garbledCircuit->wires[input0].label0);
        B = (garbledCircuit->wires[input1].label0);

        sa = getLSB(A);
        sb = getLSB(B);

        tweak0 = makeBlock(cid, 2 * i + 0);
        tweak1 = makeBlock(cid, 2 * i + 1);

        for (j = 0; j < 2; j++) {
          recv_block(connfd, &(table[j]));
        }

        keys[0] = xorBlocks(A, tweak0);
        keys[1] = xorBlocks(B, tweak1);

        mask[0] = keys[0];
        mask[1] = keys[1];
        AES_ecb_encrypt_blks(keys, 2, &(AES_Key));

        mask[0] = xorBlocks(mask[0], keys[0]);
        mask[1] = xorBlocks(mask[1], keys[1]);

        G = mask[0];
        if (sa)
          G = xorBlocks(G, table[0]);

        E = mask[1];
        if (sb) {
          E = xorBlocks(E, table[1]);
          E = xorBlocks(E, A);
        }

        C = xorBlocks(E, G);

        garbledCircuit->wires[output].label0 = C;

      }
    }

    for (i = 0; i < garbledCircuit->m; i++) {
      outputLabels[cid * garbledCircuit->m + i] =
          garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
    }
  }
  return (RDTSC - startTime);
}

void createInputLabels(block* inputLabels, block R, int n) {
  for (int i = 0; i < 2 * n; i += 2) {
    inputLabels[i] = randomBlock();
    inputLabels[i + 1] = xorBlocks(R, inputLabels[i]);
  }
}

void removeGarbledCircuit(GarbledCircuit *garbledCircuit) {
  delete []garbledCircuit->garbledGates;
  delete []garbledCircuit->wires;
  delete []garbledCircuit->outputs;
  delete []garbledCircuit->I;
  delete []garbledCircuit->D;
}

