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


#ifndef JUSTGARBLE_H_
#define JUSTGARBLE_H_


#include "common.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Wire{
	block label0, label1;
} Wire;


typedef struct GarbledGate{
	long input0, input1, output;
	int type;
} GarbledGate;


typedef struct GarbledTable{
	block table[3];
} GarbledTable;


typedef struct GarbledCircuit{
	int n; // # of inputs
	int g; // # of g inputs
	int p; // # of DFF
	int m; // # of outputs
	int q; // # of gates
	int c; // # of sequential cycle
	int r; // # of wires = n+p+q

	GarbledGate* garbledGates;
	Wire* wires;
	int *outputs;
	int *D;
	int *I;
	block globalKey;
} GarbledCircuit;


/*
 * The following are the functions involved in creating, garbling, and 
 * evaluating circuits. Most of the data-structures involved are defined
 * above, and the rest are in other header files.
 */


//Create memory for 2*n input labels.
int createInputLabels(block* inputLabels, block R, int n);

//Garble the circuit described in garbledCircuit. For efficiency reasons,
//we use the garbledCircuit data-structure for representing the input 
//circuit and the garbled output. The garbling process is non-destructive and 
//only affects the garbledTable member of the GarbledCircuit data-structure.
//In other words, the same GarbledCircuit object can be reused multiple times,
//to create multiple garbled circuit copies, 
//by just switching the garbledTable field to a new one. Also, the garbledTable
//field is the only one that should be sent over the network in the case of an 
//MPC-type application, as the topology is expected to be avaiable to the 
//receiver, and the gate-types are to be hidden away.
//The inputLabels field is expected to contain 2n fresh input labels, obtained
//by calling createInputLabels. The outputMap is expected to be a 2m-block sized
//empty array.
long garble(GarbledCircuit *garbledCircuit, block* inputLabels,
		block* initialDFFLable, block* outputMap, block* R, int connfd);

long garbleHG(GarbledCircuit *garbledCircuit, block* inputLabels,
		block* initialDFFLable, block* outputMap, block* R, int connfd);


//Evaluate a garbled circuit, using n input labels in the Extracted Labels
//to return m output labels. The garbled circuit might be generated either in 
//one piece, as the result of running garbleCircuit, or may be pieced together,
// by building the circuit (startBuilding ... finishBuilding), and adding 
// garbledTable from another source, say, a network transmission.
long evaluate(GarbledCircuit *garbledCircuit, block* inputLables,
		block* initialDFFLable, block *outputs, int sockfd);

long evaluateHG(GarbledCircuit *garbledCircuit, block* inputLables,
		block* initialDFFLable, block *outputs, int sockfd);

int readCircuitFromFile(GarbledCircuit *garbledCircuit, const char *fileName);


void removeGarbledCircuit(GarbledCircuit *garbledCircuit);


#ifdef __cplusplus
}
#endif


#endif
