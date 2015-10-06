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

#include <openssl/evp.h>
#include <iostream>
#include "crypto/OT.h"
#include "crypto/BN.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/log.h"

using std::endl;

#define SEC_K_BIT ((uint32_t)128)

const EVP_MD *md;
int InitialHash() {
  OpenSSL_add_all_digests();
  md = EVP_sha256();
  if (md == nullptr) {
    return FAILURE;
  }
  return SUCCESS;
}

void FinishHash() {
  EVP_cleanup();
}

int HashBN(BIGNUM* r, uint32_t n, const BIGNUM* v) {
  uint32_t v_len = (uint32_t) BN_num_bits(v);
  if (v_len != SEC_K_BIT) {
    return FAILURE;
  }

  EVP_MD_CTX *mdctx = EVP_MD_CTX_create();
  if (mdctx == nullptr) {
    LOG(ERROR) << "Can not create EVP_MD_CTX" << endl;
    return FAILURE;
  }
  BN_CHECK(EVP_DigestInit_ex(mdctx, md, NULL));
  BN_CHECK(EVP_DigestUpdate(mdctx, &n, sizeof(uint32_t)));
  BN_CHECK(EVP_DigestUpdate(mdctx, v->d, sizeof(BN_ULONG) * v->dmax));
  unsigned char md_value[EVP_MAX_MD_SIZE];
  uint32_t md_len;
  BN_CHECK(EVP_DigestFinal_ex(mdctx, md_value, &md_len));
  EVP_MD_CTX_destroy(mdctx);

  BN_bin2bn(md_value, SEC_K_BIT / 8, r);

  return SUCCESS;
}

int SwitchRowColumnBN(const BIGNUM* const * v, uint32_t v_len, BIGNUM*** w,
                      uint32_t* w_len) {

  // check bit length of v's
  uint32_t v_bit_len = (uint32_t) BN_num_bits(v[0]);
  for (uint32_t i = 0; i < v_len; i++) {
    if (v_bit_len != (uint32_t) BN_num_bits(v[i])) {
      LOG(ERROR) << "number of bits in v are not equal." << endl;
      return FAILURE;
    }
  }

  BIGNUM** _w = new BIGNUM*[v_bit_len];
  for (uint32_t i = 1; i < v_bit_len; i++) {
    _w[i] = BN_new();
    // TODO(ebi): check if it helps
    _w[i] = bn_expand(_w[i], v_len);
    for (uint32_t k = 0; k < v_len; k++) {
      if (BN_is_bit_set(v[k], i)) {
        BN_CHECK(BN_set_bit(_w[i], k));
      } else {
        BN_CHECK(BN_clear_bit(_w[i], k));
      }
    }
  }

  *w_len = v_bit_len;
  *w = _w;
  return SUCCESS;
}

