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

#include "garbled_circuit/garbled_circuit_high_mem.h"

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "util/log.h"
#include "crypto/aes.h"
#include "crypto/BN.h"
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

int Garble(const GarbledCircuit& garbled_circuit, block* init_labels,
           block* input_labels, block global_key, block R,
           uint64_t clock_cycles, int connfd, block* output_labels,
           short* output_vals) {

  DUMP("r_key") << R << endl;
  DUMP("r_key") << global_key << endl;

  BlockPair *wires = nullptr;
  CHECK_ALLOC(wires = new BlockPair[garbled_circuit.get_wire_size()]);

  /*
   * The actual value of wire, 0,1 and unknown: -1.
   */
  short *wires_val = nullptr;
  CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
  for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
    wires_val[i] = UNKOWN;  // All wires are initialed with unknown.
  }

  int *fanout = nullptr;
  CHECK_ALLOC(fanout = new int[garbled_circuit.gate_size]);

  uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
  block* garbled_tables = nullptr;
  CHECK_ALLOC(garbled_tables = new block[num_of_non_xor * 2]);

  uint64_t comm_time = 0;
  uint64_t garble_time = 0;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    uint64_t garbled_table_ind = 0;
    uint64_t garble_start_time = RDTSC;
    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    int64_t gate_bias = (int64_t) garbled_circuit.get_gate_lo_index();
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
          wires_val[dff_bias + i] = UNKOWN;
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
          wires_val[dff_bias + i] = 0;  // Wire with invalid I values become 0.
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
          wires[dff_bias + i].label0 = wires[wire_index].label0;
          wires[dff_bias + i].label1 = wires[wire_index].label1;
          wires_val[dff_bias + i] = wires_val[wire_index];
        } else {
          LOG(ERROR) << "Invalid D: " << wire_index << endl;
          wires_val[dff_bias + i] = 0;  // Wire with invalid D values become 0.
        }
      }
    }
    // inputs
    uint64_t input_bias = garbled_circuit.get_input_lo_index();
    for (uint64_t i = 0; i < garbled_circuit.get_input_size(); i++) {
      wires[input_bias + i].label0 = input_labels[(cid
          * garbled_circuit.get_input_size() + i) * 2 + 0];
      wires[input_bias + i].label1 = input_labels[(cid
          * garbled_circuit.get_input_size() + i) * 2 + 1];
      DUMP("input")
          << input_labels[(cid * garbled_circuit.get_input_size() + i) * 2 + 0]
          << endl;
    }
    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  //known value
      fanout[i] = garbled_circuit.garbledGates[i].fanout;  // init fanout

      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      short input0_value = UNKOWN;
      if (input0 == CONST_ZERO) {
        input0_value = 0;
      } else if (input0 == CONST_ONE) {
        input0_value = 1;
      } else if (input0 >= 0
          && input0 < (int64_t) garbled_circuit.get_wire_size()) {
        input0_value = wires_val[input0];
      } else {
        LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
        input0_value = 0;
      }

      short input1_value = UNKOWN;
      if (input1 == CONST_ZERO) {
        input1_value = 0;
      } else if (input1 == CONST_ONE) {
        input1_value = 1;
      } else if (input1 >= 0
          && input1 < (int64_t) garbled_circuit.get_wire_size()) {
        input1_value = wires_val[input1];
      } else if (type != NOTGATE) {
        LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
        input1_value = 0;
      }

      GarbleEvalGateKnownValue(input0_value, input1_value, type,
                               &wires_val[output]);

      if (wires_val[output] != UNKOWN) {
        if (input0_value == UNKOWN) {
          ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
        } else if (input1_value == UNKOWN) {
          ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
        }
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  //secret value
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      if (fanout[i] > 0 && wires_val[output] == UNKOWN) {
        BlockPair input0_labels = { ZeroBlock(), ZeroBlock() };
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

        GarbleGate(input0_labels, input0_value, input1_labels, input1_value,
                   type, cid, i, garbled_tables, &garbled_table_ind, R, AES_Key,
                   &wires[output], &wires_val[output]);
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      output_labels[(cid * garbled_circuit.output_size + i) * 2 + 0] =
          wires[garbled_circuit.outputs[i]].label0;
      output_labels[(cid * garbled_circuit.output_size + i) * 2 + 1] =
          wires[garbled_circuit.outputs[i]].label1;
      output_vals[cid * garbled_circuit.output_size + i] =
          wires_val[garbled_circuit.outputs[i]];
      DUMP("output") << wires[garbled_circuit.outputs[i]].label0 << endl;
    }
    garble_time += RDTSC - garble_start_time;

    uint64_t comm_start_time = RDTSC;
    CHECK(SendData(connfd, garbled_tables, 2 * num_of_non_xor * sizeof(block)));
    comm_time += RDTSC - comm_start_time;

  }

  LOG(INFO) << "Alice communication time (cc) = " << comm_time
            << "\t(cc/gate) = "
            << (comm_time) / ((double) garbled_circuit.gate_size * clock_cycles)
            << endl;

  LOG(INFO)
      << "Alice garbling time (cc) = " << garble_time << "\t(cc/gate) = "
      << (garble_time) / ((double) garbled_circuit.gate_size * clock_cycles)
      << endl;

  delete[] wires;
  delete[] wires_val;
  delete[] fanout;
  delete[] garbled_tables;
  return SUCCESS;
}

