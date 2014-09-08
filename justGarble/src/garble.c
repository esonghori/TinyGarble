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

#include "../include/garble.h"
#include "../include/common.h"
#include "../include/circuits.h"
#include "../include/gates.h"
#include "../include/util.h"
#include "../include/dkcipher.h"
#include "../include/aes.h"
#include "../include/justGarble.h"
#include <malloc.h>
#include <wmmintrin.h>
#include <time.h>

int FINAL_ROUND = 0;

int createNewWire(Wire *in, GarblingContext *garblingContext, int id) {
	in->id = id; //getNextWire(garblingContext);
	in->label0 = randomBlock();
	in->label1 = xorBlocks(garblingContext->R, in->label0);
	return 0;
}

void TRUNCATE(char *X) {
	char *__ct;
	short *__msks;
	int *__mski;
	{
		__ct = (char*) X;
		__msks = (short*) (&__ct[10]);
		__mski = (int*) (&__ct[10]);
		__mski[0] = 0;
		__msks[2] = 0;
	}
}

void TRUNC_COPY(char *X, char *Y) {
	int __itc;
	short*__itc_src;
	short*__itc_dst;

	{
		__itc_src = (short *) X;
		__itc_dst = (short *) Y;
		for (__itc = 0; __itc < 5; __itc++)
			__itc_dst[__itc] = __itc_src[__itc];
	}
}

static unsigned long currentId;
int getNextId() {
	currentId++;
	return currentId;
}
int getFreshId() {
	currentId = 0;
	return currentId;
}

int getNextWire(GarblingContext *garblingContext) {
	int i = garblingContext->wireIndex;
	garblingContext->wireIndex++;
	return i;
}

int createEmptyGarbledCircuit(GarbledCircuit *garbledCircuit, int n, int m,
		int q, int r, InputLabels inputLabels) {
	startTime = RDTSC;
	garbledCircuit->id = getNextId();
	garbledCircuit->garbledGates = (GarbledGate *) memalign(128,
			sizeof(GarbledGate) * q);
	garbledCircuit->garbledTable = (GarbledTable *) memalign(128,
			sizeof(GarbledTable) * q);
	garbledCircuit->wires = (Wire *) memalign(128, sizeof(Wire) * r);
	garbledCircuit->outputs = (int *) memalign(128, sizeof(int) * m);

	if (garbledCircuit->garbledGates == NULL
			|| garbledCircuit->garbledGates == NULL) {
		dbgs("Linux is a cheap miser that refuses to give us memory");
		exit(1);
	}
	garbledCircuit->m = m;
	garbledCircuit->n = n;
	garbledCircuit->q = q;
	garbledCircuit->r = r;
	int i;
	for (i = 0; i < r; i++) {
		garbledCircuit->wires[i].id = 0;
	}
	for (i = 0; i < q; i++) {
		garbledCircuit->garbledGates[i].id = 0;
	}

	for (i = 0; i < 2 * n; i += 2) {
		garbledCircuit->wires[i / 2].id = i + 1;
		garbledCircuit->wires[i / 2].label0 = inputLabels[i];
		garbledCircuit->wires[i / 2].label1 = inputLabels[i + 1];
	}
	return 0;
}

void removeGarbledCircuit(GarbledCircuit *garbledCircuit) {
	garbledCircuit->id = getNextId();
	free(garbledCircuit->garbledGates);
	free(garbledCircuit->wires);
}

int startBuilding(GarbledCircuit *garbledCircuit,
		GarblingContext *garblingContext) {
	garblingContext->gateIndex = 0;
	garblingContext->tableIndex = 0;
	garblingContext->wireIndex = garbledCircuit->n + 1;
	block key = randomBlock();
	garblingContext->R =
			xorBlocks(garbledCircuit->wires[0].label0, garbledCircuit->wires[0].label1);
	garblingContext->fixedWires = (int *) malloc(
			sizeof(int) * garbledCircuit->r);
	garbledCircuit->globalKey = key;
	startTime = RDTSC;
	DKCipherInit(&key, &(garblingContext->dkCipherContext));

	return 0;
}

