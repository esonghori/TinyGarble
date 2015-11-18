#include <iostream>
#include <cstring>
#include <cstdint>
#include <iomanip>
#include <sstream>
#include "tri_loc.h"

using namespace std;

void print_rect(rect R){	
	cout << "<" << R.x << "," << R.y << ">\t\t";
	cout << "\n";
}

void print_rect(vector<rect> R){
	for (int i = 0; i < R.size(); i++)
		cout << "<" << R[i].x << "," << R[i].y << ">\t\t";
	cout << "\n";
}

void set_rect(rect &R, rect R_1){	
	R.x = R_1.x;	
	R.y = R_1.y;
}

string to_string_hex(uint64_t v, int pad) {
  std::stringstream stream;
  stream << std::hex << std::setw(pad) << std::setfill('0') << v;
  string ret = stream.str();
  return ret;
}
