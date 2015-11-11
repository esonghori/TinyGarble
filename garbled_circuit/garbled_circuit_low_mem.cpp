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

#include "garbled_circuit/garbled_circuit_low_mem.h"

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "util/log.h"
#include "crypto/BN.h"
#include "crypto/OT_extension.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

uint64_t GarbleLowMem(const GarbledCircuit& garbled_circuit,
                      block* const_labels, block* init_labels,
                      block* input_labels, block* garbled_tables, block R,
                      AES_KEY& AES_Key, uint64_t cid, int connfd,
                      BlockPair *wires, block* output_labels) {
  uint64_t garbled_table_ind = 0;

  uint64_t start_time = RDTSC;

  // init
  uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
  if (cid == 0) {
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.I[i];
      if (wire_index == CONST_ZERO) {
        wires[dff_bias + i].label0 = const_labels[0 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[0 * 2 + 1];
      } else if (wire_index == CONST_ONE) {
        wires[dff_bias + i].label0 = const_labels[1 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[1 * 2 + 1];
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_init_size()) {
        wires[dff_bias + i].label0 = init_labels[wire_index * 2 + 0];
        wires[dff_bias + i].label1 = init_labels[wire_index * 2 + 1];
      } else {
        LOG(ERROR) << "Invalid I: " << wire_index << endl;
        wires[dff_bias + i].label0 = const_labels[0 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[0 * 2 + 1];
      }
      DUMP("dff") << wires[dff_bias + i].label0 << endl;
    }
  } else {  //copy latched labels
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.D[i];
      if (wire_index == CONST_ZERO) {
        wires[dff_bias + i].label0 = const_labels[0 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[0 * 2 + 1];
      } else if (wire_index == CONST_ONE) {
        wires[dff_bias + i].label0 = const_labels[1 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[1 * 2 + 1];
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
        wires[dff_bias + i].label0 = wires[wire_index].label0;
        wires[dff_bias + i].label1 = wires[wire_index].label1;
      } else {
        LOG(ERROR) << "Invalid D: " << wire_index << endl;
        wires[dff_bias + i].label0 = const_labels[0 * 2 + 0];
        wires[dff_bias + i].label1 = const_labels[0 * 2 + 1];
      }
    }
  }

  // inputs
  uint64_t input_bias = garbled_circuit.get_input_lo_index();
  for (uint64_t i = 0; i < garbled_circuit.get_input_size(); i++) {
    wires[input_bias + i].label0 = input_labels[i * 2 + 0];
    wires[input_bias + i].label1 = input_labels[i * 2 + 1];
    DUMP("input") << input_labels[i * 2 + 0] << endl;
  }

  for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  //for each gates
    GarbledGate& garbledGate = garbled_circuit.garbledGates[i];

    int64_t input0 = garbledGate.input0;
    int64_t input1 = garbledGate.input1;
    int64_t output = garbledGate.output;
    int type = garbledGate.type;

    block input0_labels[2];
    if (input0 == CONST_ZERO) {
      input0_labels[0] = const_labels[0 * 2 + 0];
      input0_labels[1] = const_labels[0 * 2 + 1];
    } else if (input0 == CONST_ONE) {
      input0_labels[0] = const_labels[1 * 2 + 0];
      input0_labels[1] = const_labels[1 * 2 + 1];
    } else if (input0 >= 0
        && input0 < (int64_t) garbled_circuit.get_wire_size()) {
      input0_labels[0] = wires[input0].label0;
      input0_labels[1] = wires[input0].label1;
    } else {
      LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
      input0_labels[0] = const_labels[0 * 2 + 0];
      input0_labels[1] = const_labels[0 * 2 + 1];
    }

    block input1_labels[2];
    if (input1 == CONST_ZERO) {
      input1_labels[0] = const_labels[0 * 2 + 0];
      input1_labels[1] = const_labels[0 * 2 + 1];
    } else if (input1 == CONST_ONE) {
      input1_labels[0] = const_labels[1 * 2 + 0];
      input1_labels[1] = const_labels[1 * 2 + 1];
    } else if (input1 >= 0
        && input1 < (int64_t) garbled_circuit.get_wire_size()) {
      input1_labels[0] = wires[input1].label0;
      input1_labels[1] = wires[input1].label1;
    } else if (type != NOTGATE) {
      LOG(
          ERROR) << "Invalid input1 index: " << input1 << endl;
      input1_labels[0] = const_labels[0 * 2 + 0];
      input1_labels[1] = const_labels[0 * 2 + 1];
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
      garbled_tables[garbled_table_ind++] = table[j];
      //CHECK(SendData(connfd, &table[j], sizeof(block)));
      DUMP(
          "table") << table[j] << endl;
    }
  }

  for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
    output_labels[(i) * 2 + 0] = wires[garbled_circuit.outputs[i]].label0;
    output_labels[(i) * 2 + 1] = wires[garbled_circuit.outputs[i]].label1;
  }
  uint64_t end_time = RDTSC;
  return (end_time - start_time);
}

uint64_t EvaluateLowMem(const GarbledCircuit& garbled_circuit,
                        block* const_labels, block* init_labels,
                        block* input_labels, block* garbled_tables,
                        AES_KEY& AES_Key, uint64_t cid, int connfd,
                        block *wires, block* output_labels) {
  uint64_t garbled_table_ind = 0;
  uint64_t start_time = RDTSC;

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
          && wire_index < (int64_t) garbled_circuit.get_init_size()) {
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
    wires[input_bias + i] = input_labels[i];
    DUMP("input") << input_labels[i] << endl;
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
        table[j] = garbled_tables[garbled_table_ind++];
        //CHECK(RecvData(connfd, &(table[j]), sizeof(block)));
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
    output_labels[i] = wires[garbled_circuit.outputs[i]];
    DUMP("output") << wires[garbled_circuit.outputs[i]] << endl;
  }

  uint64_t end_time = RDTSC;
  return (end_time - start_time);
}