int finishBuilding(GarbledCircuit *garbledCircuit,
		GarblingContext *garbledContext, OutputMap outputMap, int *outputs) {
	int i;

	for (i = 0; i < garbledCircuit->m; i++) {
		outputMap[2 * i] = garbledCircuit->wires[outputs[i]].label0;
		outputMap[2 * i + 1] = garbledCircuit->wires[outputs[i]].label1;
		garbledCircuit->outputs[i] = outputs[i];
	}
	for (i = 0; i < garbledCircuit->r; i++) {
		if (garbledContext->fixedWires[i] == FIXED_ZERO_GATE) {
			garbledCircuit->wires[i].label = garbledCircuit->wires[i].label0;
		}
		if (garbledContext->fixedWires[i] == FIXED_ONE_GATE) {
			garbledCircuit->wires[i].label = garbledCircuit->wires[i].label1;
		}
	}

	garbledCircuit->q = garbledContext->gateIndex;
	endTime = RDTSC;
	return (int) (endTime - startTime);
}

int extractLabels(ExtractedLabels extractedLabels, InputLabels inputLabels,
		int* inputBits, int n) {
	int i;
	for (i = 0; i < n; i++) {
		if (inputBits[i]) {
			extractedLabels[i] = inputLabels[2 * i + 1];
		} else {
			extractedLabels[i] = inputLabels[2 * i];
		}
	}
	return 0;

}
#ifdef TRUNCATED
#ifdef ROW_REDUCTION
long garbleCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels, OutputMap outputMap) {

	GarblingContext garblingContext;
	GarbledGate *garbledGate;
	GarbledTable *garbledTable;
	DKCipherContext dkCipherContext;
	const __m128i *sched = ((__m128i *) (dkCipherContext.K.rd_key));
	block val;

	block *A, *B, *plainText, *cipherText;
	block tweak;
	long a, b, i, j, rnds = 10;
	block blocks[4];
	block keys[4];
	long lsb0, lsb1;
	block keyToEncrypt;
	int input0, input1, output;
	srand_sse(time(NULL ));

	startTime = RDTSC;

	createInputLabels(inputLabels, garbledCircuit->n);

	garbledCircuit->id = getFreshId();

	for (i = 0; i < 2 * garbledCircuit->n; i += 2) {
		garbledCircuit->wires[i / 2].id = i + 1;
		garbledCircuit->wires[i / 2].label0 = inputLabels[i];
		garbledCircuit->wires[i / 2].label1 = inputLabels[i + 1];
	}
	garbledTable = garbledCircuit->garbledTable;
	garblingContext.gateIndex = 0;
	garblingContext.wireIndex = garbledCircuit->n + 1;
	block key = randomBlock();
	garblingContext.R =
	xorBlocks(garbledCircuit->wires[0].label0, garbledCircuit->wires[0].label1);
	garbledCircuit->globalKey = key;
	DKCipherInit(&key, &(garblingContext.dkCipherContext));
	int tableIndex = 0;

	for (i = 0; i < garbledCircuit->q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		input0 = garbledGate->input0;
		input1 = garbledGate->input1;
		output = garbledGate->output;

#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[output].label0 =
			xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
			garbledCircuit->wires[output].label1 =
			xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
			continue;
		}
#endif
		tweak = makeBlock(i, (long)0);
		input0 = garbledGate->input0;
		input1 = garbledGate->input1;
		lsb0 = getLSB(garbledCircuit->wires[input0].label0);
		lsb1 = getLSB(garbledCircuit->wires[input1].label0);

		block A0, A1, B0, B1;
		A0 = DOUBLE(garbledCircuit->wires[input0].label0);
		A1 = DOUBLE(garbledCircuit->wires[input0].label1);
		B0 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label0));
		B1 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label1));

		keys[0] = xorBlocks(A0, B0);
		keys[0] = xorBlocks(keys[0], tweak);
		keys[1] = xorBlocks(A0,B1);
		keys[1] = xorBlocks(keys[1], tweak);
		keys[2] = xorBlocks(A1, B0);
		keys[2] = xorBlocks(keys[2], tweak);
		keys[3] = xorBlocks(A1, B1);
		keys[3] = xorBlocks(keys[3], tweak);

		block mask[4];
		block newToken;
		mask[0] = keys[0];
		mask[1] = keys[1];
		mask[2] = keys[2];
		mask[3] = keys[3];
		AES_ecb_encrypt_blks(keys, 4, &(garblingContext.dkCipherContext.K));

		mask[0] = xorBlocks(mask[0], keys[0]);
		mask[1] = xorBlocks(mask[1],keys[1]);
		mask[2] = xorBlocks(mask[2],keys[2]);
		mask[3] = xorBlocks(mask[3],keys[3]);
		TRUNCATE(&mask[0]);
		TRUNCATE(&mask[3]);
		TRUNCATE(&mask[1]);
		TRUNCATE(&mask[2]);

		if (2 * lsb0 + lsb1 == 0)
		newToken = mask[0];
		if (2 * lsb0 + 1 - lsb1 == 0)
		newToken = mask[1];
		if (2 * (1 - lsb0) + lsb1 == 0)
		newToken = mask[2];
		if (2 * (1 - lsb0) + 1 - lsb1 == 0)
		newToken = mask[3];

		block newToken2 = xorBlocks(garblingContext.R, newToken);

		if (garbledGate->type == ANDGATE) {
			if (lsb1 == 1 & lsb0 == 1) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			} else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == ORGATE) {
			if (!(lsb1 == 0 & lsb0 == 0)) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			} else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == XORGATE) {
			if ((lsb1 == 0 & lsb0 == 1) || (lsb1 == 1 & lsb0 == 0)) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			} else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == NOTGATE) {
			if (lsb0 == 0) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			} else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		block *label0 = &garbledCircuit->wires[garbledGate->output].label0;
		block *label1 = &garbledCircuit->wires[garbledGate->output].label1;
		TRUNCATE(&garbledCircuit->wires[garbledGate->output].label0);
		TRUNCATE(&garbledCircuit->wires[garbledGate->output].label1);

		if (garbledGate->type == ANDGATE) {

			blocks[0] = *label0;
			blocks[1] = *label0;
			blocks[2] = *label0;
			blocks[3] = *label1;
			goto write;
		}

		if (garbledGate->type == ORGATE) {

			blocks[0] = *label0;
			blocks[1] = *label1;
			blocks[2] = *label1;
			blocks[3] = *label1;
			goto write;

		}

		if (garbledGate->type == XORGATE) {

			blocks[0] = *label0;
			blocks[1] = *label1;
			blocks[2] = *label1;
			blocks[3] = *label0;
			goto write;

		}

		if (garbledGate->type == NOTGATE) {

			blocks[0] = *label1;
			blocks[1] = *label0;
			blocks[2] = *label1;
			blocks[3] = *label0;
			goto write;

		}
		write:;

		char toWrite[4][16];
		char **dest[4];

		*((block *) toWrite[0]) = xorBlocks(blocks[0], mask[0]);
		*((block *) toWrite[1]) = xorBlocks(blocks[1], mask[1]);
		*((block *) toWrite[2]) = xorBlocks(blocks[2], mask[2]);
		*((block *) toWrite[3]) = xorBlocks(blocks[3], mask[3]);

		short *cpsrc;
		short *cpdst;
		int sub = 1;

		if (2 * lsb0 + lsb1 != 0) {
			cpsrc = (short *) toWrite[0];
			cpdst = (short *) &garbledTable[tableIndex].table[2 * lsb0 + lsb1
			- sub];
			cpdst[0] = cpsrc[0];
			cpdst[1] = cpsrc[1];
			cpdst[2] = cpsrc[2];
			cpdst[3] = cpsrc[3];
			cpdst[4] = cpsrc[4];
		}

		if (2 * (lsb0) + (1 - lsb1) != 0) {
			cpsrc = (short *) toWrite[1];
			cpdst = (short *) &garbledTable[tableIndex].table[2 * (lsb0)
			+ (1 - lsb1) - sub];
			cpdst[0] = cpsrc[0];
			cpdst[1] = cpsrc[1];
			cpdst[2] = cpsrc[2];
			cpdst[3] = cpsrc[3];
			cpdst[4] = cpsrc[4];
		}

		if (2 * (1 - lsb0) + (lsb1) != 0) {
			cpsrc = (short *) toWrite[2];
			cpdst = (short *) &garbledTable[tableIndex].table[2 * (1 - lsb0)
			+ (lsb1) - sub];
			cpdst[0] = cpsrc[0];
			cpdst[1] = cpsrc[1];
			cpdst[2] = cpsrc[2];
			cpdst[3] = cpsrc[3];
			cpdst[4] = cpsrc[4];
		}

		if (2 * (1 - lsb0) + (1 - lsb1) != 0) {
			cpsrc = (short *) toWrite[3];
			cpdst = (short *) &garbledTable[tableIndex].table[2 * (1 - lsb0)
			+ (1 - lsb1) - sub];
			cpdst[0] = cpsrc[0];
			cpdst[1] = cpsrc[1];
			cpdst[2] = cpsrc[2];
			cpdst[3] = cpsrc[3];
			cpdst[4] = cpsrc[4];
		}
		tableIndex++;

	}
	for (i = 0; i < garbledCircuit->m; i++) {
		outputMap[2 * i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
		outputMap[2 * i + 1] = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
	}
	endTime = RDTSC;
	return (endTime - startTime);
}

