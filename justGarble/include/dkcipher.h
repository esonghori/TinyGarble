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


#ifndef DKC_H_
#define DKC_H_

#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include "aes.h"


#ifdef __cplusplus
extern "C" {
#endif


typedef struct {
	AES_KEY K;
//	block A;
//	block B;
} DKCipherContext;

void DKCipher1Init(block *key, DKCipherContext *c);


#define DKCipherInit DKCipher1Init
#define DKCipherSetFirstKey DKCipher1SetFirstKey
#define DKCipherSetSecondKey DKCipher1SetSecondKey
#define DKCipher_encrypt DKCipher1_encrypt
#define DKCipher_decrypt DKCipher1_decrypt

#ifdef DKC1
#define __TWEAK_IN
#define FKEY
#endif

#ifdef DKC9
#define SHELAT
#endif

#ifdef DKC2
#define FKEY
#endif

#ifdef DKC3
#define __TWEAK_IN
#define __DOUBLE_B
#define FKEY
#endif

#ifdef DKC4
#define __DOUBLE_B
#define FKEY
#endif

//#define	DOUBLE(B) B
#define DOUBLE(B) _mm_slli_epi64(B,1)


#ifdef __cplusplus
}
#endif

#endif
