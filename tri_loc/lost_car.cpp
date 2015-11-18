#include <iostream>
#include <vector>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include "tri_loc.h"
#include "util.h"
#include "tcpip.h"

using namespace std;

int main(int argc, char* argv[]){
	if(argc != 4){
		cout << "Usage: " << argv[0] << "<port_0> <port_1> <port_2>" << endl;
		return -1;
	} 	
	
	vector<int> port(3);
	for (int i = 0; i < 3; i++)
		port[i] = atoi(argv[i+1]);
	
	lost_car(port);
}

int lost_car(vector<int> &port){
	
	int id;
	
	//establish connection with three helping cars 
	vector<int> connfd(3);
	for (id = 0; id < 3; id++)
		if ((connfd[id] = server_init(port[id])) == -1) {
			cout << "Cannot open the socket in port " << port[id] << " with Car " << id << endl;
			return -1;
		}
		
	//provide each car an id and get the port numbers they use to establish server with other cars
	vector<int> h_port(3);	
	for (id = 0; id < 3; id++){
		write(connfd[id], &id, sizeof(int));
		read(connfd[id], &h_port[id], sizeof(int));
	}
	
	//provide each car the port number of its server car
	for (id = 0; id < 3; id++){
		write(connfd[id], &h_port[(id+2)%3], sizeof(int));
	}
	
	//manage connection establishment of the helping cars
	int done, ser = 0, cli = 1; 
	for (id = 0; id < 3; id++){
		write(connfd[id], &ser, sizeof(int));
		write(connfd[(id+1)%3], &cli, sizeof(int));
		read(connfd[(id+1)%3], &done, sizeof(int));
	}
	
	//compute median through secure sum protocol
	rect Q, M;
	
	M.x = rand()%255 + rand()/255;
	M.y = rand()%255 + rand()/255;
	
	write(connfd[0], &M.x, sizeof(double));
	write(connfd[0], &M.y, sizeof(double));
	
	read(connfd[2], &Q.x, sizeof(double));
	read(connfd[2], &Q.y, sizeof(double));
	
	Q.x = (Q.x - M.x)/3;
	Q.y = (Q.y - M.y)/3;
	
	print_rect(Q);	
	
	int N = 8;
	uint64_t output = (((uint8_t)Q.x) << N) | (((uint8_t)Q.y));
	string output_str = to_string_hex(output, ceil((2*N)/4));
	cout << output_str << endl;
	
	for (id = 0; id < 3; id++)
		close(connfd[id]);
	
	return 0;
	
}