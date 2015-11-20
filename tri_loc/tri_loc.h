#ifndef TRILOC
#define TRILOC

#include <vector>

#define PRIVACY 1
#define BIT_LEN 8
#define INTERSECTION_OUTPUT_MASK "3FFFFFFFFFFFFFFFFFE000000000000000000"  // (7*BIT_LEN+17 '1's)||(7*BIT_LEN+17 '0's)
	
#define INTERSECTION_SCD "../../../Netlist/syn/intersections.scd"
#define INSIDE_SCD "../../../Netlist/syn/inside.scd"

using namespace std;

typedef struct rect{
	double x, y;
}rect;

void print_rect(rect);
void print_rect(vector<rect>);
void set_rect(rect&, rect);

rect get_loc(int);
double get_dist(int);
vector <rect> intersection (rect, double, rect, double);
bool inside (rect, rect, double);
int lost_car(vector<int>&);
int helping_car(vector<int>&, bool);

#endif


