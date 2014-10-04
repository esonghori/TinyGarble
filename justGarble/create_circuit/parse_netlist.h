#ifndef PARSE_NETLIST
#define PARSE_NETLIST

#include <string>
#include <cstring>

using namespace std;

#define MAX_NO_OF_INPUTS 20000
#define MAX_NO_OF_OUTPUTS 20000
#define MAX_NO_OF_GATES 100000
#define DEBUG_PARSER 0

enum gate_type {XOR, IV, NOR};

typedef struct{
	bool is_port;
	int index;
} net;

typedef struct {
	net input[2]; 
	net output;
	int id, type;
} GarbledGate;

typedef struct {
	string input[2]; 
	string output;
	int id, type;
} GarbledGateString;

void parse_netlist(string);
int search (string , string *, int, int);
int get_weight(int );

#endif