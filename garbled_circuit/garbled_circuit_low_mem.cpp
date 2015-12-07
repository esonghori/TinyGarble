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
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

void Half0GarbleGate(int type, short input0_value, BlockPair input1_labels,
                     BlockPair* output_labels, short* output_value) {

  bool x0 = GateOperator(type, input0_value, 0);
  bool x1 = GateOperator(type, input0_value, 1);

  if (x0 == x1) {
    if (x0 == 0) {
      *output_value = 0;
    } else {
      *output_value = 1;
    }
  } else if (x0 == 0 && x1 == 1) {
    *output_labels = input1_labels;
    *output_value = -1;
  } else /*if(x0 == 1 && x1 == 0)*/{
    output_labels->label0 = input1_labels.label1;
    output_labels->label1 = input1_labels.label0;
    *output_value = -1;
  }
}

void Half1GarbleGate(int type, short input1_value, BlockPair input0_labels,
                     BlockPair* output_labels, short* output_value) {
  bool x0 = GateOperator(type, 0, input1_value);
  bool x1 = GateOperator(type, 1, input1_value);

  if (x0 == x1) {
    if (x0 == 0) {
      *output_value = 0;
    } else {
      *output_value = 1;
    }
  } else if (x0 == 0 && x1 == 1) {
    *output_labels = input0_labels;
    *output_value = -1;
  } else /*if(x0 == 1 && x1 == 0)*/{
    output_labels->label0 = input0_labels.label1;
    output_labels->label1 = input0_labels.label0;
    *output_value = -1;
  }
}

void GarbleGate(BlockPair input0_labels, short input0_value,
                BlockPair input1_labels, short input1_value, int type,
                uint64_t cid, uint64_t gid, block* garbled_tables,
                uint64_t* garbled_table_ind, block R, AES_KEY AES_Key,
                BlockPair* output_labels, short* output_value) {

  if (input0_value != -1 && input1_value != -1) {
    *output_value = GateOperator(type, input0_value, input1_value);
  } else if (input0_value != -1) {
    Half0GarbleGate(type, input0_value, input1_labels, output_labels,
                    output_value);

  } else if (input1_value != -1) {
    Half1GarbleGate(type, input1_value, input0_labels, output_labels,
                    output_value);
  } else if (type == XORGATE) {
    output_labels->label0 = XorBlock(input0_labels.label0,
                                     input1_labels.label0);
    output_labels->label1 = XorBlock(input0_labels.label1,
                                     input1_labels.label0);
    *output_value = -1;
  } else if (type == XNORGATE) {
    output_labels->label0 = XorBlock(input0_labels.label1,
                                     input1_labels.label0);
    output_labels->label1 = XorBlock(input0_labels.label0,
                                     input1_labels.label0);
    *output_value = -1;
  } else if (type == NOTGATE) {
    output_labels->label0 = input0_labels.label1;
    output_labels->label1 = input0_labels.label0;
    *output_value = -1;
  } else {

    block A1;
    block A0;
    unsigned short v = Type2V(type);
    if (v & 1) {
      A1 = (input0_labels.label0);
      A0 = (input0_labels.label1);
    } else {
      A0 = (input0_labels.label0);
      A1 = (input0_labels.label1);
    }

    block B1;
    block B0;
    if (v & 2) {
      B1 = (input1_labels.label0);
      B0 = (input1_labels.label1);
    } else {
      B0 = (input1_labels.label0);
      B1 = (input1_labels.label1);
    }

    unsigned short pa = get_LSB(A0);
    unsigned short pb = get_LSB(B0);

    block tweak0 = MakeBlock(cid, 2 * gid + 0);
    block tweak1 = MakeBlock(cid, 2 * gid + 1);

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

    output_labels->label0 = C0;
    output_labels->label1 = C1;
    *output_value = -1;

    for (uint64_t j = 0; j < 2; j++) {
      garbled_tables[(*garbled_table_ind)++] = table[j];
      DUMP("table") << table[j] << endl;
    }
  }
}

