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
#include "../include/aes.h"
#include "../include/justGarble.h"
#include "../include/tcpip.h"
#include "../include/aes.h"



#ifdef __cplusplus
extern "C" {
#endif


long garbleHG(GarbledCircuit *garbledCircuit, block* inputLabels,
		block* initialDFFLable, block* outputMap, block R, block DKCkey, int connfd)
{
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	int p = garbledCircuit->p;
	int c = garbledCircuit->c;

	AES_KEY AES_key;
	GarbledGate *garbledGate;
	block val;

	block *A, *B, *plainText,*cipherText;
	block tweak0, tweak1;
	long cc, a, b, i, j, cid ,rnds = 10;
	block blocks[4];
	block keys[4];
	unsigned short pa,pb;
	block keyToEncrypt;
	int input0, input1, output;

	long startTime = RDTSC;

	AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128, &AES_Key);

	for(i=0;i<15;i++)
	{

	}


	for(cid = 0; cid <garbledCircuit->c; cid++) //for each clock cycle
	{

		for(i=0;i<garbledCircuit->n;i++) //inputs
		{
			garbledCircuit->wires[i].label0 = inputLabels[2*(cid*garbledCircuit->n +i)];
			garbledCircuit->wires[i].label1 = inputLabels[2*(cid*garbledCircuit->n +i) + 1];
		}

		if(cid == 0) //dff initial value
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				garbledCircuit->wires[garbledCircuit->n + i].label0 = initialDFFLable[2*i];
				garbledCircuit->wires[garbledCircuit->n + i].label1 = initialDFFLable[2*i+1];
			}

		}
		else //copy latched labels
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				int wireIndex = garbledCircuit->D[i];
				garbledCircuit->wires[garbledCircuit->n + i].label0 = garbledCircuit->wires[wireIndex].label0;
				garbledCircuit->wires[garbledCircuit->n + i].label1 = garbledCircuit->wires[wireIndex].label1;
			}
		}


		for(i=0; i< garbledCircuit->q;i++) //for each gates
		{

			garbledGate = &(garbledCircuit->garbledGates[i]);
			input0 = garbledGate->input0;
			input1 = garbledGate->input1;
			output = garbledGate->output;

			printf("(%ld, %ld)\n", cid, i);
			print__m128i(garbledCircuit->wires[input0].label0);
			print__m128i(garbledCircuit->wires[input0].label1);

			print__m128i(garbledCircuit->wires[input1].label0);
			print__m128i(garbledCircuit->wires[input1].label1);


			if (garbledGate->type == XORGATE)
			{
				garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
				garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);


				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}
			else if (garbledGate->type == XNORGATE)
			{
				garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
				garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);

				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}
			else if (garbledGate->type == NOTGATE){
				garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0].label1;
				garbledCircuit->wires[output].label1 = garbledCircuit->wires[input0].label0;

				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}

			unsigned short v = type2V(garbledGate->type);

			block A0, A1, B0, B1, C0, C1;

			if(v&1 == 0)
			{
				A0 = (garbledCircuit->wires[input0].label0);
				A1 = (garbledCircuit->wires[input0].label1);
			}
			else
			{
				A1 = (garbledCircuit->wires[input0].label0);
				A0 = (garbledCircuit->wires[input0].label1);
			}

			if(v&2 == 0)
			{
				B0 = (garbledCircuit->wires[input1].label0);
				B1 = (garbledCircuit->wires[input1].label1);
			}
			else
			{
				B1 = (garbledCircuit->wires[input1].label0);
				B0 = (garbledCircuit->wires[input1].label1);
			}

			pa = getLSB(A0);
			pb = getLSB(B0);

			tweak0 = makeBlock(cid, 2*i+0);
			tweak1 = makeBlock(cid, 2*i+1);

			keys[0] = xorBlocks(A0, tweak0);
			keys[1] = xorBlocks(A1, tweak0);
			keys[2] = xorBlocks(B0, tweak1);
			keys[3] = xorBlocks(B1, tweak1);


			for (j = 0; j < 4; j++)
			{
				printf("k(%ld)\t", j);
				print__m128i(keys[j]);
			}



			block mask[4];
			mask[0] = keys[0];
			mask[1] = keys[1];
			mask[2] = keys[2];
			mask[3] = keys[3];
			AES_ecb_encrypt_blks(keys, 4, &(AES_key));


			for (j = 0; j < 4; j++)
			{
				printf("kd(%ld)\t", j);
				print__m128i(keys[j]);
			}



			mask[0] = xorBlocks(mask[0], keys[0]);
			mask[1] = xorBlocks(mask[1], keys[1]);
			mask[2] = xorBlocks(mask[2], keys[2]);
			mask[3] = xorBlocks(mask[3], keys[3]);


			for (j = 0; j < 4; j++)
			{
				printf("m(%ld)\t", j);
				print__m128i(mask[j]);
			}




			block table[2];
			block G, E;

			table[0] = xorBlocks(mask[0], mask[1]);
			if(pb)
				table[0] = xorBlocks(table[0], R);

			G = mask[0];
			if(pa)
				G = xorBlocks(G, table[0]);

			table[1] = xorBlocks(mask[2], mask[3]);
			table[1] = xorBlocks(table[1], A0);

			E = mask[2];
			if(pb)
			{
				E = xorBlocks(E, table[1]);
				E = xorBlocks(E, A0);
			}


			printf("G\t");
			print__m128i(G);
			printf("E\t");
			print__m128i(E);

			if(v&4 == 0)
			{
				C0 = xorBlocks(G, E);
				C1 = xorBlocks(R, C0);
			}
			else
			{
				C1 = xorBlocks(G, E);
				C0 = xorBlocks(R, C1);
			}


			garbledCircuit->wires[garbledGate->output].label0 = C0;
			garbledCircuit->wires[garbledGate->output].label1 = C1;


			for (j = 0; j < 2; j++)
			{
				printf("t(%ld)\t", j);
				print__m128i(table[j]);

				send_block(connfd, table[j]);
			}

			print__m128i(garbledCircuit->wires[garbledGate->output].label0);
			print__m128i(garbledCircuit->wires[garbledGate->output].label1);

		}

		printf ("\noutput: \n");

		for(i=0;i<garbledCircuit->m;i++)
		{
			block o0 = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
			block o1 = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
			outputMap[cid*2*garbledCircuit->m + 2*i] = o0;
			outputMap[cid*2*garbledCircuit->m + 2*i+1] = o1;

			printf ("o(%ld,%ld)\n", cid, i);
			print__m128i(outputMap[cid*2*garbledCircuit->m + 2*i]);
			print__m128i(outputMap[cid*2*garbledCircuit->m + 2*i+1]);
		}
	}
	return (RDTSC - startTime);
}


