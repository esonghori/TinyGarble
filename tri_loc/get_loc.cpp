#include <iostream>
#include <vector>
#include "tri_loc.h"
#include "util.h"

using namespace std;

rect get_loc(int id){
	vector <rect> R(3);
	R[0].x  = -32;
	R[0].y  = 108;
	R[1].x  = -16;
	R[1].y  = -111;
	R[2].x  = 109;
	R[2].y  = -99;
	
	return R[id];
}

double get_dist(int id){
	vector <double> D(3);
	
	D[0] = 215; 
	D[1] = 236;
	D[2] = 183;
	
	return D[id];
}

