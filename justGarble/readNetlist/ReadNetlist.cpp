#include "include/read_netlist.h"



extern "C" {
#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"
}

void read_netlist(string infilename, string outfilename, bool update)
{
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	if (update){	
		parse_netlist(infilename);
		}
		
	GarbledGateS *gate_list;
	int circuit_size[3];	
		
	read_gate_list(gate_list, circuit_size, infilename);

	int n = circuit_size[0]; //# of inputs
	int m = circuit_size[1]; //# of outputs
	int q = circuit_size[2]; //# of gates
	int r = n + q + 2;

	int *ts;	
	ts = new int[q];
	read_task_schedule(ts, q, infilename);


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
	long startBuldingTime = createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, inputLabels);
	startBuilding(&garbledCircuit, &garblingContext);


	int i, j = 0;
	
	int input[2], output;

	for(i = 0; i < q; i++)
	{
		int gindex = ts[i];


		if (gate_list[gindex].input[0].is_port)
			input[0] = gate_list[gindex].input[0].index;
		else 
			input[0] = ts[gate_list[gindex].input[0].index] + n;
		
		if (gate_list[gindex ].input[1].is_port)
			input[1] = gate_list[gindex].input[1].index;
		else 
			input[1] = ts[gate_list[gindex].input[1].index] + n;
		
		output = i + n;
		

		if (gate_list[gindex ].type == NOR)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "NOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (gate_list[gindex ].type == XOR)
		{
			XORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "XOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (gate_list[gindex ].type == IV)
		{
			NOTGate(&garbledCircuit, &garblingContext, input[0],  output);
			cout << "IV\t" << input[0] << "\t" << -1 << "\t" << output << endl;
		}

		if(gate_list[gindex ].output.is_port)
		{
			outputs[j] = gate_list[gindex].id + n;
			j++;
		}
	}

	cout << "outputs ";
	for(i = 0; i < j; i++)
		cout << outputs[i] << " ";
	cout << endl;

	long endBuldingTime = finishBuilding(&garbledCircuit, &garblingContext, outputMap, outputs);
	writeCircuitToFile(&garbledCircuit, outfilename.c_str());
}


int main(int argc, char** argv)
{
	if(argc < 3)
	{
		cout << "Enter infilename outfilename" << endl;
		return -1;
	}
	string infilename(argv[1]);
	string outfilename(argv[2]);
	read_netlist(infilename, outfilename, 1);
}