int GarbleAllocLabels(const GarbledCircuit& garbled_circuit,
                      block** const_labels, block** init_labels,
                      block** input_labels, block** output_labels, block R) {

  (*const_labels) = nullptr;
  CHECK_ALLOC((*const_labels) = new block[2 * 2]);
  for (uint i = 0; i < 2; i++) {
    (*const_labels)[i * 2 + 0] = RandomBlock();
    (*const_labels)[i * 2 + 1] = XorBlock(R, (*const_labels)[i * 2 + 0]);
  }

// allocate and generate random init and inputs label pairs
  (*init_labels) = nullptr;
  if (garbled_circuit.get_init_size() > 0) {
    CHECK_ALLOC((*init_labels) = new block[garbled_circuit.get_init_size() * 2]);
    for (uint i = 0; i < garbled_circuit.get_init_size(); i++) {
      (*init_labels)[i * 2 + 0] = RandomBlock();
      (*init_labels)[i * 2 + 1] = XorBlock(R, (*init_labels)[i * 2 + 0]);
    }
  }

  (*input_labels) = nullptr;
  if (garbled_circuit.get_input_size() > 0) {
    CHECK_ALLOC((*input_labels) =
        new block[garbled_circuit.get_input_size() * 2]);
  }

  (*output_labels) = nullptr;
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC((*output_labels) = new block[garbled_circuit.output_size * 2]);
  }

  return SUCCESS;
}

int GarbleGneInitLabels(const GarbledCircuit& garbled_circuit,
                        block* const_labels, block* init_labels, block R) {

  for (uint i = 0; i < 2; i++) {
    const_labels[i * 2 + 0] = RandomBlock();
    const_labels[i * 2 + 1] = XorBlock(R, const_labels[i * 2 + 0]);
  }

  for (uint i = 0; i < garbled_circuit.get_init_size(); i++) {
    init_labels[i * 2 + 0] = RandomBlock();
    init_labels[i * 2 + 1] = XorBlock(R, init_labels[i * 2 + 0]);
  }

  return SUCCESS;
}

