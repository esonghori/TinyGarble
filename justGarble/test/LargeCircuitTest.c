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

int main(int argc, char **argv)
{
	srand(time(NULL));
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;
	if (argc != 3)
	{
		printf("Usage: <prog_name> number_of_gates [2|1|0] (2 for mixed 1 for xor 0 for and gates)\n");
        return -1;
	}
	int i,j;

	int mode = atoi(argv[2]);

	//Set up circuit parameters
	int n = atoi(argv[1]);
	int m = 1;
	int q = n;
	int r = 5 * n; //wire + FIXED0 + FIXED1 = n+q+2

	//Set up input and output tokens/labels.
	block *labels = (block*) malloc(sizeof(block) * 2 * n);
	block *exlabels = (block*) malloc(sizeof(block) * n);
	block *outputbs2 = (block*) malloc(sizeof(block) * m);
	block *outputbs = (block*) malloc(sizeof(block) * m);
	int *inp = (int *) malloc(sizeof(int) * n);
	countToN(inp, n);
	int outputs[1];

	OutputMap outputMap = outputbs;
	InputLabels inputLabels = labels;

	//Actually build a circuit. Alternatively, this circuit could be read
	//from a file.
	createInputLabels(labels, n);
	long startBuldingTime = createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, 0, 1);
	startBuilding(&garbledCircuit, &garblingContext);
	if(mode==2)
	{
		printf("MIXED\n");
		MIXEDCircuit(&garbledCircuit, &garblingContext, n, inp, outputs);
	}
	else if(mode==1)
	{
		printf("XOR\n");
		MIXEDXORCircuit(&garbledCircuit, &garblingContext, n, inp, outputs);
	}
	else if(mode==0)
	{
		printf("AND\n");
		MIXEDANDCircuit(&garbledCircuit, &garblingContext, n, inp, outputs);
	}
	else
	{
		printf("invalid mode use [2|1|0] (2 for mixed 1 for xor 0 for and gates)\n");
		return -1;
	}
	long endBuldingTime = finishBuilding(&garbledCircuit, &garblingContext, outputs,  NULL, NULL);


	double timeGarble[TIMES];
	double timeEval[TIMES];
	double timeGarbleMedians[TIMES];
	double timeEvalMedians[TIMES];

	for (j = 0; j < TIMES; j++) {
		for (i = 0; i < TIMES; i++) {
			timeGarble[i] = (double) garbleCircuit(&garbledCircuit, inputLabels, outputMap);
			timeEval[i] = (double) timedEval(&garbledCircuit, inputLabels);
		}
		timeGarbleMedians[j] = doubleMean(timeGarble, TIMES)/ garbledCircuit.q;
		timeEvalMedians[j] = doubleMean(timeEval, TIMES) / garbledCircuit.q;
	}
	double garblingTime = doubleMean(timeGarbleMedians, TIMES);
	double evalTime = doubleMean(timeEvalMedians, TIMES);

	printf("%lf\n%lf\n", garblingTime, evalTime);



	//Garble the built circuit.
	//garbleCircuit(&garbledCircuit, inputLabels, outputMap);

	//Evaluate the circuit with random values and check the computed
	//values match the outputs of the desired function.
	//checkCircuit(&garbledCircuit, inputLabels, outputMap, &(checkfn));

	return 0;

}

#ifdef __cplusplus
}
#endif
