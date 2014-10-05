#include "include/read_netlist.h"

void write_gate_list(GarbledGateS* gate_list, int *circuit_size, const string &filename){
	string dfilename(filename+"_gate_list.dat");
	fstream gate_file(dfilename.c_str(),ios::out|ios::binary|ios::trunc);
	if (!gate_file.good()){ 
		cout << "Error creating dat file" << endl;
		exit(1); 
	}
	
	for (int i = 0; i < 3; i++){
		gate_file << circuit_size[i] << "\n";
	}
	
	int no_of_gates = circuit_size[2];
	
	for (int i = 0; i < no_of_gates; i++){
		gate_file << gate_list[i].input[0].is_port << "\n";
		gate_file << gate_list[i].input[0].index << "\n";
		gate_file << gate_list[i].input[1].is_port << "\n";
		gate_file << gate_list[i].input[1].index << "\n";
		gate_file << gate_list[i].output.is_port << "\n";
		gate_file << gate_list[i].output.index << "\n";
		gate_file << gate_list[i].id << "\n";		
		gate_file << gate_list[i].type << "\n";
	}
	gate_file.close();
	
	return;	
}

void read_gate_list(GarbledGateS *&gate_list, int *circuit_size, const string &filename){
	string dfilename(filename+"_gate_list.dat");
	fstream gate_file(dfilename.c_str(),ios::in|ios::binary);
	if (!gate_file.good()){ 
		cout << "Specified dat file not found" << endl;
		exit(1); 
	}
	gate_file.seekg (0, ios::beg);
	
	for (int i = 0; i < 3; i++){
		gate_file >> circuit_size[i];
	}
	
	int no_of_gates = circuit_size[2];
	gate_list = new GarbledGateS[no_of_gates];
	
	for (int i = 0; i < no_of_gates; i++){
		gate_file >> gate_list[i].input[0].is_port;
		gate_file >> gate_list[i].input[0].index;
		gate_file >> gate_list[i].input[1].is_port;
		gate_file >> gate_list[i].input[1].index;
		gate_file >> gate_list[i].output.is_port;
		gate_file >> gate_list[i].output.index;
		gate_file >> gate_list[i].id;		
		gate_file >> gate_list[i].type;
	}
	gate_file.close();
	
	return;	
}

void write_task_schedule(int *task_schedule, int no_task, const string &filename){
	string dfilename(filename+"_task_list.dat");
	fstream task_file(dfilename.c_str(),ios::out|ios::binary|ios::trunc);
	if (!task_file.good()){ 
		cout << "Error creating dat file" << endl;
		exit(1); 
	}
	
	for (int i = 0; i < no_task; i++)
		task_file << task_schedule[i] << "\n";

}

void read_task_schedule(int *task_schedule, int no_task, const string &filename){
	string dfilename(filename+"_task_list.dat");
	fstream task_file(dfilename.c_str(),ios::in|ios::binary);
	if (!task_file.good()){ 
		cout << "Specified dat file not found" << endl;
		exit(1); 
	}
	
	for (int i = 0; i < no_task; i++)
		task_file >> task_schedule[i];

}