int GarbleGenInputLabels(const GarbledCircuit& garbled_circuit,
                         block* input_labels, block R) {
  if (garbled_circuit.get_input_size() > 0) {
    for (uint i = 0; i < garbled_circuit.get_input_size(); i++) {
      input_labels[i * 2 + 0] = RandomBlock();
      input_labels[i * 2 + 1] = XorBlock(R, input_labels[i * 2 + 0]);
    }
  }
  return SUCCESS;
}

int EvaluateAllocLabels(const GarbledCircuit& garbled_circuit,
                        block** const_labels, block** init_labels,
                        block** input_labels, block** output_labels) {
  (*const_labels) = nullptr;
  CHECK_ALLOC((*const_labels) = new block[2]);

  (*init_labels) = nullptr;
  if (garbled_circuit.get_init_size() > 0) {
    CHECK_ALLOC((*init_labels) = new block[garbled_circuit.get_init_size()]);
  }

  (*input_labels) = nullptr;
  if (garbled_circuit.get_input_size() > 0) {
    CHECK_ALLOC((*input_labels) = new block[garbled_circuit.get_input_size()]);
  }

  (*output_labels) = nullptr;
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC((*output_labels) = new block[garbled_circuit.output_size]);
  }

  return SUCCESS;
}

int GarbleOTExtInitLowMem(const GarbledCircuit& garbled_circuit,
                          block* init_labels, int connfd) {

  uint32_t m_len = garbled_circuit.e_init_size;
  if (m_len == 0) {
    return SUCCESS;
  }
  block **m = nullptr;
  CHECK_ALLOC(m = new block*[m_len]);

  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    CHECK_ALLOC(m[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      m[i][j] = init_labels[(i + garbled_circuit.g_init_size) * 2 + j];
    }
  }

  uint64_t start_time = RDTSC;
  CHECK(OTExtSend(m, m_len, connfd));
  uint64_t end_time = RDTSC;

  LOG(INFO) << "Total OT Extension send Init time (cc) = "
            << end_time - start_time
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

int GarbleOTExtInputLowMem(const GarbledCircuit& garbled_circuit,
                           block* input_labels, uint64_t cid, int connfd) {

  uint32_t m_len = garbled_circuit.e_input_size;
  if (m_len == 0) {
    return SUCCESS;
  }
  block **m = nullptr;
  CHECK_ALLOC(m = new block*[m_len]);

  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    CHECK_ALLOC(m[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      m[i][j] = input_labels[(i + garbled_circuit.g_input_size) * 2 + j];
    }
  }

  CHECK(OTExtSend(m, m_len, connfd));

  if (m != nullptr) {
    for (uint i = 0; i < m_len; i++) {
      delete[] m[i];
    }
    delete[] m;
  }

  return SUCCESS;
}

int EvalauteOTExtInitLowMem(const GarbledCircuit& garbled_circuit,
                            BIGNUM* e_init, block* init_labels, int connfd) {
  uint32_t m_len = garbled_circuit.e_init_size;
  if (m_len == 0) {
    return SUCCESS;
  }
  bool *sel = nullptr;
  CHECK_ALLOC(sel = new bool[m_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    sel[i] = BN_is_bit_set(e_init, i);
  }

  block* m = nullptr;
  CHECK_ALLOC(m = new block[m_len]);

  CHECK(OTExtRecv(sel, m_len, connfd, m));

  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    init_labels[i + garbled_circuit.g_init_size] = m[i];
  }

  delete[] sel;
  delete[] m;

  return SUCCESS;
}

int EvalauteOTExtInputLowMem(const GarbledCircuit& garbled_circuit,
                             BIGNUM* e_input, block* input_labels, uint64_t cid,
                             int connfd) {
  uint32_t m_len = garbled_circuit.e_input_size;
  if (m_len == 0) {
    return SUCCESS;
  }
  bool *sel = nullptr;
  CHECK_ALLOC(sel = new bool[m_len]);
  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    sel[i] = BN_is_bit_set(e_input, cid * garbled_circuit.e_input_size + i);
  }

  block* m = nullptr;
  CHECK_ALLOC(m = new block[m_len]);

  CHECK(OTExtRecv(sel, m_len, connfd, m));

  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    input_labels[i + garbled_circuit.g_input_size] = m[i];
  }

  delete[] sel;

  return SUCCESS;
}

