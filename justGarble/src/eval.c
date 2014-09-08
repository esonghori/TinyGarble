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
#include "../include/garble.h"
#include "../include/circuits.h"
#include "../include/gates.h"
#include "../include/util.h"
#include "../include/dkcipher.h"
#include "../include/aes.h"
#include "../include/justGarble.h"

#include <malloc.h>
#include <wmmintrin.h>

#ifdef TRUNCATED
int evaluate(GarbledCircuit *garbledCircuit, ExtractedLabels extractedLabels,
		OutputMap outputMap) {
	GarbledGate *garbledGate;
	DKCipherContext dkCipherContext;
	DKCipherInit(&(garbledCircuit->globalKey), &dkCipherContext);
	const __m128i *sched = ((__m128i *) (dkCipherContext.K.rd_key));
	block val;
	block A, B;
	block *plainText;
	block cipherText;
	char c1[16];
	long *c1l = (long*) c1;
	short *c1s = (short*) (c1);
	long a, b, i, j, rnds = 10;

	for (i = 0; i < 16; i++)
	c1[i] = '\0';

	block zer = zero_block();
	block tweak;
	GarbledTable *garbledTable = garbledCircuit->garbledTable;
	int tableIndex = 0;

	for (i = 0; i < garbledCircuit->n; i++) {
		garbledCircuit->wires[i].label = extractedLabels[i];
	}

	for (i = 0; i < garbledCircuit->q; i++) {

		garbledGate = &(garbledCircuit->garbledGates[i]);

#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[garbledGate->output].label =
			xorBlocks(garbledCircuit->wires[garbledGate->input0].label,
					garbledCircuit->wires[garbledGate->input1].label);
		} else {
#endif

			A = DOUBLE(garbledCircuit->wires[garbledGate->input0].label);
			B =
			DOUBLE(DOUBLE(garbledCircuit->wires[garbledGate->input1].label));

			plainText = &garbledCircuit->wires[garbledGate->output].label;

			a = getLSB(garbledCircuit->wires[garbledGate->input0].label);
			b = getLSB(garbledCircuit->wires[garbledGate->input1].label);
			block temp;

			val = xorBlocks(A, B);
			tweak = makeBlock(i, (long) 0);
			val = xorBlocks(val, tweak);
#ifdef ROW_REDUCTION
			if (a + b == 0) {
				cipherText = zer;
			} else {
				short*__itc_src;
				short*__itc_dst;
				__itc_src = (short*) &garbledTable[tableIndex].table[2 * a + b
				- 1];
				__itc_dst = (short*) c1;
				__itc_dst[0] = __itc_src[0];
				__itc_dst[1] = __itc_src[1];
				__itc_dst[2] = __itc_src[2];
				__itc_dst[3] = __itc_src[3];
				__itc_dst[4] = __itc_src[4];

				cipherText = *((block*) c1);

			}
#else
			short*__itc_src;
			short*__itc_dst;
			__itc_src = (short*)&garbledTable[tableIndex].table[2*a+b];
			__itc_dst = (short*)c1;
			__itc_dst[0] = __itc_src[0];
			__itc_dst[1] = __itc_src[1];
			__itc_dst[2] = __itc_src[2];
			__itc_dst[3] = __itc_src[3];
			__itc_dst[4] = __itc_src[4];

			cipherText = * ((block*) c1);
#endif
			char *__ct;
			short *__msks;
			int *__mski;
			int __itc;

			temp = val;

			val = _mm_xor_si128(val, sched[0]);
			for (j = 1; j < rnds; j++)
			val = _mm_aesenc_si128(val, sched[j]);
			val = _mm_aesenclast_si128(val, sched[j]);

			block temp2 = zero_block();
			temp2 = xorBlocks(temp,val);
			TRUNCATE(&temp2);

			*plainText = xorBlocks(cipherText, temp2);
			tableIndex++;
#ifdef FREE_XOR
		}
#endif

	}

	for (i = 0; i < garbledCircuit->m; i++) {
		outputMap[i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label;
	}
	return 0;

}
#else
int evaluate(GarbledCircuit *garbledCircuit, ExtractedLabels extractedLabels,
		OutputMap outputMap) {
	GarbledGate *garbledGate;
	DKCipherContext dkCipherContext;
	DKCipherInit(&(garbledCircuit->globalKey), &dkCipherContext);
	const __m128i *sched = ((__m128i *) (dkCipherContext.K.rd_key));
	block val;

	block A, B;
	block *plainText, *cipherText;
	block zer = zero_block();
	block tweak;
	GarbledTable *garbledTable = garbledCircuit->garbledTable;
	int tableIndex = 0;
	long a, b, i, j, rnds = 10;

	for (i = 0; i < garbledCircuit->n; i++) {
		garbledCircuit->wires[i].label = extractedLabels[i];
	}

	for (i = 0; i < garbledCircuit->q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[garbledGate->output].label =
			xorBlocks(garbledCircuit->wires[garbledGate->input0].label,
					garbledCircuit->wires[garbledGate->input1].label);
		} else {
#endif
		A = DOUBLE(garbledCircuit->wires[garbledGate->input0].label);
		B = DOUBLE(DOUBLE(garbledCircuit->wires[garbledGate->input1].label));

		plainText = &garbledCircuit->wires[garbledGate->output].label;

		a = getLSB(garbledCircuit->wires[garbledGate->input0].label);
		b = getLSB(garbledCircuit->wires[garbledGate->input1].label);
		block temp;

		val = xorBlocks(A, B);
		tweak = makeBlock(i, (long) 0);
		val = xorBlocks(val, tweak);
#ifdef ROW_REDUCTION
		if (a+b==0)
		cipherText = &zer;
		else
		cipherText = &garbledTable[tableIndex].table[2*a+b-1];
#else
		cipherText = &garbledTable[tableIndex].table[2 * a + b];
#endif

		temp = xorBlocks(val, *cipherText);

		val = _mm_xor_si128(val, sched[0]);
		for (j = 1; j < rnds; j++)
			val = _mm_aesenc_si128(val, sched[j]);
		val = _mm_aesenclast_si128(val, sched[j]);

		*plainText = xorBlocks(val, temp);
		tableIndex++;
#ifdef FREE_XOR
	}
#endif

	}

	for (i = 0; i < garbledCircuit->m; i++) {
		outputMap[i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label;
	}
	return 0;

}
#endif
