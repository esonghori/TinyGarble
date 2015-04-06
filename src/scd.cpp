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

#include "../include/common.h"
#include "../include/justGarble.h"

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>
#include <malloc.h>
#include <sys/stat.h>

#include <iostream>
#include <fstream>
using namespace std;

int readCircuitFromFile(GarbledCircuit *garbledCircuit, const char *fileName)
{
	ifstream f(fileName, ios::out);
	if(!f.is_open())
	{
		cout << "can't open "<< fileName << endl;
		return -1;
	}

	int n;
	int g;
	int p;
	int m;
	int q;
	int c;

	f>>n>>g>>p>>m>>q>>c;
	cout<< "n = "<< n << endl
		<< "g = " << g << endl
		<< "p = " << p << endl
		<< "m = " << m << endl
		<< "q = " << q << endl
		<< "c = " << c << endl;


	garbledCircuit->n = n;
	garbledCircuit->g = g;
	garbledCircuit->p = p;
	garbledCircuit->m = m;
	garbledCircuit->q = q;
	garbledCircuit->c = c;
	garbledCircuit->r = n+p+q;



	garbledCircuit->garbledGates = (GarbledGate *) memalign(128, sizeof(GarbledGate) * q);
	garbledCircuit->outputs = (int *) memalign(128, sizeof(int) * m);
	garbledCircuit->wires = (Wire *) malloc(sizeof(Wire) * (garbledCircuit->r)); //wires

	garbledCircuit->D = (int *) malloc(sizeof(int) * garbledCircuit->p);
	garbledCircuit->I = (int *) malloc(sizeof(int) * garbledCircuit->p);


	if (	garbledCircuit->garbledGates == NULL ||
			garbledCircuit->outputs == NULL ||
			garbledCircuit->wires == NULL ||
			garbledCircuit->D == NULL ||
			garbledCircuit->I == NULL
		)
	{
		cout << "Linux is a cheap miser that refuses to give us memory" << endl;
		return FAILURE;
	}

	int i;
	for (i = 0; i < q; i++)
	{
		garbledCircuit->garbledGates[i].output = n+p+i;
    }

	for (i = 0; i < q; i++)
	{
		f  >> garbledCircuit->garbledGates[i].input0;
		printf("garbledCircuit->garbledGates[%d].input0 = %ld\n", i, garbledCircuit->garbledGates[i].input0);
	}

	for (i = 0; i < q; i++)
	{
		f >> garbledCircuit->garbledGates[i].input1;
		printf("garbledCircuit->garbledGates[%d].input1 = %ld\n", i, garbledCircuit->garbledGates[i].input1);
	}
	for (i = 0; i < q; i++)
	{
		f >> garbledCircuit->garbledGates[i].type;
		printf("garbledCircuit->garbledGates[%d].type = %d\n", i, garbledCircuit->garbledGates[i].type);
	}
	for (i = 0; i < m; i++)
	{
		f >> garbledCircuit->outputs[i];
		printf("garbledCircuit->outputs[%d] = %d\n", i, garbledCircuit->outputs[i]);
	}
	for (i = 0; i < p; i++)
	{
		f >> garbledCircuit->D[i];
		printf("garbledCircuit->D[%d] = %d\n", i, garbledCircuit->D[i]);
	}
	for (i = 0; i < p; i++)
	{
		f >> garbledCircuit->I[i];
		printf("garbledCircuit->I[%d] = %d\n", i, garbledCircuit->I[i]);
	}

	f.close();

	return SUCCESS;
}
