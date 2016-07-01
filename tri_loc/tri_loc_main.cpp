#include <iostream>
#include <vector>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include "tri_loc/tri_loc.h"

#include "crypto/OT_extension.h"
#include "util/util.h"
#include "util/log.h"

using namespace std;

int main(int argc, char* argv[]){
	
	LogInitial(argc, argv);
	HashInit();
	srand(time(0));  // srand(1);
	SrandSSE(time(0));  // SrandSSE(1111);
	
	if (argc < 4){
		cout << "Usage: " << argv[0] << " 0(lost)  hport[0]  hport[1]  hport[2]  or " << argv[0] << " 1(helper)  lport  hport" << endl;	
		exit(1);
	}
	
	int l_h = atoi(argv[1]);
	if (l_h == 0 && argc < 5){
		cout << "Usage: " << argv[0] << " 0(lost)  hport[0]  hport[1]  hport[2]  or " << argv[0] << " 1(helper)  lport  hport" << endl;
		exit(1);
	}
	
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
		helping_car(port);
	}
}

