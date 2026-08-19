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

#ifndef CRYPTO_BLOCK_H_
#define CRYPTO_BLOCK_H_

#if defined(__aarch64__) || defined(_M_ARM64)
#include "crypto/neon_compat.h"
#else
#include <xmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#endif

typedef __m128i block;
#define get_LSB(x) (*((unsigned short *)&x)&1)
#define XorBlock(x,y) _mm_xor_si128((x),(y))
#define ZeroBlock() _mm_setzero_si128()
/**
 * @brief True when two blocks are equal in all 128 bits.
 *
 * This used to compare only the low 64 bits, so two labels agreeing in their
 * low halves compared equal. GarbleGate uses this to
 * decide that two gate inputs carry the same secret wire and to skip garbling
 * the gate, so a half-collision produced a wrong circuit.
 *
 * An inline function rather than a macro so the arguments are evaluated once.
 */
static inline bool CmpBlock(block x, block y) {
  const block diff = _mm_xor_si128(x, y);
  return _mm_testz_si128(diff, diff) != 0;
}
#define MakeBlock(X,Y) _mm_set_epi64((__m64)(X), (__m64)(Y))

#define _m128_switch_endian(x) \
  _mm_shuffle_epi8((x), _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))

#endif /* CRYPTO_BLOCK_H_ */
