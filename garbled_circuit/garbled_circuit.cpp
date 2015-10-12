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

#include <openssl/bn.h>
#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "util/log.h"
#include "crypto/aes.h"
#include "crypto/OT_extension.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

uint64_t Garble(const GarbledCircuit& garbled_circuit, block** const_labels,
                block** init_labels, block*** input_labels, block global_key,
                block R, uint64_t clock_cycles, int connfd,
                block*** output_labels) {

  DUMP("r_key") << R << endl;
  DUMP("r_key") << global_key << endl;

  BlockPair *wires = nullptr;
  CHECK_ALLOC(wires = new BlockPair[garbled_circuit.get_wire_size()]);

  uint64_t start_time = RDTSC;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < clock_cycles; cid++) {

    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    if (cid == 0) {
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.I[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i].label0 = const_labels[0][0];
          wires[dff_bias + i].label1 = const_labels[0][1];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i].label0 = const_labels[1][0];
          wires[dff_bias + i].label1 = const_labels[1][1];
        } else if (wire_index >= 0
            && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
          wires[dff_bias + i].label0 = init_labels[wire_index][0];
          wires[dff_bias + i].label1 = init_labels[wire_index][1];
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
          wires[dff_bias + i].label0 = const_labels[0][0];
          wires[dff_bias + i].label1 = const_labels[0][1];
        }
        DUMP("dff") << wires[dff_bias + i].label0 << endl;
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.D[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i].label0 = const_labels[0][0];
          wires[dff_bias + i].label1 = const_labels[0][1];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i].label0 = const_labels[1][0];
          wires[dff_bias + i].label1 = const_labels[1][1];
        } else if (wire_index >= 0
            && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
          wires[dff_bias + i].label0 = wires[wire_index].label0;
          wires[dff_bias + i].label1 = wires[wire_index].label1;
        } else {
          LOG(ERROR) << "Invalid D: " << wire_index << endl;
          wires[dff_bias + i].label0 = const_labels[0][0];
          wires[dff_bias + i].label1 = const_labels[0][1];
        }
      }
    }

    // inputs
    uint64_t input_bias = garbled_circuit.get_input_lo_index();
    for (uint64_t i = 0; i < garbled_circuit.get_input_size(); i++) {
      wires[input_bias + i].label0 = input_labels[cid][i][0];
      wires[input_bias + i].label1 = input_labels[cid][i][1];

      if (cid == 0) {
        DUMP("input") << input_labels[cid][i][0] << endl;
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  //for each gates
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];

      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      block input0_labels[2];
      if (input0 == CONST_ZERO) {
        input0_labels[0] = const_labels[0][0];
        input0_labels[1] = const_labels[0][1];
      } else if (input0 == CONST_ONE) {
        input0_labels[0] = const_labels[1][0];
        input0_labels[1] = const_labels[1][1];
      } else if (input0 >= 0
          && input0 < (int64_t) garbled_circuit.get_wire_size()) {
        input0_labels[0] = wires[input0].label0;
        input0_labels[1] = wires[input0].label1;
      } else {
        LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
        input0_labels[0] = const_labels[0][0];
        input0_labels[1] = const_labels[0][1];
      }

      block input1_labels[2];
      if (input1 == CONST_ZERO) {
        input1_labels[0] = const_labels[0][0];
        input1_labels[1] = const_labels[0][1];
      } else if (input1 == CONST_ONE) {
        input1_labels[0] = const_labels[1][0];
        input1_labels[1] = const_labels[1][1];
      } else if (input1 >= 0
          && input1 < (int64_t) garbled_circuit.get_wire_size()) {
        input1_labels[0] = wires[input1].label0;
        input1_labels[1] = wires[input1].label1;
      } else if (type != NOTGATE) {
        LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
        input1_labels[0] = const_labels[0][0];
        input1_labels[1] = const_labels[0][1];
      }

      if (type == XORGATE) {
        wires[output].label0 = XorBlock(input0_labels[0], input1_labels[0]);
        wires[output].label1 = XorBlock(input0_labels[1], input1_labels[0]);
        continue;
      } else if (type == XNORGATE) {
        wires[output].label0 = XorBlock(input0_labels[1], input1_labels[0]);
        wires[output].label1 = XorBlock(input0_labels[0], input1_labels[0]);
        continue;
      } else if (type == NOTGATE) {
        wires[output].label0 = input0_labels[1];
        wires[output].label1 = input0_labels[0];
        continue;
      }

      block A1;
      block A0;
      unsigned short v = Type2V(type);
      if (v & 1) {
        A1 = (input0_labels[0]);
        A0 = (input0_labels[1]);
      } else {
        A0 = (input0_labels[0]);
        A1 = (input0_labels[1]);
      }

      block B1;
      block B0;
      if (v & 2) {
        B1 = (input1_labels[0]);
        B0 = (input1_labels[1]);
      } else {
        B0 = (input1_labels[0]);
        B1 = (input1_labels[1]);
      }

      unsigned short pa = get_LSB(A0);
      unsigned short pb = get_LSB(B0);

      block tweak0 = MakeBlock(cid, 2 * i + 0);
      block tweak1 = MakeBlock(cid, 2 * i + 1);

      block keys[4];
      keys[0] = XorBlock(A0, tweak0);
      keys[1] = XorBlock(A1, tweak0);
      keys[2] = XorBlock(B0, tweak1);
      keys[3] = XorBlock(B1, tweak1);

      block mask[4];
      mask[0] = keys[0];
      mask[1] = keys[1];
      mask[2] = keys[2];
      mask[3] = keys[3];
      AESEcbEncryptBlks(keys, 4, &(AES_Key));

      mask[0] = XorBlock(mask[0], keys[0]);
      mask[1] = XorBlock(mask[1], keys[1]);
      mask[2] = XorBlock(mask[2], keys[2]);
      mask[3] = XorBlock(mask[3], keys[3]);

      block table[2];
      table[0] = XorBlock(mask[0], mask[1]);
      if (pb) {
        table[0] = XorBlock(table[0], R);
      }
      block G = mask[0];
      if (pa) {
        G = XorBlock(G, table[0]);
      }
      table[1] = XorBlock(mask[2], mask[3]);
      table[1] = XorBlock(table[1], A0);

      block E = mask[2];
      if (pb) {
        E = XorBlock(E, table[1]);
        E = XorBlock(E, A0);
      }

      block C0;
      block C1;
      if (v & 4) {
        C1 = XorBlock(G, E);
        C0 = XorBlock(R, C1);
      } else {
        C0 = XorBlock(G, E);
        C1 = XorBlock(R, C0);
      }

      wires[garbledGate.output].label0 = C0;
      wires[garbledGate.output].label1 = C1;

      for (uint64_t j = 0; j < 2; j++) {
        CHECK(SendData(connfd, &table[j], sizeof(block)));
        DUMP("table") << table[j] << endl;
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      output_labels[cid][i][0] = wires[garbled_circuit.outputs[i]].label0;
      output_labels[cid][i][1] = wires[garbled_circuit.outputs[i]].label1;

      if (cid == clock_cycles - 1) {
        DUMP("output") << wires[garbled_circuit.outputs[i]].label0 << endl;
      }
    }
  }
  uint64_t end_time = RDTSC;
  delete[] wires;
  return (end_time - start_time);
}