uint64_t GarbleLowMem(const GarbledCircuit& garbled_circuit, block* init_labels,
                      block* input_labels, block* garbled_tables, block R,
                      AES_KEY& AES_Key, uint64_t cid, int connfd,
                      BlockPair *wires, short* wires_val, block* output_labels,
                      short* output_vals) {
  uint64_t garbled_table_ind = 0;

  uint64_t start_time = RDTSC;

  // init
  uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
  if (cid == 0) {
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.I[i];
      if (wire_index == CONST_ZERO) {
        wires_val[dff_bias + i] = 0;
      } else if (wire_index == CONST_ONE) {
        wires_val[dff_bias + i] = 1;
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_init_size()) {
        wires[dff_bias + i].label0 = init_labels[wire_index * 2 + 0];
        wires[dff_bias + i].label1 = init_labels[wire_index * 2 + 1];
        wires_val[dff_bias + i] = -1;
      } else {
        LOG(ERROR) << "Invalid I: " << wire_index << endl;
        wires_val[dff_bias + i] = 0;
      }
      DUMP("dff") << wires[dff_bias + i].label0 << endl;
    }
  } else {  //copy latched labels
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.D[i];
      if (wire_index == CONST_ZERO) {
        wires_val[dff_bias + i] = 0;
      } else if (wire_index == CONST_ONE) {
        wires_val[dff_bias + i] = 1;
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
        wires[dff_bias + i] = wires[wire_index];
        wires_val[dff_bias + i] = wires_val[wire_index];
      } else {
        LOG(ERROR) << "Invalid D: " << wire_index << endl;
        wires_val[dff_bias + i] = 0;
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

    BlockPair input0_labels = { ZeroBlock(), ZeroBlock() };
    short input0_value = -1;
    if (input0 == CONST_ZERO) {
      input0_value = 0;
    } else if (input0 == CONST_ONE) {
      input0_value = -1;
    } else if (input0 >= 0
        && input0 < (int64_t) garbled_circuit.get_wire_size()) {
      input0_labels = wires[input0];
      input0_value = wires_val[input0];
    } else {
      LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
      input0_value = 0;
    }

    BlockPair input1_labels = { ZeroBlock(), ZeroBlock() };
    short input1_value = -1;
    if (input1 == CONST_ZERO) {
      input1_value = 0;
    } else if (input1 == CONST_ONE) {
      input1_value = 1;
    } else if (input1 >= 0
        && input1 < (int64_t) garbled_circuit.get_wire_size()) {
      input1_labels = wires[input1];
      input1_value = wires_val[input1];
    } else if (type != NOTGATE) {
      LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
      input1_value = 0;
    }

    GarbleGate(input0_labels, input0_value, input1_labels, input1_value, type,
               cid, i, garbled_tables, &garbled_table_ind, R, AES_Key,
               &wires[output], &wires_val[output]);
  }

  for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
    output_labels[(i) * 2 + 0] = wires[garbled_circuit.outputs[i]].label0;
    output_labels[(i) * 2 + 1] = wires[garbled_circuit.outputs[i]].label1;
    output_vals[i] = wires_val[garbled_circuit.outputs[i]];
  }
  uint64_t end_time = RDTSC;
  return (end_time - start_time);
}

void Half0EvalGate(int type, short input0_value, block input1_labels,
                   block* output_labels, short* output_value) {

  bool x0 = GateOperator(type, input0_value, 0);
  bool x1 = GateOperator(type, input0_value, 1);

  if (x0 == x1) {
    if (x0 == 0) {
      *output_value = 0;
    } else {
      *output_value = 1;
    }
  } else {
    *output_labels = input1_labels;
    *output_value = -1;
  }
}

