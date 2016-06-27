#ifndef TRILOC
#define TRILOC

#include <vector>
#include <cstring>

#define SINGLE_THREAD 0
#define PRIVACY 1
#define BIT_LEN 8
	
#define INTERSECTION_SCD "../../../TriLoc/Netlist/syn/intersections.scd"
#define INSIDE_SCD "../../../TriLoc/Netlist/syn/inside.scd"

using namespace std;

typedef struct rect{
	double x, y;
}rect;

typedef struct int_data{
	int id;
	string input_str_0, input_str_1, output_str, intersection_output_mask;
	int h_connfd;	
}int_data;

void print_rect(rect);
void print_rect(vector<rect>);
void set_rect(rect&, rect);

rect get_loc(int);
double get_dist(int);
#if PRIVACY	
void *intersection_GC(void*);
void *inside_GC(void*);
#else
vector <rect> intersection (rect, double, rect, double);
bool inside (rect, rect, double);
#endif
int lost_car(vector<int>&);
int helping_car(vector<int>&);

#endif


