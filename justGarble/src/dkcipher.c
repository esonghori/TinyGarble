/*
 This file is part of JustGarble.

    JustGarble is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JustGarble is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JustGarble.  If not, see <http://www.gnu.org/licenses/>.

*/

#include "../include/dkcipher.h"
#include "../include/common.h"
#include "../include/justGarble.h"

void DKCipher1Init(block *key, DKCipherContext *c) {
	AES_set_encrypt_key((unsigned char *) key, 128, &c->K);
}

void DKCipherKSSInit(block *key, DKCipherContext *c) {
}

void DKCipherKSSEncrypt(block *ptext, block *ctext, block tweak,
		DKCipherContext *c) {
	AES_KEY K1;
	block temp;
	unsigned char key[32];
	memcpy(key, &(c->A), 16);
	memcpy(key + 16, &(c->B), 16);
	AES_set_encrypt_key(key, 256, &K1);
	AES_encrypt((unsigned char *) (&tweak), (unsigned char *) &temp, &K1);
	*ctext = xorBlocks(*ptext ,temp);
}

void DKCipherKSSEncryptFull(block *key1, block *key2, block *ctext,
		block *tweak, block *ptext) {
	AES_KEY K1;
	block temp;
	unsigned char key[32];
	memcpy(key, key1, 16);
	memcpy(key + 16, key2, 16);
	AES_set_encrypt_key(key, 256, &K1);
	AES_encrypt((unsigned char *) (tweak), (unsigned char *) &temp, &K1);
	*ctext = xorBlocks(*ptext ,temp);
}

void DKCipherKSSDecrypt(block *ctext, block *ptext, block tweak,
		DKCipherContext *c) {
	AES_KEY K1;
	block temp;
	unsigned char key[32];
	memcpy(key, &(c->A), 16);
	memcpy(key + 16, &(c->A), 16);
	AES_set_encrypt_key(key, 256, &K1);
	AES_encrypt((unsigned char *) (&tweak), (unsigned char *) &temp, &K1);
	*ptext = xorBlocks(*ctext ,temp);
}

