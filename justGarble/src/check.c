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
#include "../include/check.h"
#include "../include/util.h"
#include "../include/justGarble.h"


int checkCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels,
		OutputMap outputMap, int check(int *a, int *out, int s)) {

	int i, j;
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	block extractedLabels[n];
	block computedOutputMap[m];
	int outputVals[m];
	int outputReal[m];
	int inputs[n];

	for (i = 0; i < TIMES; i++) {
		for (j = 0; j < n; j++) {
			inputs[j] = rand() % 2;
		}
		extractLabels(extractedLabels, inputLabels, inputs, n);
		evaluate(garbledCircuit, extractedLabels, computedOutputMap);
		mapOutputs(outputMap, computedOutputMap, outputVals, m);
		check(inputs, outputReal, n);
		for (j = 0; j < m; j++)
			if (outputVals[j] != outputReal[j]) {
				fprintf(stderr, "Check failed %u \n", j);
			}
	}
	return 0;
}

unsigned long timedEval(GarbledCircuit *garbledCircuit, InputLabels inputLabels) {

	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	block extractedLabels[n];
	block outputs[m];
	int j;
	int inputs[n];
	unsigned long startTime, endTime;
	unsigned long sum = 0;
	for (j = 0; j < n; j++) {
		inputs[j] = rand() % 2;
	}
	extractLabels(extractedLabels, inputLabels, inputs, n);
	startTime = RDTSC;
	evaluate(garbledCircuit, extractedLabels, outputs);
	endTime = RDTSC;
	sum = endTime - startTime;
	return sum;

}