int Evaluate(const GarbledCircuit& garbled_circuit, block* init_labels,
             block* input_labels, block global_key, uint64_t clock_cycles,
             int connfd, block* output_labels, short* output_vals) {

  DUMP("r_key") << global_key << endl;

  block *wires = nullptr;
  CHECK_ALLOC(wires = new block[garbled_circuit.get_wire_size()]);

  short *wires_val = nullptr;
  CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
  for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
    wires_val[i] = UNKOWN;  // All wires are initialed with unknown.
  }

  int *fanout = nullptr;
  CHECK_ALLOC(fanout = new int[garbled_circuit.gate_size]);

  uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
  block* garbled_tables = nullptr;
  CHECK_ALLOC(garbled_tables = new block[num_of_non_xor * 2]);

  uint64_t comm_time = 0;
  uint64_t eval_time = 0;

  AES_KEY AES_Key;
  AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    uint64_t garbled_table_ind = 0;

    uint64_t comm_start_time = RDTSC;
    CHECK(RecvData(connfd, garbled_tables, 2 * num_of_non_xor * sizeof(block)));
    comm_time += RDTSC - comm_start_time;

    uint64_t eval_start_time = RDTSC;
    // init
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    int64_t gate_bias = (int64_t) garbled_circuit.get_gate_lo_index();
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
          wires_val[dff_bias + i] = UNKOWN;
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
      wires[input_bias + i] = input_labels[cid
          * garbled_circuit.get_input_size() + i];
      DUMP("input") << input_labels[cid * garbled_circuit.get_input_size() + i]
                    << endl;
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  // known values
      fanout[i] = garbled_circuit.garbledGates[i].fanout;  // init fanout

      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      short input0_value = UNKOWN;
      if (input0 == CONST_ZERO) {
        input0_value = 0;
      } else if (input0 == CONST_ONE) {
        input0_value = 1;
      } else if (input0 >= 0
          && input0 < (int64_t) garbled_circuit.get_wire_size()) {
        input0_value = wires_val[input0];
      } else {
        LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
        input0_value = 0;
      }

      short input1_value = UNKOWN;
      if (input1 == CONST_ZERO) {
        input1_value = 0;
      } else if (input1 == CONST_ONE) {
        input1_value = 1;
      } else if (input1 >= 0
          && input1 < (int64_t) garbled_circuit.get_wire_size()) {
        input1_value = wires_val[input1];
      } else if (type != NOTGATE) {
        LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
        input1_value = 0;
      }

      GarbleEvalGateKnownValue(input0_value, input1_value, type,
                               &wires_val[output]);
      if (wires_val[output] != UNKOWN) {
        if (input0_value == UNKOWN) {
          ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
        } else if (input1_value == UNKOWN) {
          ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
        }
      }

    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  // secret values
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      int64_t input0 = garbledGate.input0;
      int64_t input1 = garbledGate.input1;
      int64_t output = garbledGate.output;
      int type = garbledGate.type;

      if (fanout[i] > 0 && wires_val[output] == UNKOWN) {
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
    }

    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      output_labels[cid * garbled_circuit.output_size + i] =
          wires[garbled_circuit.outputs[i]];
      output_vals[cid * garbled_circuit.output_size + i] =
          wires_val[garbled_circuit.outputs[i]];
      DUMP("output") << output_labels[cid * garbled_circuit.output_size + i]
                     << endl;
    }
    eval_time += RDTSC - eval_start_time;
  }

  LOG(INFO) << "Bob communication time (cc) = " << comm_time << "\t(cc/gate) = "
            << (comm_time) / ((double) garbled_circuit.gate_size * clock_cycles)
            << endl;

  LOG(INFO) << "Bob evaluation time (cc) = " << eval_time << "\t(cc/gate) = "
            << (eval_time) / ((double) garbled_circuit.gate_size * clock_cycles)
            << endl;

  delete[] wires;
  delete[] wires_val;
  delete[] fanout;
  delete[] garbled_tables;
  return SUCCESS;
}

