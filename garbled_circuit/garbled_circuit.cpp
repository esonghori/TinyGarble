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
              const string& output_mask, OutputMode output_mode,
              bool disable_OT, bool low_mem_foot, string* output_str,
              int connfd) {
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
  BIGNUM* output_bn = BN_new();
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

  if (low_mem_foot && clock_cycles > 1) {
    CHECK(
        GarbleBNLowMem(garbled_circuit, g_init, g_input, clock_cycles,
                       output_mask, output_mode, init_labels, input_labels,
                       output_labels, output_vals, output_bn, R, global_key,
                       disable_OT, connfd));

    CHECK(
        OutputBN2StrLowMem(garbled_circuit, output_bn, clock_cycles,
                           output_mode, output_str));

  } else {
    CHECK(
        GarbleBNHighMem(garbled_circuit, g_init, g_input, clock_cycles,
                        output_mask, output_mode, init_labels, input_labels,
                        output_labels, output_vals, output_bn, R, global_key,
                        disable_OT, connfd));
    CHECK(
        OutputBN2StrHighMem(garbled_circuit, output_bn, clock_cycles,
                            output_mode, output_str));
  }
  BN_free(g_init);
  BN_free(g_input);
  BN_free(output_bn);

  delete[] init_labels;
  delete[] input_labels;
  delete[] output_labels;
  delete[] output_vals;

  RemoveGarbledCircuit(&garbled_circuit);

  return SUCCESS;
}

int EvaluateStr(const string& scd_file_address, const string& init_str,
                const string& input_str, uint64_t clock_cycles,
                const string& output_mask, OutputMode output_mode, bool disable_OT,
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
  BIGNUM* output_bn = BN_new();
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

  if (low_mem_foot && clock_cycles > 1) {
    CHECK(
        EvaluateBNLowMem(garbled_circuit, e_init, e_input, clock_cycles,
                         output_mask, output_mode, init_labels, input_labels,
                         output_labels, output_vals, output_bn, global_key,
                         disable_OT, connfd));
    CHECK(
        OutputBN2StrLowMem(garbled_circuit, output_bn, clock_cycles,
                           output_mode, output_str));
  } else {
    CHECK(
        EvaluateBNHighMem(garbled_circuit, e_init, e_input, clock_cycles,
                          output_mask, output_mode, init_labels, input_labels,
                          output_labels, output_vals, output_bn, global_key,
                          disable_OT, connfd));
    CHECK(
        OutputBN2StrHighMem(garbled_circuit, output_bn, clock_cycles,
                            output_mode, output_str));
  }
  BN_free(e_init);
  BN_free(e_input);
  BN_free(output_bn);

  delete[] init_labels;
  delete[] input_labels;
  delete[] output_labels;
  delete[] output_vals;

  RemoveGarbledCircuit(&garbled_circuit);
  return SUCCESS;
}

