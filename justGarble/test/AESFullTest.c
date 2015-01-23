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


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include "../include/justGarble.h"

#ifdef __cplusplus
extern "C" {
#endif


#define AES_CIRCUIT_FILE_NAME "./readNetlist/netlists/aesCircuit.scd"

char GATETABLE[16][32]=
{
		"", //0
		"NOR", //1
		"NORN", //2
		"", //3
		"ANDN", //4
		"", //5
		"XOR", //6
		"NAND", //7
		"AND", //8
		"XNOR", //9
		"", //10
		"NANDN", //11
		"IV", //12
		"ORN", //13
		"OR", //14
		""	//15
};

void buildAESCircuit() {
	srand(time(NULL));
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int roundLimit = 10;
	int n = 128 * (roundLimit + 1);
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000; //wire + FIXED0 + FIXED1 = n+q+2
	int inp[n];
	countToN(inp, n);
	int addKeyInputs[n * (roundLimit + 1)];
	int addKeyOutputs[n];
	int subBytesOutputs[n];
	int shiftRowsOutputs[n];
	int mixColumnOutputs[n];
	int round;
	//block labels[2 * n];
	block outputbs[m];
	OutputMap outputMap = outputbs;
	//InputLabels inputLabels = labels;
	int i;
	int xorc  = 0;
	int nxorc =0;

	//createInputLabels(labels, n);
	long startBuldingTime = createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);

	countToN(addKeyInputs, 256);

	for (round = 0; round < roundLimit; round++) {

		AddRoundKey(&garbledCircuit, &garblingContext, addKeyInputs,
				addKeyOutputs);

		for (i = 0; i < 16; i++) {
			SubBytes(&garbledCircuit, &garblingContext, addKeyOutputs + 8 * i,
					subBytesOutputs + 8 * i);
		}

		ShiftRows(&garbledCircuit, &garblingContext, subBytesOutputs,
				shiftRowsOutputs);

		for (i = 0; i < 4; i++) {
			if (round == roundLimit - 1)
				MixColumns(&garbledCircuit, &garblingContext,
						shiftRowsOutputs + i * 32, mixColumnOutputs + 32 * i);
		}
		for (i = 0; i < 128; i++) {
			addKeyInputs[i] = mixColumnOutputs[i];
			addKeyInputs[i + 128] = (round + 2) * 128 + i;
		}
	}
	int * final = mixColumnOutputs;
	long endBuldingTime = finishBuilding(&garbledCircuit, &garblingContext, final, NULL, NULL);
	writeCircuitToFile(&garbledCircuit, AES_CIRCUIT_FILE_NAME);


	for (i = 0; i < q; i++) {
		int type = garbledCircuit.garbledGates[i].type;
		if(	type == XORGATE	|| type == XNORGATE ||type == NOTGATE)
			xorc++;
	}
	nxorc = garbledCircuit.q - xorc;

	printf("AES has %d xor and %d non-xor gates\n",xorc, nxorc);

}
void makeAddRoundKey()
{
	FILE *f = fopen("AddRoundKey.v", "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return;
	}


	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int n = 128 + 128;
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000; //wire + FIXED0 + FIXED1 = n+q+2
	int inp[n];
	int outp[m];
	long i;
	long t;

	countToN(inp, n);

	//createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);



	AddRoundKey(&garbledCircuit, &garblingContext, inp,	outp);

	finishBuilding(&garbledCircuit, &garblingContext, outp, NULL, NULL);

	fprintf(f, "module AddRoundKey(\n");
	fprintf(f, "x,\n");
	fprintf(f, "y,\n");
	fprintf(f, "z);\n\n");

	fprintf(f, "\tinput [%lu:0] x;\n", (long)garbledCircuit.n/2 - 1);
	fprintf(f, "\tinput [%lu:0] y;\n", (long)garbledCircuit.n/2 - 1);
	fprintf(f, "\toutput [%lu:0] z;\n", (long)garbledCircuit.m - 1);


	//wire
	fprintf(f, "\twire ");
	for(i=0;i<garbledCircuit.n ;i++)
	{
		t = i;
		fprintf(f, "w%lu, ", t);
	}
	for(i=0;i<garbledCircuit.q - 1;i++)
	{
		t = garbledCircuit.garbledGates[i].output;
		fprintf(f, "w%lu, ", t);
	}
	t = garbledCircuit.garbledGates[i].output;
	fprintf(f, "w%lu;\n\n", t);


	//input
	fprintf(f, "\tassign {");
	for(i=0;i<garbledCircuit.n/2 - 1;i++)
	{
		fprintf(f, "w%lu, ", i);
	}
	fprintf(f, "w%lu} = x;\n\n", i++);

	fprintf(f, "\tassign {");
	for(;i<garbledCircuit.n - 1;i++)
	{
		fprintf(f, "w%lu, ", i);
	}
	fprintf(f, "w%lu} = y;\n\n", i);

	//output
	fprintf(f, "\tassign z = {");
	for(i=0;i<garbledCircuit.m - 1;i++)
	{
		fprintf(f, "w%lu, ", (long)outp[i]);
	}
	fprintf(f, "w%lu};\n\n", (long)outp[i]);




	for(i=0;i<garbledCircuit.q;i++)
	{
		int type;
		long input0,input1, output;

		type = garbledCircuit.garbledGates[i].type;
		input0 = garbledCircuit.garbledGates[i].input0;
		input1 = garbledCircuit.garbledGates[i].input1;
		output = garbledCircuit.garbledGates[i].output;


		fprintf(f, "\t%s U%lu ( .A(w%lu), .B(w%lu), .Z(w%lu) );\n", GATETABLE[type], i, input0, input1, output);

	}
	fprintf(f, "endmodule\n\n");

	fclose(f);
}