uint64_t Evaluate(const GarbledCircuit& garbled_circuit, block* const_labels,
                  block* init_labels, block** input_labels, block global_key,
                  uint64_t clock_cycles, int connfd, block** output_labels) {

  DUMP("r_key") << global_key << endl;

  block *wires = nullptr;

  CHECK_ALLOC(wires = new block[garbled_circuit.get_wire_size()]);

  uint64_t start_time = RDTSC;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    if (cid == 0) {
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.I[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i] = const_labels[0];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i] = const_labels[1];
        } else if (wire_index >= 0
            && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
          wires[dff_bias + i] = init_labels[wire_index];
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
          wires[dff_bias + i] = const_labels[0];
        }
        DUMP("dff") << wires[dff_bias + i] << endl;
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.D[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i] = const_labels[0];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i] = const_labels[1];
        } else if (wire_index >= 0
            && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
          wires[dff_bias + i] = wires[wire_index];
        } else {
          LOG(ERROR) << "Invalid D: " << wire_index << endl;
          wires[dff_bias + i] = const_labels[0];
        }
      }
    }
    // inputs
    uint64_t input_bias = garbled_circuit.get_input_lo_index();
    for (uint64_t i = 0; i < garbled_circuit.get_input_size(); i++) {
      wires[input_bias + i] = input_labels[cid][i];
      if (cid == 0) {
        DUMP("input") << input_labels[cid][i] << endl;
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  // for each gates
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      block input0_labels;
      if (input0 == CONST_ZERO) {
        input0_labels = const_labels[0];
      } else if (input0 == CONST_ONE) {
        input0_labels = const_labels[1];
      } else if (input0 >= 0
          && input0 < (int64_t) garbled_circuit.get_wire_size()) {
        input0_labels = wires[input0];
      } else {
        LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
        input0_labels = const_labels[0];
      }

      block input1_labels;
      if (input1 == CONST_ZERO) {
        input1_labels = const_labels[0];
      } else if (input1 == CONST_ONE) {
        input1_labels = const_labels[1];
      } else if (input1 >= 0
          && input1 < (int64_t) garbled_circuit.get_wire_size()) {
        input1_labels = wires[input1];
      } else if (type != NOTGATE) {
        LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
        input1_labels = const_labels[0];
      }

      if (type == XORGATE || type == XNORGATE) {
        wires[output] = XorBlock(input0_labels, input1_labels);
      } else if (type == NOTGATE) {
        wires[output] = input0_labels;
      } else {
        block A = (input0_labels);
        block B = (input1_labels);

        unsigned short sa = get_LSB(A);
        unsigned short sb = get_LSB(B);

        block tweak0 = MakeBlock(cid, 2 * i + 0);
        block tweak1 = MakeBlock(cid, 2 * i + 1);

        block table[2];
        for (uint64_t j = 0; j < 2; j++) {
          CHECK(RecvData(connfd, &(table[j]), sizeof(block)));
          DUMP("table") << table[j] << endl;
        }

        block keys[2];
        keys[0] = XorBlock(A, tweak0);
        keys[1] = XorBlock(B, tweak1);

        block mask[2];
        mask[0] = keys[0];
        mask[1] = keys[1];
        AESEcbEncryptBlks(keys, 2, &(AES_Key));

        mask[0] = XorBlock(mask[0], keys[0]);
        mask[1] = XorBlock(mask[1], keys[1]);

        block G = mask[0];
        if (sa) {
          G = XorBlock(G, table[0]);
        }

        block E = mask[1];
        if (sb) {
          E = XorBlock(E, table[1]);
          E = XorBlock(E, A);
        }

        block C = XorBlock(E, G);

        wires[output] = C;

      }
    }

    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      output_labels[cid][i] = wires[garbled_circuit.outputs[i]];
      if (cid == clock_cycles - 1) {
        DUMP("output") << output_labels[cid][i] << endl;
      }
    }
  }
  uint64_t end_time = RDTSC;
  delete[] wires;
  return (end_time - start_time);
}

