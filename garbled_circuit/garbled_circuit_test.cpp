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
  string init;
  string input;
  int output_mode;
  string output;
  uint64_t clock_cycles;
};

GCTestStruct MakeGCTestStruct(string scd_file_address, string init,
                              string input, int output_mode, string output,
                              uint64_t clock_cycles) {
  GCTestStruct ret;

  ret.scd_file_address = scd_file_address;
  ret.init = init;
  ret.input = input;
  ret.output_mode = output_mode;
  ret.output = output;
  ret.clock_cycles = clock_cycles;
  return ret;
}

void TestSetup() {
}
void TestTeardown() {
}

int Alice(const void* data, int connfd) {
  GCTestStruct* gc_data = (GCTestStruct*) data;

  return GarbleStr(gc_data->scd_file_address, gc_data->init, gc_data->input,
                   gc_data->clock_cycles, connfd);
}

int Bob(const void *data, int connfd) {
  GCTestStruct* gc_data = (GCTestStruct*) data;
  string output_str;
  int ret = EvaluateStr(gc_data->scd_file_address, gc_data->init,
                        gc_data->input, gc_data->clock_cycles,
                        gc_data->output_mode, &output_str, connfd);
  if (ret == FAILURE) {
    LOG(ERROR) << "EvaluateStr failed.";
    return FAILURE;
  }

  if (output_str != gc_data->output) {
    LOG(ERROR) << "Equality test failed (plain-text's != garble circuit's): "
               << output_str << " != " << gc_data->output << endl;
    return FAILURE;
  }
  LOG(INFO) << "Equality passed: " << output_str << " == " << gc_data->output
            << endl;

  return SUCCESS;
}

MU_TEST(Mux8Bit) {

  LOG(INFO) << "Test Mux8Bit" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/mux_8bit.scd";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 1;
  int output_mode = 0;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 256);
    x[1] = (uint8_t) (rand() % 256);
    uint8_t select = (uint8_t) (rand() % 2);

    string g_input_str = to_string_hex(x[1], 2) + to_string_hex(x[0], 2);
    string e_input_str = std::to_string(select);
    string output_str = "";

    LOG(INFO) << "mux (8bit 1cc): " << e_input_str << " from {0:"
              << to_string_hex(x[0], 2) << ", 1:" << to_string_hex(x[1], 2)
              << "}. " << g_input_str << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, g_init_str, e_init_str,
                                    g_input_str, e_input_str, clock_cycles,
                                    output_mode, &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "plain-text result: " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, g_init_str,
                                                 g_input_str, output_mode,
                                                 output_str, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, e_init_str,
                                              e_input_str, output_mode,
                                              output_str, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Sum1Bit) {

  LOG(INFO) << "Test Sum1Bit" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_1bit.scd";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 8;
  int output_mode = 0;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "sum (1bit 8cc): " << g_input_str << " + " << e_input_str
              << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, g_init_str, e_init_str,
                                    g_input_str, e_input_str, clock_cycles,
                                    output_mode, &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "plain-text result: " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, g_init_str,
                                                 g_input_str, output_mode,
                                                 output_str, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, e_init_str,
                                              e_input_str, output_mode,
                                              output_str, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST(Sum8Bit) {

  LOG(INFO) << "Test Sum8Bit" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_8bit.scd";
  string g_init_str = "0";
  string e_init_str = "0";
  uint64_t clock_cycles = 1;
  int output_mode = 0;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "sum (8bit 1cc): " << g_input_str << " + " << e_input_str
              << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, g_init_str, e_init_str,
                                    g_input_str, e_input_str, clock_cycles,
                                    output_mode, &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "plain-text result: " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, g_init_str,
                                                 g_input_str, output_mode,
                                                 output_str, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, e_init_str,
                                              e_input_str, output_mode,
                                              output_str, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Hamming32Bit1cc) {

  LOG(INFO) << "Test Hamming32Bit1cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_1cc.scd";
  int output_mode = 0;  // normal mode
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 1;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32bit 1cc) distance between " << g_input_str << " and "
              << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, g_init_str, e_init_str,
                                    g_input_str, e_input_str, clock_cycles,
                                    output_mode, &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "plain-text result: " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, g_init_str,
                                                 g_input_str, output_mode,
                                                 output_str, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, e_init_str,
                                              e_input_str, output_mode,
                                              output_str, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");
  }
}

MU_TEST(Hamming32Bit8cc) {

  LOG(INFO) << "Test Hamming32Bit8cc" << endl;

  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  int output_mode = 2;  // print the last cycle
  string g_init_str = "";
  string e_init_str = "";
  uint64_t clock_cycles = 8;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming (32bit 8cc) distance between " << g_input_str << " and "
              << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, g_init_str, e_init_str,
                                    g_input_str, e_input_str, clock_cycles,
                                    output_mode, &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "plain-text result: " << output_str << endl;

    GCTestStruct garbler_data = MakeGCTestStruct(scd_file_address, g_init_str,
                                                 g_input_str, output_mode,
                                                 output_str, clock_cycles);
    GCTestStruct eval_data = MakeGCTestStruct(scd_file_address, e_init_str,
                                              e_input_str, output_mode,
                                              output_str, clock_cycles);

    ret = TcpipTestRun(Alice, (void *) &garbler_data, Bob, (void *) &eval_data);
    mu_assert(ret == SUCCESS, "TcpipTestRun");

  }
}

MU_TEST_SUITE(TestSuite) {
  MU_SUITE_CONFIGURE(&TestSetup, &TestTeardown);

  MU_RUN_TEST(Mux8Bit);
  MU_RUN_TEST(Sum1Bit);
  MU_RUN_TEST(Sum8Bit);
  MU_RUN_TEST(Hamming32Bit1cc);
  MU_RUN_TEST(Hamming32Bit8cc);
}

int main(int argc, char* argv[]) {
  LogInitial(argc, argv);
  srand(time(NULL));
  SrandSSE(time(NULL));
  MU_RUN_SUITE(TestSuite);
  MU_REPORT()
  ;
  LogFinish();
  return SUCCESS;
}