void makeSubBytes()
{

	FILE *f = fopen("SubBytes.v", "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return;
	}

	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int n = 128;
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000; //wire + FIXED0 + FIXED1 = n+q+2
	int inp[n];
	int outp[m];
	long i;
	long t;


	countToN(inp, n);


	//createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);

	countToN(inp, n);


	for (i = 0; i < 16; i++)
	{
		SubBytes(&garbledCircuit, &garblingContext, inp + 8 * i, outp + 8 * i);
	}


	finishBuilding(&garbledCircuit, &garblingContext, outp, NULL, NULL);


	fprintf(f, "module SubBytes(\n");
	fprintf(f, "x,\n");
	fprintf(f, "z);\n\n");

	fprintf(f, "\tinput [%lu:0] x;\n", (long)garbledCircuit.n - 1);
	fprintf(f, "\toutput [%lu:0] z;\n", (long)garbledCircuit.m - 1);


	//wire
	fprintf(f, "\twire ");
	for(i=0;i<garbledCircuit.n ;i++)
	{
		t = i;
		fprintf(f, "w%lu, ", t);
	}
	for(i=0;i<garbledCircuit.q - 1;i++)
	{
		t = garbledCircuit.garbledGates[i].output;
		fprintf(f, "w%lu, ", t);
	}
	t = garbledCircuit.garbledGates[i].output;
	fprintf(f, "w%lu;\n\n", t);


	//input
	fprintf(f, "\tassign {");
	for(i=0;i<garbledCircuit.n - 1;i++)
	{
		fprintf(f, "w%lu, ", i);
	}
	fprintf(f, "w%lu} = x;\n\n", i);


	//output
	fprintf(f, "\tassign z = {");
	for(i=0;i<garbledCircuit.m - 1;i++)
	{
		fprintf(f, "w%lu, ", (long)outp[i]);
	}
	fprintf(f, "w%lu};\n\n", (long)outp[i]);



	for(i=0;i<garbledCircuit.q;i++)
	{
		int type;
		long input0,input1, output;

		type = garbledCircuit.garbledGates[i].type;
		input0 = garbledCircuit.garbledGates[i].input0;
		input1 = garbledCircuit.garbledGates[i].input1;
		output = garbledCircuit.garbledGates[i].output;


		fprintf(f,"\t%s U%lu ( .A(w%lu), .B(w%lu), .Z(w%lu) );\n", GATETABLE[type], i, input0, input1, output);

	}
	fprintf(f, "endmodule\n\n");
	fclose(f);
}


void makeShiftRows()
{
	FILE *f = fopen("ShiftRows.v", "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return;
	}


	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int n = 128;
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000; //wire + FIXED0 + FIXED1 = n+q+2
	int inp[n];
	int outp[m];
	long i;
	long t;


	countToN(inp, n);


	//createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);

	countToN(inp, n);


	ShiftRows(&garbledCircuit, &garblingContext, inp, outp);

	finishBuilding(&garbledCircuit, &garblingContext, outp, NULL, NULL);


	fprintf(f, "module ShiftRows(\n");
	fprintf(f, "x,\n");
	fprintf(f, "z);\n\n");

	fprintf(f, "\tinput [%lu:0] x;\n", (long)garbledCircuit.n - 1);
	fprintf(f, "\toutput [%lu:0] z;\n", (long)garbledCircuit.m - 1);


	//wire
	fprintf(f, "\twire ");
	for(i=0;i<garbledCircuit.n ;i++)
	{
		t = i;
		fprintf(f, "w%lu, ", t);
	}
	t = i;
	fprintf(f, "w%lu;\n\n", t);


	//input
	fprintf(f, "\tassign {");
	for(i=0;i<garbledCircuit.n - 1;i++)
	{
		fprintf(f, "w%lu, ", i);
	}
	fprintf(f, "w%lu} = x;\n\n", i);


	//output
	fprintf(f, "\tassign z = {");
	for(i=0;i<garbledCircuit.m - 1;i++)
	{
		fprintf(f, "w%lu, ", (long)outp[i]);
	}
	fprintf(f, "w%lu};\n\n", (long)outp[i]);


	fprintf(f, "endmodule\n\n");
	fclose(f);
}