int GarbleOTExt(const GarbledCircuit& garbled_circuit, block** init_labels,
                block*** input_labels, uint64_t clock_cycles, int connfd) {

  uint32_t m_len = garbled_circuit.e_init_size
      + clock_cycles * garbled_circuit.e_input_size;
  block **m = nullptr;
  CHECK_ALLOC(m = new block*[m_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    CHECK_ALLOC(m[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      m[i][j] = init_labels[i + garbled_circuit.g_init_size][j];
    }
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint idx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      CHECK_ALLOC(m[idx] = new block[2]);
      for (uint j = 0; j < 2; j++) {
        m[idx][j] = input_labels[cid][i + garbled_circuit.g_input_size][j];
      }
    }
  }

  uint64_t start_time = RDTSC;
  CHECK(OTExtSend(m, m_len, connfd));
  uint64_t end_time = RDTSC;

  LOG(INFO) << "Total OT Extension send time (cc) = " << end_time - start_time
            << "\tOT Extension send time per byte (cc/Byte) = "
            << (end_time - start_time) / ((double) (m_len * sizeof(block)))
            << endl;

  if (m != nullptr) {
    for (uint i = 0; i < m_len; i++) {
      delete[] m[i];
    }
    delete[] m;
  }

  return SUCCESS;
}

int EvalauteOTExt(const GarbledCircuit& garbled_circuit, short* e_init,
                  block* init_labels, short** e_input, block** input_labels,
                  uint64_t clock_cycles, int connfd) {
  uint32_t m_len = garbled_circuit.e_init_size
      + clock_cycles * garbled_circuit.e_input_size;
  bool *sel = nullptr;
  CHECK_ALLOC(sel = new bool[m_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    sel[i] = e_init[i];
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint indx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      sel[indx] = e_input[cid][i];
    }
  }

  block* m = nullptr;
  CHECK_ALLOC(m = new block[m_len]);

  uint64_t start_time = RDTSC;
  CHECK(OTExtRecv(sel, m_len, connfd, m));
  uint64_t end_time = RDTSC;

  LOG(INFO) << "Total OT Extension send time (cc) = " << end_time - start_time
            << "\tOT Extension send time per byte (cc/Byte) = "
            << (end_time - start_time) / ((double) (m_len * sizeof(block)))
            << endl;

  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    init_labels[i + garbled_circuit.g_init_size] = m[i];
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint indx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      input_labels[cid][i + garbled_circuit.g_input_size] = m[indx];
    }
  }

  delete[] sel;
  delete[] m;

  return SUCCESS;
}

