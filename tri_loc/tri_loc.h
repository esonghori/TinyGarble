#ifndef TRILOC
#define TRILOC

#include <vector>

#define PRIVACY 1

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


