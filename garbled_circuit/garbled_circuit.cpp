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

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "crypto/aes.h"
#include "crypto/BN.h"
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include "garbled_circuit/garbled_circuit_high_mem.h"
#include "garbled_circuit/garbled_circuit_low_mem.h"
#include "tcpip/tcpip.h"
#include "util/log.h"
#include "util/common.h"
#include "util/util.h"

int GarbleStr(const string& scd_file_address, const string& init_str,
              const string& input_str, uint64_t clock_cycles,
              const string& output_mask, int output_mode, bool disable_OT,
              bool low_mem_foot, string* output_str, int connfd) {
  if (clock_cycles == 0) {
    return FAILURE;
  }

  GarbledCircuit garbled_circuit;
  if (ReadSCD(scd_file_address, &garbled_circuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return FAILURE;
  }
  FillFanout(&garbled_circuit);

  block R = RandomBlock();  // secret label
  *((short *) (&R)) |= 1;

  // parse init and input
  BIGNUM* g_init = BN_new();
  BIGNUM* g_input = BN_new();
  CHECK(
      ParseInitInputStr(init_str, input_str, garbled_circuit.g_init_size,
                        garbled_circuit.g_input_size, clock_cycles, &g_init,
                        &g_input));

  block* init_labels = nullptr;
  block* input_labels = nullptr;
  block* output_labels = nullptr;
  short* output_vals = nullptr;

  // global key
  block global_key = RandomBlock();
  CHECK(SendData(connfd, &global_key, sizeof(block)));  // send global key

  uint64_t ot_time = 0;
  if (low_mem_foot && clock_cycles > 1) {
    uint64_t garble_time = 0;
    uint64_t comm_time = 0;
    BlockPair *wires = nullptr;
    CHECK_ALLOC(wires = new BlockPair[garbled_circuit.get_wire_size()]);
    short *wires_val = nullptr;
    CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
    for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
      wires_val[i] = -1;  // All wires are initialed with unknown.
    }
    uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
    block* garbled_tables = nullptr;
    CHECK_ALLOC(garbled_tables = new block[num_of_non_xor * 2]);

    BIGNUM* output_bn = BN_new();

    CHECK(
        GarbleAllocLabels(garbled_circuit, &init_labels, &input_labels,
                          &output_labels, &output_vals, R));

    CHECK(GarbleGneInitLabels(garbled_circuit, init_labels, R));

    uint64_t ot_start_time = RDTSC;
    {
      CHECK(
          GarbleTransferInitLabels(garbled_circuit, g_init, init_labels,
                                   disable_OT, connfd));
    }
    ot_time += RDTSC - ot_start_time;

    AES_KEY AES_Key;
    AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);
    DUMP("r_key") << R << endl;
    DUMP("r_key") << global_key << endl;

    for (uint64_t cid = 0; cid < clock_cycles; cid++) {

      CHECK(GarbleGenInputLabels(garbled_circuit, input_labels, R));

      ot_start_time = RDTSC;
      {
        CHECK(
            GarbleTransferInputLabels(garbled_circuit, g_input, input_labels,
                                      cid, disable_OT, connfd));
      }
      ot_time += RDTSC - ot_start_time;

      uint64_t garble_start_time = RDTSC;
      {
        GarbleLowMem(garbled_circuit, init_labels, input_labels, garbled_tables,
                     R, AES_Key, cid, connfd, wires, wires_val, output_labels,
                     output_vals);
      }
      garble_time += RDTSC - garble_start_time;

      uint64_t comm_start_time = RDTSC;
      {
        CHECK(
            SendData(connfd, garbled_tables,
                     2 * num_of_non_xor * sizeof(block)));
      }
      comm_time += RDTSC - comm_start_time;
      CHECK(
          GarbleTransferOutputLowMem(garbled_circuit, output_labels,
                                     output_vals, cid, output_mode, output_mask,
                                     output_bn, connfd));

    }
    OutputBN2StrLowMem(garbled_circuit, output_bn, clock_cycles, output_mode,
                       output_str);
    BN_free(output_bn);
    LOG(INFO)
        << "Alice transfer labels time (cc) = "
        << ot_time
        << "\t(cc/bit) = "
        << ot_time
            / ((double) (garbled_circuit.e_init_size
                + clock_cycles * garbled_circuit.e_input_size))
        << endl;
    LOG(INFO)
        << "Alice communication time (cc) = " << comm_time << "\t(cc/gate) = "
        << (comm_time) / ((double) garbled_circuit.gate_size * clock_cycles)
        << endl;

    LOG(INFO)
        << "Alice garbling time (cc) = " << garble_time << "\t(cc/gate) = "
        << (garble_time) / ((double) garbled_circuit.gate_size * clock_cycles)
        << endl;
    delete[] wires;
    delete[] garbled_tables;

  } else {
    // allocate init and input values and translate form string
    CHECK(
        GarbleMakeLabels(garbled_circuit, &init_labels, &input_labels,
                         &output_labels, &output_vals, R, clock_cycles));

    uint64_t ot_start_time = RDTSC;
    {
      CHECK(
          GarbleTransferLabels(garbled_circuit, g_init, init_labels, g_input,
                               input_labels, clock_cycles, disable_OT, connfd));
    }
    ot_time = RDTSC - ot_start_time;

    LOG(INFO)
        << "Alice transfer labels time (cc) = "
        << ot_time
        << "\t(cc/bit) = "
        << ot_time
            / ((double) (garbled_circuit.e_init_size
                + clock_cycles * garbled_circuit.e_input_size))
        << endl;

    Garble(garbled_circuit, init_labels, input_labels, global_key, R,
           clock_cycles, connfd, output_labels, output_vals);
    CHECK(
        GarbleTransferOutput(garbled_circuit, output_labels, output_vals,
                             clock_cycles, output_mask, output_mode, output_str,
                             connfd));
  }
  BN_free(g_init);
  BN_free(g_input);
  delete[] init_labels;
  delete[] input_labels;
  delete[] output_labels;
  delete[] output_vals;

  RemoveGarbledCircuit(&garbled_circuit);

  return SUCCESS;
}