int GarbleTransferLabels(const GarbledCircuit& garbled_circuit,
                         block** const_labels, short* g_init,
                         block** init_labels, short** g_input,
                         block*** input_labels, uint64_t clock_cycles,
                         bool disable_OT, int connfd) {
  // constant
  CHECK(SendData(connfd, &const_labels[0][0], sizeof(block)));
  CHECK(SendData(connfd, &const_labels[1][1], sizeof(block)));

  // g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    if (g_init[i] == 0) {
      CHECK(SendData(connfd, &init_labels[i][0], sizeof(block)));
    } else {
      CHECK(SendData(connfd, &init_labels[i][1], sizeof(block)));
    }
  }
  // g_input
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      if (g_input[cid][i] == 0) {
        CHECK(SendData(connfd, &input_labels[cid][i][0], sizeof(block)));
      } else {
        CHECK(SendData(connfd, &input_labels[cid][i][1], sizeof(block)));
      }
    }
  }

  if (disable_OT) {
    // e_init
    short* e_init = nullptr;
    if (garbled_circuit.e_init_size > 0) {
      CHECK_ALLOC(e_init = new short[garbled_circuit.e_init_size]);
      CHECK(
          RecvData(connfd, e_init, garbled_circuit.e_init_size * sizeof(short)));
      for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
        if (e_init[i] == 0) {
          CHECK(
              SendData(connfd, &init_labels[i + garbled_circuit.g_init_size][0],
                       sizeof(block)));
        } else {
          CHECK(
              SendData(connfd, &init_labels[i + garbled_circuit.g_init_size][1],
                       sizeof(block)));
        }
      }
    }
    // e_input
    short** e_input = nullptr;
    CHECK_ALLOC(e_input = new short*[clock_cycles]);
    for (uint cid = 0; cid < clock_cycles; cid++) {
      if (garbled_circuit.e_input_size > 0) {
        CHECK_ALLOC(e_input[cid] = new short[garbled_circuit.e_input_size]);
        CHECK(
            RecvData(connfd, e_input[cid],
                     garbled_circuit.e_input_size * sizeof(short)));
        for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
          if (e_input[cid][i] == 0) {
            CHECK(
                SendData(
                    connfd,
                    &input_labels[cid][i + garbled_circuit.g_input_size][0],
                    sizeof(block)));
          } else {
            CHECK(
                SendData(
                    connfd,
                    &input_labels[cid][i + garbled_circuit.g_input_size][1],
                    sizeof(block)));
          }
        }
      } else {
        e_input[cid] = nullptr;
      }
    }
    if (e_init != nullptr) {
      delete[] e_init;
    }
    for (uint cid = 0; cid < clock_cycles; cid++) {
      if (e_input[cid] != nullptr) {
        delete[] e_input[cid];
      }
    }
    delete[] e_input;

  } else {
    CHECK(
        GarbleOTExt(garbled_circuit, init_labels, input_labels, clock_cycles,
                    connfd));
  }
  return SUCCESS;
}

