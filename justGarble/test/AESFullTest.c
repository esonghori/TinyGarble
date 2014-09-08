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

int *final;

#define AES_CIRCUIT_FILE_NAME "./aesCircuit"

void buildAESCircuit() {
	srand(time(NULL));
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int roundLimit = 10;
	int n = 128 * (roundLimit + 1);
	int m = 128;
	int q = 50000; //Just an upper bound
	int r = 50000;
	int inp[n];
	countToN(inp, n);
	int addKeyInputs[n * (roundLimit + 1)];
	int addKeyOutputs[n];
	int subBytesOutputs[n];
	int shiftRowsOutputs[n];
	int mixColumnOutputs[n];
	int round;
	block labels[2 * n];
	block outputbs[m];
	OutputMap outputMap = outputbs;
	InputLabels inputLabels = labels;
	int i;

	createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
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

	final = mixColumnOutputs;
	finishBuilding(&garbledCircuit, &garblingContext, outputMap, final);
	writeCircuitToFile(&garbledCircuit, AES_CIRCUIT_FILE_NAME);
}

int main() {
	int rounds = 10;
	int n = 128 + (128 * rounds);
	int m = 128;

	GarbledCircuit aesCircuit;
	block inputLabels[2 * n];
	block outputMap[m];
	int i, j;
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

