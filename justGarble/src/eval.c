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
#include "../include/circuits.h"
#include "../include/gates.h"
#include "../include/util.h"
#include "../include/dkcipher.h"
#include "../include/aes.h"
#include "../include/justGarble.h"
#include "../include/tcpip.h"

#include <malloc.h>
#include <wmmintrin.h>

#ifdef __cplusplus
extern "C" {
#endif

long evaluate(GarbledCircuit *garbledCircuit, block* inputLables, block* initialDFFLable, block *outputs, block DKCkey, int sockfd)
{
	GarbledGate *garbledGate;
	DKCipherContext dkCipherContext;
	const __m128i *sched = ((__m128i *) (dkCipherContext.K.rd_key));
	block val;

	block A, B;
	block *plainText, *cipherText;
	block zer = zero_block();
	block tweak;
	GarbledTable garbledTable;
	long a, b, i, j, cid, rnds = 10;


	long startTime = RDTSC;


	DKCipherInit(&DKCkey, &dkCipherContext);

	for(cid=0;cid<garbledCircuit->c;cid++) //for each clock cycle
	{

		for(i=0;i<garbledCircuit->n;i++) //inputs
		{
			garbledCircuit->wires[i].label = inputLables[cid*garbledCircuit->n + i];
		}

		if(cid == 0) //dff initial value
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				garbledCircuit->wires[garbledCircuit->n + i].label = initialDFFLable[i];
			}

		}
		else //copy latched labels
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				int wireIndex = garbledCircuit->D[i];
				garbledCircuit->wires[garbledCircuit->n + i].label = garbledCircuit->wires[wireIndex].label;
			}
		}

		for (i = 0; i < garbledCircuit->q; i++) // for each gates
		{
			garbledGate = &(garbledCircuit->garbledGates[i]);

			printf("(%ld, %ld)\n", cid, i);
			print__m128i(garbledCircuit->wires[garbledGate->input0].label);
			print__m128i(garbledCircuit->wires[garbledGate->input1].label);

			if (garbledGate->type == XORGATE || garbledGate->type == XNORGATE)
			{
				garbledCircuit->wires[garbledGate->output].label =
				xorBlocks(garbledCircuit->wires[garbledGate->input0].label,
						garbledCircuit->wires[garbledGate->input1].label);
			}
			else if (garbledGate->type == NOTGATE)
			{
				garbledCircuit->wires[garbledGate->output].label = garbledCircuit->wires[garbledGate->input0].label;
			}
			else
			{
				A = DOUBLE(garbledCircuit->wires[garbledGate->input0].label);
				B = DOUBLE(DOUBLE(garbledCircuit->wires[garbledGate->input1].label));

				plainText = &garbledCircuit->wires[garbledGate->output].label;

				a = getLSB(garbledCircuit->wires[garbledGate->input0].label);
				b = getLSB(garbledCircuit->wires[garbledGate->input1].label);
				block temp;

				val = xorBlocks(A, B);
				tweak = makeBlock(cid, i);
				val = xorBlocks(val, tweak);

				for (j = 0; j < 3; j++)
				{
					recv_block(sockfd, &(garbledTable.table[j]));

					printf("t(%ld)\t", j);
					print__m128i(garbledTable.table[j]);
				}

				if (a+b==0)
					cipherText = &zer;
				else
					cipherText = &(garbledTable.table[2*a+b-1]);

				temp = xorBlocks(val, *cipherText);

				val = _mm_xor_si128(val, sched[0]);
				for (j = 1; j < rnds; j++)
					val = _mm_aesenc_si128(val, sched[j]);
				val = _mm_aesenclast_si128(val, sched[j]);

				*plainText = xorBlocks(val, temp);
			}
			print__m128i(garbledCircuit->wires[garbledGate->output].label);
		}
		
		printf ("\noutput: \n");

		for (i = 0; i < garbledCircuit->m; i++)
		{
			outputs[cid*garbledCircuit->m + i] = garbledCircuit->wires[garbledCircuit->outputs[i]].label;
			
			printf ("(%ld, %ld)", cid, i);
			print__m128i(outputs[cid*garbledCircuit->m + i]);
		}
	}
	return (RDTSC - startTime);
}

#ifdef __cplusplus
}
#endif