int EvaluateTransferLabels(const GarbledCircuit& garbled_circuit,
                           block* const_labels, short* e_init,
                           block* init_labels, short** e_input,
                           block** input_labels, uint64_t clock_cycles,
                           bool disable_OT, int connfd) {
  // constant
  CHECK(RecvData(connfd, &const_labels[0], sizeof(block)));
  CHECK(RecvData(connfd, &const_labels[1], sizeof(block)));

  // g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    CHECK(RecvData(connfd, &init_labels[i], sizeof(block)));
  }
  // g_input
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      CHECK(RecvData(connfd, &input_labels[cid][i], sizeof(block)));
    }
  }

  if (disable_OT) {
    // e_init
    CHECK(SendData(connfd, e_init, garbled_circuit.e_init_size * sizeof(short)));
    for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
      CHECK(
          RecvData(connfd, &init_labels[i + garbled_circuit.g_init_size],
                   sizeof(block)));
    }
    // e_input
    for (uint cid = 0; cid < clock_cycles; cid++) {
      CHECK(
          SendData(connfd, e_input[cid],
                   garbled_circuit.e_input_size * sizeof(short)));
      for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
        CHECK(
            RecvData(connfd,
                     &input_labels[cid][i + garbled_circuit.g_input_size],
                     sizeof(block)));
      }
    }
  } else {
    CHECK(
        EvalauteOTExt(garbled_circuit, e_init, init_labels, e_input,
                      input_labels, clock_cycles, connfd));
  }
  return SUCCESS;
}

int ParseInitInputStr(const string& init_str, const string&input_str,
                      uint64_t init_size, uint64_t input_size,
                      uint64_t clock_cycles, short** init, short*** input) {
  BIGNUM* temp_bn = BN_new();
  *init = nullptr;
  if (init_size > 0) {
    BN_hex2bn(&temp_bn, init_str.c_str());
    CHECK_ALLOC(*init = new short[init_size]);
    for (uint i = 0; i < init_size; i++) {
      if (i >= (uint) BN_num_bits(temp_bn) || !BN_is_bit_set(temp_bn, i)) {
        (*init)[i] = 0;
      } else {
        (*init)[i] = 1;
      }
    }
  }

  BN_hex2bn(&temp_bn, input_str.c_str());
  (*input) = nullptr;
  CHECK_ALLOC((*input) = new short*[clock_cycles]);
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (input_size > 0) {
      CHECK_ALLOC((*input)[cid] = new short[input_size]);
      for (uint i = 0; i < input_size; i++) {
        if (cid * input_size + i >= (uint) BN_num_bits(temp_bn)
            || !BN_is_bit_set(temp_bn, cid * input_size + i)) {
          (*input)[cid][i] = 0;
        } else {
          (*input)[cid][i] = 1;
        }
      }
    } else {
      (*input)[cid] = nullptr;
    }
  }

  BN_free(temp_bn);
  return SUCCESS;
}

