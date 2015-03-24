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
#include "../include/justGarble.h"
#include "../include/tcpip.h"
#include "../include/aes.h"

#include <malloc.h>
#include <wmmintrin.h>

#ifdef __cplusplus
extern "C" {
#endif

long evaluate(GarbledCircuit *garbledCircuit, block* inputLables, block* initialDFFLable, block *outputLabels, int sockfd)
{
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	int p = garbledCircuit->p;
	int c = garbledCircuit->c;
	long i, j, cid;
	AES_KEY AES_Key;


	long startTime = RDTSC;

	AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128, &AES_Key);

	for(cid=0;cid<garbledCircuit->c;cid++) //for each clock cycle
	{
		for(i=0;i<garbledCircuit->n;i++) //inputs
		{
			garbledCircuit->wires[i].label0 = inputLables[cid*garbledCircuit->n + i];
		}
		if(cid == 0) //dff initial value
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				garbledCircuit->wires[garbledCircuit->n + i].label0 = initialDFFLable[i];
			}
		}
		else //copy latched labels
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				int wireIndex = garbledCircuit->D[i];
				garbledCircuit->wires[garbledCircuit->n + i].label0 = garbledCircuit->wires[wireIndex].label0;
			}
		}

		for (i = 0; i < garbledCircuit->q; i++) // for each gates
		{
			int input0, input1, output;
			GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);
			input0 = garbledGate->input0;
			input1 = garbledGate->input1;
			output = garbledGate->output;

			printf("(%ld, %ld)\n", cid, i);
			print__m128i(garbledCircuit->wires[input0].label0);
			print__m128i(garbledCircuit->wires[input1].label0);

			if (garbledGate->type == XORGATE || garbledGate->type == XNORGATE)
			{
				garbledCircuit->wires[output].label0 =
				xorBlocks(garbledCircuit->wires[input0].label0,
						garbledCircuit->wires[input1].label0);
			}
			else if (garbledGate->type == NOTGATE)
			{
				garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0].label0;
			}
			else
			{
				block A, B, C, G, E;
				unsigned short sa, sb;
				block keys[2];
				block mask[2];
				block table[2];
				block tweak0, tweak1;

				A = (garbledCircuit->wires[input0].label0);
				B = (garbledCircuit->wires[input1].label0);

				sa = getLSB(A);
				sb = getLSB(B);

				tweak0 = makeBlock(cid, 2*i+0);
				tweak1 = makeBlock(cid, 2*i+1);

				for (j = 0; j < 2; j++)
				{
					recv_block(sockfd, &(table[j]));

					printf("t(%ld)\t", j);
					print__m128i(table[j]);
				}

				keys[0] = xorBlocks(A, tweak0);
				keys[1] = xorBlocks(B, tweak1);

				for (j = 0; j < 2; j++)
				{
					printf("k(%ld)\t", j);
					print__m128i(keys[j]);
				}

				mask[0] = keys[0];
				mask[1] = keys[1];
				AES_ecb_encrypt_blks(keys, 2, &(AES_Key));

				for (j = 0; j < 2; j++)
				{
					printf("kd(%ld)\t", j);
					print__m128i(keys[j]);
				}

				mask[0] = xorBlocks(mask[0], keys[0]);
				mask[1] = xorBlocks(mask[1], keys[1]);

				for (j = 0; j < 2; j++)
				{
					printf("m(%ld)\t", j);
					print__m128i(mask[j]);
				}

				G = mask[0];
				if(sa)
					G = xorBlocks(G, table[0]);

				E = mask[1];
				if(sb)
				{
					E = xorBlocks(E, table[1]);
					E = xorBlocks(E, A);
				}

				printf("G\t");
				print__m128i(G);
				printf("E\t");
				print__m128i(E);

				C = xorBlocks(E,G);

				garbledCircuit->wires[output].label0 = C;

			}

			print__m128i(garbledCircuit->wires[output].label0);
		}

		printf ("\noutput: \n");

		for (i = 0; i < garbledCircuit->m; i++)
		{
			outputLabels[cid*garbledCircuit->m + i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;

			printf ("(%ld, %ld)", cid, i);
			print__m128i(outputLabels[cid*garbledCircuit->m + i]);
		}
	}
	return (RDTSC - startTime);
}

#ifdef __cplusplus
}
#endif
