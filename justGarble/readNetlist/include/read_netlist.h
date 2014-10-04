#ifndef READ_NETLIST_H_
#define READ_NETLIST_H_

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <sys/time.h>
#include <boost/tokenizer.hpp>
#include <boost/foreach.hpp>

using namespace std;
using namespace boost; 


#define MAX_NO_OF_INPUTS 20000
#define MAX_NO_OF_OUTPUTS 20000
#define MAX_NO_OF_GATES 100000
#define DEBUG_PARSER 0
#define DEBUG_SCHEDULER 0


enum gate_type {XOR, IV, NOR};

typedef struct net{
	bool is_port;
	int index;
} net;

typedef struct GarbledGateS{
	net input[2]; 
	net output;
	int id, type;
} GarbledGateS;

typedef struct GarbledGateString{
	string input[2];
	string output;
	int id, type;
} GarbledGateString;


void write_gate_list(GarbledGateS* , int *, string );
void read_gate_list(GarbledGateS*& , int *, string );
void write_task_schedule(int *, int , string );
void read_task_schedule(int *, int , string );
void read_netlist(string infilename, string outfilename, bool update);
void parse_netlist(string);
int search (string , string *, int, int);
int get_weight(int );
void top_sort(GarbledGateS *, int, int  *);
void schedule(int, int **, string);
void arrange_in_time(GarbledGateS *, int, int, int  **, int  **, int *);
void quickSort(int *, int *, int, int);
int get_min_index(int *, int);
int get_max(int *, int);

#endif
