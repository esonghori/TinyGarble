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

#ifndef CRYPTO_OT_H_
#define CRYPTO_OT_H_

#include <cstdint>
#include <openssl/rsa.h>
#include "crypto/block.h"

void BlockToBN(BIGNUM *a, block w);
void BNToBlock(const BIGNUM *a, block *w);
int SendBN(int connf, const BIGNUM *bignum);
int RecvBN(int connf, BIGNUM *bignum);

int OTsend(const block* const* m, uint32_t m_len, int connfd);
int OTRecv(const bool *sel, uint32_t m_len, int connfd, block* m);


#endif /* CRYPTO_OT_H_ */
