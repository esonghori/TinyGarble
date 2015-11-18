#include <iostream>
#include <vector>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include "tri_loc/tri_loc.h"

using namespace std;

int main(int argc, char* argv[]){
	
	cout << "Usage: " << argv[0] << "0[lost] <port_0> <port_1> <port_2> or " << argv[0] << "1[helper] <port> <h_port[1]> PRV" << endl;	
	
	int l_h = atoi(argv[1]);
	
	if (l_h == 0){
		vector<int> port(3);
		for (int i = 0; i < 3; i++)
			port[i] = atoi(argv[i+2]);
		
		lost_car(port);	
	}
	else{		
		vector<int> port(2);
		port[0] = atoi(argv[2]);
		port[1] = atoi(argv[3]);
		bool PRV = atoi(argv[4]);
		helping_car(port, PRV);
	}
}