int GarbleTransferInitLabels(const GarbledCircuit& garbled_circuit,
                             block* const_labels, BIGNUM* g_init,
                             block* init_labels, bool disable_OT, int connfd) {
// constant
  CHECK(SendData(connfd, &const_labels[0 * 2 + 0], sizeof(block)));
  CHECK(SendData(connfd, &const_labels[1 * 2 + 1], sizeof(block)));

// g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    if (i >= (uint) BN_num_bits(g_init) || BN_is_bit_set(g_init, i) == 0) {
      CHECK(SendData(connfd, &init_labels[i * 2 + 0], sizeof(block)));
    } else {
      CHECK(SendData(connfd, &init_labels[i * 2 + 1], sizeof(block)));
    }
  }

  if (disable_OT) {
// e_init
    BIGNUM* e_init = BN_new();
    CHECK(RecvBN(connfd, e_init));
    for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
      if (i >= (uint) BN_num_bits(e_init) || BN_is_bit_set(e_init, i) == 0) {
        CHECK(
            SendData(connfd,
                     &init_labels[(i + garbled_circuit.g_init_size) * 2 + 0],
                     sizeof(block)));
      } else {
        CHECK(
            SendData(connfd,
                     &init_labels[(i + garbled_circuit.g_init_size) * 2 + 1],
                     sizeof(block)));
      }
    }
    BN_free(e_init);

  } else {
    CHECK(GarbleOTExtInitLowMem(garbled_circuit, init_labels, connfd));
  }
  return SUCCESS;
}

int GarbleTransferInputLabels(const GarbledCircuit& garbled_circuit,
                              BIGNUM* g_input, block* input_labels,
                              uint64_t cid, bool disable_OT, int connfd) {

  // g_input
  for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
    if (cid * garbled_circuit.g_input_size + i >= (uint) BN_num_bits(g_input)
        || BN_is_bit_set(g_input, cid * garbled_circuit.g_input_size + i)
            == 0) {
      CHECK(SendData(connfd, &input_labels[(i) * 2 + 0], sizeof(block)));
    } else {
      CHECK(SendData(connfd, &input_labels[(i) * 2 + 1], sizeof(block)));
    }
  }

  if (disable_OT) {
// e_input
    BIGNUM* e_input = BN_new();
    CHECK(RecvBN(connfd, e_input));
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      if (cid * garbled_circuit.e_input_size + i >= (uint) BN_num_bits(e_input)
          || BN_is_bit_set(e_input, cid * garbled_circuit.e_input_size + i)
              == 0) {
        CHECK(
            SendData(connfd,
                     &input_labels[(i + garbled_circuit.g_input_size) * 2 + 0],
                     sizeof(block)));
      } else {
        CHECK(
            SendData(connfd,
                     &input_labels[(i + garbled_circuit.g_input_size) * 2 + 1],
                     sizeof(block)));
      }
    }

    BN_free(e_input);

  } else {
    CHECK(GarbleOTExtInputLowMem(garbled_circuit, input_labels, cid, connfd));
  }
  return SUCCESS;
}

int EvaluateTransferInitLabels(const GarbledCircuit& garbled_circuit,
                               block* const_labels, BIGNUM* e_init,
                               block* init_labels, bool disable_OT,
                               int connfd) {
// constant
  CHECK(RecvData(connfd, &const_labels[0], sizeof(block)));
  CHECK(RecvData(connfd, &const_labels[1], sizeof(block)));

// g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    CHECK(RecvData(connfd, &init_labels[i], sizeof(block)));
  }

  if (disable_OT) {
// e_init
    CHECK(SendBN(connfd, e_init));
    for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
      CHECK(
          RecvData(connfd, &init_labels[i + garbled_circuit.g_init_size],
                   sizeof(block)));
    }

  } else {
    CHECK(EvalauteOTExtInitLowMem(garbled_circuit, e_init, init_labels, connfd));
  }
  return SUCCESS;
}