#else
long garbleCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels, OutputMap outputMap) {

	GarblingContext garblingContext;
	GarbledGate *garbledGate;
	GarbledTable *garbledTable;
	DKCipherContext dkCipherContext;
	const __m128i *sched = ((__m128i *)(dkCipherContext.K.rd_key));
	block val;

	block *A, *B, *plainText,*cipherText;
	block tweak;
	long a, b, i, j,rnds = 10;
	block blocks[4];
	block keys[4];
	long lsb0,lsb1;
	block keyToEncrypt;
	int input0, input1,output;
	srand_sse( time(NULL));

	startTime = RDTSC;

	createInputLabels(inputLabels, garbledCircuit->n);

	garbledCircuit->id = getFreshId();

	for(i=0;i<2*garbledCircuit->n;i+=2) {
		garbledCircuit->wires[i/2].id = i+1;
		garbledCircuit->wires[i/2].label0 = inputLabels[i];
		garbledCircuit->wires[i/2].label1 = inputLabels[i+1];
	}
	garbledTable = garbledCircuit->garbledTable;
	garblingContext.gateIndex = 0;
	garblingContext.wireIndex = garbledCircuit->n + 1;
	block key = randomBlock();
	block rkey = randomBlock();
	AES_KEY KR;
	AES_set_encrypt_key(&rkey, 128, &KR);
	const __m128i *sched2 = ((__m128i *)(KR.rd_key));
	garblingContext.R = xorBlocks(garbledCircuit->wires[0].label0, garbledCircuit->wires[0].label1);
	garbledCircuit->globalKey = key;
	DKCipherInit(&key, &(garblingContext.dkCipherContext));
	int tableIndex = 0;

	for(i=0; i< garbledCircuit->q;i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		input0 = garbledGate->input0; input1 = garbledGate->input1;
		output = garbledGate->output;

#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
			garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
			continue;
		}
#endif
		tweak = makeBlock(i, (long)0);
		lsb0 = getLSB(garbledCircuit->wires[input0].label0);
		lsb1 = getLSB(garbledCircuit->wires[input1].label0);
		char templ[20];
		char templ2[20];
		block val = _mm_xor_si128 (tweak, sched[0]);
		for (j=1; j<rnds; j++) val = _mm_aesenc_si128 (val,sched2[j]);
		*((block*)templ) = _mm_aesenclast_si128 (val, sched[j]);
		val = _mm_aesenclast_si128 (val, sched[j]);
		*((block *)templ2) = xorBlocks(*((block *)templ), garblingContext.R);

		TRUNCATE(templ);
		TRUNCATE(templ2);

		block *label0 = (block *)templ;
		block *label1 = (block *)templ2;
		garbledCircuit->wires[garbledGate->output].label0 = *((block*)templ);
		garbledCircuit->wires[garbledGate->output].label1 = *((block*)templ2);
		block A0, A1, B0, B1;
		A0 = DOUBLE(garbledCircuit->wires[input0].label0);
		A1 = DOUBLE(garbledCircuit->wires[input0].label1);
		B0 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label0));
		B1 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label1));

		keys[0] = xorBlocks(A0, B0);
		keys[0] = xorBlocks(keys[0], tweak);
		keys[1] = xorBlocks(A0,B1);
		keys[1] = xorBlocks(keys[1], tweak);
		keys[2] = xorBlocks(A1, B0);
		keys[2] = xorBlocks(keys[2], tweak);
		keys[3] = xorBlocks(A1, B1);
		keys[3] = xorBlocks(keys[3], tweak);

		if (garbledGate->type == ANDGATE) {

			blocks[0] = xorBlocks(keys[0], *label0);
			blocks[1] = xorBlocks(keys[1], *label0);
			blocks[2] = xorBlocks(keys[2], *label0);
			blocks[3] = xorBlocks(keys[3], *label1);
			goto write;
		}

		if (garbledGate->type == ORGATE) {

			blocks[0] = xorBlocks(keys[0], *label0);
			blocks[1] = xorBlocks(keys[1], *label1);
			blocks[2] = xorBlocks(keys[2], *label1);
			blocks[3] = xorBlocks(keys[3], *label1);
			goto write;

		}

		if (garbledGate->type == XORGATE) {

			blocks[0] = xorBlocks(keys[0], *label0);
			blocks[1] = xorBlocks(keys[1], *label1);
			blocks[2] = xorBlocks(keys[2], *label1);
			blocks[3] = xorBlocks(keys[3], *label0);
			goto write;

		}

		if (garbledGate->type == NOTGATE) {

			blocks[0] = xorBlocks(keys[0], *label1);
			blocks[1] = xorBlocks(keys[1], *label0);
			blocks[2] = xorBlocks(keys[2], *label1);
			blocks[3] = xorBlocks(keys[3], *label0);
			goto write;

		}
		write:
		AES_ecb_encrypt_blks(keys, 4, &(garblingContext.dkCipherContext.K));

		char toWrite[4][16];
		char **dest[4];

		*((block *) toWrite[0]) = xorBlocks(blocks[0], keys[0]);
		*((block *) toWrite[1]) = xorBlocks(blocks[1], keys[1]);
		*((block *) toWrite[2]) = xorBlocks(blocks[2], keys[2]);
		*((block *) toWrite[3]) = xorBlocks(blocks[3], keys[3]);

		short *cpsrc; short *cpdst;
		cpsrc = (short *)toWrite[0];
		cpdst = (short *)&garbledTable[tableIndex].table[2*lsb0 + lsb1];
		cpdst[0]=cpsrc[0];
		cpdst[1]=cpsrc[1];
		cpdst[2]=cpsrc[2];
		cpdst[3]=cpsrc[3];
		cpdst[4]=cpsrc[4];

		cpsrc = (short *)toWrite[1];
		cpdst = (short *)&garbledTable[tableIndex].table[2*(lsb0) + (1-lsb1)];
		cpdst[0]=cpsrc[0];
		cpdst[1]=cpsrc[1];
		cpdst[2]=cpsrc[2];
		cpdst[3]=cpsrc[3];
		cpdst[4]=cpsrc[4];

		cpsrc = (short *)toWrite[2];
		cpdst = (short *)&garbledTable[tableIndex].table[2*(1-lsb0) + (lsb1)];
		cpdst[0]=cpsrc[0];
		cpdst[1]=cpsrc[1];
		cpdst[2]=cpsrc[2];
		cpdst[3]=cpsrc[3];
		cpdst[4]=cpsrc[4];

		cpsrc = (short *)toWrite[3];
		cpdst = (short *)&garbledTable[tableIndex].table[2*(1-lsb0) + (1-lsb1)];
		cpdst[0]=cpsrc[0];
		cpdst[1]=cpsrc[1];
		cpdst[2]=cpsrc[2];
		cpdst[3]=cpsrc[3];
		cpdst[4]=cpsrc[4];

		tableIndex++;
	}
	for(i=0;i<garbledCircuit->m;i++) {
		outputMap[2*i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
		outputMap[2*i+1] = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
	}

	endTime = RDTSC;
	return (endTime - startTime);
}
#endif
#else
#ifdef ROW_REDUCTION

long garbleCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels, OutputMap outputMap) {

	GarblingContext garblingContext;
	GarbledGate *garbledGate;
	GarbledTable *garbledTable;
	DKCipherContext dkCipherContext;
	const __m128i *sched = ((__m128i *)(dkCipherContext.K.rd_key));
	block val;

	block *A, *B, *plainText,*cipherText;
	block tweak;
	long a, b, i, j,rnds = 10;
	block blocks[4];
	block keys[4];
	long lsb0,lsb1;
	block keyToEncrypt;
	int input0, input1, output;
	srand_sse( time(NULL));

	startTime = RDTSC;

	createInputLabels(inputLabels, garbledCircuit->n);

	garbledCircuit->id = getFreshId();

	for(i=0;i<2*garbledCircuit->n;i+=2) {
		garbledCircuit->wires[i/2].id = i+1;
		garbledCircuit->wires[i/2].label0 = inputLabels[i];
		garbledCircuit->wires[i/2].label1 = inputLabels[i+1];
	}
	garbledTable = garbledCircuit->garbledTable;
	garblingContext.gateIndex = 0;
	garblingContext.wireIndex = garbledCircuit->n + 1;
	block key = randomBlock();
	garblingContext.R = xorBlocks(garbledCircuit->wires[0].label0, garbledCircuit->wires[0].label1);
	garbledCircuit->globalKey = key;
	DKCipherInit(&key, &(garblingContext.dkCipherContext));
	int tableIndex = 0;

	for(i=0; i< garbledCircuit->q;i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		input0 = garbledGate->input0; input1 = garbledGate->input1;
		output = garbledGate->output;

#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
			garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
			continue;
		}
#endif
		tweak = makeBlock(i, (long)0);
		input0 = garbledGate->input0; input1 = garbledGate->input1;
		lsb0 = getLSB(garbledCircuit->wires[input0].label0);
		lsb1 = getLSB(garbledCircuit->wires[input1].label0);

		block A0, A1, B0, B1;
		A0 = DOUBLE(garbledCircuit->wires[input0].label0);
		A1 = DOUBLE(garbledCircuit->wires[input0].label1);
		B0 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label0));
		B1 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label1));

		keys[0] = xorBlocks(A0, B0);
		keys[0] = xorBlocks(keys[0], tweak);
		keys[1] = xorBlocks(A0,B1);
		keys[1] = xorBlocks(keys[1], tweak);
		keys[2] = xorBlocks(A1, B0);
		keys[2] = xorBlocks(keys[2], tweak);
		keys[3] = xorBlocks(A1, B1);
		keys[3] = xorBlocks(keys[3], tweak);

		block mask[4]; block newToken;
		mask[0] = keys[0];
		mask[1] = keys[1];
		mask[2] = keys[2];
		mask[3] = keys[3];
		AES_ecb_encrypt_blks(keys, 4, &(garblingContext.dkCipherContext.K));
		mask[0] = xorBlocks(mask[0], keys[0]);
		mask[1] = xorBlocks(mask[1],keys[1]);
		mask[2] = xorBlocks(mask[2],keys[2]);
		mask[3] = xorBlocks(mask[3],keys[3]);

		if (2*lsb0 + lsb1 ==0)
		newToken = mask[0];
		if (2*lsb0 + 1-lsb1 ==0)
		newToken = mask[1];
		if (2*(1-lsb0) + lsb1 ==0)
		newToken = mask[2];
		if (2*(1-lsb0) + 1-lsb1 ==0)
		newToken = mask[3];

		block newToken2 = xorBlocks(garblingContext.R, newToken);

		if (garbledGate->type == ANDGATE) {
			if (lsb1 ==1 & lsb0 ==1) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			}
			else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == ORGATE) {
			if (!(lsb1 ==0 & lsb0 ==0)) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			}
			else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == XORGATE) {
			if ((lsb1 ==0 & lsb0 ==1) ||(lsb1 ==1 & lsb0 ==0) ) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			}
			else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		if (garbledGate->type == NOTGATE) {
			if (lsb0 ==0) {
				garbledCircuit->wires[garbledGate->output].label1 = newToken;
				garbledCircuit->wires[garbledGate->output].label0 = newToken2;
			}
			else {
				garbledCircuit->wires[garbledGate->output].label0 = newToken;
				garbledCircuit->wires[garbledGate->output].label1 = newToken2;
			}
		}

		block *label0 = &garbledCircuit->wires[garbledGate->output].label0;
		block *label1 = &garbledCircuit->wires[garbledGate->output].label1;

		if (garbledGate->type == ANDGATE) {

			blocks[0] = *label0;
			blocks[1] = *label0;
			blocks[2] = *label0;
			blocks[3] = *label1;
			goto write;
		}

		if (garbledGate->type == ORGATE) {

			blocks[0] = *label0;
			blocks[1] = *label1;
			blocks[2] = *label1;
			blocks[3] = *label1;
			goto write;

		}

		if (garbledGate->type == XORGATE) {

			blocks[0] = *label0;
			blocks[1] = *label1;
			blocks[2] = *label1;
			blocks[3] = *label0;
			goto write;

		}

		if (garbledGate->type == NOTGATE) {

			blocks[0] = *label1;
			blocks[1] = *label0;
			blocks[2] = *label1;
			blocks[3] = *label0;
			goto write;

		}
		write:
		if (2*lsb0 + lsb1 !=0)
		garbledTable[tableIndex].table[2*lsb0 + lsb1 -1] = xorBlocks(blocks[0], mask[0]);
		if (2*lsb0 + 1-lsb1 !=0)
		garbledTable[tableIndex].table[2*lsb0 + 1-lsb1-1] = xorBlocks(blocks[1], mask[1]);
		if (2*(1-lsb0) + lsb1 !=0)
		garbledTable[tableIndex].table[2*(1-lsb0) + lsb1-1] = xorBlocks(blocks[2], mask[2]);
		if (2*(1-lsb0) + (1-lsb1) !=0)
		garbledTable[tableIndex].table[2*(1-lsb0) + (1-lsb1)-1] = xorBlocks(blocks[3], mask[3]);

		tableIndex++;

	}
	for(i=0;i<garbledCircuit->m;i++) {
		outputMap[2*i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
		outputMap[2*i+1] = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
	}
	endTime = RDTSC;
	return (endTime - startTime);
}

