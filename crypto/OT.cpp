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

#include "crypto/OT.h"

#include <iostream>
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/log.h"

using std::endl;

#define RSA_BITS 1024
#define RSA_EXPONENT 65537

#define BN_CHECK(X) if((X)==0) { LOG(ERROR) << #X << " failed" << endl; return FAILURE; }

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
  // TODO(ebi) :check for error
  if (SendData(connf, (void *) &bignum->top, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "sending top failed" << endl;
    return FAILURE;
  }
  if (SendData(connf, (void *) &bignum->dmax, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "sending dmax failed" << endl;
    return FAILURE;
  }
  if (SendData(connf, (void *) &bignum->neg, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "sending neg failed" << endl;
    return FAILURE;
  }
  if (SendData(connf, (void *) &bignum->flags, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "sending flags failed" << endl;
    return FAILURE;
  }
  if (SendData(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG)) == FAILURE) {
    LOG(ERROR) << "sending d failed" << endl;
    return FAILURE;
  }

  return SUCCESS;
}
int RecvBN(int connf, BIGNUM *bignum) {
  if (bignum == nullptr) {
    LOG(ERROR) << "bignum pointer is null" << endl;
    return FAILURE;
  }
  // TODO(ebi) :check for error
  if (RecvData(connf, (void *) &bignum->top, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "receiving top failed" << endl;
    return FAILURE;
  }
  if (RecvData(connf, (void *) &bignum->dmax, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "receiving dmax failed" << endl;
    return FAILURE;
  }
  if (RecvData(connf, (void *) &bignum->neg, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "receiving neg failed" << endl;
    return FAILURE;
  }
  if (RecvData(connf, (void *) &bignum->flags, sizeof(int)) == FAILURE) {
    LOG(ERROR) << "receiving flags failed" << endl;
    return FAILURE;
  }
  bignum->d = new BN_ULONG[bignum->dmax];
  if (RecvData(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG)) == FAILURE) {
    LOG(ERROR) << "receiving d failed" << endl;
    return FAILURE;
  }
  return SUCCESS;
}

int OTsend(const block* const * m, uint32_t m_len, int connfd) {

  BN_CTX *ctx;
  ctx = BN_CTX_new();
  if(ctx == nullptr) {
    LOG(ERROR) << "allocating ctx failed." << endl;
  }

  // 0. check the vector size
  LOG(INFO) << "sender: send length" << endl;
  SendData(connfd, &m_len, sizeof(uint32_t));

  // 1.0. generate RSA key
  LOG(INFO) << "sender: generate RSA key" << endl;
  BIGNUM * rsa_exponent = BN_new();
  BN_set_word(rsa_exponent, RSA_EXPONENT);
  RSA *rsa = RSA_new();
  RSA_generate_key_ex(rsa, RSA_BITS, rsa_exponent, nullptr);
  BN_free(rsa_exponent);

  // 1.1. send public portion to Bob (receiver)
  LOG(INFO) << "sender: send public key" << endl;
  SendBN(connfd, rsa->n);
  SendBN(connfd, rsa->e);

  // 2. generate two messages
  LOG(INFO) << "sender: generate random messages" << endl;
  BIGNUM ***x = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    x[i] = new BIGNUM*[2];
    for (uint32_t j = 0; j < 2; j++) {
      x[i][j] = BN_new();
      BN_rand(x[i][j], RSA_BITS, -1, 0);
      SendBN(connfd, x[i][j]);
    }
  }

  // 4. receive v from Bob (receiver) and send m0' and m1' to Bob
  LOG(INFO) << "sender: receive v and send m0' and m1'" << endl;
  BIGNUM *v = BN_new();
  BIGNUM *temp = BN_new();
  BIGNUM *k0 = BN_new();
  BIGNUM *k1 = BN_new();
  BIGNUM *m0 = BN_new();
  BIGNUM *m1 = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    RecvBN(connfd, v);

    BN_CHECK(BN_sub(v, v, x[i][0]));  // temp = v - x0
    BN_CHECK(BN_mod_exp(k0, temp, rsa->d, rsa->n, ctx));  // k0 = (v - x0)^d mod N

    BN_CHECK(BN_sub(temp, v, x[i][1]));  // temp = v - x1
    BN_CHECK(BN_mod_exp(k0, v, rsa->d, rsa->n, ctx));  // k1 = (v - x0)^d mod N

    BlockToBN(m0, m[i][0]);
    BN_add(k0, k0, m0);
    SendBN(connfd, k0);  // send m0' = m0 + k0

    BlockToBN(m1, m[i][1]);
    BN_add(k1, k1, m1);
    SendBN(connfd, k1);  // send m1' = m1 + k1
  }
  LOG(INFO) << "sender: free memories" << endl;
  RSA_free(rsa);
  BN_free(v);
  BN_free(temp);
  BN_free(k0);
  BN_free(k1);
  BN_free(m0);
  BN_free(m1);

  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      BN_free(x[i][j]);
    }
  }
  BN_CTX_free(ctx)
  ;
  return SUCCESS;
}