void Half1EvalGate(int type, short input1_value, block input0_labels,
                   block* output_labels, short* output_value) {
  bool x0 = GateOperator(type, 0, input1_value);
  bool x1 = GateOperator(type, 1, input1_value);

  if (x0 == x1) {
    if (x0 == 0) {
      *output_value = 0;
    } else {
      *output_value = 1;
    }
  } else {
    *output_labels = input0_labels;
    *output_value = -1;
  }
}

void EvalGate(block input0_labels, short input0_value, block input1_labels,
              short input1_value, int type, uint64_t cid, uint64_t gid,
              block* garbled_tables, uint64_t* garbled_table_ind,
              AES_KEY AES_Key, block* output_labels, short* output_value) {
  if (input0_value != -1 && input1_value != -1) {
    *output_value = GateOperator(type, input0_value, input1_value);
  } else if (input0_value != -1) {
    Half0EvalGate(type, input0_value, input1_labels, output_labels,
                  output_value);
  } else if (input1_value != -1) {
    Half1EvalGate(type, input1_value, input0_labels, output_labels,
                  output_value);
  } else if (type == XORGATE || type == XNORGATE) {
    *output_labels = XorBlock(input0_labels, input1_labels);
    *output_value = -1;
  } else if (type == NOTGATE) {
    *output_labels = input0_labels;
    *output_value = -1;
  } else {
    block A = (input0_labels);
    block B = (input1_labels);

    unsigned short sa = get_LSB(A);
    unsigned short sb = get_LSB(B);

    block tweak0 = MakeBlock(cid, 2 * gid + 0);
    block tweak1 = MakeBlock(cid, 2 * gid + 1);

    block table[2];
    for (uint64_t j = 0; j < 2; j++) {
      table[j] = garbled_tables[(*garbled_table_ind)++];
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

    *output_labels = C;
    *output_value = -1;
  }

}

uint64_t EvaluateLowMem(const GarbledCircuit& garbled_circuit,
                        block* init_labels, block* input_labels,
                        block* garbled_tables, AES_KEY& AES_Key, uint64_t cid,
                        int connfd, block *wires, short* wires_val,
                        block* output_labels, short* output_vals) {
  uint64_t garbled_table_ind = 0;
  uint64_t start_time = RDTSC;

  // init
  uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
  if (cid == 0) {
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.I[i];
      if (wire_index == CONST_ZERO) {
        wires_val[dff_bias + i] = 0;
      } else if (wire_index == CONST_ONE) {
        wires_val[dff_bias + i] = 1;
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_init_size()) {
        wires[dff_bias + i] = init_labels[wire_index];
        wires_val[dff_bias + i] = -1;
      } else {
        LOG(ERROR) << "Invalid I: " << wire_index << endl;
        wires_val[dff_bias + i] = 0;
      }
      DUMP("dff") << wires[dff_bias + i] << endl;
    }
  } else {  //copy latched labels
    for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
      int64_t wire_index = garbled_circuit.D[i];
      if (wire_index == CONST_ZERO) {
        wires_val[dff_bias + i] = 0;
      } else if (wire_index == CONST_ONE) {
        wires_val[dff_bias + i] = 1;
      } else if (wire_index >= 0
          && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
        wires[dff_bias + i] = wires[wire_index];
        wires_val[dff_bias + i] = wires_val[wire_index];
      } else {
        LOG(ERROR) << "Invalid D: " << wire_index << endl;
        wires_val[dff_bias + i] = 0;
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

    block input0_labels = ZeroBlock();
    short input0_value = -1;
    if (input0 == CONST_ZERO) {
      input0_value = 0;
    } else if (input0 == CONST_ONE) {
      input0_value = 1;
    } else if (input0 >= 0
        && input0 < (int64_t) garbled_circuit.get_wire_size()) {
      input0_labels = wires[input0];
      input0_value = wires_val[input0];
    } else {
      LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
      input0_value = 0;
    }

    block input1_labels = ZeroBlock();
    short input1_value = -1;
    if (input1 == CONST_ZERO) {
      input1_value = 0;
    } else if (input1 == CONST_ONE) {
      input1_value = 1;
    } else if (input1 >= 0
        && input1 < (int64_t) garbled_circuit.get_wire_size()) {
      input1_labels = wires[input1];
      input1_value = wires_val[input1];
    } else if (type != NOTGATE) {
      LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
      input1_value = 0;
    }
    EvalGate(input0_labels, input0_value, input1_labels, input1_value, type,
             cid, i, garbled_tables, &garbled_table_ind, AES_Key,
             &wires[output], &wires_val[output]);
  }

  for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
    output_labels[i] = wires[garbled_circuit.outputs[i]];
    output_vals[i] = wires_val[garbled_circuit.outputs[i]];
    DUMP("output") << wires[garbled_circuit.outputs[i]] << endl;
  }

  uint64_t end_time = RDTSC;
  return (end_time - start_time);
}