long garble(GarbledCircuit *garbledCircuit, block* inputLabels,
		block* initialDFFLable, block* outputMap, block* R, int connfd)
{
	int n = garbledCircuit->n;
	int m = garbledCircuit->m;
	int p = garbledCircuit->p;
	int c = garbledCircuit->c;
	
	GarbledGate *garbledGate;
	GarbledTable garbledTable;
	AES_KEY AES_Key;
	const __m128i *sched = ((__m128i *)(AES_Key.rd_key));
	block val;

	block *A, *B, *plainText,*cipherText;
	block tweak;
	long cc, a, b, i, j, cid ,rnds = 10;
	block blocks[4];
	block keys[4];
	long lsb0,lsb1;
	block keyToEncrypt;
	int input0, input1, output;

	long startTime = RDTSC;

	AES_set_encrypt_key((unsigned char *) &(garbledCircuit->globalKey), 128, &AES_Key);

	for(cid = 0; cid <garbledCircuit->c; cid++) //for each clock cycle
	{

		for(i=0;i<garbledCircuit->n;i++) //inputs
		{
			garbledCircuit->wires[i].label0 = inputLabels[2*(cid*garbledCircuit->n +i)];
			garbledCircuit->wires[i].label1 = inputLabels[2*(cid*garbledCircuit->n +i) + 1];
		}

		if(cid == 0) //dff initial value
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				garbledCircuit->wires[garbledCircuit->n + i].label0 = initialDFFLable[2*i];
				garbledCircuit->wires[garbledCircuit->n + i].label1 = initialDFFLable[2*i+1];
			}

		}
		else //copy latched labels
		{
			for(i=0;i<garbledCircuit->p;i++)
			{
				int wireIndex = garbledCircuit->D[i];
				garbledCircuit->wires[garbledCircuit->n + i].label0 = garbledCircuit->wires[wireIndex].label0;
				garbledCircuit->wires[garbledCircuit->n + i].label1 = garbledCircuit->wires[wireIndex].label1;
			}
		}


		for(i=0; i< garbledCircuit->q;i++) //for each gates
		{

			garbledGate = &(garbledCircuit->garbledGates[i]);
			input0 = garbledGate->input0; input1 = garbledGate->input1;
			output = garbledGate->output;

			printf("(%ld, %ld)\n", cid, i);
			print__m128i(garbledCircuit->wires[input0].label0);
			print__m128i(garbledCircuit->wires[input0].label1);

			print__m128i(garbledCircuit->wires[input1].label0);
			print__m128i(garbledCircuit->wires[input1].label1);



			if (garbledGate->type == XORGATE)
			{
				garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
				garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);


				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}
			else if (garbledGate->type == XNORGATE)
			{
				garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
				garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);

				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}
			else if (garbledGate->type == NOTGATE){
				garbledCircuit->wires[output].label0 = garbledCircuit->wires[input0].label1;
				garbledCircuit->wires[output].label1 = garbledCircuit->wires[input0].label0;

				print__m128i(garbledCircuit->wires[garbledGate->output].label0);
				print__m128i(garbledCircuit->wires[garbledGate->output].label1);

				continue;
			}

			tweak = makeBlock(cid, i);
			input0 = garbledGate->input0; input1 = garbledGate->input1;
			lsb0 = getLSB(garbledCircuit->wires[input0].label0);
			lsb1 = getLSB(garbledCircuit->wires[input1].label0);


			//A2,D7
			// p(K) ^ K ^ X, K = A ^ B ^T
			// p(.) = AES_c(.)
			// DOUBLE is _mm_slli_epi64 64-bit right shift
			block A0, A1, B0, B1;
			A0 = DOUBLE(garbledCircuit->wires[input0].label0);
			A1 = DOUBLE(garbledCircuit->wires[input0].label1);
			B0 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label0));
			B1 = DOUBLE(DOUBLE(garbledCircuit->wires[input1].label1));

			keys[0] = xorBlocks(A0, B0);
			keys[0] = xorBlocks(keys[0], tweak);
			keys[1] = xorBlocks(A0,B1);
			keys[1] = xorBlocks(keys[1], tweak);
			keys[2] = xorBlocks(A1, B0);
			keys[2] = xorBlocks(keys[2], tweak);
			keys[3] = xorBlocks(A1, B1);
			keys[3] = xorBlocks(keys[3], tweak);

			block mask[4]; block newToken;
			mask[0] = keys[0];
			mask[1] = keys[1];
			mask[2] = keys[2];
			mask[3] = keys[3];
			AES_ecb_encrypt_blks(keys, 4, &(AES_Key));
			mask[0] = xorBlocks(mask[0], keys[0]);
			mask[1] = xorBlocks(mask[1], keys[1]);
			mask[2] = xorBlocks(mask[2], keys[2]);
			mask[3] = xorBlocks(mask[3], keys[3]);

			if (2*lsb0 + lsb1 ==0)
				newToken = mask[0];
			else if (2*lsb0 + 1-lsb1 ==0)
				newToken = mask[1];
			else if (2*(1-lsb0) + lsb1 ==0)
				newToken = mask[2];
			else if (2*(1-lsb0) + 1-lsb1 ==0)
				newToken = mask[3];

			block newToken2 = xorBlocks(*R, newToken);

			if (garbledGate->type == ANDGATE)
			{
				if (lsb1 ==1 && lsb0 ==1)
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == ANDNGATE)
			{
				if (lsb1 ==0 && lsb0 ==1)
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == NANDGATE)
			{
				if (!(lsb1 ==1 && lsb0 ==1))
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == NANDNGATE)
			{
				if (!(lsb1 ==0 && lsb0 ==1))
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == ORGATE)
			{
				if (lsb1 ==1 || lsb0 ==1)
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == ORNGATE)
			{
				if (lsb1 ==0 || lsb0 ==1)
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == NORGATE)
			{
				if (!(lsb1 ==1 || lsb0 ==1))
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == NORNGATE)
			{
				if (!(lsb1 ==0 || lsb0 ==1))
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == XORGATE)
			{
				if ((lsb1 ==0 && lsb0 ==1) ||(lsb1 ==1 && lsb0 ==0) )
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == XNORGATE)
			{
				if ((lsb1 ==0 && lsb0 ==0) ||(lsb1 ==1 && lsb0 ==1) )
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}
			else if (garbledGate->type == NOTGATE)
			{
				if (lsb0 ==0)
				{
					garbledCircuit->wires[garbledGate->output].label1 = newToken;
					garbledCircuit->wires[garbledGate->output].label0 = newToken2;
				}
				else
				{
					garbledCircuit->wires[garbledGate->output].label0 = newToken;
					garbledCircuit->wires[garbledGate->output].label1 = newToken2;
				}
			}

			block *label0 = &garbledCircuit->wires[garbledGate->output].label0;
			block *label1 = &garbledCircuit->wires[garbledGate->output].label1;

			if (garbledGate->type == ANDGATE)
			{
				blocks[0] = *label0;
				blocks[1] = *label0;
				blocks[2] = *label0;
				blocks[3] = *label1;
			}
			else if (garbledGate->type == ANDNGATE)
			{
				blocks[0] = *label0;
				blocks[1] = *label0;
				blocks[2] = *label1;
				blocks[3] = *label0;
			}
			else if (garbledGate->type == NANDGATE)
			{
				blocks[0] = *label1;
				blocks[1] = *label1;
				blocks[2] = *label1;
				blocks[3] = *label0;
			}
			else if (garbledGate->type == NANDNGATE)
			{
				blocks[0] = *label1;
				blocks[1] = *label1;
				blocks[2] = *label0;
				blocks[3] = *label1;
			}
			else if (garbledGate->type == ORGATE)
			{
				blocks[0] = *label0;
				blocks[1] = *label1;
				blocks[2] = *label1;
				blocks[3] = *label1;
			}
			else if (garbledGate->type == ORNGATE)
			{
				blocks[0] = *label1;
				blocks[1] = *label0;
				blocks[2] = *label1;
				blocks[3] = *label1;
			}
			else if (garbledGate->type == NORGATE)
			{
				blocks[0] = *label1;
				blocks[1] = *label0;
				blocks[2] = *label0;
				blocks[3] = *label0;
			}
			else if (garbledGate->type == NORNGATE)
			{
				blocks[0] = *label0;
				blocks[1] = *label1;
				blocks[2] = *label0;
				blocks[3] = *label0;
			}
			else if (garbledGate->type == XORGATE)
			{
				blocks[0] = *label0;
				blocks[1] = *label1;
				blocks[2] = *label1;
				blocks[3] = *label0;
			}
			else if (garbledGate->type == XORGATE)
			{
				blocks[0] = *label1;
				blocks[1] = *label0;
				blocks[2] = *label0;
				blocks[3] = *label1;

			}
			else if (garbledGate->type == NOTGATE)
			{

				blocks[0] = *label1;
				blocks[1] = *label0;
				blocks[2] = *label1;
				blocks[3] = *label0;
			}


			if (2*lsb0 + lsb1 !=0)
				garbledTable.table[2*lsb0 + lsb1 -1] = xorBlocks(blocks[0], mask[0]);
			if (2*lsb0 + 1-lsb1 !=0)
				garbledTable.table[2*lsb0 + 1-lsb1-1] = xorBlocks(blocks[1], mask[1]);
			if (2*(1-lsb0) + lsb1 !=0)
				garbledTable.table[2*(1-lsb0) + lsb1-1] = xorBlocks(blocks[2], mask[2]);
			if (2*(1-lsb0) + (1-lsb1) !=0)
				garbledTable.table[2*(1-lsb0) + (1-lsb1)-1] = xorBlocks(blocks[3], mask[3]);


			for (j = 0; j < 3; j++)
			{
				printf("t(%ld)\t", j);
				print__m128i(garbledTable.table[j]);

				send_block(connfd, garbledTable.table[j]);
				
			}

			print__m128i(garbledCircuit->wires[garbledGate->output].label0);
			print__m128i(garbledCircuit->wires[garbledGate->output].label1);

		}
		
		printf ("\noutput: \n");
		
		for(i=0;i<garbledCircuit->m;i++)
		{
			block o0 = garbledCircuit->wires[garbledCircuit->outputs[i]].label0;
			block o1 = garbledCircuit->wires[garbledCircuit->outputs[i]].label1;
			outputMap[cid*2*garbledCircuit->m + 2*i] = o0;
			outputMap[cid*2*garbledCircuit->m + 2*i+1] = o1;
			
			printf ("o(%ld,%ld)\n", cid, i);
			print__m128i(outputMap[cid*2*garbledCircuit->m + 2*i]);
			print__m128i(outputMap[cid*2*garbledCircuit->m + 2*i+1]);
		}
	}
	return (RDTSC - startTime);
}


int createInputLabels(block* inputLabels, block R, int n)
{
	int i;

	for (i = 0; i < 2 * n; i += 2)
	{
		inputLabels[i] = randomBlock();
		inputLabels[i + 1] = xorBlocks(R, inputLabels[i]);
	}
	return 0;

}


void removeGarbledCircuit(GarbledCircuit *garbledCircuit)
{
	free(garbledCircuit->garbledGates);
	free(garbledCircuit->wires);
	free(garbledCircuit->outputs);
	free(garbledCircuit->I);
	free(garbledCircuit->D);
}

#ifdef __cplusplus
}
#endif
