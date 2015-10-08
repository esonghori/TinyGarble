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
#include "util/log.h"
#include "crypto/aes.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

int Alice(GarbledCircuit& garbled_circuit, const string& init_str,
          const string& input_str, int connfd) {

  block R = RandomBlock();  //secret label
  //TODO(ebi): check if single bit gets 1 or 8 bit.
  *((short *) (&R)) |= 1;

  // allocate init and input values and translate form string
  BIGNUM* temp_bn = BN_new();
  BN_hex2bn(&temp_bn, init_str.c_str());
  bool* g_init = new bool[garbled_circuit.g_init_size];
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    if (i >= (uint) BN_num_bits(temp_bn) || !BN_is_bit_set(temp_bn, i)) {
      g_init[i] = false;
    } else {
      g_init[i] = true;
    }
  }

  BN_hex2bn(&temp_bn, init_str.c_str());
  bool** g_input = new bool*[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    g_input[cid] = new bool[garbled_circuit.g_input_size];
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      if (cid * garbled_circuit.clock_cycles + i >= (uint) BN_num_bits(temp_bn)
          || !BN_is_bit_set(temp_bn, cid * garbled_circuit.clock_cycles + i)) {
        g_input[cid][i] = false;
      } else {
        g_input[cid][i] = true;
      }
    }
  }

  BN_free(temp_bn);
  // allocate and generate random init and inputs label pairs
  block** init_labels = new block*[garbled_circuit.get_init_size()];
  for (uint i = 0; i < garbled_circuit.get_init_size(); i++) {
    init_labels[i] = new block[2];
    init_labels[i][0] = RandomBlock();
    init_labels[i][1] = XorBlock(R, init_labels[i][0]);
  }

  block*** input_labels = new block**[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    input_labels[cid] = new block*[garbled_circuit.get_input_size()];
    for (uint i = 0; i < garbled_circuit.get_input_size(); i++) {
      init_labels[cid][i] = new block[2];
      input_labels[cid][i][0] = RandomBlock();
      input_labels[cid][i][1] = XorBlock(R, input_labels[cid][i][0]);
    }
  }

  // constant wires
  block** const_labels = new block*[2];
  for (uint i = 0; i < 2; i++) {
    const_labels[i] = new block[2];
    const_labels[i][0] = RandomBlock();
    const_labels[i][1] = XorBlock(R, const_labels[i][0]);
  }

  CHECK(SendData(connfd, &const_labels[0][0], sizeof(block)));
  CHECK(SendData(connfd, &const_labels[1][1], sizeof(block)));

  // send init labels
  // g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    if (g_init[i] == 0) {
      CHECK(SendData(connfd, &init_labels[i][0], sizeof(block)));
    } else {
      CHECK(SendData(connfd, &init_labels[i][1], sizeof(block)));
    }
  }
  // e_init in plain text
  // TODO(ebi): replace with OT
  bool* e_init = new bool[garbled_circuit.e_init_size];
  CHECK(RecvData(connfd, e_init, garbled_circuit.e_init_size * sizeof(bool)));
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

  // send input labels
  // g_input
  // e_input
  // TODO(ebi): replace with OT
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      if (g_input[cid][i] == 0) {
        CHECK(SendData(connfd, &input_labels[cid][i][0], sizeof(block)));
      } else {
        CHECK(SendData(connfd, &input_labels[cid][i][1], sizeof(block)));
      }
    }
  }
  bool** e_input = new bool*[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    e_input[cid] = new bool[garbled_circuit.e_input_size];
    CHECK(
        RecvData(connfd, e_input[cid],
                 garbled_circuit.e_input_size * sizeof(bool)));
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      if (e_input[cid][i] == 0) {
        CHECK(
            SendData(connfd,
                     &input_labels[cid][i + garbled_circuit.g_input_size][0],
                     sizeof(block)));
      } else {
        CHECK(
            SendData(connfd,
                     &input_labels[cid][i + garbled_circuit.g_input_size][1],
                     sizeof(block)));
      }
    }
  }

  // global key
  block global_key = RandomBlock();
  CHECK(SendData(connfd, &global_key, sizeof(block)));  // send global key

  block*** output_labels = new block**[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    output_labels[cid] = new block*[garbled_circuit.output_size];
    for (uint i = 0; i < garbled_circuit.output_size; i++) {
      output_labels[cid][i] = new block[2];
    }
  }

  Garble(garbled_circuit, const_labels, init_labels, input_labels, global_key,
         R, connfd, output_labels);

  for (uint64_t cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      bool outputType = get_LSB(output_labels[cid][i][0]);
      CHECK(SendData(connfd, &outputType, sizeof(bool)));
    }
  }

  ServerClose(connfd);
  RemoveGarbledCircuit(&garbled_circuit);

  delete[] g_init;
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    delete[] g_input[cid];
  }
  delete[] g_input;

  for (uint i = 0; i < garbled_circuit.get_init_size(); i++) {
    delete[] init_labels[i];
  }
  delete[] init_labels;

  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.get_input_size(); i++) {
      delete[] input_labels[cid][i];
    }
    delete[] input_labels[cid];
  }
  delete[] input_labels;

  delete[] const_labels;

  delete[] e_init;
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    delete[] e_input[cid];
  }
  delete[] e_input;

  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.output_size; i++) {
      delete[] output_labels[cid][i];
    }
    delete[] output_labels[cid];
  }
  delete[] output_labels;

  return SUCCESS;
}