int GarbleMakeLabels(const GarbledCircuit& garbled_circuit,
                     block*** const_labels, block*** init_labels,
                     block**** input_labels, block**** output_labels, block R,
                     uint64_t clock_cycles) {

  (*const_labels) = nullptr;
  CHECK_ALLOC((*const_labels) = new block*[2]);
  for (uint i = 0; i < 2; i++) {
    CHECK_ALLOC((*const_labels)[i] = new block[2]);
    (*const_labels)[i][0] = RandomBlock();
    (*const_labels)[i][1] = XorBlock(R, (*const_labels)[i][0]);
  }

  // allocate and generate random init and inputs label pairs
  (*init_labels) = nullptr;
  if (garbled_circuit.get_init_size() > 0) {
    CHECK_ALLOC((*init_labels) = new block*[garbled_circuit.get_init_size()]);
    for (uint i = 0; i < garbled_circuit.get_init_size(); i++) {
      CHECK_ALLOC((*init_labels)[i] = new block[2]);
      (*init_labels)[i][0] = RandomBlock();
      (*init_labels)[i][1] = XorBlock(R, (*init_labels)[i][0]);
    }
  }

  (*input_labels) = nullptr;
  CHECK_ALLOC((*input_labels) = new block**[clock_cycles]);
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (garbled_circuit.get_input_size() > 0) {
      CHECK_ALLOC(
          (*input_labels)[cid] = new block*[garbled_circuit.get_input_size()]);
      for (uint i = 0; i < garbled_circuit.get_input_size(); i++) {
        CHECK_ALLOC((*input_labels)[cid][i] = new block[2]);
        (*input_labels)[cid][i][0] = RandomBlock();
        (*input_labels)[cid][i][1] = XorBlock(R, (*input_labels)[cid][i][0]);
      }
    } else {
      (*input_labels)[cid] = nullptr;
    }
  }

  (*output_labels) = nullptr;
  CHECK_ALLOC((*output_labels) = new block**[clock_cycles]);
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (garbled_circuit.output_size > 0) {
      CHECK_ALLOC((*output_labels)[cid] =
          new block*[garbled_circuit.output_size]);
      for (uint i = 0; i < garbled_circuit.output_size; i++) {
        CHECK_ALLOC((*output_labels)[cid][i] = new block[2]);
      }
    } else {
      (*output_labels)[cid] = nullptr;
    }
  }

  return SUCCESS;
}

int EvaluateMakeLabels(const GarbledCircuit& garbled_circuit,
                       block** const_labels, block** init_labels,
                       block*** input_labels, block*** output_labels,
                       uint64_t clock_cycles) {
  (*const_labels) = nullptr;
  CHECK_ALLOC((*const_labels) = new block[2]);

  (*init_labels) = nullptr;
  if (garbled_circuit.get_init_size() > 0) {
    CHECK_ALLOC((*init_labels) = new block[garbled_circuit.get_init_size()]);
  }

  (*input_labels) = nullptr;
  CHECK_ALLOC((*input_labels) = new block*[clock_cycles]);
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (garbled_circuit.get_input_size() > 0) {
      CHECK_ALLOC(
          (*input_labels)[cid] = new block[garbled_circuit.get_input_size()]);
    } else {
      (*input_labels)[cid] = nullptr;
    }
  }

  (*output_labels) = nullptr;
  CHECK_ALLOC((*output_labels) = new block*[clock_cycles]);
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (garbled_circuit.output_size > 0) {
      CHECK_ALLOC((*output_labels)[cid] =
          new block[garbled_circuit.output_size]);
    } else {
      (*output_labels)[cid] = nullptr;
    }
  }

  return SUCCESS;
}