#else

long garbleCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels,
		OutputMap outputMap) {

	GarblingContext garblingContext;
	GarbledGate *garbledGate;
	GarbledTable *garbledTable;
	DKCipherContext dkCipherContext;
	const block *sched = ((block *) (dkCipherContext.K.rd_key));
	block val;

	block *A, *B, *plainText, *cipherText;
	block tweak;
	long i, j, rnds = 10;
	block blocks[4];
	block keys[4];
	long lsb0, lsb1;
	int input0, input1, output;
	srand_sse(time(NULL));

	startTime = RDTSC;

	createInputLabels(inputLabels, garbledCircuit->n);
	garbledCircuit->id = getFreshId();

	for (i = 0; i < 2 * garbledCircuit->n; i += 2) {
		garbledCircuit->wires[i / 2].label0 = inputLabels[i];
		garbledCircuit->wires[i / 2].label1 = inputLabels[i + 1];
	}
	garbledTable = garbledCircuit->garbledTable;
	garblingContext.gateIndex = 0;
	garblingContext.wireIndex = garbledCircuit->n + 1;
	block key = randomBlock();
	block rkey = randomBlock();
	AES_KEY KR;
	AES_set_encrypt_key((unsigned char *) &rkey, 128, &KR);
	const __m128i *sched2 = ((__m128i *) (KR.rd_key));
	garblingContext.R =
			xorBlocks(garbledCircuit->wires[0].label0, garbledCircuit->wires[0].label1);
	garbledCircuit->globalKey = key;
	DKCipherInit(&key, &(garblingContext.dkCipherContext));
	int tableIndex = 0;

	for (i = 0; i < garbledCircuit->q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		input0 = garbledGate->input0;
		input1 = garbledGate->input1;
		output = garbledGate->output;

#ifdef FREE_XOR
		if (garbledGate->type == XORGATE) {
			garbledCircuit->wires[output].label0 =
					xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
			garbledCircuit->wires[output].label1 =
					xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
			continue;
		}
#endif
		tweak = makeBlock(i, (long)0);
		lsb0 = getLSB(garbledCircuit->wires[input0].label0);
		lsb1 = getLSB(garbledCircuit->wires[input1].label0);

		block val = _mm_xor_si128(tweak, sched[0]);
		for (j = 1; j < rnds; j++)
			val = _mm_aesenc_si128(val, sched2[j]);
		garbledCircuit->wires[garbledGate->output].label0 =
				_mm_aesenclast_si128(val, sched[j]);

		garbledCircuit->wires[garbledGate->output].label1 =
				xorBlocks(garblingContext.R,
						garbledCircuit->wires[garbledGate->output].label0);
		block A0, A1, B0, B1;
		A0 = DOUBLE(garbledCircuit->wires[input0].label0);
		A1 = DOUBLE(garbledCircuit->wires[input0].label1);
		B0 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label0));
		B1 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label1));

		keys[0] = xorBlocks(xorBlocks(A0, B0) , tweak);
		keys[1] = xorBlocks(xorBlocks(A0,B1), tweak);
		keys[2] = xorBlocks(xorBlocks(A1, B0), tweak);
		keys[3] = xorBlocks(xorBlocks(A1, B1), tweak);

		block *temp[2];
		temp[0] = &garbledCircuit->wires[garbledGate->output].label0;
		temp[1] = &garbledCircuit->wires[garbledGate->output].label1;
		int bp = 0;
		blocks[0] =
				xorBlocks(keys[0], *(temp[(garbledGate->type & (1<<bp))>>bp]));
		bp++;
		blocks[1] =
				xorBlocks(keys[1], *(temp[(garbledGate->type & (1<<bp))>>bp]));
		bp++;
		blocks[2] =
				xorBlocks(keys[2], *(temp[(garbledGate->type & (1<<bp))>>bp]));
		bp++;
		blocks[3] =
				xorBlocks(keys[3], *(temp[(garbledGate->type & (1<<bp))>>bp]));

		write:

		AES_ecb_encrypt_blks_4(keys,  &(garblingContext.dkCipherContext.K));

		garbledTable[tableIndex].table[2 * lsb0 + lsb1] =
				xorBlocks(blocks[0], keys[0]);
		garbledTable[tableIndex].table[2 * lsb0 + 1 - lsb1] =
				xorBlocks(blocks[1], keys[1]);
		garbledTable[tableIndex].table[2 * (1 - lsb0) + lsb1] =
				xorBlocks(blocks[2], keys[2]);
		garbledTable[tableIndex].table[2 * (1 - lsb0) + (1 - lsb1)] =
				xorBlocks(blocks[3], keys[3]);

		tableIndex++;

	}
	for (i = 0; i < garbledCircuit->m; i++) {
		outputMap[2 * i] =
				garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
		outputMap[2 * i + 1] =
				garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
	}
	endTime = RDTSC;
	return (endTime - startTime);
}