int Bob(GarbledCircuit& garbled_circuit, const string& init_str,
        const string& input_str, int connfd) {

  // allocate init and input values and translate form string
  BIGNUM* temp_bn = BN_new();
  BN_hex2bn(&temp_bn, init_str.c_str());
  bool* e_init = new bool[garbled_circuit.e_init_size];
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    if (i >= (uint) BN_num_bits(temp_bn) || !BN_is_bit_set(temp_bn, i)) {
      e_init[i] = false;
    } else {
      e_init[i] = true;
    }
  }

  BN_hex2bn(&temp_bn, init_str.c_str());
  bool** e_input = new bool*[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    e_input[cid] = new bool[garbled_circuit.e_input_size];
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      if (cid * garbled_circuit.clock_cycles + i >= (uint) BN_num_bits(temp_bn)
          || !BN_is_bit_set(temp_bn, cid * garbled_circuit.clock_cycles + i)) {
        e_input[cid][i] = false;
      } else {
        e_input[cid][i] = true;
      }
    }
  }

  BN_free(temp_bn);
  // allocate and generate random init and inputs label pairs
  block* init_labels = new block[garbled_circuit.get_init_size()];

  block** input_labels = new block*[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    input_labels[cid] = new block[garbled_circuit.get_input_size()];
  }

  // constant wires
  block *const_labels = new block[2];
  CHECK(RecvData(connfd, &const_labels[0], sizeof(block)));
  CHECK(RecvData(connfd, &const_labels[1], sizeof(block)));

  // send init labels
  // g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    CHECK(RecvData(connfd, &init_labels[i], sizeof(block)));
  }
  // e_init in plain text
  // TODO(ebi): replace with OT
  CHECK(SendData(connfd, e_init, garbled_circuit.e_init_size * sizeof(bool)));
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    CHECK(
        RecvData(connfd, &init_labels[i + garbled_circuit.g_init_size],
                 sizeof(block)));

  }

  // send input labels
  // g_input
  // e_input
  // TODO(ebi): replace with OT
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      CHECK(RecvData(connfd, &input_labels[cid][i], sizeof(block)));
    }
  }
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    CHECK(
        SendData(connfd, e_input[cid],
                 garbled_circuit.e_input_size * sizeof(bool)));
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      CHECK(
          RecvData(connfd, &input_labels[cid][i + garbled_circuit.g_input_size],
                   sizeof(block)));
    }
  }

// global key
  block global_key = RandomBlock();
  CHECK(RecvData(connfd, &global_key, sizeof(block)));  // send global key

  block** output_labels = new block*[garbled_circuit.clock_cycles];
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    output_labels[cid] = new block[garbled_circuit.output_size];
  }

  Evaluate(&garbled_circuit, const_labels, init_labels, input_labels,
           global_key, connfd, output_labels);

  LOG(INFO) << "output:" << endl;

  for (uint64_t cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      bool outputType = get_LSB(output_labels[cid][i][0]);
      CHECK(SendData(connfd, &outputType, sizeof(bool)));
    }
  }

  LOG(INFO) << "outputs:" << endl;
  for (uint64_t cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    std::cout << "c = " << cid << endl;
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      bool myOutputType = get_LSB(output_labels[cid][i]);
      bool outputType;
      RecvData(connfd, &outputType, sizeof(bool));
      // myOutputType XOR outputType
      std::cout << ((myOutputType != outputType) ? '0' : '1');
    }
    std::cout << endl;
  }

  ClientClose(connfd);
  RemoveGarbledCircuit (&garbledCircuit);

  delete[] init_labels;

  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    delete[] input_labels[cid];
  }
  delete[] input_labels;

  delete[] const_labels;

  delete[] e_init;
  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    delete[] e_input[cid];
  }
  delete[] e_input;

  for (uint cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    delete[] output_labels[cid];
  }
  delete[] output_labels;

  return SUCCESS;
}