int GarbleTransferOutput(const GarbledCircuit& garbled_circuit,
                         block*** output_labels, uint64_t clock_cycles,
                         int connfd) {
  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      short outputType = get_LSB(output_labels[cid][i][0]);
      CHECK(SendData(connfd, &outputType, sizeof(short)));
    }
  }
  return SUCCESS;
}
int EvaluateTransferOutput(const GarbledCircuit& garbled_circuit,
                           block** output_labels, uint64_t clock_cycles,
                           int output_mode, string* output_str, int connfd) {
  BIGNUM* output_bn = BN_new();
  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      short myOutputType = get_LSB(output_labels[cid][i]);
      short outputType;
      CHECK(RecvData(connfd, &outputType, sizeof(short)));
      if (myOutputType != outputType) {  // myOutputType XOR outputType
        BN_set_bit(output_bn, cid * garbled_circuit.output_size + i);
      } else {
        BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
      }
    }
  }

  *output_str = OutputBN2Str(output_bn, clock_cycles,
                             garbled_circuit.output_size, output_mode);

  BN_free(output_bn);
  return SUCCESS;
}

int GarbleDeallocate(GarbledCircuit* garbled_circuit, short* g_init,
                     short** g_input, block** const_labels, block** init_labels,
                     block*** input_labels, block*** output_labels,
                     uint64_t clock_cycles) {

  if (g_init != nullptr) {
    delete[] g_init;
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (g_input[cid] != nullptr) {
      delete[] g_input[cid];
    }
  }
  delete[] g_input;

  if (init_labels != nullptr) {
    for (uint i = 0; i < garbled_circuit->get_init_size(); i++) {
      delete[] init_labels[i];
    }
    delete[] init_labels;
  }

  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (input_labels[cid] != nullptr) {
      for (uint i = 0; i < garbled_circuit->get_input_size(); i++) {
        delete[] input_labels[cid][i];
      }
      delete[] input_labels[cid];
    }
  }
  delete[] input_labels;

  delete[] const_labels;

  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (output_labels[cid] != nullptr) {
      for (uint i = 0; i < garbled_circuit->output_size; i++) {
        delete[] output_labels[cid][i];
      }
      delete[] output_labels[cid];
    }
  }
  delete[] output_labels;
  RemoveGarbledCircuit(garbled_circuit);
  return SUCCESS;
}

int EvaluateDeallocate(GarbledCircuit* garbled_circuit, short* e_init,
                       short** e_input, block* const_labels, block* init_labels,
                       block** input_labels, block** output_labels,
                       uint64_t clock_cycles) {

  if (init_labels != nullptr) {
    delete[] init_labels;
  }

  for (uint cid = 0; cid < clock_cycles; cid++) {
    delete[] input_labels[cid];
  }
  delete[] input_labels;

  delete[] const_labels;

  if (e_init != nullptr) {
    delete[] e_init;
  }

  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (e_input[cid] != nullptr) {
      delete[] e_input[cid];
    }
  }
  delete[] e_input;

  for (uint cid = 0; cid < clock_cycles; cid++) {
    if (output_labels[cid] != nullptr) {
      delete[] output_labels[cid];
    }
  }
  delete[] output_labels;
  RemoveGarbledCircuit(garbled_circuit);
  return SUCCESS;
}

