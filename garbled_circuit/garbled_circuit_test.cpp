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

#include <iostream>
#include "crypto/OT_extension.h"
#include "tcpip/tcpip.h"
#include "tcpip/tcpip_testsuit.h"
#include "scd/scd_evaluator.h"
#include "util/common.h"
#include "util/util.h"
#include "util/log.h"
#include "util/tinygarble_config.h"
#include "util/minunit.h"

using std::endl;

#define TEST_REPEAT 3

struct GCTestStruct {
  string scd_file_address;
  string p_init;
  string p_input;
  string init;
  string input;
  string output;
  string output_mask;
  OutputMode output_mode;
  bool disable_OT;
  bool low_mem_foot;
  uint64_t clock_cycles;
};

GCTestStruct MakeGCTestStruct(const string& scd_file_address,
                              const string& p_init, const string& p_input,
                              const string& init, const string& input,
                              const string& output, const string& output_mask,
                              OutputMode output_mode, bool disable_OT,
                              bool low_mem_foot, uint64_t clock_cycles) {
  GCTestStruct ret;

  ret.scd_file_address = scd_file_address;
  ret.p_init = p_init;
  ret.p_input = p_input;
  ret.init = init;
  ret.input = input;
  ret.output = output;
  ret.output_mask = output_mask;
  ret.output_mode = output_mode;
  ret.disable_OT = disable_OT;
  ret.low_mem_foot = low_mem_foot;
  ret.clock_cycles = clock_cycles;
  return ret;
}

void TestSetup() {
}
void TestTeardown() {
}

int Alice(const void* data, int connfd) {
  GCTestStruct* gc_data = (GCTestStruct*) data;
  string output_str;
  int ret = GarbleStr(gc_data->scd_file_address, gc_data->init, gc_data->input,
                      gc_data->clock_cycles, gc_data->output_mask,
                      gc_data->output_mode, gc_data->disable_OT,
                      gc_data->low_mem_foot, &output_str, connfd);

  if (ret == FAILURE) {
    LOG(ERROR) << "GarbleStr failed.";
    return FAILURE;
  }

  if (output_str != gc_data->output) {
    LOG(ERROR) << "Alice-side equality test failed "
               "(plain-text's != garble circuit's): "
               << output_str << " != " << gc_data->output << endl;
    return FAILURE;
  }
  LOG(INFO) << "Equality passed: " << output_str << " == " << gc_data->output
            << endl;
  return SUCCESS;
}

int Bob(const void *data, int connfd) {
  GCTestStruct* gc_data = (GCTestStruct*) data;
  string output_str;
  int ret = EvaluateStr(gc_data->scd_file_address, gc_data->init,
                        gc_data->input, gc_data->clock_cycles,
                        gc_data->output_mask, gc_data->output_mode,
                        gc_data->disable_OT, gc_data->low_mem_foot, &output_str,
                        connfd);
  if (ret == FAILURE) {
    LOG(ERROR) << "EvaluateStr failed.";
    return FAILURE;
  }

  if (output_str != gc_data->output) {
    LOG(ERROR) << "Bob's side equality test failed "
               "(plain-text's != garble circuit's): "
               << output_str << " != " << gc_data->output << endl;
    return FAILURE;
  }
  LOG(INFO) << "Equality passed: " << output_str << " == " << gc_data->output
            << endl;

  return SUCCESS;
}

