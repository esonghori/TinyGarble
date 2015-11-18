#include <iostream>
#include <vector>
#include <cmath>
#include "tri_loc.h"
#include "util.h"

using namespace std;


vector <rect> intersection (rect B, double rB, rect C, double rC){
	
	vector <rect> E(2);
	
	double p, q, t, s, u, w, z;
	
	p = C.x - B.x;
	q = B.y - C.y;
	t = rB*rB - rC*rC + (C.x)*(C.x) - (B.x)*(B.x) + (C.y)*(C.y) - (B.y)*(B.y);
	s = 4*p*p*(B.y)*(B.y) + t*t - 4*p*t*B.x + 4*p*p*(B.x)*(B.x) - 4*p*p*rB*rB;
	u = (q*t - 2*B.y*p*p - 2*p*q*B.x);
	w = sqrt(u*u - s*(p*p + q*q));

	E[0].y = ( p*q*B.x + B.y*p*p - .5*q*t + w/2 )/( p*p + q*q);
	E[1].y = ( p*q*B.x + B.y*p*p - .5*q*t - w/2 )/( p*p + q*q);

	z = rB*rB - rC*rC + (C.x)*(C.x) - (B.x)*(B.x) + (C.y)*(C.y) - (B.y)*(B.y);

	E[0].x = (2*E[0].y*(B.y - C.y) +  z)/(2*(C.x - B.x));
	E[1].x = (2*E[1].y*(B.y - C.y) +  z)/(2*(C.x - B.x));
	
	return E;
}	