#include <iostream>
#include <vector>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include "tri_loc/tri_loc.h"

#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit.h"
#include "scd/scd.h"
#include "tcpip/tcpip.h"
#include "util/util.h"
#include "util/tinygarble_config.h"
#include "util/log.h"

using namespace std;

int main(int argc, char* argv[]){
	
	LogInitial(argc, argv);
	HashInit();
	srand(time(0));  // srand(1);
	SrandSSE(time(0));  // SrandSSE(1111);
	
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