int GarbleOT(const GarbledCircuit& garbled_circuit, block* init_labels,
             block* input_labels, uint64_t clock_cycles, int connfd) {

  uint32_t message_len = garbled_circuit.e_init_size
      + clock_cycles * garbled_circuit.e_input_size;
  block **message = nullptr;
  CHECK_ALLOC(message = new block*[message_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    CHECK_ALLOC(message[i] = new block[2]);
    for (uint j = 0; j < 2; j++) {
      message[i][j] = init_labels[(i + garbled_circuit.g_init_size) * 2 + j];
    }
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint idx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      CHECK_ALLOC(message[idx] = new block[2]);
      for (uint j = 0; j < 2; j++) {
        message[idx][j] = input_labels[(cid * garbled_circuit.get_input_size()
            + i + garbled_circuit.g_input_size) * 2 + j];
      }
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

int EvalauteOT(const GarbledCircuit& garbled_circuit, BIGNUM* e_init,
               block* init_labels, BIGNUM* e_input, block* input_labels,
               uint64_t clock_cycles, int connfd) {
  uint32_t message_len = garbled_circuit.e_init_size
      + clock_cycles * garbled_circuit.e_input_size;
  bool *select = nullptr;
  CHECK_ALLOC(select = new bool[message_len]);
  for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
    select[i] = BN_is_bit_set(e_init, i);
  }
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint indx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      select[indx] = BN_is_bit_set(e_input,
                                   cid * garbled_circuit.e_input_size + i);
    }
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
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
      uint indx = garbled_circuit.e_init_size
          + cid * garbled_circuit.e_input_size + i;
      input_labels[cid * garbled_circuit.get_input_size() + i
          + garbled_circuit.g_input_size] = message[indx];
    }
  }

  delete[] select;
  delete[] message;

  return SUCCESS;
}

int GarbleTransferLabels(const GarbledCircuit& garbled_circuit, BIGNUM* g_init,
                         block* init_labels, BIGNUM* g_input,
                         block* input_labels, uint64_t clock_cycles,
                         bool disable_OT, int connfd) {
// g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    if (i >= (uint) BN_num_bits(g_init) || BN_is_bit_set(g_init, i) == 0) {
      CHECK(SendData(connfd, &init_labels[i * 2 + 0], sizeof(block)));
    } else {
      CHECK(SendData(connfd, &init_labels[i * 2 + 1], sizeof(block)));
    }
  }
