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

int checkfn(int *a, int *outputs, int n) {
	outputs[0] = a[0];
	int i = 0;
	for (i = 0; i < n - 1; i++) {
		if (i % 3 == 2)
			outputs[0] = outputs[0] | a[i + 1];
		if (i % 3 == 1)
			outputs[0] = outputs[0] & a[i + 1];
		if (i % 3 == 0)
			outputs[0] = outputs[0] ^ a[i + 1];
	}
	return outputs[0];
}

int main(int argc, char **argv) {
	srand(time(NULL));
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;
	if (argc != 2)
	{
		printf("Usage: <prog_name> number_of_gates (in thousands)");
        return -1;
	}
	int n = atoi(argv[1]) * 1024;
	int m = 1;
	int q = n;
	int r = q+n;

	//Setup input and output tokens/labels.
	block *labels = (block*) malloc(sizeof(block) * 2 * n);
	block *exlabels = (block*) malloc(sizeof(block) * n);
	block *outputbs2 = (block*) malloc(sizeof(block) * m);
	block *outputbs = (block*) malloc(sizeof(block) * m);
	int *inp = (int *) malloc(sizeof(int) * n);
	countToN(inp, n);
	int outputs[1];
	int i;

	OutputMap outputMap = outputbs;
	InputLabels inputLabels = labels;

	//Create a circuit.
	createInputLabels(labels, n);
	long startBuldingTime = createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
	startBuilding(&garbledCircuit, &garblingContext);
	MIXEDCircuit(&garbledCircuit, &garblingContext, n, inp, outputs);
	long endBuldingTime = finishBuilding(&garbledCircuit, &garblingContext, outputMap, outputs);

	//Write the created circuit to a file
	writeCircuitToFile(&garbledCircuit, "test/netlists/test.scd");

	//Create an empty garbled circuit data structure
	GarbledCircuit garbledCircuit2;

	//Read a circuit from a file and initialize the garbled circuit data
	//structure with it. Note that this step does not perform actual
	//garbling. It just creates empty garbled tables and space for wires and gates.
	readCircuitFromFile(&garbledCircuit2, "test/netlists/test.scd");

	//Actually garble the circuit created from the file.
	garbleCircuit(&garbledCircuit2, inputLabels, outputMap);

	//Evaluate the circuit with random values and check the computed
	//values match the outputs of the desired function.
	checkCircuit(&garbledCircuit2, inputLabels, outputMap, &(checkfn));

	return 0;

}

#ifdef __cplusplus
}
#endif
