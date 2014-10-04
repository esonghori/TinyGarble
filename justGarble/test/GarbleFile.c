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


	int timeGarble[TIMES];
	int timeEval[TIMES];
	double timeGarbleMedians[TIMES];
	double timeEvalMedians[TIMES];

	for (j = 0; j < TIMES; j++) {
		for (i = 0; i < TIMES; i++) {
			timeGarble[i] = garbleCircuit(&gc, inputLabels, outputMap);
			timeEval[i] = timedEval(&gc, inputLabels);
		}
		timeGarbleMedians[j] = ((double) median(timeGarble, TIMES))/ gc.q;
		timeEvalMedians[j] = ((double) median(timeEval, TIMES)) / gc.q;
	}
	double garblingTime = doubleMean(timeGarbleMedians, TIMES);
	double evalTime = doubleMean(timeEvalMedians, TIMES);
	printf("%lf %lf\n", garblingTime, evalTime);
	return 0;
}

#ifdef __cplusplus
}
#endif