#endif
#endif

int blockEqual(block a, block b) {
	long *ap = (long*) &a;
	long *bp = (long*) &b;
	if ((ap[0] == bp[0]) && (ap[1] == bp[1]))
		return 1;
	else
		return 0;
}

int mapOutputs(OutputMap outputMap, OutputMap outputMap2, int *vals, int m) {
	int i;
	for (i = 0; i < m; i++) {
		if (blockEqual(outputMap2[i], outputMap[2 * i])) {
			vals[i] = 0;
			continue;
		}
		if (blockEqual(outputMap2[i], outputMap[2 * i + 1])) {
			vals[i] = 1;
			continue;
		}
		printf("MAP FAILED %d\n", i);
	}
	return 0;

}
#ifdef TRUNCATED
int createInputLabels(InputLabels inputLabels, int n) {
	int i;
	block R = randomBlock();
	*((short *) (&R)) = 1;
	char temp[20];
	char temp2[20];
	long *tempS = temp + 10;
	long *temp2S = temp2 + 10;

	for (i = 0; i < 2 * n; i += 2) {
		*((block *) temp) = randomBlock();
		*((block *) temp2) = xorBlocks(*((block *)temp), R);
		tempS[0] = 0;
		temp2S[0] = 0;
		/*		temp[10] = '\0';
		 temp[11] = '\0';
		 temp[12] = '\0';
		 temp[13] = '\0';
		 temp[14] = '\0';
		 temp[15] = '\0';
		 temp2[10] = '\0';
		 temp2[11] = '\0';
		 temp2[12] = '\0';
		 temp2[13] = '\0';
		 temp2[14] = '\0';
		 temp2[15] = '\0';*/
		inputLabels[i] = *((block *) temp);
		inputLabels[i + 1] = *((block *) temp2);
	}
	return 0;

}

