#ifndef READ_NETLIST_H_
#define READ_NETLIST_H_

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <assert.h>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <assert.h>
#include <msgpack.h>
#include <sys/time.h>
#include <boost/tokenizer.hpp>
#include <boost/foreach.hpp>
#include "../../include/common.h"

using namespace std;
using namespace boost; 


#define MAX_NO_OF_INPUTS 20000
#define MAX_NO_OF_OUTPUTS 20000
#define MAX_NO_OF_GATES 100000
#define DEBUG_PARSER 0
#define DEBUG_SCHEDULER 0

#ifdef DEBUG
	#define VERBOSE
#endif

class ReadGateString
{
public:
	string input[2];
	string output;
	short type;
};

class ReadCircuitString
{

public:
	vector<string> inport_list;
	vector<string> outport_list;
	vector<ReadGateString> gate_list_string;
	vector<ReadGateString> dff_list_string;
	int no_of_g_inports;

	ReadCircuitString():
		inport_list(0),
		outport_list(0),
		gate_list_string(0),
		dff_list_string(0)
	{
		no_of_g_inports = 0;
	};
};


class ReadGate
{
public:
	int input[2];
	int output;
	short type;
};

class ReadCircuit
{

public:
	vector<int> output_list;
	vector<ReadGate> gate_list;
	vector<ReadGate> dff_list;
	vector<int> task_schedule;

	int no_of_inports;
	int no_of_g_inports;

	int no_of_outports;
	int no_of_gates;
	int no_of_dffs;

	ReadCircuit():
		output_list(0),
		gate_list(0),
		dff_list(0),
		task_schedule(0)
	{
		no_of_inports= 0;
		no_of_g_inports = 0;
		no_of_outports= 0;
		no_of_gates= 0;
		no_of_dffs = 0;
	}
};


const string typetoStrGate(short itype);

void parse_netlist(const string &filename, ReadCircuitString &readCircuitString);
void id_assignment(const ReadCircuitString readCircuitString, ReadCircuit &readCircuit);
void topological_sort(ReadCircuit &readCircuit);

void top_sort(const vector<ReadGate>& G, int no_task, int  *index);
void schedule(const ReadCircuit &readCircuit,  int no_core, int  **core);
void quickSort(int *, int *, int, int);
int get_min_index(int *, int);
int get_max(int *, int);

void writeSCD(const ReadCircuit &readCircuit,  int _c, const string &fileName);



#endif
