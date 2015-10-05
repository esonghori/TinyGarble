/*
 * test.cpp
 *
 *  Created on: Oct 1, 2015
 *      Author: ebi
 */

#include "crypto/OT.h"

#include <iostream>
#include <openssl/bn.h>
#include "util/util.h"
#include "util/minunit.h"

using std::cerr;
using std::cout;
using std::endl;

void TestSetup() {
}
void TestTeardown() {
}

MU_TEST(BlockEndian) {

  block w;
  uint8_t *w_ch = (uint8_t *) &w;
  for (uint i = 0; i < sizeof(block); i++) {
    w_ch[i] = i;
  }
  block v = _m128_switch_endian(w);
  uint8_t *v_ch = (uint8_t *) &v;
  for (uint i = 0; i < sizeof(block); i++) {
    mu_check(v_ch[i] == sizeof(block) - i - 1);
  }

}

MU_TEST(BNBlock) {

  block w;
  uint8_t *w_ch = (uint8_t *) &w;
  for (uint i = 0; i < sizeof(block); i++) {
    w_ch[i] = i;
  }

  BIGNUM* a = BN_new();
  BlockToBN(a, w);

  block v;
  BNToBlock(a, &v);

  uint8_t *v_ch = (uint8_t *) &v;
  for (uint i = 0; i < sizeof(block); i++) {
    mu_check(v_ch[i] == w_ch[i]);
  }

  BN_free(a);
}

MU_TEST_SUITE(TestSuite) {
  MU_SUITE_CONFIGURE(&TestSetup, &TestTeardown);

  MU_RUN_TEST(BlockEndian);
  MU_RUN_TEST(BNBlock);
}

int main(int argc, char *argv[]) {
  MU_RUN_SUITE(TestSuite);
  MU_REPORT();
  return 0;
}