int SwitchRowColumnBNPair(const BIGNUM* const * const * v, uint32_t v_len,
                          BIGNUM**** w, uint32_t* w_len) {

  // check bit length of v's
  uint32_t v_bit_len = (uint32_t) BN_num_bits(v[0][0]);
  for (uint32_t i = 0; i < v_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      if (v_bit_len != (uint32_t) BN_num_bits(v[i][j])) {
        LOG(ERROR) << "number of bits in v are not equal." << endl;
        return FAILURE;
      }
    }
  }

  BIGNUM*** _w = new BIGNUM**[v_bit_len];
  for (uint32_t i = 1; i < v_bit_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      _w[i][j] = BN_new();
      // TODO(ebi): check if it helps
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

  LOG(INFO) << "sender: " << "initial hash" << endl;
  CHECK(InitialHash());

  // 0. generate random k-bit s
  LOG(INFO) << "sender: " << "generate random S" << endl;
  BIGNUM* S = BN_new();
  BN_rand(S, SEC_K_BIT, -1, 0);

  BIGNUM** Q = new BIGNUM*[SEC_K_BIT];
  for (uint32_t i = 0; i < SEC_K_BIT; i++) {
    Q[i] = BN_new();
  }
  BN_new();

  LOG(INFO) << "sender: " << "Receiving Q based on S via OT" << endl;
  OTRecvBN(S, SEC_K_BIT, connfd, Q);

  LOG(INFO) << "sender: " << "row column switch on Q" << endl;
  BIGNUM** Q_rotate;
  uint32_t m_len_check;
  CHECK(SwitchRowColumnBN(Q, SEC_K_BIT, &Q_rotate, &m_len_check));
  if (m_len_check != m_len) {
    LOG(ERROR) << "column-row switch failed." << endl;
    return FAILURE;
  }

  LOG(INFO) << "sender: " << "compute and send (y0, y1)" << endl;
  BIGNUM* h0 = BN_new();
  BIGNUM* h1 = BN_new();
  BIGNUM* QS = BN_new();
  BIGNUM* y0 = BN_new();
  BIGNUM* y1 = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    CHECK(HashBN(h0, i, Q_rotate[i]));
    BN_CHECK(BN_xor(QS, Q_rotate[i], S));
    CHECK(HashBN(h1, i, QS));
    BN_CHECK(BN_xor(y1, h0, m[i][0]));
    BN_CHECK(BN_xor(y0, h1, m[i][1]));
    CHECK(SendBN(connfd, y0));
    CHECK(SendBN(connfd, y1));
  }
  BN_free(h0);
  BN_free(h1);
  BN_free(QS);
  BN_free(y0);
  BN_free(y1);

  // free memory
  LOG(INFO) << "sender: " << "free memory" << endl;
  for (uint32_t i = 0; i < m_len; i++) {
    BN_free(Q_rotate[i]);
  }
  delete[] Q_rotate;
  for (uint32_t i = 0; i < SEC_K_BIT; i++) {
    BN_free(Q[i]);
  }
  delete[] Q;
  BN_free(S);
  FinishHash();
  return SUCCESS;
}
int OTExtRecvBN(const BIGNUM *sel, uint32_t m_len, int connfd, BIGNUM** m) {

  LOG(INFO) << "receiver: " << "initial hash" << endl;
  CHECK(InitialHash());

  // 0.generate m_len random k-bits T ([0]) and T^r ([1])
  LOG(INFO) << "receiver: " << "generate random T and compute T^r" << endl;
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

  LOG(INFO) << "receiver: " << "row column switch on T" << endl;
  BIGNUM*** T_rotate;
  uint32_t sec_k_bit_check;
  CHECK(SwitchRowColumnBNPair(T, m_len, &T_rotate, &sec_k_bit_check));
  if (sec_k_bit_check != SEC_K_BIT) {
    LOG(ERROR) << "column-row switch failed." << endl;
    return FAILURE;
  }

  LOG(INFO) << "receiver: " << "send T via OT" << endl;
  OTSendBN(T_rotate, SEC_K_BIT, connfd);

  LOG(INFO) << "receiver: " << "receive (y0,y1) and compute m" << endl;
  BIGNUM* h = BN_new();
  BIGNUM* y0 = BN_new();
  BIGNUM* y1 = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    CHECK(RecvBN(connfd, y0));
    CHECK(RecvBN(connfd, y1));
    if (BN_is_bit_set(sel, i) == 0) {
      CHECK(HashBN(h, i, T[i][0]));
      BN_CHECK(BN_xor(m[i], y0, h));
    } else {
      CHECK(HashBN(h, i, T[i][1]));
      BN_CHECK(BN_xor(m[i], y1, h));
    }
  }
  BN_free(h);
  BN_free(y0);
  BN_free(y1);

  // free memory
  LOG(INFO) << "receiver: " << "free memory" << endl;
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
  FinishHash();
  return SUCCESS;
}

int OTExtSend(const block* const * m, uint32_t m_len, int connfd) {
  BIGNUM*** bn_m = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    bn_m[i] = new BIGNUM*[2];
    for (uint32_t j = 0; j < 2; j++) {
      bn_m[i][j] = BN_new();
      BlockToBN(bn_m[i][j], m[i][j]);
    }
  }
  int ret = OTExtSendBN(bn_m, m_len, connfd);
  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      BN_free(bn_m[i][j]);
    }
    delete[] bn_m[i];
  }
  delete[] bn_m;
  return ret;
}

int OTExtRecv(const bool *sel, uint32_t m_len, int connfd, block* m) {
  int ret;
  BIGNUM *bn_sel = BN_new();
  BIGNUM** bn_m = new BIGNUM*[m_len];
  for (uint32_t i = 0; i < m_len; ++i) {
    bn_m[i] = BN_new();
    if (sel[i]) {
      BN_CHECK(BN_set_bit(bn_sel, i));
    }
  }
  if ((ret = OTExtRecvBN(bn_sel, m_len, connfd, bn_m)) == FAILURE) {
    return FAILURE;
  }
  for (uint32_t i = 0; i < m_len; ++i) {
    BNToBlock(bn_m[i], &m[i]);
    BN_free(bn_m[i]);
  }
  BN_free(bn_sel);
  delete[] bn_m;
  return ret;
}

