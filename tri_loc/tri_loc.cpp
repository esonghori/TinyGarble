#include <iostream>
#include <vector>
#include <cstring>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include <sys/time.h>
#include "tri_loc/tri_loc.h"

#include <boost/program_options.hpp>
#include <boost/format.hpp>
#include <cstdlib>
#include <ctime>

#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit.h"
#include "scd/scd.h"
#include "tcpip/tcpip.h"
#include "util/util.h"
#include "util/tinygarble_config.h"
#include "util/log.h" 

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

bool inside (rect D, rect A, double rA){
	bool in;
	double H;
	
	H = ((D.x - A.x)*(D.x - A.x) + (D.y - A.y)*(D.y - A.y));
	
	in = (H <= rA*rA);
	
	return in;
}

int lost_car(vector<int> &port){
	
	int id;
	//establish connection with three helping cars 
	vector<int> connfd(3);
	for (id = 0; id < 3; id++)
		if ((connfd[id] = ServerInit(port[id])) == -1) {
			cout << "Cannot open the socket in port " << port[id] << " with Car " << id << endl;
			return -1;
		}
	
	timeval tim;
	gettimeofday(&tim, NULL);
	double t1 = tim.tv_sec+(tim.tv_usec/1000000.0);
	uint64_t delta_time = RDTSC;
	
	//provide each car an id and get the port numbers they use to establish server with other cars
	vector<int> h_port(3);	
	for (id = 0; id < 3; id++){
		SendData(connfd[id], &id, sizeof(int));
		RecvData(connfd[id], &h_port[id], sizeof(int));
	}
	
	//provide each car the port number of its server car
	for (id = 0; id < 3; id++){
		SendData(connfd[id], &h_port[(id+2)%3], sizeof(int));
	}
	
	//manage connection establishment of the helping cars
	int done, ser = 0, cli = 1; 
	for (id = 0; id < 3; id++){
		SendData(connfd[id], &ser, sizeof(int));
		SendData(connfd[(id+1)%3], &cli, sizeof(int));
		RecvData(connfd[(id+1)%3], &done, sizeof(int));
	}
	
	//compute median through secure sum protocol
	rect Q, M;
	
	M.x = rand()%255 + rand()/255;
	M.y = rand()%255 + rand()/255;
	
	SendData(connfd[0], &M.x, sizeof(double));
	SendData(connfd[0], &M.y, sizeof(double));
	
	RecvData(connfd[2], &Q.x, sizeof(double));
	RecvData(connfd[2], &Q.y, sizeof(double));
	
	Q.x = (Q.x - M.x)/3;
	Q.y = (Q.y - M.y)/3;
	
	print_rect(Q);	
	
	uint64_t output = (((uint8_t)Q.x) << BIT_LEN) | (((uint8_t)Q.y));
	string output_str_int = to_string_hex(output, ceil((2*BIT_LEN)/4));
	cout << output_str_int << endl;
	
	for (id = 0; id < 3; id++)
		ServerClose(connfd[id]);
	
	gettimeofday(&tim, NULL);
	double t2 = tim.tv_sec + (tim.tv_usec/1000000.0);	
	delta_time = RDTSC - delta_time;	
	cout << "total time(cc): " << delta_time << " approx: " << (double)delta_time/(3.4e9) << "s" << endl; 
	cout << "total time: " << (t2 - t1) << "s" << endl;
	
	return 0;
	
}

