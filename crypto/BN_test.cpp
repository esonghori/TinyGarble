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

#include "crypto/BN.h"

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

