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

#include "aes.h"
#include "common.h"
#include "garbled_circuit.h"

#include <stdio.h>
#include <ctype.h>
#include <stdint.h>

#include "util.h"

static block cur_seed;

void srand_sse(unsigned int seed) {
  cur_seed = _mm_set_epi32(seed, seed + 1, seed, seed + 1);
}

block randomBlock() {

  block cur_seed_split;
  block multiplier;
  block adder;
  block mod_mask;
  block sra_mask;
  block sseresult;

  static const unsigned int mult[4] = { 214013, 17405, 214013, 69069 };
  static const unsigned int gadd[4] = { 2531011, 10395331, 13737667, 1 };
  static const unsigned int mask[4] = { 0xFFFFFFFF, 0, 0xFFFFFFFF, 0 };
  static const unsigned int masklo[4] = { 0x00007FFF, 0x00007FFF, 0x00007FFF,
      0x00007FFF };

  adder = _mm_load_si128((block *) gadd);
  multiplier = _mm_load_si128((block *) mult);
  mod_mask = _mm_load_si128((block *) mask);
  sra_mask = _mm_load_si128((block *) masklo);
  cur_seed_split = _mm_shuffle_epi32(cur_seed, _MM_SHUFFLE(2, 3, 0, 1));
  cur_seed = _mm_mul_epu32(cur_seed, multiplier);
  multiplier = _mm_shuffle_epi32(multiplier, _MM_SHUFFLE(2, 3, 0, 1));
  cur_seed_split = _mm_mul_epu32(cur_seed_split, multiplier);
  cur_seed = _mm_and_si128(cur_seed, mod_mask);
  cur_seed_split = _mm_and_si128(cur_seed_split, mod_mask);
  cur_seed_split = _mm_shuffle_epi32(cur_seed_split, _MM_SHUFFLE(2, 3, 0, 1));
  cur_seed = _mm_or_si128(cur_seed, cur_seed_split);
  cur_seed = _mm_add_epi32(cur_seed, adder);

  return cur_seed;

}
/**
 * \brief constant v value based on gate Type
 *
 * Two Halves Make a Whole Reducing Data Transfer in Garbled Circuits using Half Gates
 *
 *
 *  a op b = ((a ^ v0) & (b ^v1)) ^ v2
 *  v1v2v0
 *  000b -> AND
 *  111b -> OR
 */
unsigned short type2V(int gateType) {
  if (gateType == ANDGATE) {
    return 0b000;
  } else if (gateType == ANDNGATE) {
    return 0b100;
  } else if (gateType == NANDGATE) {
    return 0b001;
  } else if (gateType == NANDNGATE) {
    return 0b101;
  } else if (gateType == ORGATE) {
    return 0b111;
  } else if (gateType == ORNGATE) {
    return 0b011;
  } else if (gateType == NORGATE) {
    return 0b110;
  } else if (gateType == NORNGATE) {
    return 0b010;
  }
  return 0;
}

void print__m128i(block var) {
  uint32_t *val = (uint32_t*) &var;
  printf("%08x \t%08x \t%08x \t%08x \n", val[3], val[2], val[1], val[0]);
}
