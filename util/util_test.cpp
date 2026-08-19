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

#include "util/util.h"

#include <iostream>
#include <sstream>
#include "util/minunit.h"
#include "util/log.h"
#include "util/common.h"

using std::endl;
using std::stringstream;

void TestSetup() {
}
void TestTeardown() {
}

MU_TEST(StrBlockSeperation) {
  block v, w;
  string test_hex = "15141312 11100908 07060504 03020100";
  mu_check(Str2Block(test_hex, &v) == SUCCESS);
  test_hex = "15141312_11100908_07060504_03020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
  test_hex = "15141312\t11100908\t07060504\t03020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
  test_hex = "15141312111009080706050403020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
  test_hex = "1514131\t211100 90807060504_03020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
}

MU_TEST(StrBlockFillZero) {
  block v, w;
  string test_hex = "00000000 00000000 00000000 03020100";
  mu_check(Str2Block(test_hex, &v) == SUCCESS);
  test_hex = "3020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
  test_hex = "00000003020100";
  mu_check(Str2Block(test_hex, &w) == SUCCESS);
  mu_check(CmpBlock(v, w));
}

/**
 * CmpBlock must compare all 128 bits. It used to read only lane 0 of a 64-bit
 * comparison, so blocks that agreed in their low halves and differed in their
 * high halves compared equal. GarbleGate uses CmpBlock to decide that two gate
 * inputs are the same secret wire and skip the gate, so that produced a wrong
 * circuit.
 */
MU_TEST(BlockCompareFullWidth) {
  block v, w;

  // identical
  mu_check(Str2Block("15141312111009080706050403020100", &v) == SUCCESS);
  mu_check(Str2Block("15141312111009080706050403020100", &w) == SUCCESS);
  mu_check(CmpBlock(v, w));

  // low 64 bits identical, high 64 bits differ
  mu_check(Str2Block("0000000000000000ffffffffffffffff", &v) == SUCCESS);
  mu_check(Str2Block("1000000000000000ffffffffffffffff", &w) == SUCCESS);
  mu_check(!CmpBlock(v, w));

  // differing only in the most significant bit
  mu_check(Str2Block("00000000000000000000000000000000", &v) == SUCCESS);
  mu_check(Str2Block("80000000000000000000000000000000", &w) == SUCCESS);
  mu_check(!CmpBlock(v, w));

  // high 64 bits identical, low 64 bits differ
  mu_check(Str2Block("ffffffffffffffff0000000000000000", &v) == SUCCESS);
  mu_check(Str2Block("ffffffffffffffff0000000000000001", &w) == SUCCESS);
  mu_check(!CmpBlock(v, w));

  // every single-bit difference must be detected
  for (int bit = 0; bit < 128; bit++) {
    block zero = ZeroBlock();
    uint64_t hi = (bit >= 64) ? (1ULL << (bit - 64)) : 0;
    uint64_t lo = (bit < 64) ? (1ULL << bit) : 0;
    block one_bit = MakeBlock(hi, lo);
    mu_check(!CmpBlock(zero, one_bit));
    mu_check(CmpBlock(one_bit, one_bit));
  }
}

MU_TEST(StrBlockLSB) {
  block v;
  mu_check(Str2Block("01", &v) == SUCCESS);
  mu_check(get_LSB(v));
  mu_check(Str2Block("00", &v) == SUCCESS);
  mu_check(!get_LSB(v));
}

MU_TEST(StrBlockOperator) {
  stringstream o_stream;
  string test_hex = "15141312 11100908 07060504 03020100";
  block v;
  mu_check(Str2Block(test_hex, &v) == SUCCESS);
  o_stream << v;
  o_stream.flush();
  mu_check(o_stream.str() == test_hex);
}

MU_TEST_SUITE(TestSuite) {
  MU_SUITE_CONFIGURE(&TestSetup, &TestTeardown);

  MU_RUN_TEST(StrBlockSeperation);
  MU_RUN_TEST(StrBlockFillZero);
  MU_RUN_TEST(BlockCompareFullWidth);
  MU_RUN_TEST(StrBlockLSB);
  MU_RUN_TEST(StrBlockOperator);
}

int main(int argc, char *argv[]) {
  LogInitial(argc, argv);
  MU_RUN_SUITE(TestSuite);
  MU_REPORT()
  ;
  LogFinish();
  return 0;
}

