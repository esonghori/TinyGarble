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
	if(argc != 3){
		cout << "Usage: " << argv[0] << "<port> <h_port[1]>" << endl;
		return -1;
	} 	
	
	vector<int> port(2);
	port[0] = atoi(argv[1]);
	port[1] = atoi(argv[2]);
	
	helping_car(port);
}

int helping_car(vector<int> &port){
	
	string server_ip = "127.0.0.1";
	
	//connect to lost car
	int connfd;
	if ((connfd = client_init(server_ip.c_str(), port[0])) == -1) {
      cout << "Cannot connect to " << server_ip << ":" << port[0] << endl;
      return -1;
    }
	
	//get id from lost car, provide port number for its server for other helping car and get port number of the car to which its a client
	vector<int> h_port(2);
	h_port[0] = port[1];	
	int id;
	read(connfd, &id, sizeof(int));
	write(connfd, &h_port[0], sizeof(int));	
	read(connfd, &h_port[1], sizeof(int));
	
	//establish connection with the two other helping cars
	int ser_cli, done = 1;
	vector<int> h_connfd(2);
	
	for (int i = 0; i < 2; i++){
		read(connfd, &ser_cli, sizeof(int));
		if (ser_cli == 0){
			if ((h_connfd[0] = server_init(h_port[0])) == -1) {
				cout << "Cannot open the socket in port " << h_port[0] << " with Car " << (id+1)%3 << endl;
				return -1;
			}
			write(h_connfd[0], &id, sizeof(int));
		}
		else{
			if ((h_connfd[1] = client_init(server_ip.c_str(), h_port[1])) == -1) {
					cout << "Cannot connect to " << server_ip << ":" << h_port[1] << " with Car " << (id+2)%3 << endl;
					return -1;
				}
			int other_id;
			read(h_connfd[1], &other_id, sizeof(int));
			cout << "car " << id << " established connection with car " << other_id << endl;
			write(connfd, &done, sizeof(int));
		}
	}
	
	//triangle localization
	vector <rect> M_1(2), M(2);
	vector <rect> R(2);
	vector <double> D(2);	
	vector <int> in(2);
	R[0] = get_loc(id);
	D[0] = get_dist(id);
	
	int N = 8;
	uint64_t input = ((((uint16_t)R[0].x) & 0xFF) << (2*N+1)) | ((((uint16_t)R[0].y) & 0xFF) << (N+1)) | (((uint16_t)D[0]) & 0x1FF); 
	string input_str = to_string_hex(input, ceil((3*N+1)/4));
	cout << input_str << endl;
	
	rect S;
	S.x = 0;
	S.y = 0;
	
	//set sequence of operation according to id
	vector <int> op(3);
	for (int i = 0; i < 3; i++){
		op[i] = (id+3-i)%3;
	}
	
	for (int i = 0; i < 3; i++){
		
		if (op[i] == 0){ // initialize computation of one pair of intersections
			write(h_connfd[0], &(R[0].x), sizeof(double));
			write(h_connfd[0], &(R[0].y), sizeof(double));
			write(h_connfd[0], &D[0], sizeof(double));
			
			read(h_connfd[0], &(M[1].x), sizeof(double));
			read(h_connfd[0], &(M[1].y), sizeof(double));
						
			read(h_connfd[0], &in[1], sizeof(int));			
			if(!in[1]){
				S.x = S.x + M[1].x;
				S.y = S.y + M[1].y;
			}	
		}
		else if (op[i] == 1){ // compute intersections and check which one is valid				
			read(h_connfd[1], &(R[1].x), sizeof(double));
			read(h_connfd[1], &(R[1].y), sizeof(double));
			read(h_connfd[1], &D[1], sizeof(double)); 
			
			M_1 = intersection(R[0], D[0], R[1], D[1]);
			set_rect(M[0], M_1[0]);			
			write(h_connfd[1], &(M_1[1].x), sizeof(double));
			write(h_connfd[1], &(M_1[1].y), sizeof(double));
					
			read(h_connfd[0], &(R[1].x), sizeof(double));
			read(h_connfd[0], &(R[1].y), sizeof(double));
			read(h_connfd[0], &(D[1]), sizeof(double));
			
			in[0] = (int)(inside(M[0], R[1], D[1]));			
			if(in[0]){
				S.x = S.x + M[0].x;
				S.y = S.y + M[0].y;
			}				
			write(h_connfd[1], &in[0], sizeof(int));			
		}
		else if (op[i] == 2){ // help check validity of the intersections	
			write(h_connfd[1], &(R[0].x), sizeof(double));
			write(h_connfd[1], &(R[0].y), sizeof(double));
			write(h_connfd[1], &(D[0]), sizeof(double));
		}
	}	
	
	//secure sum protocol
	rect T;
	
	if (id == 0){
		read(connfd, &T.x, sizeof(double));
		read(connfd, &T.y, sizeof(double));
	}
	else{
		read(h_connfd[1], &T.x, sizeof(double));
		read(h_connfd[1], &T.y, sizeof(double));
	}
		
	T.x = T.x + S.x;
	T.y = T.y + S.y;		
		
	if (id == 2){
		write(connfd, &T.x, sizeof(double));
		write(connfd, &T.y, sizeof(double));
	}
	else{
		write(h_connfd[0], &T.x, sizeof(double));
		write(h_connfd[0], &T.y, sizeof(double));
	}
	
	close(connfd);
	for (id = 0; id < 2; id++)
		close(h_connfd[id]);
	
	return 0;
}