#else
int createInputLabels(InputLabels inputLabels, int n) {
	int i;
	block R = randomBlock();
	*((short *) (&R)) = 1;
	for (i = 0; i < 2 * n; i += 2) {
		inputLabels[i] = randomBlock();
		inputLabels[i + 1] = xorBlocks(R, inputLabels[i]);
	}
	return 0;

}
#endif

int findGatesWithMatchingInputs(GarbledCircuit *garbledCircuit,
		InputLabels inputLabels, OutputMap outputMap, int *outputs) {
	int i;
	GarbledGate *garbledGate1, *garbledGate2;
	DKCipherContext dkCipherContext;

	DKCipherInit(&(garbledCircuit->globalKey), &dkCipherContext);

	for (i = 0; i < garbledCircuit->n; i++) {
		garbledCircuit->wires[i].label = inputLabels[i];
	}
	int matching = 0;
	int j;
	for (i = 0; i < garbledCircuit->q; i++) {
		garbledGate1 = &garbledCircuit->garbledGates[i];
		for (j = i + 1; j < garbledCircuit->q; j++) {
			garbledGate2 = &garbledCircuit->garbledGates[j];
			if (garbledGate1->input0 == garbledGate2->input0
					&& garbledGate1->input1 == garbledGate2->input1) {
				matching++;
			}
		}
	}
	return 0;
}

