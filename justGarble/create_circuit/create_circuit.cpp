#include <iostream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include "parse_netlist.h"
#include "scheduling.h"
#include "file_io.h" 
#include "create_circuit.h"

#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"

using namespace std;

#if 0
int main(int argc, char** argv){
	string filename("sum_synth_128");
	create_circuit(filename, 1);
}
#endif

void create_circuit(string filename, bool update){

	if (update){	
		parse_netlist(filename); // without .v extension	
		}
		
	GarbledGate *gate_list;
	int circuit_size[3];	
		
	read_gate_list(gate_list, circuit_size, filename);

	int n = circuit_size[0]; //# of inputs
	int m = circuit_size[1]; //# of outputs
	int q = circuit_size[2]; //# of gates
	int r = n + q + 2;

	int *task_schedule;	
	task_schedule = new int[q];
	read_task_schedule(task_schedule, q, filename);

	//Set up input and output tokens/labels.
	block *labels = (block*) malloc(sizeof(block) * 2 * n);
	block *exlabels = (block*) malloc(sizeof(block) * n);
	block *outputbs2 = (block*) malloc(sizeof(block) * m);
	block *outputbs = (block*) malloc(sizeof(block) * m);
	int *inp = (int *) malloc(sizeof(int) * n);
	countToN(inp, n);
	int outputs[m];

	OutputMap outputMap = outputbs;
	InputLabels inputLabels = labels;

	//Actually build a circuit. Alternatively, this circuit could be read
	//from a file.
	createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
	startBuilding(&garbledCircuit, &garblingContext);

	int i, k, j = 0;

	for(k = 0; k < q; k++)
	{ 	
		i = task_schedule[k];
		
		if (gate_list[i].type == NOR)
			NORGate(&garbledCircuit, &garblingContext, gate_list[i].input[0].index, gate_list[i].input[1].index, gate_list[i].output.index);
			//cout << "NOR" << endl;
		else if (gate_list[i].type == XOR)
			NORGate(&garbledCircuit, &garblingContext, gate_list[i].input[0].index, gate_list[i].input[1].index, gate_list[i].output.index);
			//cout << "XOR" << endl;
		else if (gate_list[i].type == IV)
			NOTGate(&garbledCircuit, &garblingContext, gate_list[i].input[0].index,  gate_list[i].output.index);
			//cout << "IV" << endl;
			
		if(gate_list[i].output.is_port) {
			outputs[j] = gate_list[i].id;
			j++;
		}
	}
	
	finishBuilding(&garbledCircuit, &garblingContext, outputMap, outputs);

}