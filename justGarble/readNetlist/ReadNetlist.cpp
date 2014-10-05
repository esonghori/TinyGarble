#include "include/read_netlist.h"

#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"

void read_netlist(const string &infilename, const string &outfilename, bool update)
{
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	if (update)
	{
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
	int *ts_1;
	ts = new int[q];
	ts_1 = new int[q];
	read_task_schedule(ts, q, infilename);

	for(int i=0;i<q;i++)
	{
		ts_1[ts[i]] = i;
	}

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


	int i;
	int outputNum = 0;
	int input[2], output;

	for(i = 0; i < q; i++)
	{
		int gindex = ts[i];

		GarbledGateS & g = gate_list[gindex];

		if (g.input[0].is_port)
			input[0] = g.input[0].index;
		else 
			input[0] = ts_1[g.input[0].index] + n;
		
		if (g.input[1].is_port || g.input[1].index < 0)
			input[1] = g.input[1].index;
		else 
			input[1] = ts_1[g.input[1].index] + n;

		output = i + n;
		
		assert(input[0] < output);
		assert(input[1] < output || g.type == NOTGATE);


		if (g.type == ANDGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "AND\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == ANDNGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "ANDN\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == NANDGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "NAND\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == NANDNGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "NANDN\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == ORGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "OR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == ORNGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "ORN\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == NORGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "NOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == NORNGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "NORN\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == XORGATE)
		{
			XORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "XOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == XNORGATE)
		{
			XORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
			cout << "XNOR\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}
		else if (g.type == NOTGATE)
		{
			NOTGate(&garbledCircuit, &garblingContext, input[0],  output);
			cout << "IV\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
		}

		if(g.output.is_port)
		{
			outputs[outputNum++] = g.id + n;
		}
	}

	assert(outputNum==m);
	cout << "outputs ";
	for(i = 0; i < outputNum; i++)
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
