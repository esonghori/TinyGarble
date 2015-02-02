/*
 * SCDCircuitTest.c
 *
 *  Created on: Feb 2, 2015
 *      Author: ebi
 */

#include "../include/common.h"
#include "../include/garble.h"
#include "../include/justGarble.h"

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>
#include <msgpack.h>
#include <malloc.h>
#include <sys/stat.h>

void executeCombinational(GarbledCircuit *garbledCircuit, int *wires_val)
{
		int i;
		GarbledGate *garbledGate;
		int input0, input1, output;

		for(i=0; i< garbledCircuit->q;i++)
		{
			garbledGate = &(garbledCircuit->garbledGates[i]);
			input0 = garbledGate->input0; input1 = garbledGate->input1;
			output = garbledGate->output;

			assert(wires_val[input0] != -1 && wires_val[input1] != -1); // check invalid wires


			if (garbledGate->type == ANDGATE)
			{
				if (wires_val[input0] ==1 && wires_val[input1] ==1)
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
			else if (garbledGate->type == ANDNGATE)
			{
				if (wires_val[input0] == 0 && wires_val[input1] ==1)
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
			else if (garbledGate->type == NANDGATE)
			{
				if (wires_val[input0] == 1 && wires_val[input1] ==1)
				{
					wires_val[output] = 0;
				}
				else
				{
					wires_val[output] = 1;
				}
			}
			else if (garbledGate->type == NANDNGATE)
			{
				if (wires_val[input0] == 0 && wires_val[input1] ==1)
				{
					wires_val[output] = 0;
				}
				else
				{
					wires_val[output] = 1;
				}
			}
			else if (garbledGate->type == ORGATE)
			{
				if (wires_val[input0] ==1 || wires_val[input1] ==1)
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
			else if (garbledGate->type == ORNGATE)
			{
				if (wires_val[input0] == 0 || wires_val[input1] ==1)
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
			else if (garbledGate->type == NORGATE)
			{
				if (wires_val[input0] == 1 || wires_val[input1] ==1)
				{
					wires_val[output] = 0;
				}
				else
				{
					wires_val[output] = 1;
				}
			}
			else if (garbledGate->type == NORNGATE)
			{
				if (wires_val[input0] == 0 || wires_val[input1] ==1)
				{
					wires_val[output] = 0;
				}
				else
				{
					wires_val[output] = 1;
				}
			}
			else if (garbledGate->type == XORGATE)
			{
				if ((wires_val[input0] == 1 && wires_val[input1] ==1) || (wires_val[input0] == 0 && wires_val[input1] ==0))
				{
					wires_val[output] = 0;
				}
				else
				{
					wires_val[output] = 1;
				}
			}
			else if (garbledGate->type == XNORGATE)
			{
				if ((wires_val[input0] == 1 && wires_val[input1] ==1) || (wires_val[input0] == 0 && wires_val[input1] ==0))
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
			else if (garbledGate->type == NOTGATE)
			{
				if (wires_val[input0] == 0)
				{
					wires_val[output] = 1;
				}
				else
				{
					wires_val[output] = 0;
				}
			}
		}
}


int main(int argc, char *argv[])
{
	if(argc!=2)
	{
		printf("usage: ./SCDCircuitTest sum_syn_1024_1024.scd\n");
		return -1;
	}

	GarbledCircuit garbledCircuit;

	printf("read circuit from the file\n");
	readCircuitFromFile(&garbledCircuit, argv[1]);

	int i,j;
	int cid;//clock cycle id
	int *wires_val;
	int *outputs_without_dff;

	wires_val = (int *)malloc(sizeof(int) * (garbledCircuit.n + garbledCircuit.q + 2)); // gates + dff + [2 const wires]
	for(i = 0; i < garbledCircuit.n + garbledCircuit.q + 2;i++)
	{
		wires_val[i] = -1; //INVALID
	}

	outputs_without_dff = (int *)malloc(sizeof(int)*garbledCircuit.m);
	int outputs_without_dff_num = 0;
	for(i = 0; i < garbledCircuit.m;i++)
	{
		/*
		 * check if the output is the input of a DFF in a feedback loop. if it is true, the wire is not actual output.
		 */
		int real_output = 1;
		for(j=0;j<garbledCircuit.n;j++)
		{

			if(garbledCircuit.outputs[i] == garbledCircuit.S[j])
			{
				real_output = 0;
				break;
			}
		}
		if(real_output)
		{
			outputs_without_dff[outputs_without_dff_num++] = garbledCircuit.outputs[i];
		}
	}


	/*
	 * SUM EXAMPLE
	 */
	assert(garbledCircuit.c==1024); // 1024 bit sum in 104 cycle
	int A[32]; // input
	int B[32]; // input
	int O[32]; // output = A+B

	for(i=0;i<32;i++)
	{
		A[i] = rand();
		B[i] = rand();
		O[i] = 0;
	}


	for(cid = 0; cid <garbledCircuit.c; cid++) //for each clock cycle
	{
		/*
		 * Assign input value to input wires at each cycle.
		 * if S[i] >= 0, it means the input is the feedback and connected to a DFF.
		 */
		for(i=0;i<garbledCircuit.n;i++)
		{
			if(garbledCircuit.S[i] < 0) // it is actual input
			{
				if(i==0)
				{
					wires_val[i] = ((A[cid/32] & 1<<(cid%32))!=0);
					//printf("A[%d] = %d\n", cid, wires_val[i]);
				}
				else
				{
					wires_val[i] = ((B[cid/32] & 1<<(cid%32))!=0);
					//printf("B[%d] = %d\n", cid, wires_val[i]);
				}
			}
		}


		/*
		 * DFF initialization
		 * I[i] == CONST_ZERO : DFF initialized with 0
		 * I[i] == CONST_ZERO : DFF initialized with 1
		 * I[i] > 0 : DFF initialized with wire I[i]
		 * o.w. : it is an input wire
		 */
		if(cid==0) // dff initialization
		{
			for(i=0;i<garbledCircuit.n;i++)
			{
				if(garbledCircuit.I[i] == CONST_ZERO)
				{
					wires_val[i] = 0;
				}
				else if(garbledCircuit.I[i] == CONST_ONE)
				{
					wires_val[i] = 1;
				}
				else if(garbledCircuit.I[i] > 0)
				{
					wires_val[i] = wires_val[garbledCircuit.I[i]];
				}

			}
		}
		/*
		 * DFF feedback
		 * S[i] >= 0 : the value of DFF should be equal to value of wire S[i]
		 * o.w. : it is an input wire
		 */
		else
		{
			for(i=0;i<garbledCircuit.n;i++)
			{
				int output_index = garbledCircuit.S[i];
				if(output_index >= 0)
				{
					wires_val[i] = wires_val[output_index];
				}
			}
		}

		/*
		 * execute the combinational part
		 */
		executeCombinational(&garbledCircuit, wires_val);

		/*
		 * Map output
		 * wire output[i] is the ith output. Output wires include DFF too.
		 * The
		 */
		for(i=0;i<outputs_without_dff_num;i++)
		{
			int output_index = outputs_without_dff[i];

			if(wires_val[output_index])
				O[cid/32] |= (1<<cid%32);

			//printf("O[%d] = %d\n", cid, wires_val[output_index]);

		}
	}

	printf("A: \n");
	for(i=0;i<32;i++)
	{
		printf("%08x", A[i]);
	}
	printf("\n");

	printf("B: \n");
	for(i=0;i<32;i++)
	{
		printf("%08x", B[i]);
	}
	printf("\n");

	printf("O: \n");
	for(i=0;i<32;i++)
	{
		printf("%08x", O[i]);
	}
	printf("\n");
	fflush(stdout);

	return 0;
}
