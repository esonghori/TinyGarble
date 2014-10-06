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
#include "../include/garble.h"
#ifdef __cplusplus
extern "C" {
#endif


int checkfn(int *input, int *outputs, int n) {
	outputs[0] = (input[0])?input[2]:input[1];
	return outputs[0];
}


int main(int argc, char* argv[])
{
	if(argc < 2)
	{
		printf("Enter scd file name\n");
		return -1;
	}



	GarbledCircuit gc;

	int i, j;
	readCircuitFromFile(&gc, argv[1]);

	int n = gc.n;
	int m = gc.m;
	block *inputLabels = (block *)malloc(sizeof(block *)*2*n);
	block *outputMap = (block *)malloc(sizeof(block *)*m);


	garbleCircuit(&gc, inputLabels, outputMap);
	checkCircuit(&gc, inputLabels, outputMap, &(checkfn));

	for(int k=0;k<gc.r; k++)
	{
		if(blockEqual(gc.wires[k].label, gc.wires[k].label0))
		{
			printf("Wire%d: 0\n", k);
		}
		else if(blockEqual(gc.wires[k].label, gc.wires[k].label1))
		{
			printf("Wire%d: 1\n", k);
		}
		else
		{
			printf("Wire%d: undefined\n", k);
		}
	}


	int timeGarble[TIMES];
	int timeEval[TIMES];
	double timeGarbleMedians[TIMES];
	double timeEvalMedians[TIMES];
	double totalTimeGarbleMedians[TIMES];
	double totalTimeEvalMedians[TIMES];

	for (j = 0; j < TIMES; j++)
	{
		for (i = 0; i < TIMES; i++)
		{
			timeGarble[i] = garbleCircuit(&gc, inputLabels, outputMap);
			timeEval[i] = timedEval(&gc, inputLabels);
		}
		totalTimeGarbleMedians[j] = ((double) median(timeGarble, TIMES));
		timeGarbleMedians[j] = totalTimeGarbleMedians[j] / gc.q;

		totalTimeEvalMedians[j] =  ((double) median(timeEval, TIMES));
		timeEvalMedians[j] =  totalTimeEvalMedians[j] / gc.q;
	}
	double totalGarblingTime = doubleMean(totalTimeGarbleMedians, TIMES);
	double garblingTime = doubleMean(timeGarbleMedians, TIMES);
	double totalEvalTime = doubleMean(totalTimeEvalMedians, TIMES);
	double evalTime = doubleMean(timeEvalMedians, TIMES);


	printf("total(g,e): %lf %lf\n", garblingTime, evalTime);
	printf("pg(g,e): %lf %lf\n", totalGarblingTime, totalEvalTime);
	return 0;
}

#ifdef __cplusplus
}
#endif
