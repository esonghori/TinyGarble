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

#include "../include/common.h"
#include "../include/util.h"
#include "../include/justGarble.h"
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

static __m128i cur_seed;

int countToN(int *a, int n) {
	int i;
	for (i = 0; i < n; i++)
		a[i] = i;
	return 0;
}

int dbgBlock(block a) {
	int *A = (int *) &a;
	int i;
	int out = 0;
	for (i = 0; i < 4; i++)
		out = out + (A[i] + 13432) * 23517;
	return out;
}

int compare(const void * a, const void * b) {
	return (*(int*) a - *(int*) b);
}

int median(int *values, int n) {
	int i;
	qsort(values, n, sizeof(int), compare);
	if (n % 2 == 1)
		return values[(n + 1) / 2];
	else
		return (values[n / 2] + values[n / 2 + 1]) / 2;
}

double doubleMean(double *values, int n) {
	int i;
	double total = 0;
	for (i = 0; i < n; i++)
		total += values[i];
	return total / n;
}

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

void print__m128i(__m128i var)
{
    uint16_t *val = (uint16_t*) &var;
    printf("%i \t%i \t%i \t%i \t%i \t%i \t%i \t%i \n", val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7]);
}

#ifdef __cplusplus
}
#endif
