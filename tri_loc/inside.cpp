#include <iostream>
#include <vector>
#include <cmath>
#include "tri_loc.h"
#include "util.h"

using namespace std;

bool inside (rect D, rect A, double rA){
	bool in;
	double H;
	
	H = ((D.x - A.x)*(D.x - A.x) + (D.y - A.y)*(D.y - A.y));
	
	in = (H <= rA*rA);
	
	return in;
}