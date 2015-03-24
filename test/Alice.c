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
/*
	This file is part of TinyGarble. It is modified version of JustGarble
	under GNU license.

	TinyGarble is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	TinyGarble is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with TinyGarble.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include "../include/justGarble.h"
#include "../include/tcpip.h"
#ifdef __cplusplus
extern "C" {
#endif


int main(int argc, char* argv[])
{
#ifndef DEBUG
	srand( time(NULL));
	srand_sse( time(NULL));
#else
	srand(1);
	srand_sse(1111);
#endif


	GarbledCircuit garbledCircuit;
	long i, j, cid;

	if(argc < 3)
	{
			printf( "Usage: %s <scd file name> <port> \n", argv[0]);
			return -1;
	}

	int port = atoi(argv[2]);
	int connfd = server_init(port);
	if (connfd == -1)
	{
		printf( "Something's wrong with the socket!\n");
		return -1;
	}

	readCircuitFromFile(&garbledCircuit, argv[1]);
	

	printf("garbledCircuit.I[0] = %d\n", garbledCircuit.I[0]);


	int n = garbledCircuit.n;
	int g = garbledCircuit.g;
	int p = garbledCircuit.p;
	int m = garbledCircuit.m;
	int c = garbledCircuit.c;
	int e = n - g;


	int *garbler_inputs = (int *)malloc(sizeof(int)*(g)*c);
	block *inputLabels = (block *)malloc(sizeof(block)*2*n*c);
	block *initialDFFLable = (block *)malloc(sizeof(block)*2*p);
	block *outputLabels = (block *)malloc(sizeof(block)*2*m*c);

	printf("\n\ninputs:\n");
	for(cid=0;cid<c;cid++)
	{
		for (j = 0; j < g; j++)
		{
			garbler_inputs[cid*g + j] = rand() % 2;
			printf("%d ", garbler_inputs[cid*g + j]);
		}
	}
	printf("\n\n");

#ifndef DEBUG
	block R = randomBlock();
	*((short *) (&R)) = 1;
#else
	block R = makeBlock((long)(-1),(long)(-1));
#endif

	createInputLabels(inputLabels, R, n*c);
	createInputLabels(initialDFFLable, R, p);


	for (cid = 0; cid < c; cid++)
	{
		for (j = 0; j < g; j++)
		{
			if (garbler_inputs[cid*g + j]==0)
				send_block(connfd, inputLabels[2*(cid*n+j)]);
			else
				send_block(connfd, inputLabels[2*(cid*n+j)+1]);

			printf("i(%ld, %ld, %d)\n", cid, j, garbler_inputs[cid*g + j]);
			print__m128i(inputLabels[2*(cid*n+j)]);
			print__m128i(inputLabels[2*(cid*n+j)+1]);
		}

		for(j = 0 ; j < e; j++)
		{
			int ev_input;
			read(connfd, &ev_input, sizeof(int));
			if (!ev_input)
				send_block(connfd, inputLabels[2*(cid*n+g+j)]);
			else
				send_block(connfd, inputLabels[2*(cid*n+g+j) + 1]);

			printf("i(%ld, %ld, %d)\n", cid, j, ev_input);
			print__m128i(inputLabels[2*(cid*n+g+j)]);
			print__m128i(inputLabels[2*(cid*n+g+j) + 1]);
		}
	}
	printf("\n\n");

	for (j = 0; j < p; j++)
	{
		printf("garbledCircuit.I[j] = %d\n", garbledCircuit.I[j]);
		if(garbledCircuit.I[j] == CONST_ZERO) // constant zero
		{
			send_block(connfd, initialDFFLable[2*j]);
			printf("dffi(%ld, %ld, %d)\n", cid, j, 0);
			print__m128i(initialDFFLable[2*j]);
			print__m128i(initialDFFLable[2*j+1]);

		}
		else if(garbledCircuit.I[j] == CONST_ONE) // constant zero
		{
			send_block(connfd, initialDFFLable[2*j+1]);
			printf("dffi(%ld, %ld, %d)\n", cid, j, 0);
			print__m128i(inputLabels[2*j]);
			print__m128i(inputLabels[2*j+1]);

		}
		else if(garbledCircuit.I[j] < g) //belongs to Alice (garbler)
		{
			int index = garbledCircuit.I[j];

			if (garbler_inputs[index]==0)
				send_block(connfd, initialDFFLable[2*j]);
			else
				send_block(connfd, initialDFFLable[2*j+1]);

			printf("dffi(%ld, %ld, %d)\n", cid, j, garbler_inputs[index]);
			print__m128i(initialDFFLable[2*j]);
			print__m128i(initialDFFLable[2*j+1]);

		}
		else // belong to Bob
		{
			int ev_input;
			read(connfd, &ev_input, sizeof(int));
			if (!ev_input)
				send_block(connfd, initialDFFLable[2*j]);
			else
				send_block(connfd, initialDFFLable[2*j+1]);

			printf("dffi(%ld, %ld, %d)\n", cid, j, ev_input);
			print__m128i(initialDFFLable[2*j]);
			print__m128i(initialDFFLable[2*j+1]);
			printf("\n");
		}
	}
	printf("\n\n");

	garbledCircuit.globalKey = randomBlock();
	send_block(connfd, garbledCircuit.globalKey); // send DKC key


	garble(&garbledCircuit, inputLabels, initialDFFLable, outputLabels, &R, connfd);

	for(cid=0;cid<c;cid++)
	{
		for(i=0;i<m;i++)
		{
			short outputType =  getLSB(outputLabels[2*(m*cid + i)+ 0]);
			send_type(connfd, outputType);
		}
	}




	server_close(connfd);
	removeGarbledCircuit(&garbledCircuit);


	return 0;
}

#ifdef __cplusplus
}
#endif