int EvaluateStr(const string& scd_file_address, const string& init_str,
                const string& input_str, uint64_t clock_cycles,
                const string& output_mask, int output_mode, bool disable_OT,
                bool low_mem_foot, string* output_str, int connfd) {
  if (clock_cycles == 0) {
    return FAILURE;
  }

  GarbledCircuit garbled_circuit;
  if (ReadSCD(scd_file_address, &garbled_circuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return FAILURE;
  }
  FillFanout(&garbled_circuit);

  // allocate init and input values and translate form string
  BIGNUM* e_init = BN_new();
  BIGNUM* e_input = BN_new();
  CHECK(
      ParseInitInputStr(init_str, input_str, garbled_circuit.e_init_size,
                        garbled_circuit.e_input_size, clock_cycles, &e_init,
                        &e_input));

  block* init_labels = nullptr;
  block* input_labels = nullptr;
  block* output_labels = nullptr;
  short* output_vals = nullptr;

  // global key
  block global_key = RandomBlock();
  CHECK(RecvData(connfd, &global_key, sizeof(block)));  // receive global key

  uint64_t ot_time = 0;
  if (low_mem_foot && clock_cycles > 1) {
    uint64_t eval_time = 0;
    uint64_t comm_time = 0;
    block *wires = nullptr;
    CHECK_ALLOC(wires = new block[garbled_circuit.get_wire_size()]);
    short *wires_val = nullptr;
    CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
    for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
      wires_val[i] = -1;  // All wires are initialed with unknown.
    }
    uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
    block* garbled_tables = nullptr;
    CHECK_ALLOC(garbled_tables = new block[num_of_non_xor * 2]);
    BIGNUM* output_bn = BN_new();

    CHECK(
        EvaluateAllocLabels(garbled_circuit, &init_labels, &input_labels,
                            &output_labels, &output_vals));
    uint64_t ot_start_time = RDTSC;
    {
      CHECK(
          EvaluateTransferInitLabels(garbled_circuit, e_init, init_labels,
                                     disable_OT, connfd));
    }
    ot_time += RDTSC - ot_start_time;

    AES_KEY AES_Key;
    AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);
    DUMP("r_key") << global_key << endl;

    for (uint64_t cid = 0; cid < clock_cycles; cid++) {
      ot_start_time = RDTSC;
      {
        CHECK(
            EvaluateTransferInputLabels(garbled_circuit, e_input, input_labels,
                                        cid, disable_OT, connfd));
      }
      ot_time += RDTSC - ot_start_time;

      uint64_t comm_start_time = RDTSC;
      {
        CHECK(
            RecvData(connfd, garbled_tables,
                     2 * num_of_non_xor * sizeof(block)));
      }
      comm_time += RDTSC - comm_start_time;

      uint64_t eval_start_time = RDTSC;
      {
        eval_time += EvaluateLowMem(garbled_circuit, init_labels, input_labels,
                                    garbled_tables, AES_Key, cid, connfd, wires,
                                    wires_val, output_labels, output_vals);
      }
      eval_time += RDTSC - eval_start_time;

      CHECK(
          EvaluateTransferOutputLowMem(garbled_circuit, output_labels,
                                       output_vals, cid, output_mode,
                                       output_mask, output_bn, connfd));

    }
    OutputBN2StrLowMem(garbled_circuit, output_bn, clock_cycles, output_mode,
                       output_str);
    BN_free(output_bn);
    LOG(INFO)
        << "Bob transfer labels time (cc) = "
        << ot_time
        << "\t(cc/bit) = "
        << ot_time
            / ((double) (garbled_circuit.e_init_size
                + clock_cycles * garbled_circuit.e_input_size))
        << endl;
    LOG(INFO)
        << "Bob communication time (cc) = " << comm_time << "\t(cc/gate) = "
        << (comm_time) / ((double) garbled_circuit.gate_size * clock_cycles)
        << endl;

    LOG(INFO)
        << "Bob evaluation time (cc) = " << eval_time << "\t(cc/gate) = "
        << (eval_time) / ((double) garbled_circuit.gate_size * clock_cycles)
        << endl;

    delete[] wires;
    delete[] garbled_tables;
  } else {
    CHECK(
        EvaluateMakeLabels(garbled_circuit, &init_labels, &input_labels,
                           &output_labels, &output_vals, clock_cycles));

    // transfer labels
    uint64_t ot_start_time = RDTSC;
    CHECK(
        EvaluateTransferLabels(garbled_circuit, e_init, init_labels, e_input,
                               input_labels, clock_cycles, disable_OT, connfd));
    ot_time = RDTSC - ot_start_time;

    LOG(INFO)
        << "Bob transfer labels time (cc) = "
        << ot_time
        << "\t(cc/bit) = "
        << ot_time
            / ((double) (garbled_circuit.e_init_size
                + clock_cycles * garbled_circuit.e_input_size))
        << endl;

    Evaluate(garbled_circuit, init_labels, input_labels, global_key,
             clock_cycles, connfd, output_labels, output_vals);

    CHECK(
        EvaluateTransferOutput(garbled_circuit, output_labels, output_vals,
                               clock_cycles, output_mask, output_mode,
                               output_str, connfd));

  }
  BN_free(e_init);
  BN_free(e_input);

  delete[] init_labels;
  delete[] input_labels;
  delete[] output_labels;
  delete[] output_vals;

  RemoveGarbledCircuit(&garbled_circuit);
  return SUCCESS;
}

