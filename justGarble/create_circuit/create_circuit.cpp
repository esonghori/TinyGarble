#include <iostream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include "parse_netlist.h"
#include "scheduling.h"
#include "file_io.h" 
#include "create_circuit.h"

#define MAIN 0

#if !MAIN
#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"
#endif

using namespace std;

#if MAIN
int main(int argc, char** argv){
	string filename(argv[1]);
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

	int *ts;	
	ts = new int[q];
	read_task_schedule(ts, q, filename);

#if !MAIN
	//Set up input and output tokens/labels.
	block *labels = (block*) malloc(sizeof(block) * 2 * n);
	block *exlabels = (block*) malloc(sizeof(block) * n);
	block *outputbs2 = (block*) malloc(sizeof(block) * m);
	block *outputbs = (block*) malloc(sizeof(block) * m);
	int *inp = (int *) malloc(sizeof(int) * n);
	countToN(inp, n);
#endif
	int outputs[m];
#if !MAIN
	OutputMap outputMap = outputbs;
	InputLabels inputLabels = labels;

	//Actually build a circuit. Alternatively, this circuit could be read
	//from a file.
	createInputLabels(labels, n);
	createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
	startBuilding(&garbledCircuit, &garblingContext);
#endif

	int i, j = 0;
	
	int input[2], output;

	for(i = 0; i < q; i++)
	{ 			
		if (gate_list[i].input[0].is_port) input[0] = gate_list[i].input[0].index;
		else input[0] = ts[gate_list[i].input[0].index] + n;
		
		if (gate_list[i].input[1].is_port) input[1] = gate_list[i].input[1].index;
		else input[1] = ts[gate_list[i].input[1].index] + n;
		
		output = ts[gate_list[i].id] + n;
		
		if (gate_list[i].type == NOR)
#if !MAIN	
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
#else
			cout << "NOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
#endif
		else if (gate_list[i].type == XOR)
#if !MAIN
			XORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
#else
			cout << "XOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
#endif
		else if (gate_list[i].type == IV)
#if !MAIN
			NOTGate(&garbledCircuit, &garblingContext, input[0],  output);
#else
			cout << "IV\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
#endif
			
		if(gate_list[i].output.is_port) {
			outputs[j] = gate_list[i].id + n;
			j++;
		}
	}
#if MAIN
	cout << "outputs ";
	for(i = 0; i < j; i++)
		cout << outputs[i] << " ";
	cout << endl;
#endif	
#if !MAIN	
	finishBuilding(&garbledCircuit, &garblingContext, outputMap, outputs);
#endif
}