int EvaluateTransferInputLabels(const GarbledCircuit& garbled_circuit,
                                BIGNUM* e_input, block* input_labels,
                                uint64_t cid, bool disable_OT, int connfd) {
  // g_input
  for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
    CHECK(RecvData(connfd, &input_labels[i], sizeof(block)));
  }

  if (disable_OT) {
    // e_input
    CHECK(SendBN(connfd, e_input));
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      CHECK(
          RecvData(connfd, &input_labels[i + garbled_circuit.g_input_size],
                   sizeof(block)));
    }
  } else {
    CHECK(
        EvalauteOTExtInputLowMem(garbled_circuit, e_input, input_labels, cid,
                                 connfd));
  }
  return SUCCESS;
}

int GarbleTransferOutputLowMem(const GarbledCircuit& garbled_circuit,
                               block* output_labels, uint64_t cid,
                               int output_mode, const string& output_mask,
                               BIGNUM* output_bn, int connfd) {
  BIGNUM* output_mask_bn = BN_new();
  BN_hex2bn(&output_mask_bn, output_mask.c_str());

  uint64_t output_bit_offset = 0;
  if (output_mode == 0) {  // normal mode, keep all the bits.
    output_bit_offset = cid * garbled_circuit.output_size;
  } else if (output_mode == 1) {  // Separated by clock mode, keep all the bits.
    output_bit_offset = cid * garbled_circuit.output_size;
  } else if (output_mode == 2) {  // keep the last cycle, overwrite the bits.
    output_bit_offset = 0;
  }

  for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
    short garble_output_type = get_LSB(output_labels[(i) * 2 + 0]);
    short eval_output_type;
    if (cid * garbled_circuit.output_size + i
        >= (uint64_t) BN_num_bits(output_mask_bn)
        || BN_is_bit_set(output_mask_bn, cid * garbled_circuit.output_size + i)
            == 0) {
      CHECK(SendData(connfd, &garble_output_type, sizeof(short)));
      BN_clear_bit(output_bn, output_bit_offset + i);
    } else {
      CHECK(RecvData(connfd, &eval_output_type, sizeof(short)));
      if (eval_output_type != garble_output_type) {
        BN_set_bit(output_bn, output_bit_offset + i);
      } else {
        BN_clear_bit(output_bn, output_bit_offset + i);
      }
    }
  }

  BN_free(output_mask_bn);
  return SUCCESS;
}

int EvaluateTransferOutputLowMem(const GarbledCircuit& garbled_circuit,
                                 block* output_labels, uint64_t cid,
                                 int output_mode, const string& output_mask,
                                 BIGNUM* output_bn, int connfd) {
  BIGNUM* output_mask_bn = BN_new();
  BN_hex2bn(&output_mask_bn, output_mask.c_str());

  uint64_t output_bit_offset = 0;
  if (output_mode == 0) {  // normal mode, keep all the bits.
    output_bit_offset = cid * garbled_circuit.output_size;
  } else if (output_mode == 1) {  // Separated by clock mode, keep all the bits.
    output_bit_offset = cid * garbled_circuit.output_size;
  } else if (output_mode == 2) {  // keep the last cycle, overwrite the bits.
    output_bit_offset = 0;
  }

  for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
    short garble_output_type;
    short eval_output_type = get_LSB(output_labels[i]);
    if (cid * garbled_circuit.output_size + i
        >= (uint64_t) BN_num_bits(output_mask_bn)
        || BN_is_bit_set(output_mask_bn, cid * garbled_circuit.output_size + i)
            == 0) {
      CHECK(RecvData(connfd, &garble_output_type, sizeof(short)));
      if (eval_output_type != garble_output_type) {
        BN_set_bit(output_bn, output_bit_offset + i);
      } else {
        BN_clear_bit(output_bn, output_bit_offset + i);
      }
    } else {
      CHECK(SendData(connfd, &eval_output_type, sizeof(short)));
      BN_clear_bit(output_bn, output_bit_offset + i);
    }
  }

  BN_free(output_mask_bn);
  return SUCCESS;
}

