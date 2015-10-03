/*
 * OT.cpp
 *
 *  Created on: Oct 1, 2015
 *      Author: ebi
 */

#include "crypto/OT.h"

#include <iostream>
#include "tcpip/tcpip.h"
#include "util/common.h"

using std::cerr;
using std::endl;

#define RSA_BITS 1024
#define RSA_EXPONENT 65537


void blockToBN(BIGNUM *a, block w) {

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

int sendBN(int connf, const BIGNUM *bignum) {

  // TODO(ebi) :check for error
  send_data(connf, (void *) &bignum->top, sizeof(int));
  send_data(connf, (void *) &bignum->dmax, sizeof(int));
  send_data(connf, (void *) &bignum->neg, sizeof(int));
  send_data(connf, (void *) &bignum->flags, sizeof(int));
  send_data(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG));

  return SUCCESS;
}
int recvBN(int connf, BIGNUM *bignum) {

  // TODO(ebi) :check for error
  recv_data(connf, (void *) &bignum->top, sizeof(int));
  recv_data(connf, (void *) &bignum->dmax, sizeof(int));
  recv_data(connf, (void *) &bignum->neg, sizeof(int));
  recv_data(connf, (void *) &bignum->flags, sizeof(int));
  bignum->d = new BN_ULONG[bignum->dmax];
  recv_data(connf, bignum->d, bignum->dmax * sizeof(BN_ULONG));

  return SUCCESS;
}

int OTsend(const block** m, uint32_t m_len, int connfd) {

  // 0. check the vector size
  send_data(connfd, &m_len, sizeof(uint32_t));

  // 1.0. generate RSA key
  BIGNUM * rsa_exponent = BN_new();
  BN_set_word(rsa_exponent, RSA_EXPONENT);
  RSA *rsa = RSA_new();
  RSA_generate_key_ex(rsa, RSA_BITS, rsa_exponent, nullptr);
  BN_free(rsa_exponent);

  // 1.1. send public portion to Bob (receiver)
  sendBN(connfd, rsa->n);
  sendBN(connfd, rsa->e);

  // 2. generate two messages
  BIGNUM ***x = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    x[i] = new BIGNUM*[2];
    for (uint32_t j = 0; j < 2; j++) {
      x[i][j] = BN_new();
      BN_rand(x[i][j], RSA_BITS, -1, 0);
      sendBN(connfd, x[i][j]);
    }
  }

  // 4. receive v from Bob (receiver) and send m0' and m1' to Bob
  BIGNUM *v = BN_new();
  BIGNUM *temp = BN_new();
  BIGNUM *k0 = BN_new();
  BIGNUM *k1 = BN_new();
  BIGNUM *m0 = BN_new();
  BIGNUM *m1 = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    recvBN(connfd, v);

    BN_sub(v, v, x[i][0]);  // temp = v - x0
    BN_mod_exp(k0, temp, rsa->d, rsa->n, nullptr);  // k0 = (v - x0)^d mod N

    BN_sub(temp, v, x[i][1]);  // temp = v - x1
    BN_mod_exp(k0, v, rsa->d, rsa->n, nullptr);  // k1 = (v - x0)^d mod N

    blockToBN(m0, m[i][0]);
    BN_add(k0, k0, m0);
    sendBN(connfd, k0);  // send m0' = m0 + k0

    blockToBN(m1, m[i][1]);
    BN_add(k1, k1, m1);
    sendBN(connfd, k1);  // send m1' = m1 + k1
  }
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

  RSA_free(rsa);
  return SUCCESS;
}

int OTrecv(const bool *sel, uint32_t m_len, int connfd, block* m) {

  // 0. check the vector size
  uint32_t m_len_from_sender;
  recv_data(connfd, &m_len_from_sender, sizeof(uint32_t));
  if (m_len_from_sender != m_len) {
    cerr << "The size of vectors are not equal" << endl << "sender's length = "
         << m_len_from_sender << " " << "reciver's length = " << m_len << endl;
    return FAILURE;
  }

  RSA *rsa = RSA_new();

  // 1. receive public portion of a rsa key from Alice (receiver)
  recvBN(connfd, rsa->n);
  recvBN(connfd, rsa->e);

  // 2. receive two random messages
  BIGNUM ***x = new BIGNUM**[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    x[i] = new BIGNUM*[2];
    for (uint32_t j = 0; j < 2; j++) {
      x[i][j] = BN_new();
      recvBN(connfd, x[i][j]);
    }
  }

  // 3. generate random k
  BIGNUM **k = new BIGNUM*[m_len];
  for (uint32_t i = 0; i < m_len; i++) {
    k[i] = BN_new();
    BN_rand(k[i], RSA_BITS, -1, 0);
  }

  // 4. compute v = (x_b + k^e) mod N and send it to Alice (sender)
  BIGNUM *v = BN_new();
  BIGNUM *temp = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    BN_mod_exp(temp, k[i], rsa->e, rsa->n, nullptr);  // K^e mod N
    BN_add(temp, x[i][sel[i]], temp);  // x_b + (K^e mod N)
    BN_nnmod(v, temp, rsa->n, nullptr);  // v = (x_b + K^e) mod N
    sendBN(connfd, v);
  }
  BN_free(v);
  BN_free(temp);

  // 4. receive m0' and m1' from Alice
  BIGNUM *m0p = BN_new();
  BIGNUM *m1p = BN_new();
  BIGNUM *mb = BN_new();
  for (uint32_t i = 0; i < m_len; i++) {
    recvBN(connfd, m0p);
    recvBN(connfd, m1p);
    if (sel[i]) {
      BN_sub(mb, m0p, k[i]);
    } else {
      BN_sub(mb, m1p, k[i]);
    }
  }
  BN_free(m0p);
  BN_free(m1p);

  for (uint32_t i = 0; i < m_len; i++) {
    for (uint32_t j = 0; j < 2; j++) {
      BN_free(x[i][j]);
    }
    BN_free(k[i]);
  }

  BNToBlock(mb, m);

  RSA_free(rsa);
  return SUCCESS;
}