uint64_t Garble(GarbledCircuit& garbled_circuit, block** const_labels,
                block** init_labels, block*** input_labels, block global_key,
                block R, int connfd, block*** output_labels) {

  DUMP("r_key") << R << endl;
  DUMP("r_key") << global_key << endl;

  BlockPair *wires = new BlockPair[garbled_circuit.get_wire_size()];

  uint64_t startTime = RDTSC;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < garbled_circuit.clock_cycles; cid++) {

    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    if (cid == 0) {
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.I[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i].label0 = const_labels[0][0];
          wires[dff_bias + i].label1 = const_labels[0][1];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i].label1 = const_labels[1][0];
          wires[dff_bias + i].label1 = const_labels[1][1];
        } else if (wire_index > 0) {
          wires[dff_bias + i].label0 = init_labels[wire_index][0];
          wires[dff_bias + i].label1 = init_labels[wire_index][1];
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
        }
        DUMP("dff") << init_labels[i][0] << endl;
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        uint64_t wire_index = garbled_circuit.D[i];
        wires[dff_bias + i].label0 = wires[wire_index].label0;
        wires[dff_bias + i].label1 = wires[wire_index].label1;
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

      uint64_t input0 = garbledGate.input0;
      uint64_t input1 = garbledGate.input1;
      uint64_t output = garbledGate.output;
      int type = garbledGate.type;

      if (type == XORGATE) {
        wires[output].label0 = XorBlock(wires[input0].label0,
                                        wires[input1].label0);
        wires[output].label1 = XorBlock(wires[input0].label1,
                                        wires[input1].label0);
        continue;
      } else if (type == XNORGATE) {
        wires[output].label0 = XorBlock(wires[input0].label1,
                                        wires[input1].label0);
        wires[output].label1 = XorBlock(wires[input0].label0,
                                        wires[input1].label0);
        continue;
      } else if (type == NOTGATE) {
        wires[output].label0 = wires[input0].label1;
        wires[output].label1 = wires[input0].label0;
        continue;
      }

      block A1;
      block A0;
      unsigned short v = Type2V(type);
      if (v & 1) {
        A1 = (wires[input0].label0);
        A0 = (wires[input0].label1);
      } else {
        A0 = (wires[input0].label0);
        A1 = (wires[input0].label1);
      }

      block B1;
      block B0;
      if (v & 2) {
        B1 = (wires[input1].label0);
        B0 = (wires[input1].label1);
      } else {
        B0 = (wires[input1].label0);
        B1 = (wires[input1].label1);
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

      if (cid == garbled_circuit.clock_cycles - 1) {
        DUMP("output") << wires[garbled_circuit.outputs[i]].label0 << endl;
      }
    }
  }
  uint64_t endtime = RDTSC;
  delete[] wires;
  return (endtime - startTime);
}

uint64_t Evaluate(GarbledCircuit& garbled_circuit, block* const_labels,
                  block* init_labels, block** input_labels, block global_key,
                  int connfd, block** output_labels) {

  DUMP("r_key") << global_key << endl;

  block *wires = new block[garbled_circuit.get_wire_size()];

  uint64_t startTime = RDTSC;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < garbled_circuit.clock_cycles; cid++) {
    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    if (cid == 0) {
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.I[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i] = const_labels[0];
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i] = const_labels[1];
        } else if (wire_index > 0) {
          wires[dff_bias + i] = init_labels[wire_index];
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
        }
        DUMP("dff") << init_labels[i] << endl;
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        uint64_t wire_index = garbled_circuit.D[i];
        wires[dff_bias + i] = wires[wire_index];
      }
    }
    // inputs
    uint64_t input_bias = garbled_circuit.get_input_lo_index();
    for (uint64_t i = 0; i < garbled_circuit.get_init_size(); i++) {
      wires[input_bias + i] = input_labels[cid][i];
      if (cid == 0) {
        DUMP("input") << input_labels[cid][i] << endl;
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  // for each gates
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      uint64_t input0 = garbledGate.input0;
      uint64_t input1 = garbledGate.input1;
      uint64_t output = garbledGate.output;
      int type = garbledGate.type;

      if (type == XORGATE || type == XNORGATE) {
        wires[output] = XorBlock(wires[input0], wires[input1]);
      } else if (type == NOTGATE) {
        wires[output] = wires[input0];
      } else {
        block A = (wires[input0]);
        block B = (wires[input1]);

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
      if (cid == garbled_circuit.clock_cycles - 1) {
        DUMP("output") << output_labels[cid][i] << endl;
      }
    }
  }
  uint64_t endtime = RDTSC;
  delete[] wires;
  return (endtime - startTime);
}

void RemoveGarbledCircuit(GarbledCircuit *garbledCircuit) {
  delete[] garbledCircuit->garbledGates;
  delete[] garbledCircuit->outputs;
  delete[] garbledCircuit->I;
  delete[] garbledCircuit->D;
}