int GarbleStr(const string& scd_file_address, const string& init_str,
              const string& input_str, uint64_t clock_cycles, bool disable_OT,
              int connfd) {
  if (clock_cycles == 0) {
    return FAILURE;
  }

  GarbledCircuit garbled_circuit;
  if (ReadSCD(scd_file_address, &garbled_circuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return FAILURE;
  }

  block R = RandomBlock();  // secret label
  *((short *) (&R)) |= 1;

  // parse init and input
  short* g_init;
  short** g_input;
  CHECK(
      ParseInitInputStr(init_str, input_str, garbled_circuit.g_init_size,
                        garbled_circuit.g_input_size, clock_cycles, &g_init,
                        &g_input));

  // allocate init and input values and translate form string
  block** const_labels;
  block** init_labels;
  block*** input_labels;
  block*** output_labels;
  CHECK(
      GarbleMakeLabels(garbled_circuit, &const_labels, &init_labels,
                       &input_labels, &output_labels, R, clock_cycles));

  CHECK(
      GarbleTransferLabels(garbled_circuit, const_labels, g_init, init_labels,
                           g_input, input_labels, clock_cycles, disable_OT,
                           connfd));

  // global key
  block global_key = RandomBlock();
  CHECK(SendData(connfd, &global_key, sizeof(block)));  // send global key

  uint64_t g_time = Garble(garbled_circuit, const_labels, init_labels,
                           input_labels, global_key, R, clock_cycles, connfd,
                           output_labels);
  LOG(INFO) << "Total Garbling time (cc) = " << g_time
            << "\tGarbling time per gate (cc/gate) = "
            << (g_time) / ((double) garbled_circuit.gate_size * clock_cycles)
            << endl;

  CHECK(
      GarbleTransferOutput(garbled_circuit, output_labels, clock_cycles,
                           connfd));

  ServerClose(connfd);
  CHECK(
      GarbleDeallocate(&garbled_circuit, g_init, g_input, const_labels,
                       init_labels, input_labels, output_labels, clock_cycles));

  return SUCCESS;
}

int EvaluateStr(const string& scd_file_address, const string& init_str,
                const string& input_str, uint64_t clock_cycles, int output_mode,
                bool disable_OT, string* output_str, int connfd) {
  if (clock_cycles == 0) {
    return FAILURE;
  }

  GarbledCircuit garbled_circuit;
  if (ReadSCD(scd_file_address, &garbled_circuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return FAILURE;
  }

  // allocate init and input values and translate form string
  short* e_init;
  short** e_input;
  CHECK(
      ParseInitInputStr(init_str, input_str, garbled_circuit.e_init_size,
                        garbled_circuit.e_input_size, clock_cycles, &e_init,
                        &e_input));

  // allocate labels
  block* const_labels;
  block* init_labels;
  block** input_labels;
  block** output_labels;
  CHECK(
      EvaluateMakeLabels(garbled_circuit, &const_labels, &init_labels,
                         &input_labels, &output_labels, clock_cycles));

  // transfer labels
  CHECK(
      EvaluateTransferLabels(garbled_circuit, const_labels, e_init, init_labels,
                             e_input, input_labels, clock_cycles, disable_OT,
                             connfd));

  // global key
  block global_key = RandomBlock();
  CHECK(RecvData(connfd, &global_key, sizeof(block)));  // send global key

  uint64_t e_time = Evaluate(garbled_circuit, const_labels, init_labels,
                             input_labels, global_key, clock_cycles, connfd,
                             output_labels);

  LOG(INFO) << "Total Evaluating time (cc) = " << e_time
            << "\tEvaluate time per gate (cc/gate) = "
            << (e_time) / ((double) garbled_circuit.gate_size * clock_cycles)
            << endl;

  CHECK(
      EvaluateTransferOutput(garbled_circuit, output_labels, clock_cycles,
                             output_mode, output_str, connfd));

  ClientClose(connfd);
  CHECK(
      EvaluateDeallocate(&garbled_circuit, e_init, e_input, const_labels,
                         init_labels, input_labels, output_labels,
                         clock_cycles));
  return SUCCESS;
}

void RemoveGarbledCircuit(GarbledCircuit *garbledCircuit) {
  delete[] garbledCircuit->garbledGates;
  if (garbledCircuit->outputs != nullptr) {
    delete[] garbledCircuit->outputs;
  }
  if (garbledCircuit->I != nullptr) {
    delete[] garbledCircuit->I;
  }
  if (garbledCircuit->D != nullptr) {
    delete[] garbledCircuit->D;
  }
}

