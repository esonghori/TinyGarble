#include <iostream>
#include <vector>
#include <cstring>
#include <cstdint>
#include <unistd.h>
#include <cmath>
#include <sys/time.h>
#include <pthread.h>
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

pthread_mutex_t running_mutex = PTHREAD_MUTEX_INITIALIZER;
volatile int running_threads  = 0;

void print_rect(rect R){	
	cout << "<" << R.x << "," << R.y << ">\t\t";
	cout << "\n";
}

void print_rect(vector<rect> R){
	for (uint i = 0; i < R.size(); i++)
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
	
	delta_time = RDTSC - delta_time;	
	cout << "total time(cc): " << delta_time << " second: " << (double)delta_time/(3.4e9) << endl; 
	
	return 0;
	
}

int helping_car(vector<int> &port, bool PRV){
	
	string server_ip = "127.0.0.1";
	int i;
	
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
	
	for (i = 0; i < 2; i++){
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
	
/* 	string bin = dec2bin(127, 9);
	int64_t dec = bin2dec(bin, true);
	cout << bin << " : " << dec << endl;
	bin = dec2bin(-127, 9);
	dec = bin2dec(bin, true);
	cout << bin << " : " << dec << endl; */
	
	string hex_, bin;
	hex_ = "5A";
	bin = hex2bin(hex_, 7);
	hex_ = bin2hex(bin);
	cout << bin << " : " << hex_ << endl;
	hex_ = "5A";
	bin = hex2bin(hex_, 10);
	hex_ = bin2hex(bin);
	cout << bin << " : " << hex_ << endl;
	
//#if PRIVACY	
	uint64_t input = ((((uint16_t)R[0].x) & 0xFF) << (2*BIT_LEN+1)) | ((((uint16_t)R[0].y) & 0xFF) << (BIT_LEN+1)) | (((uint16_t)D[0]) & 0x1FF); 
	string input_str = to_string_hex(input, ceil((3*BIT_LEN+1)/4));
	cout << input_str << endl;
	
	vector<uint64_t> input_1(3);
	vector<uint8_t> len_1(3);
	input_1[0] = R[0].x;
	input_1[1] = R[0].y;
	input_1[2] = D[0];
	len_1[0] = BIT_LEN;
	len_1[1] = BIT_LEN;
	len_1[2] = BIT_LEN+1;
	string input_str_1 = fromatGCInputString(input_1, len_1);
	cout << input_str_1 << endl;
	
	
	vector <string> output_str_int(2);
	string in_range, in_range_dummy;
//#endif	
	
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
	
	
	
	for (i = 0; i < 2; i++){		
		if (op[i] == 0){// initialize computation of one pair of intersections
#if PRIVACY				
			cout << "Garbler input: " << input_str << endl;
			CHECK(GarbleStr(INTERSECTION_SCD, "", input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &output_str_int[0], h_connfd[0]));
			cout << "Garbler output: " << output_str_int[0] << endl;
#else				
			SendData(h_connfd[0], &(R[0].x), sizeof(double));
			SendData(h_connfd[0], &(R[0].y), sizeof(double));
			SendData(h_connfd[0], &D[0], sizeof(double));			
			RecvData(h_connfd[0], &(M[0].x), sizeof(double));
			RecvData(h_connfd[0], &(M[0].y), sizeof(double));
#endif	
		}
		else if (op[i] == 1){ // compute intersections		
#if PRIVACY				
			cout << "Evaluator input: " << input_str << endl;
			CHECK(EvaluateStr(INTERSECTION_SCD, "", input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &output_str_int[1], h_connfd[1]));	
			cout << "Evaluator output: " << output_str_int[1] << endl;
#else	
			RecvData(h_connfd[1], &(R[1].x), sizeof(double));
			RecvData(h_connfd[1], &(R[1].y), sizeof(double));
			RecvData(h_connfd[1], &D[1], sizeof(double)); 			
			M_1 = intersection(R[0], D[0], R[1], D[1]);
			set_rect(M[1], M_1[1]);			
			SendData(h_connfd[1], &(M_1[0].x), sizeof(double));
			SendData(h_connfd[1], &(M_1[0].y), sizeof(double));	
#endif					
		}
	}
	
	for (i = 0; i < 2; i++){		
		if (op[i] == 0){// check which one is valid	
#if PRIVACY				
			cout << "Garbler input: " << output_str_int[0] << endl;
			CHECK(GarbleStr(INSIDE_SCD, "", output_str_int[1], 1, "1", 0, 0, 0, &in_range, h_connfd[0]));
			cout << "Garbler output: " << in_range << endl;
#else			
			RecvData(h_connfd[0], &(R[1].x), sizeof(double));
			RecvData(h_connfd[0], &(R[1].y), sizeof(double));
			RecvData(h_connfd[0], &(D[1]), sizeof(double));			
			in[1] = (int)(inside(M[1], R[1], D[1]));
#endif				
		}
		else if (op[i] == 1){ // help check validity of the intersections
#if PRIVACY				
			cout << "Evaluator input: " << input_str << endl;
			CHECK(EvaluateStr(INSIDE_SCD, "", input_str, 1, "1", 0, 0, 0, &in_range_dummy, h_connfd[1]));	
			cout << "Evaluator output: " << endl;
#else	
			SendData(h_connfd[1], &(R[0].x), sizeof(double));
			SendData(h_connfd[1], &(R[0].y), sizeof(double));
			SendData(h_connfd[1], &(D[0]), sizeof(double));	
#endif	
		}
	}

	for (i = 0; i < 2; i++){		
		if (op[i] == 0){ // receive validity info									
			RecvData(h_connfd[0], &in[0], sizeof(int));
		}
		else if (op[i] == 1){ // send validity info	
			SendData(h_connfd[1], &in[1], sizeof(int));
		}
	}		
	
	print_rect(M[0]);
	print_rect(M[1]);
	cout << !in[0] << " " << in[1] << endl;

#if PRIVACY
#else
	int_data *I_data = new int_data[2];	
	pthread_t *threads = new pthread_t[2];

	for (i = 0; i < 2; i++){
		I_data[i].id = i;
		I_data[i].input_str = input_str;
		I_data[i].h_connfd = h_connfd[i];
	}
	
	for (i = 0; i < 2; i++){
		pthread_mutex_lock(&running_mutex);
		running_threads++;
		pthread_mutex_unlock(&running_mutex);
		pthread_create(&threads[i], NULL, int_GC, (void *)&I_data[i]);
	}
	
	while (running_threads > 0);
	
	for (i = 0; i < 2; i++){
		I_data[i].input_str_1 = I_data[1].output_str;
		I_data[i].h_connfd = h_connfd[1-i];
	}
	
	for (i = 0; i < 2; i++){
		pthread_mutex_lock(&running_mutex);
		running_threads++;
		pthread_mutex_unlock(&running_mutex);
		pthread_create(&threads[i], NULL, rng_GC, (void *)&I_data[i]);
	}
	
	while (running_threads > 0);
	
#endif
		
	//secure sum protocol
	
	rect S;
	S.x = 0;
	S.y = 0;
	if(!in[0]){
		S.x = S.x + M[0].x;
		S.y = S.y + M[0].y;
	}				
	if(in[1]){
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

void *int_GC(void* I){
	int_data *I_data;
	I_data = (int_data*)I;
	
	if (I_data->id == 0){
		cout << "core " << I_data->id << " input:\t" << I_data->input_str << endl;
		GarbleStr(INTERSECTION_SCD, "", I_data->input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &(I_data->output_str), I_data->h_connfd);
		cout << "core " << I_data->id << " output:\t" << I_data->output_str << endl;
	}
	else {
		cout << "core " << I_data->id << " input:\t" << I_data->input_str << endl;
		EvaluateStr(INTERSECTION_SCD, "", I_data->input_str, 1, INTERSECTION_OUTPUT_MASK, 0, 0, 0, &(I_data->output_str), I_data->h_connfd);
		cout << "core " << I_data->id << " output:\t" << I_data->output_str << endl;
	}
	
	pthread_mutex_lock(&running_mutex);
		running_threads--;
	pthread_mutex_unlock(&running_mutex);
}

void *rng_GC(void* I){
	int_data *I_data;
	I_data = (int_data*)I;
	string in_range_dummy;
	
	if (I_data->id == 0){
		cout << "core " << I_data->id << " input:\t" << I_data->input_str_1 << endl;
		GarbleStr(INSIDE_SCD, "", I_data->input_str_1, 1, "1", 0, 0, 0, &(I_data->output_str), I_data->h_connfd);
		cout << "core " << I_data->id << " output:\t" << I_data->output_str << endl;
	}
	else {
		cout << "core " << I_data->id << " input:\t" << I_data->input_str << endl;
		EvaluateStr(INSIDE_SCD, "", I_data->input_str, 1, "1", 0, 0, 0, &in_range_dummy, I_data->h_connfd);
	}
	
	pthread_mutex_lock(&running_mutex);
		running_threads--;
	pthread_mutex_unlock(&running_mutex);
}