int GarbleAllocLabels(const GarbledCircuit& garbled_circuit,
                      block** init_labels, block** input_labels,
                      block** output_labels, short** output_vals, block R) {

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

  (*output_vals) = nullptr;
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC((*output_vals) = new short[garbled_circuit.output_size]);
  }

  return SUCCESS;
}

int GarbleGneInitLabels(const GarbledCircuit& garbled_circuit,
                        block* init_labels, block R) {

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
                        block** init_labels, block** input_labels,
                        block** output_labels, short** output_vals) {

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

  (*output_vals) = nullptr;
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC((*output_vals) = new short[garbled_circuit.output_size]);
  }

  return SUCCESS;
}

int GarbleOTInitLowMem(const GarbledCircuit& garbled_circuit,
                       block* init_labels, int connfd) {

  uint32_t message_len = garbled_circuit.e_init_size;
  if (message_len == 0) {
    return SUCCESS;
  }
  block **message = nullptr;
  CHECK_ALLOC(message = new block*[message_len]);

  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    CHECK_ALLOC(message[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      message[i][j] = init_labels[(i + garbled_circuit.g_init_size) * 2 + j];
    }
  }

  if (message_len > OT_EXT_LEN) {
    CHECK(OTExtSend(message, message_len, connfd));
  } else {
    CHECK(OTSend(message, message_len, connfd));
  }

  if (message != nullptr) {
    for (uint i = 0; i < message_len; i++) {
      delete[] message[i];
    }
    delete[] message;
  }

  return SUCCESS;
}

int GarbleOTInputLowMem(const GarbledCircuit& garbled_circuit,
                        block* input_labels, uint64_t cid, int connfd) {

  uint32_t message_len = garbled_circuit.e_input_size;
  if (message_len == 0) {
    return SUCCESS;
  }
  block **message = nullptr;
  CHECK_ALLOC(message = new block*[message_len]);

  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    CHECK_ALLOC(message[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      message[i][j] = input_labels[(i + garbled_circuit.g_input_size) * 2 + j];
    }
  }

  if (message_len > OT_EXT_LEN) {
    CHECK(OTExtSend(message, message_len, connfd));
  } else {
    CHECK(OTSend(message, message_len, connfd));
  }

  if (message != nullptr) {
    for (uint i = 0; i < message_len; i++) {
      delete[] message[i];
    }
    delete[] message;
  }

  return SUCCESS;
}

int EvalauteOTInitLowMem(const GarbledCircuit& garbled_circuit, BIGNUM* e_init,
                         block* init_labels, int connfd) {
  uint32_t message_len = garbled_circuit.e_init_size;
  if (message_len == 0) {
    return SUCCESS;
  }
  bool *select = nullptr;
  CHECK_ALLOC(select = new bool[message_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    select[i] = BN_is_bit_set(e_init, i);
  }

  block* message = nullptr;
  CHECK_ALLOC(message = new block[message_len]);

  if (message_len > OT_EXT_LEN) {
    CHECK(OTExtRecv(select, message_len, connfd, message));
  } else {
    CHECK(OTRecv(select, message_len, connfd, message));
  }

  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    init_labels[i + garbled_circuit.g_init_size] = message[i];
  }

  delete[] select;
  delete[] message;

  return SUCCESS;
}

