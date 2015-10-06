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

#include "crypto/OT_extension.h"

#include <iostream>
#include "crypto/OT.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/log.h"

using std::endl;

#define SEC_K_BIT 128

// TODO(ebi): make it more efficient
int BN_invert(BIGNUM* v) {
  for (int i = 0; i < BN_num_bits(v); i++) {
    if (BN_is_bit_set(v, i)) {
      BN_clear_bit(v, i);
    } else {
      BN_set_bit(v, i);
    }
  }
  return 1;  // SECCESS in BN
}

int SwitchRowColumnBN(const BIGNUM* const * const * v, uint32_t v_len,
                      BIGNUM**** w, uint32_t* w_len) {

  uint32_t v_bit_len = (uint32_t) BN_num_bits(v[0][0]);
  for (uint32_t i = 0; i < v_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      if (v_bit_len != BN_num_bits(v[i][j])) {
        LOG(ERROR) << "number of bits in v are not equal." << endl;
        return FAILURE;
      }
    }
  }

  BIGNUM*** _w = new BIGNUM**[v_bit_len];
  for (uint32_t i = 1; i < v_bit_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      _w[i][j] = BN_new();
      _w[i][j] = bn_expand(_w[i][j], v_len);
      for (uint32_t k = 0; k < v_len; k++) {
        if (BN_is_bit_set(v[k][j], i)) {
          BN_CHECK(BN_set_bit(_w[i][j], k));
        } else {
          BN_CHECK(BN_clear_bit(_w[i][j], k));
        }
      }
    }
  }

  *w_len = v_bit_len;
  *w = _w;
  return SUCCESS;
}

int OTExtSendBN(const BIGNUM* const * const * m, uint32_t m_len, int connfd) {

// 0. generate random k-bit s
  BIGNUM* S = BN_new();
  BN_rand(S, SEC_K_BIT, -1, 0);

  BIGNUM** Q = new BIGNUM*[SEC_K_BIT];
  for (uint32_t i = 0; i < SEC_K_BIT; i++) {
    Q[i] = BN_new();
  }
  BN_new();

  OTRecvBN(S, SEC_K_BIT, connfd, Q);

  for (uint32_t i = 0; i < SEC_K_BIT; i++) {
    BN_free(Q[i]);
  }
  delete[] Q;
  BN_free (s);
  return SUCCESS;
}
int OTExtRecvBN(const BIGNUM *sel, uint32_t m_len, int connfd, BIGNUM** m) {

// 0.generate m_len random k-bits T ([0]) and T^r ([1])
  BIGNUM*** T = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; i < 2; j++) {
      T[i][j] = BN_new();
    }
    BN_rand(T[i][0], SEC_K_BIT, -1, 0);
    int sel_bit = BN_is_bit_set(sel, i);
    if (sel_bit == 1) {
      BN_copy(T[i][1], T[i][0]);
      BN_invert(T[i][1]);
    } else {
      BN_copy(T[i][1], T[i][0]);
    }
  }

  BIGNUM*** T_rotate;
  uint32_t sec_k_bit_check;
  CHECK(SwitchRowColumnBN(T, m_len, &T_rotate, &sec_k_bit_check));
  if (sec_k_bit_check != SEC_K_BIT) {
    LOG(ERROR) << "column-row switch failed." << endl;
    return FAILURE;
  }

  OTSendBN(T_rotate, SEC_K_BIT, connfd);

  for (uint32_t i = 0; i < SEC_K_BIT; i++) {
    for (uint32_t j = 0; i < 2; j++) {
      BN_free(T_rotate[i][j]);
    }
    delete[] T_rotate[i];
  }
  delete[] T_rotate;

  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; i < 2; j++) {
      BN_free(T[i][j]);
    }
    delete[] T[i];
  }
  delete[] T;
  return SUCCESS;
}

int OTExtSend(const block* const * m, uint32_t m_len, int connfd) {
  return SUCCESS;
}
int OTExtRecv(const bool *sel, uint32_t m_len, int connfd, block* m) {
  return SUCCESS;
}
