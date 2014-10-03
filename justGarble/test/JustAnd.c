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

#define JUST_AND_FILE_NAME "./justAnd"

void buildJustAnd() {
	srand(time(NULL));
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	int n = 2; // # of inputs
	int m = 1; // # of outputs
	int q = 1; // # of gates
	int r = 3; // # of fixed wires
	int inp[n];
	countToN(inp, n);
	block labels[2 * n];
	block outputbs[m];
	InputLabels inputLabels = labels;
	OutputMap outputMap = outputbs;
	int outputs[m];

	createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
	startBuilding(&garbledCircuit, &garblingContext);

	int newInternalWire = getNextWire(&garblingContext);
	ANDGate(&garbledCircuit, &garblingContext, 0, 1, newInternalWire);
	outputs[0] = newInternalWire;

	finishBuilding(&garbledCircuit, &garblingContext, outputMap, outputs);

	writeCircuitToFile(&garbledCircuit, JUST_AND_FILE_NAME);
}

int main() {
	int n = 2;
	int m = 1;

	GarbledCircuit justAnd;
	block inputLabels[2];
	block outputMap[m];
	int i, j;
	buildJustAnd();
	readCircuitFromFile(&justAnd, JUST_AND_FILE_NAME);

	int timeGarble[TIMES];
	int timeEval[TIMES];
	double timeGarbleMedians[TIMES];
	double timeEvalMedians[TIMES];

	for (j = 0; j < TIMES; j++) {
		for (i = 0; i < TIMES; i++) {
			timeGarble[i] = garbleCircuit(&justAnd, inputLabels, outputMap);
			timeEval[i] = timedEval(&justAnd, inputLabels);
		}
		timeGarbleMedians[j] = ((double) median(timeGarble, TIMES))
				/ justAnd.q;
		timeEvalMedians[j] = ((double) median(timeEval, TIMES)) / justAnd.q;
	}
	double garblingTime = doubleMean(timeGarbleMedians, TIMES);
	double evalTime = doubleMean(timeEvalMedians, TIMES);
	printf("%lf %lf\n", garblingTime, evalTime);
	return 0;
}

