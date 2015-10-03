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

void test_setup() {
}
void test_teardown() {
}

MU_TEST(block_endian) {

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

MU_TEST(BN_block) {

  block w;
  uint8_t *w_ch = (uint8_t *) &w;
  for (uint i = 0; i < sizeof(block); i++) {
    w_ch[i] = i;
  }

  BIGNUM* a = BN_new();
  blockToBN(a, w);

  block v;
  BNToBlock(a, &v);

  uint8_t *v_ch = (uint8_t *) &v;
  for (uint i = 0; i < sizeof(block); i++) {
    mu_check(v_ch[i] == w_ch[i]);
  }

  BN_free(a);
}

MU_TEST_SUITE(test_suite) {
  MU_SUITE_CONFIGURE(&test_setup, &test_teardown);

  MU_RUN_TEST(block_endian);
  MU_RUN_TEST(BN_block);
}

int main(int argc, char *argv[]) {
  MU_RUN_SUITE(test_suite);
  MU_REPORT();
  return 0;
}

