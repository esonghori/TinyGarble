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
#include "../include/tcpip.h"

#ifdef __cplusplus
extern "C" {
#endif

int checkCircuit(GarbledCircuit *garbledCircuit, InputLabels inputLabels, OutputMap outputMap, int (*check)(int *, int *, int ), int sockfd) // TODO: never used, didn't fix
{

	int i, j, cc;
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	int p = garbledCircuit->p;
	int c = garbledCircuit->c;
	block extractedLabels[n*c];
	block computedOutputMap[m*c];
	int outputVals[m*c];
	int outputReal[m*c];
	int inputs[n*c];

	for (i = 0; i < TIMES; i++)
	{
		for(cc=0;cc<c;cc++)
		{
			for (j = 0; j < n-p; j++)
			{
				inputs[cc*n + j] = rand() % 2;
			}
			for(;j<n;j++)
			{
				inputs[cc*n + j] = 0; //reset the DFF to 0 at clock 0, the rest will be ignored
			}
		}
		extractLabels(extractedLabels, inputLabels, inputs, n*c);
		evaluate(garbledCircuit, extractedLabels, computedOutputMap, sockfd);
		mapOutputs(outputMap, computedOutputMap, outputVals, m*c);
		check(inputs, outputReal, n*c);
		for (j = 0; j < m*c; j++)
			if (outputVals[j] != outputReal[j])
			{
				fprintf(stderr, "Check failed %u: %d != %d \n", j, outputVals[j],  outputReal[j]);
			}
	}
	return 0;
}

unsigned long timedEval(GarbledCircuit *garbledCircuit, int* inputs, InputLabels inputLabels, int sockfd)
{
	
	int n0 = 4; // TODO: get it from SCD
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	int p = garbledCircuit->p;
	int c = garbledCircuit->c;
	//block extractedLabels[n*c];
	block outputs[m*c];
	int j, cc;
	unsigned long startTime, endTime;
	unsigned long sum = 0;
	
	for (cc = 0; cc < c; cc++){
		for (j = 0; j < n0; j++){
			recv_block(sockfd, &inputLabels[n*cc+j]);
			printf("i(%d,%d,?)\n", cc, j);
			print__m128i(inputLabels[n*cc+j]);
			
		}
		for(; j < n; j++){
			write(sockfd, &inputs[j-n0], sizeof(int));
			recv_block(sockfd, &inputLabels[n*cc+j]);	
			printf("i(%d,%d,%d)\n", cc, j, inputs[j-n0]);
			print__m128i(inputLabels[n*cc+j]);
			printf("\n");
		}		
	}
	printf("\n\n");
	
	//extractLabels(extractedLabels, inputLabels, inputs, n*c);
	startTime = RDTSC;
	evaluate(garbledCircuit, inputLabels, outputs, sockfd);
	endTime = RDTSC;
	sum = endTime - startTime;
	return sum;

}

#ifdef __cplusplus
}
#endif

