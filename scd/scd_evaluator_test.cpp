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

#include "scd/scd_evaluator.h"

#include "util/log.h"
#include "util/util.h"
#include "util/common.h"
#include "util/tinygarble_config.h"
#include "util/minunit.h"

#define TEST_REPEAT 10

void TestSetup() {
}
void TestTeardown() {
}

uint32_t HammingDistance(uint32_t x, uint32_t y) {
  uint32_t dist = 0;
  int32_t val = x ^ y;
  while (val) {
    dist++;
    val &= val - 1;
  }
  return dist;
}

MU_TEST(Sum1Bit) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_nbit_ncc.scd";
  string p_init_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  string p_input_str = "";
  uint64_t clock_cycles = 8;
  OutputMode output_mode = OutputMode::consecutive;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "add with sum_1bit: " << g_input_str << " + " << e_input_str
              << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "result: " << output_str << endl;

    uint8_t y = strtol(output_str.c_str(), nullptr, 16);
    mu_check(y == x[0] + x[1]);
  }
}

MU_TEST(Mux8Bit) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/mux_8bit_1cc.scd";
  string p_init_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  string p_input_str = "";
  uint64_t clock_cycles = 1;
  OutputMode output_mode = OutputMode::separated_clock;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 256);
    x[1] = (uint8_t) (rand() % 256);
    uint8_t select = (uint8_t) (rand() % 2);

    string g_input_str = to_string_hex(x[1], 2) + to_string_hex(x[0], 2);
    string e_input_str = std::to_string(select);
    string output_str = "";

    LOG(INFO) << "select with mux_8bit: " << e_input_str << " from {0:"
              << to_string_hex(x[0], 2) << ", 1:" << to_string_hex(x[1], 2)
              << "}. " << g_input_str << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "result: " << output_str << endl;
    uint8_t y = strtol(output_str.c_str(), nullptr, 16);

    mu_check(y == x[select]);
  }
}

MU_TEST(Sum8Bit) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/sum_8bit_1cc.scd";
  string p_init_str = "";
  string g_init_str = "0";
  string e_init_str = "0";
  string p_input_str = "";
  uint64_t clock_cycles = 1;
  OutputMode output_mode = OutputMode::consecutive;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint8_t x[2];
    x[0] = (uint8_t) (rand() % 127);
    x[1] = (uint8_t) (rand() % 127);

    string g_input_str = to_string_hex(x[0], 2);
    string e_input_str = to_string_hex(x[1], 2);
    string output_str = "";

    LOG(INFO) << "add with sum_8bit: " << g_input_str << " + " << e_input_str
              << endl;
    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "result: " << output_str << endl;

    uint8_t y = strtol(output_str.c_str(), nullptr, 16);
    mu_check(y == x[0] + x[1]);
  }
}

MU_TEST(Hamming32Bit1cc) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_1cc.scd";
  OutputMode output_mode = OutputMode::consecutive;
  string p_init_str = "";
  string g_init_str = "";
  string e_init_str = "";
  string p_input_str = "";
  uint64_t clock_cycles = 1;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming distance between " << g_input_str << " and "
              << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "result: " << output_str << endl;

    uint32_t y = strtol(output_str.c_str(), nullptr, 16);

    mu_check(y == HammingDistance(x[0], x[1]));
  }
}

MU_TEST(Hamming32Bit8cc) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/hamming_32bit_8cc.scd";
  OutputMode output_mode = OutputMode::last_clock;
  string p_init_str = "";
  string g_init_str = "";
  string e_init_str = "";
  string p_input_str = "";
  uint64_t clock_cycles = 8;
  for (int i = 0; i < TEST_REPEAT; i++) {
    uint32_t x[2];
    x[0] = (uint32_t) rand();
    x[1] = (uint32_t) rand();

    string g_input_str = to_string_hex(x[0], 8);
    string e_input_str = to_string_hex(x[1], 8);
    string output_str = "";

    LOG(INFO) << "Hamming distance between " << g_input_str << " and "
              << e_input_str << endl;

    int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                    e_init_str, p_input_str, g_input_str,
                                    e_input_str, clock_cycles, output_mode,
                                    &output_str);
    mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
    LOG(INFO) << "result: " << output_str << endl;

    uint32_t y = strtol(output_str.c_str(), nullptr, 16);

    mu_check(y == HammingDistance(x[0], x[1]));
  }
}

MU_TEST(PublicWire8Bit2cc) {
  string scd_file_address = string(TINYGARBLE_SOURCE_DIR)
      + "/scd/netlists/public_test_8bit_ncc.scd";
  OutputMode output_mode = OutputMode::consecutive;
  string p_init_str =  "AB"; // 8bit
  string g_init_str =  "18C3"; //16bit
  string e_init_str =  "B226B5F2"; //32bit
  string p_input_str = "B5C4C3DE95464A5C"; //2*32bit
  string g_input_str = "19458C20"; //2*16bit
  string e_input_str = "A5C6"; //2*8bit
  string output_str; //2*32bit
  uint64_t clock_cycles = 2;

  LOG(INFO) << "Public Wire test (8-bit 2cc)" << endl;

  int ret = EvalauatePlaintextStr(scd_file_address, p_init_str, g_init_str,
                                  e_init_str, p_input_str, g_input_str,
                                  e_input_str, clock_cycles, output_mode,
                                  &output_str);
  mu_assert(ret == SUCCESS, "EvalauatePlaintextStr");
  LOG(INFO) << "result: " << output_str << endl;

  mu_check(output_str == "92A4B11E27606B20");

}

MU_TEST_SUITE(TestSuite) {
  MU_SUITE_CONFIGURE(&TestSetup, &TestTeardown);

  MU_RUN_TEST(Mux8Bit);
  MU_RUN_TEST(Sum1Bit);
  MU_RUN_TEST(Sum8Bit);
  MU_RUN_TEST(Hamming32Bit1cc);
  MU_RUN_TEST(Hamming32Bit8cc);
  MU_RUN_TEST(PublicWire8Bit2cc);
}

int main(int argc, char *argv[]) {
  LogInitial(argc, argv);
  srand(time(0));
  MU_RUN_SUITE(TestSuite);
  MU_REPORT()
  ;
  LogFinish();
  return 0;
}