MU_TEST(Mux8Bit1cc) {

  LOG(INFO) << "Test Mux 8-bit 1cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/mux_8bit_1cc.scd";
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 1;
  OutputMode output_mode = OutputMode::consecutive;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 256);
    x[1] = (uint8_t) (rand() % 256);
    uint8_t select = (uint8_t) (rand() % 2);

    string g_input_str = to_string_hex(x[1], 2) + to_string_hex(x[0], 2);
    string e_input_str = std::to_string(select);
    string output_str = "";

    LOG(INFO) << "mux (8-bit 1cc): " << e_input_str << " from {0:"
              << to_string_hex(x[0], 2) << ", 1:" << to_string_hex(x[1], 2)
              << "}. " << g_input_str << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Sum1Bit8cc) {

  LOG(INFO) << "Test Sum 8-bit 8cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_nbit_ncc.scd";
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 8;
  OutputMode output_mode = OutputMode::consecutive;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "sum (1-bit 8cc): " << g_input_str << " + " << e_input_str
              << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Sum8Bit1cc) {

  LOG(INFO) << "Test Sum 8-Bit 1cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_8bit_1cc.scd";
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 1;
  OutputMode output_mode = OutputMode::consecutive;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "sum (8-bit 1cc): " << g_input_str << " + " << e_input_str
              << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Hamming32Bit1cc) {

  LOG(INFO) << "Test Hamming 32-bit 1cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_1cc.scd";
  OutputMode output_mode = OutputMode::consecutive;  // normal mode
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 1;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 1cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Hamming32Bit8cc) {

  LOG(INFO) << "Test Hamming 32-bit 8cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;  // print the last cycle
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 8cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Hamming32Bit8ccDisabledOT) {

  LOG(INFO) << "Test Hamming 32-bit 8cc Disabled OT" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;  // print the last cycle
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  bool disable_OT = true;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 8cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Hamming32Bit8ccWithMask) {
  LOG(INFO) << "Test Hamming 32-bit 8cc with output mask" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;  // print the last cycle
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  string output_mask = "FFFFFFFFFFFF";  //48-bit
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 8cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    string garble_output_str = output_str;
    string eval_output_str = "0";

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, garble_output_str,
                                                 output_mask, output_mode,
                                                 disable_OT, low_mem_foot,
                                                 clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, eval_output_str,
                                              output_mask, output_mode,
                                              disable_OT, low_mem_foot,
                                              clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Hamming32Bit8ccDisabledOTLowMem) {

  LOG(INFO) << "Test Hamming 32-bit 8cc Disabled OT with Low Memory Footprint"
            << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;  // print the last cycle
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  bool disable_OT = true;
  bool low_mem_foot = true;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 8cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Hamming32Bit8ccLowMem) {

  LOG(INFO) << "Test Hamming 32-bit 8cc with Low Memory Footprint" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;  // print the last cycle
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  bool disable_OT = false;
  bool low_mem_foot = true;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32-bit 8cc) distance between " << g_input_str
              << " and " << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, "0", "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(NonSecret8bit3cc) {

  LOG(INFO) << "Test Non-secret test 8-bit 3cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/non_secret_test_8bit_ncc.scd";
  string p_init_str = "";
  string p_input_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 3;
  OutputMode output_mode = OutputMode::separated_clock;
  bool disable_OT = false;
  bool low_mem_foot = false;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = "";
    string e_input_str = "";
    for (uint64_t j = 0; j < clock_cycles; j++) {
      g_input_str += to_string_hex(x[0], 2);
      e_input_str += to_string_hex(x[1], 2);
    }

    string g_output_str = "0\n0\n0";  // clock_cycles=3
    string output_str = "";

    LOG(INFO) << "Non-secret test (1-bit 8cc): " << g_input_str << " (+/-) "
              << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

    LOG(INFO) << "output_str = " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                                 p_input_str, g_init_str,
                                                 g_input_str, g_output_str, "0",
                                                 output_mode, disable_OT,
                                                 low_mem_foot, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                              p_input_str, e_init_str,
                                              e_input_str, output_str, "0",
                                              output_mode, disable_OT,
                                              low_mem_foot, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(PublicWire8Bit2cc) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/public_test_8bit_ncc.scd";
  OutputMode output_mode = OutputMode::consecutive;
  string p_init_str = "AB";
  string g_init_str = "18";
  string e_init_str = "B2";
  string p_input_str = "C3DE";
  string g_input_str = "1945";
  string e_input_str = "A5C6";
  uint64_t clock_cycles = 2;
  bool disable_OT = false;
  bool low_mem_foot = false;

  string output_str = "";

  LOG(INFO) << "Public Wire test (8-bit 2cc)" << endl;

  int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                  e_init_str, p_input_str, g_input_str,
                                  e_input_str, clock_cycles, output_mode,
                                  &output_str);
  mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");

  GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                               p_input_str, g_init_str,
                                               g_input_str, "0", "0",
                                               output_mode, disable_OT,
                                               low_mem_foot, clock_cycles);
  GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, p_init_str,
                                            p_input_str, e_init_str,
                                            e_input_str, output_str, "0",
                                            output_mode, disable_OT,
                                            low_mem_foot, clock_cycles);

  ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
  mu_assert(ret == SUCCESS, "TcpipTestRun");

  mu_check(output_str == "235C");

}

MU_TEST_SUITE(TestSuite) {
  MU_SUITE_CONFIGURE(&TestSetup, &TestTeardown);

  MU_RUN_TEST(Mux8Bit1cc);
  MU_RUN_TEST(Sum1Bit8cc);
  MU_RUN_TEST(Sum8Bit1cc);
  MU_RUN_TEST(Hamming32Bit1cc);
  MU_RUN_TEST(Hamming32Bit8cc);
  MU_RUN_TEST(Hamming32Bit8ccDisabledOT);
  MU_RUN_TEST(Hamming32Bit8ccWithMask);
  MU_RUN_TEST(Hamming32Bit8ccDisabledOTLowMem);
  MU_RUN_TEST(Hamming32Bit8ccLowMem);
  MU_RUN_TEST(NonSecret8bit3cc);
  //MU_RUN_TEST(PublicWire8Bit2cc);

}

int main(int argc, char* argv[]) {
  LogInitial(argc, argv);
  HashInit();
  srand(time(NULL));
  SrandSSE(time(NULL));
  MU_RUN_SUITE(TestSuite);
  MU_REPORT()
  ;
  LogFinish();
  HashFinish();
  return SUCCESS;
}