// g_input
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      if (cid * garbled_circuit.g_input_size + i >= (uint) BN_num_bits(g_input)
          || BN_is_bit_set(g_input, cid * garbled_circuit.g_input_size + i)
              == 0) {
        CHECK(
            SendData(
                connfd,
                &input_labels[(cid * garbled_circuit.get_input_size() + i) * 2
                    + 0],
                sizeof(block)));
      } else {
        CHECK(
            SendData(
                connfd,
                &input_labels[(cid * garbled_circuit.get_input_size() + i) * 2
                    + 1],
                sizeof(block)));
      }
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
    // e_input
    BIGNUM* e_input = BN_new();
    CHECK(RecvBN(connfd, e_input));
    for (uint cid = 0; cid < clock_cycles; cid++) {
      for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
        if (cid * garbled_circuit.e_input_size + i
            >= (uint) BN_num_bits(e_input)
            || BN_is_bit_set(e_input, cid * garbled_circuit.e_input_size + i)
                == 0) {
          CHECK(
              SendData(
                  connfd,
                  &input_labels[(cid * garbled_circuit.get_input_size() + i
                      + garbled_circuit.g_input_size) * 2 + 0],
                  sizeof(block)));
        } else {
          CHECK(
              SendData(
                  connfd,
                  &input_labels[(cid * garbled_circuit.get_input_size() + i
                      + garbled_circuit.g_input_size) * 2 + 1],
                  sizeof(block)));
        }
      }
    }

    BN_free(e_init);
    BN_free(e_input);

  } else {
    CHECK(
        GarbleOT(garbled_circuit, init_labels, input_labels, clock_cycles,
                 connfd));
  }
  return SUCCESS;
}

int EvaluateTransferLabels(const GarbledCircuit& garbled_circuit,
                           BIGNUM* e_init, block* init_labels, BIGNUM* e_input,
                           block* input_labels, uint64_t clock_cycles,
                           bool disable_OT, int connfd) {
// g_init
  for (uint i = 0; i < garbled_circuit.g_init_size; i++) {
    CHECK(RecvData(connfd, &init_labels[i], sizeof(block)));
  }
// g_input
  for (uint cid = 0; cid < clock_cycles; cid++) {
    for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
      CHECK(
          RecvData(connfd,
                   &input_labels[cid * garbled_circuit.get_input_size() + i],
                   sizeof(block)));
    }
  }

  if (disable_OT) {
    // e_init
    CHECK(SendBN(connfd, e_init));
    for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
      CHECK(
          RecvData(connfd, &init_labels[i + garbled_circuit.g_init_size],
                   sizeof(block)));
    }
    // e_input
    CHECK(SendBN(connfd, e_input));
    for (uint cid = 0; cid < clock_cycles; cid++) {
      for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
        CHECK(
            RecvData(
                connfd,
                &input_labels[cid * garbled_circuit.get_input_size() + i
                    + garbled_circuit.g_input_size],
                sizeof(block)));
      }
    }
  } else {
    CHECK(
        EvalauteOT(garbled_circuit, e_init, init_labels, e_input, input_labels,
                   clock_cycles, connfd));
  }
  return SUCCESS;
}

int GarbleMakeLabels(const GarbledCircuit& garbled_circuit, block** init_labels,
                     block** input_labels, block** output_labels,
                     short** output_vals, block R, uint64_t clock_cycles) {

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
  (*output_labels) = nullptr;
  (*output_vals) = nullptr;

  if (garbled_circuit.get_input_size() > 0) {
    CHECK_ALLOC(
        (*input_labels) = new block[clock_cycles
            * garbled_circuit.get_input_size() * 2]);
    for (uint cid = 0; cid < clock_cycles; cid++) {
      for (uint i = 0; i < garbled_circuit.get_input_size(); i++) {
        (*input_labels)[(cid * garbled_circuit.get_input_size() + i) * 2 + 0] =
            RandomBlock();
        (*input_labels)[(cid * garbled_circuit.get_input_size() + i) * 2 + 1] =
            XorBlock(
                R,
                (*input_labels)[(cid * garbled_circuit.get_input_size() + i) * 2
                    + 0]);
      }
    }
  }
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC(
        (*output_labels) = new block[clock_cycles * garbled_circuit.output_size
            * 2]);
    CHECK_ALLOC(
        (*output_vals) = new short[clock_cycles * garbled_circuit.output_size]);
  }

  return SUCCESS;
}

