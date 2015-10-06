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
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/log.h"

using std::endl;

// TODO(ebi): make it more efficient
int BN_invert(BIGNUM* v) {
  for (uint32_t i = 0; i < (uint32_t) BN_num_bits(v); i++) {
    if (BN_is_bit_set(v, i)) {
      BN_clear_bit(v, i);
    } else {
      BN_set_bit(v, i);
    }
  }
  return 1;  // SECCESS in BN
}

int BN_xor(BIGNUM* r, const BIGNUM* v, const BIGNUM* w) {
  uint32_t v_len = (uint32_t) BN_num_bits(v);
  if (v_len != (uint32_t) BN_num_bits(w)) {
    return 0;  // failure in BN
  }
  r = bn_expand(r, v_len);
  for (uint32_t i = 0; i < v_len; i++) {
    if (BN_is_bit_set(v, i) ^ BN_is_bit_set(w, i)) {
      BN_set_bit(r, i);
    } else {
      BN_clear_bit(r, i);
    }
  }
  return 1;  // SECCESS in BN
}

void BlockToBN(BIGNUM *a, block w) {

  // change little-endian to big-endian
  block v = _m128_switch_endian(w);

  BN_bin2bn((const unsigned char *) &v, sizeof(block), a);
}

void BNToBlock(const BIGNUM *a, block *w) {

  unsigned char *temp = new unsigned char[BN_num_bytes(a)];
  BN_bn2bin(a, temp);

  // change little-endian to big-endian
  block v = *(block *) temp;

  *w = _m128_switch_endian(v);
}

int SendBN(int connf, const BIGNUM *bignum) {
  if (bignum == nullptr) {
    LOG(ERROR) << "bignum pointer is null" << endl;
    return FAILURE;
  }
  CHECK(SendData(connf, (void * ) &bignum->top, sizeof(int)));
  CHECK(SendData(connf, (void * ) &bignum->dmax, sizeof(int)));
  CHECK(SendData(connf, (void * ) &bignum->neg, sizeof(int)));
  CHECK(SendData(connf, (void * ) &bignum->flags, sizeof(int)));
  CHECK(SendData(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG)));

  return SUCCESS;
}
int RecvBN(int connf, BIGNUM *bignum) {
  if (bignum == nullptr) {
    LOG(ERROR) << "bignum pointer is null" << endl;
    return FAILURE;
  }
  CHECK(RecvData(connf, (void * ) &bignum->top, sizeof(int)));
  CHECK(RecvData(connf, (void * ) &bignum->dmax, sizeof(int)));
  CHECK(RecvData(connf, (void * ) &bignum->neg, sizeof(int)));
  CHECK(RecvData(connf, (void * ) &bignum->flags, sizeof(int)));
  bignum->d = new BN_ULONG[bignum->dmax];
  CHECK(RecvData(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG)));
  return SUCCESS;
}