void makeMixColumns()
{
	FILE *f = fopen("MixColumns.v", "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return;
	}

	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int n = 128;
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000; //wire + FIXED0 + FIXED1 = n+q+2
	int inp[n];
	int outp[m];
	long i;
	long t;


	countToN(inp, n);


	//createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);

	countToN(inp, n);


	for (i = 0; i < 4; i++)
	{
		MixColumns(&garbledCircuit, &garblingContext, inp + i * 32, outp + 32 * i);
	}


	finishBuilding(&garbledCircuit, &garblingContext, outp, NULL, NULL);


	fprintf(f, "module MixColumns(\n");
	fprintf(f, "x,\n");
	fprintf(f, "z);\n\n");

	fprintf(f, "\tinput [%lu:0] x;\n", (long)garbledCircuit.n - 1);
	fprintf(f, "\toutput [%lu:0] z;\n", (long)garbledCircuit.m - 1);


	//wire
	fprintf(f, "\twire ");
	for(i=0;i<garbledCircuit.n ;i++)
	{
		t = i;
		fprintf(f, "w%lu, ", t);
	}
	for(i=0;i<garbledCircuit.q - 1;i++)
	{
		t = garbledCircuit.garbledGates[i].output;
		fprintf(f, "w%lu, ", t);
	}
	t = garbledCircuit.garbledGates[i].output;
	fprintf(f, "w%lu;\n\n", t);


	//input
	fprintf(f, "\tassign {");
	for(i=0;i<garbledCircuit.n - 1;i++)
	{
		fprintf(f, "w%lu, ", i);
	}
	fprintf(f, "w%lu} = x;\n\n", i);


	//output
	fprintf(f, "\tassign z = {");
	for(i=0;i<garbledCircuit.m - 1;i++)
	{
		fprintf(f, "w%lu, ", (long)outp[i]);
	}
	fprintf(f, "w%lu};\n\n", (long)outp[i]);


	for(i=0;i<garbledCircuit.q;i++)
	{
		int type;
		long input0,input1, output;

		type = garbledCircuit.garbledGates[i].type;
		input0 = garbledCircuit.garbledGates[i].input0;
		input1 = garbledCircuit.garbledGates[i].input1;
		output = garbledCircuit.garbledGates[i].output;


		fprintf(f, "\t%s U%lu ( .A(w%lu), .B(w%lu), .Z(w%lu) );\n", GATETABLE[type], i, input0, input1, output);

	}
	fprintf(f, "endmodule\n\n");
	fclose(f);
}

int main() {
	int rounds = 10;
	int n = 128 + (128 * rounds);
	int m = 128;

	GarbledCircuit aesCircuit;
	block inputLabels[2 * n];
	block outputMap[m];
	int i, j;

#ifdef WRITECIRCUIT
	printf("AddRoundKey:\n\n");
	makeAddRoundKey();
	printf("SubBytes:\n\n");
	makeSubBytes();
	printf("ShiftRows:\n\n");
	makeShiftRows();
	printf("MixColumns:\n\n");
	makeMixColumns();
#endif
	
	buildAESCircuit();
	readCircuitFromFile(&aesCircuit, AES_CIRCUIT_FILE_NAME);

	int timeGarble[TIMES];
	int timeEval[TIMES];
	double timeGarbleMedians[TIMES];
	double timeEvalMedians[TIMES];

	for (j = 0; j < TIMES; j++) {
		for (i = 0; i < TIMES; i++) {
			timeGarble[i] = garbleCircuit(&aesCircuit, inputLabels, outputMap);
			timeEval[i] = timedEval(&aesCircuit, inputLabels);
		}
		timeGarbleMedians[j] = ((double) median(timeGarble, TIMES))
				/ aesCircuit.q;
		timeEvalMedians[j] = ((double) median(timeEval, TIMES)) / aesCircuit.q;
	}
	double garblingTime = doubleMean(timeGarbleMedians, TIMES);
	double evalTime = doubleMean(timeEvalMedians, TIMES);
	printf("%lf %lf\n", garblingTime, evalTime);
	
	return 0;

}

#ifdef __cplusplus
}
#endif
