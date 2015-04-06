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

#ifndef COMMON_H_
#define COMMON_H_


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>


typedef __m128i block;
#define xorBlocks(x,y) _mm_xor_si128((x),(y))
#define zero_block() _mm_setzero_si128()

#define getLSB(x) (*((unsigned short *)&x)&1)
#define makeBlock(X,Y) _mm_set_epi64((__m64)(X), (__m64)(Y))


/*------------------------------------------------------------------------
/ OCB Version 3 Reference Code (Optimized C)     Last modified 08-SEP-2012
/-------------------------------------------------------------------------
/ Copyright (c) 2012 Ted Krovetz.
/
/ Permission to use, copy, modify, and/or distribute this software for any
/ purpose with or without fee is hereby granted, provided that the above
/ copyright notice and this permission notice appear in all copies.
/
/ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
/ WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
/ MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
/ ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
/ WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
/ ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
/ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
/
/ Phillip Rogaway holds patents relevant to OCB. See the following for
/ his patent grant: http://www.cs.ucdavis.edu/~rogaway/ocb/grant.htm
/
/ Special thanks to Keegan McAllister for suggesting several good improvements
/
/ Comments are welcome: Ted Krovetz <ted@krovetz.net> - Dedicated to Laurel K
/------------------------------------------------------------------------- */
static inline block double_block(block bl) {
		const __m128i mask = _mm_set_epi32(135,1,1,1);
		__m128i tmp = _mm_srai_epi32(bl, 31);
		tmp = _mm_and_si128(tmp, mask);
		tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2,1,0,3));
		bl = _mm_slli_epi32(bl, 1);
		return _mm_xor_si128(bl,tmp);
	}
static inline block slow_double_block(block bl) {
                int i;
		__m128i tmp = _mm_srai_epi32(bl, 31);
                for (i=0;i<1;i++){
		const __m128i mask = _mm_set_epi32(135,1,1,1);
		tmp = _mm_and_si128(tmp, mask);
		tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2,1,0,3));
		bl = _mm_slli_epi32(bl, 1);
                }
		return _mm_xor_si128(bl,tmp);
	}

static inline block LEFTSHIFT1(block bl) {
		 const __m128i mask = _mm_set_epi32(0,0, (1<<31),0);
		 __m128i tmp = _mm_and_si128(bl,mask);
		bl = _mm_slli_epi64(bl, 1);
		return _mm_xor_si128(bl,tmp);
	}
static inline block RIGHTSHIFT(block bl) {
		 const __m128i mask = _mm_set_epi32(0,1,0,0);
		 __m128i tmp = _mm_and_si128(bl,mask);
		bl = _mm_slli_epi64(bl, 1);
		return _mm_xor_si128(bl,tmp);
	}

#define ADD128(out, in1, in2)                      \
       __asm__("addq %2, %0; adcq %3, %1" :           \
                         "=r"(out.lo64), "=r"(out.hi64) :       \
                         "emr" (in2.lo64), "emr"(in2.hi64),     \
                         "0" (in1.lo64), "1" (in1.hi64));


#define SUCCESS 0
#define FAILURE -1



#define ROW_REDUCTION
#define FREE_XOR
#define DKC2

#define CONST_ZERO -2
#define CONST_ONE  -3


#define ANDGATE 8
#define ANDNGATE 4
#define NANDGATE 7
#define NANDNGATE 11
#define ORGATE 14
#define ORNGATE 13
#define NORGATE 1
#define NORNGATE 2
#define XORGATE 6
#define XNORGATE 9
#define NOTGATE 12
#define DFFGATE -1

#define RDTSC ({unsigned long long res;  unsigned hi, lo;   __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi)); res =  ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );res;})
#define fbits( v, p) ((v & (1 << p))>>p)

block randomBlock();
void srand_sse(unsigned int seed);
unsigned short type2V(int gateType);
void print__m128i(__m128i);

#endif