int EvalauteOTInputLowMem(const GarbledCircuit& garbled_circuit,
                          BIGNUM* e_input, block* input_labels, uint64_t cid,
                          int connfd) {
  uint32_t message_len = garbled_circuit.e_input_size;
  if (message_len == 0) {
    return SUCCESS;
  }
  bool *select = nullptr;
  CHECK_ALLOC(select = new bool[message_len]);
  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    select[i] = BN_is_bit_set(e_input, cid * garbled_circuit.e_input_size + i);
  }

  block* message = nullptr;
  CHECK_ALLOC(message = new block[message_len]);

  if (message_len > OT_EXT_LEN) {
    CHECK(OTExtRecv(select, message_len, connfd, message));
  } else {
    CHECK(OTRecv(select, message_len, connfd, message));
  }

  for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
    input_labels[i + garbled_circuit.g_input_size] = message[i];
  }

  delete[] select;

  return SUCCESS;
}

int GarbleTransferInitLabels(const GarbledCircuit& garbled_circuit,
                             BIGNUM* g_init, block* init_labels,
                             bool disable_OT, int connfd) {

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
    CHECK(GarbleOTInitLowMem(garbled_circuit, init_labels, connfd));
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
    CHECK(GarbleOTInputLowMem(garbled_circuit, input_labels, cid, connfd));
  }
  return SUCCESS;
}

int EvaluateTransferInitLabels(const GarbledCircuit& garbled_circuit,
                               BIGNUM* e_init, block* init_labels,
                               bool disable_OT, int connfd) {
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
    CHECK(EvalauteOTInitLowMem(garbled_circuit, e_init, init_labels, connfd));
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
        EvalauteOTInputLowMem(garbled_circuit, e_input, input_labels, cid,
                              connfd));
  }
  return SUCCESS;
}

int GarbleTransferOutputLowMem(const GarbledCircuit& garbled_circuit,
                               block* output_labels, short* output_vals,
                               uint64_t cid, int output_mode,
                               const string& output_mask, BIGNUM* output_bn,
                               int connfd) {
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
    if (output_vals[i] == 0) {
      BN_clear_bit(output_bn, output_bit_offset + i);
    } else if (output_vals[i] == 1) {
      BN_set_bit(output_bn, output_bit_offset + i);
    } else {
      short garble_output_type = get_LSB(output_labels[(i) * 2 + 0]);
      short eval_output_type;
      if (cid * garbled_circuit.output_size + i
          >= (uint64_t) BN_num_bits(output_mask_bn)
          || BN_is_bit_set(output_mask_bn,
                           cid * garbled_circuit.output_size + i) == 0) {
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
  }

  BN_free(output_mask_bn);
  return SUCCESS;
}

int EvaluateTransferOutputLowMem(const GarbledCircuit& garbled_circuit,
                                 block* output_labels, short* output_vals,
                                 uint64_t cid, int output_mode,
                                 const string& output_mask, BIGNUM* output_bn,
                                 int connfd) {
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
    if (output_vals[i] == 0) {
      BN_clear_bit(output_bn, output_bit_offset + i);
    } else if (output_vals[i] == 1) {
      BN_set_bit(output_bn, output_bit_offset + i);
    } else {
      short garble_output_type;
      short eval_output_type = get_LSB(output_labels[i]);
      if (cid * garbled_circuit.output_size + i
          >= (uint64_t) BN_num_bits(output_mask_bn)
          || BN_is_bit_set(output_mask_bn,
                           cid * garbled_circuit.output_size + i) == 0) {
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
  }

  BN_free(output_mask_bn);
  return SUCCESS;
}