int OTRecv(const bool *sel, uint32_t m_len, int connfd, block* m) {

  // 0. check the vector size
  LOG(INFO) << "receiver: check length" << endl;
  uint32_t m_len_from_sender;
  RecvData(connfd, &m_len_from_sender, sizeof(uint32_t));
  if (m_len_from_sender != m_len) {
    LOG(ERROR) << "The size of vectors are not equal" << endl
               << "sender's length = " << m_len_from_sender << " "
               << "reciver's length = " << m_len << endl;
    return FAILURE;
  }

  BN_CTX *ctx;
  ctx = BN_CTX_new();
  if(ctx == nullptr) {
    LOG(ERROR) << "allocating ctx failed." << endl;
  }
  BIGNUM* rsa_n = BN_new();
  BIGNUM* rsa_e = BN_new();

  // 1. receive public portion of a rsa key from Alice (receiver)
  LOG(INFO) << "receiver: recv public key" << endl;
  RecvBN(connfd, rsa_n);
  RecvBN(connfd, rsa_e);

  // 2. receive two random messages
  LOG(INFO) << "receiver: recv two random messages" << endl;
  BIGNUM ***x = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    x[i] = new BIGNUM*[2];
    for (uint32_t j = 0; j < 2; j++) {
      x[i][j] = BN_new();
      RecvBN(connfd, x[i][j]);
    }
  }

  // 3. generate random k
  LOG(INFO) << "receiver: generate k" << endl;
  BIGNUM **k = new BIGNUM*[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    k[i] = BN_new();
    BN_rand(k[i], RSA_BITS, -1, 0);
  }

  // 4. compute v = (x_b + k^e) mod N and send it to Alice (sender)
  LOG(INFO) << "receiver: compute and send v" << endl;
  BIGNUM *v = BN_new();
  BIGNUM *temp = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    BN_CHECK(BN_mod_exp(temp, k[i], rsa_e, rsa_n, ctx));  // K^e mod N
    BN_CHECK(BN_add(temp, x[i][sel[i]], temp));  // x_b + (K^e mod N)
    BN_CHECK(BN_nnmod(v, temp, rsa_n, ctx));  // v = (x_b + K^e) mod N
    SendBN(connfd, v);
  }
  BN_free(rsa_e);
  BN_free(rsa_n);
  BN_free(v);
  BN_free(temp);

  // 4. receive m0' and m1' from Alice
  LOG(INFO) << "receiver: recv m0' and m1'" << endl;
  BIGNUM *m0p = BN_new();
  BIGNUM *m1p = BN_new();
  BIGNUM *mb = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    RecvBN(connfd, m0p);
    RecvBN(connfd, m1p);
    if (sel[i]) {
      BN_sub(mb, m0p, k[i]);
    } else {
      BN_sub(mb, m1p, k[i]);
    }
  }
  LOG(INFO) << "receiver: bignumber to block" << endl;
  BNToBlock(mb, m);

  LOG(INFO) << "receiver: free memory" << endl;
  BN_free(m0p);
  BN_free(m1p);

  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      BN_free(x[i][j]);
    }
    BN_free(k[i]);
  }
  BN_CTX_free(ctx);

  return SUCCESS;
}