int helping_car(vector<int> &port, bool PRV){
	
	string server_ip = "127.0.0.1";
	
	//connect to lost car
	int connfd;
	if ((connfd = ClientInit(server_ip.c_str(), port[0])) == -1) {
      cout << "Cannot connect to " << server_ip << ":" << port[0] << endl;
      return -1;
    }
	
	//get id from lost car, provide port number for its server for other helping car and get port number of the car to which its a client
	vector<int> h_port(2);
	h_port[0] = port[1];	
	int id;
	RecvData(connfd, &id, sizeof(int));
	SendData(connfd, &h_port[0], sizeof(int));	
	RecvData(connfd, &h_port[1], sizeof(int));
	
	//establish connection with the two other helping cars
	int ser_cli, done = 1;
	vector<int> h_connfd(2);
	
	for (int i = 0; i < 2; i++){
		RecvData(connfd, &ser_cli, sizeof(int));
		if (ser_cli == 0){
			if ((h_connfd[0] = ServerInit(h_port[0])) == -1) {
				cout << "Cannot open the socket in port " << h_port[0] << " with Car " << (id+1)%3 << endl;
				return -1;
			}
			SendData(h_connfd[0], &id, sizeof(int));
		}
		else{
			if ((h_connfd[1] = ClientInit(server_ip.c_str(), h_port[1])) == -1) {
					cout << "Cannot connect to " << server_ip << ":" << h_port[1] << " with Car " << (id+2)%3 << endl;
					return -1;
				}
			int other_id;
			RecvData(h_connfd[1], &other_id, sizeof(int));
			cout << "car " << id << " established connection with car " << other_id << endl;
			SendData(connfd, &done, sizeof(int));
		}
	}
	
	//triangle localization
	vector <rect> M_1(2), M(2);
	vector <rect> R(2);
	vector <double> D(2);	
	vector <int> in(2);
	R[0] = get_loc(id);
	D[0] = get_dist(id);
#if PRIVACY	
	uint64_t input = ((((uint16_t)R[0].x) & 0xFF) << (2*BIT_LEN+1)) | ((((uint16_t)R[0].y) & 0xFF) << (BIT_LEN+1)) | (((uint16_t)D[0]) & 0x1FF); 
	string input_str = to_string_hex(input, ceil((3*BIT_LEN+1)/4));
	vector <string> output_str_int(2);
	string in_range, in_range_dummy;
#endif	
	rect S;
	S.x = 0;
	S.y = 0;
	
	//set sequence of operation according to id
	vector <int> op(2);
	if (id == 0){
		op[0] = 0;
		op[1] = 1;
	}
	else{
		op[0] = 1;
		op[1] = 0;
	}
	
	for (int i = 0; i < 2; i++){		
		if (op[i] == 0){// initialize computation of one pair of intersections				
			SendData(h_connfd[0], &(R[0].x), sizeof(double));
			SendData(h_connfd[0], &(R[0].y), sizeof(double));
			SendData(h_connfd[0], &D[0], sizeof(double));
			
			RecvData(h_connfd[0], &(M[1].x), sizeof(double));
			RecvData(h_connfd[0], &(M[1].y), sizeof(double));
#if PRIVACY				
			cout << "Garbler input: " << input_str << endl;
			CHECK(GarbleStr(INTERSECTION_SCD, "", input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &output_str_int[0], h_connfd[0]));
			cout << "Garbler output: " << output_str_int[0] << endl;
#endif
		}
		else if (op[i] == 1){ // compute intersections
			RecvData(h_connfd[1], &(R[1].x), sizeof(double));
			RecvData(h_connfd[1], &(R[1].y), sizeof(double));
			RecvData(h_connfd[1], &D[1], sizeof(double)); 
			
			M_1 = intersection(R[0], D[0], R[1], D[1]);
			set_rect(M[0], M_1[0]);			
			SendData(h_connfd[1], &(M_1[1].x), sizeof(double));
			SendData(h_connfd[1], &(M_1[1].y), sizeof(double));		
			
#if PRIVACY				
			cout << "Evaluator input: " << input_str << endl;
			CHECK(EvaluateStr(INTERSECTION_SCD, "", input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &output_str_int[1], h_connfd[1]));	
			cout << "Evaluator output: " << output_str_int[1] << endl;
#endif			
		}
	}
	
	for (int i = 0; i < 2; i++){		
		if (op[i] == 0){// check which one is valid			
			RecvData(h_connfd[0], &(R[1].x), sizeof(double));
			RecvData(h_connfd[0], &(R[1].y), sizeof(double));
			RecvData(h_connfd[0], &(D[1]), sizeof(double));
			
			in[0] = (int)(inside(M[0], R[1], D[1]));
#if PRIVACY				
			cout << "Garbler input: " << output_str_int[1] << endl;
			CHECK(GarbleStr(INSIDE_SCD, "", output_str_int[1], 1, "1", 0, 0, 0, &in_range, h_connfd[0]));
			cout << "Garbler output: " << in_range << endl;
#endif			
		}
		else if (op[i] == 1){ // help check validity of the intersections
			SendData(h_connfd[1], &(R[0].x), sizeof(double));
			SendData(h_connfd[1], &(R[0].y), sizeof(double));
			SendData(h_connfd[1], &(D[0]), sizeof(double));
#if PRIVACY				
			cout << "Evaluator input: " << input_str << endl;
			CHECK(EvaluateStr(INSIDE_SCD, "", input_str, 1, "1", 0, 0, 0, &in_range_dummy, h_connfd[1]));	
			cout << "Evaluator output: " << endl;
#endif	
		}
	}

	for (int i = 0; i < 2; i++){		
		if (op[i] == 0){ // receive validity info									
			RecvData(h_connfd[0], &in[1], sizeof(int));
		}
		else if (op[i] == 1){ // send validity info	
			SendData(h_connfd[1], &in[0], sizeof(int));
		}
	}		
							
	//secure sum protocol
	
	if(in[0]){
		S.x = S.x + M[0].x;
		S.y = S.y + M[0].y;
	}				
	if(!in[1]){
		S.x = S.x + M[1].x;
		S.y = S.y + M[1].y;
	}
	
	rect T;
	
	if (id == 0){
		RecvData(connfd, &T.x, sizeof(double));
		RecvData(connfd, &T.y, sizeof(double));
	}
	else{
		RecvData(h_connfd[1], &T.x, sizeof(double));
		RecvData(h_connfd[1], &T.y, sizeof(double));
	}
		
	T.x = T.x + S.x;
	T.y = T.y + S.y;		
		
	if (id == 2){
		SendData(connfd, &T.x, sizeof(double));
		SendData(connfd, &T.y, sizeof(double));
	}
	else{
		SendData(h_connfd[0], &T.x, sizeof(double));
		SendData(h_connfd[0], &T.y, sizeof(double));
	}
	
	ClientClose(connfd);
	ServerClose(h_connfd[0]);
	ClientClose(h_connfd[1]);
	
	return 0;
}