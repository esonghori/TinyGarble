/*
 * OT.h
 *
 *  Created on: Oct 1, 2015
 *      Author: ebi
 */

#ifndef EVAL_NETLIST_OT_OT_H_
#define EVAL_NETLIST_OT_OT_H_

#include <cstdint>
#include <openssl/rsa.h>
#include "crypto/block.h"

void blockToBN(BIGNUM *a, block w);
void BNToBlock(const BIGNUM *a, block *w);
int sendBN(int connf, const BIGNUM *bignum);
int recvBN(int connf, BIGNUM *bignum);

int OTsend(const block* const* m, uint32_t m_len, int connfd);
int OTrecv(const bool *sel, uint32_t m_len, int connfd, block* m);


#endif /* EVAL_NETLIST_OT_OT_H_ */