int EvaluateMakeLabels(const GarbledCircuit& garbled_circuit,
                       block** init_labels, block** input_labels,
                       block** output_labels, short** output_vals,
                       uint64_t clock_cycles) {
  (*init_labels) = nullptr;
  if (garbled_circuit.get_init_size() > 0) {
    CHECK_ALLOC((*init_labels) = new block[garbled_circuit.get_init_size()]);
  }

  (*input_labels) = nullptr;
  (*output_labels) = nullptr;
  (*output_vals) = nullptr;
  if (garbled_circuit.get_input_size() > 0) {
    CHECK_ALLOC(
        (*input_labels) = new block[clock_cycles
            * garbled_circuit.get_input_size()]);
  }
  if (garbled_circuit.output_size > 0) {
    CHECK_ALLOC(
        (*output_labels) =
            new block[clock_cycles * garbled_circuit.output_size]);
    CHECK_ALLOC(
        (*output_vals) = new short[clock_cycles * garbled_circuit.output_size]);
  }
  return SUCCESS;
}

int GarbleTransferOutput(const GarbledCircuit& garbled_circuit,
                         block* output_labels, short * output_vals,
                         uint64_t clock_cycles, const string& output_mask,
                         int output_mode, string* output_str, int connfd) {
  BIGNUM* output_mask_bn = BN_new();
  BN_hex2bn(&output_mask_bn, output_mask.c_str());

  BIGNUM* output_bn = BN_new();
  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      if (output_vals[cid * garbled_circuit.output_size + i] == 0) {
        BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
      } else if (output_vals[cid * garbled_circuit.output_size + i] == 1) {
        BN_set_bit(output_bn, cid * garbled_circuit.output_size + i);
      } else {
        short garble_output_type = get_LSB(
            output_labels[(cid * garbled_circuit.output_size + i) * 2 + 0]);
        short eval_output_type;
        if (cid * garbled_circuit.output_size + i
            >= (uint64_t) BN_num_bits(output_mask_bn)
            || BN_is_bit_set(output_mask_bn,
                             cid * garbled_circuit.output_size + i) == 0) {
          CHECK(SendData(connfd, &garble_output_type, sizeof(short)));
          BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
        } else {
          CHECK(RecvData(connfd, &eval_output_type, sizeof(short)));
          if (eval_output_type != garble_output_type) {
            BN_set_bit(output_bn, cid * garbled_circuit.output_size + i);
          } else {
            BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
          }
        }
      }
    }
  }
  OutputBN2Str(garbled_circuit, output_bn, clock_cycles, output_mode,
               output_str);

  BN_free(output_mask_bn);
  BN_free(output_bn);
  return SUCCESS;
}

int EvaluateTransferOutput(const GarbledCircuit& garbled_circuit,
                           block* output_labels, short* output_vals,
                           uint64_t clock_cycles, const string& output_mask,
                           int output_mode, string* output_str, int connfd) {
  BIGNUM* output_mask_bn = BN_new();
  BN_hex2bn(&output_mask_bn, output_mask.c_str());

  BIGNUM* output_bn = BN_new();
  for (uint64_t cid = 0; cid < clock_cycles; cid++) {
    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      if (output_vals[cid * garbled_circuit.output_size + i] == 0) {
        BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
      } else if (output_vals[cid * garbled_circuit.output_size + i] == 1) {
        BN_set_bit(output_bn, cid * garbled_circuit.output_size + i);
      } else {
        short garble_output_type;
        short eval_output_type = get_LSB(
            output_labels[cid * garbled_circuit.output_size + i]);
        if (cid * garbled_circuit.output_size + i
            >= (uint64_t) BN_num_bits(output_mask_bn)
            || BN_is_bit_set(output_mask_bn,
                             cid * garbled_circuit.output_size + i) == 0) {
          CHECK(RecvData(connfd, &garble_output_type, sizeof(short)));
          if (eval_output_type != garble_output_type) {
            BN_set_bit(output_bn, cid * garbled_circuit.output_size + i);
          } else {
            BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
          }
        } else {
          CHECK(SendData(connfd, &eval_output_type, sizeof(short)));
          BN_clear_bit(output_bn, cid * garbled_circuit.output_size + i);
        }
      }
    }
  }

  OutputBN2Str(garbled_circuit, output_bn, clock_cycles, output_mode,
               output_str);

  BN_free(output_mask_bn);
  BN_free(output_bn);
  return SUCCESS;
}
