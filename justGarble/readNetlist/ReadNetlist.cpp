#include "include/read_netlist.h"

#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"

void read_netlist(const string &infilename, const string &outfilename, int c, bool update)
{
	GarbledCircuit garbledCircuit;
	GarblingContext garblingContext;

	if (update)
	{
		parse_netlist(infilename);
	}
		
	GarbledGateS *gate_list;
	GarbledGateS *dff_list;
	int circuit_size[4];
		
	read_circuit_list(gate_list, dff_list, circuit_size, infilename);

	int n = circuit_size[0]; //# of inputs
	int m = circuit_size[1]; //# of outputs
	int q = circuit_size[2]; //# of gates
	int r = n + q + 2;
	int p = circuit_size[3]; // # of gates

	int *ts;
	int *ts_1;
	ts = new int[q];
	ts_1 = new int[q];
	read_task_schedule(ts, q, infilename);

	for(int i=0;i<q;i++)
	{
		ts_1[ts[i]] = i;
	}

	for(int i=0;i<q;i++)
	{
		if(!gate_list[i].input[0].is_port)
		{
			gate_list[i].input[0].index = ts_1[gate_list[i].input[0].index - n] + n;
		}
		if(!gate_list[i].input[1].is_port && gate_list[i].input[1].index > 0)
		{
			gate_list[i].input[1].index = ts_1[gate_list[i].input[1].index - n] + n;
		}
		gate_list[i].output.index = ts_1[i] + n;
	}
	for(int i=0;i<p;i++)
	{
		dff_list[i].input[0].index =  ts_1[dff_list[i].input[0].index - n] + n;
	}



	int *outputs = new int[m];
	int *S = new int[n];

	//Actually build a circuit.
	long startBuldingTime = createEmptyGarbledCircuit(&garbledCircuit, n, m, q, r, p, c);
	startBuilding(&garbledCircuit, &garblingContext);



	int outputNum = 0;
	int input[2], output;

	for(int i = 0; i < q; i++)
	{
		int gindex = ts[i];

		GarbledGateS & g = gate_list[gindex];

		input[0] = g.input[0].index;
		input[1] = g.input[1].index;
		output = g.output.index;
		
		assert(input[0] < output);
		assert(input[1] < output || (g.type == NOTGATE || g.type == DFFGATE));

		if (g.type == ANDGATE)
		{
			ANDGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == ANDNGATE)
		{
			ANDNGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == NANDGATE)
		{
			NANDGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == NANDNGATE)
		{
			NANDNGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == ORGATE)
		{
			ORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == ORNGATE)
		{
			ORNGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == NORGATE)
		{
			NORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == NORNGATE)
		{
			NORNGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == XORGATE)
		{
			XORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == XNORGATE)
		{
			XNORGate(&garbledCircuit, &garblingContext, input[0], input[1], output);
		}
		else if (g.type == NOTGATE)
		{
			NOTGate(&garbledCircuit, &garblingContext, input[0],  output);
		}

#ifdef VERBOSE
		cout << typetoStrGate(g.type) << "\t" << input[0] << "\t" << input[1] << "\t" << output << endl;
#endif
		if(g.output.is_port)
		{
			outputs[outputNum++] = output;
		}
	}

	for(int i=0; i<n; i++)
	{
		S[i] = -1;
		for(int j=0;j<p;j++)
		{
			if(dff_list[j].output.index == i)
			{
				S[i] = dff_list[j].input[0].index;
				break;
			}
		}
	}


#ifdef VERBOSE
	cout << endl << "outputs" << endl;
	for(int i = 0; i < outputNum; i++)
	{
		cout << outputs[i] <<endl;
	}
	cout << endl;

	cout << endl << "S" << endl;
	for(int i = 0; i < n; i++)
	{
		cout << S[i] <<endl;
	}
	cout << endl;
#endif

	assert(outputNum==m);




	long endBuldingTime = finishBuilding(&garbledCircuit, &garblingContext, outputs,  S);
	writeCircuitToFile(&garbledCircuit, outfilename.c_str());
}


int main(int argc, char** argv)
{
	if(argc < 4)
	{
		cout << "Enter infilename outfilename c" << endl;
		return -1;
	}
	string infilename(argv[1]);
	string outfilename(argv[2]);
	int c = atoi(argv[3]);
	read_netlist(infilename, outfilename, c, 1);
}
