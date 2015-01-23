#include "include/read_netlist.h"

void write_circuit_list(GarbledGateS* gate_list, GarbledGateS* dff_list, int *circuit_size, const string &filename)
{
	string dfilename(filename+".cl");
	fstream circuit_file(dfilename.c_str(),ios::out|ios::binary|ios::trunc);
	if (!circuit_file.good())
	{
		cout << "Error creating circuit list (.cl) file" << endl;
		exit(1); 
	}
	
	for (int i = 0; i < 4; i++)
	{
		circuit_file << circuit_size[i] << "\n";
	}
	
	int no_of_gates = circuit_size[2];
	int no_of_dffs = circuit_size[3];
	
	for (int i = 0; i < no_of_gates; i++)
	{
		circuit_file << gate_list[i].input[0].is_port << "\n";
		circuit_file << gate_list[i].input[0].index << "\n";
		circuit_file << gate_list[i].input[1].is_port << "\n";
		circuit_file << gate_list[i].input[1].index << "\n";
		circuit_file << gate_list[i].output.is_port << "\n";
		circuit_file << gate_list[i].output.index << "\n";
		circuit_file << gate_list[i].id << "\n";
		circuit_file << gate_list[i].type << "\n";
	}
	for (int i = 0; i < no_of_dffs; i++)
	{
		circuit_file << dff_list[i].input[0].is_port << "\n";
		circuit_file << dff_list[i].input[0].index << "\n";
		circuit_file << dff_list[i].input[1].is_port << "\n";
		circuit_file << dff_list[i].input[1].index << "\n";
		circuit_file << dff_list[i].output.is_port << "\n";
		circuit_file << dff_list[i].output.index << "\n";
		circuit_file << dff_list[i].id << "\n";
		circuit_file << dff_list[i].type << "\n";
	}
	circuit_file.close();
	
	return;	
}

void read_circuit_list(GarbledGateS *&gate_list, GarbledGateS *&dff_list, int *circuit_size, const string &filename)
{

	string dfilename(filename+".cl");
	fstream circuit_file(dfilename.c_str(),ios::in|ios::binary);
	if (!circuit_file.good()){
		cout << "circuit list (.cl) file not found" << endl;
		exit(1); 
	}
	circuit_file.seekg (0, ios::beg);
	
	for (int i = 0; i < 4; i++)
	{
		circuit_file >> circuit_size[i];
	}
	
	int no_of_gates = circuit_size[2];
	int no_of_dffs = circuit_size[3];
	gate_list = new GarbledGateS[no_of_gates];
	dff_list = new GarbledGateS[no_of_dffs];

	for (int i = 0; i < no_of_gates; i++)
	{
		circuit_file >> gate_list[i].input[0].is_port;
		circuit_file >> gate_list[i].input[0].index;
		circuit_file >> gate_list[i].input[1].is_port;
		circuit_file >> gate_list[i].input[1].index;
		circuit_file >> gate_list[i].output.is_port;
		circuit_file >> gate_list[i].output.index;
		circuit_file >> gate_list[i].id;
		circuit_file >> gate_list[i].type;
	}

	
	for (int i = 0; i < no_of_dffs; i++)
	{
		circuit_file >> dff_list[i].input[0].is_port;
		circuit_file >> dff_list[i].input[0].index;
		circuit_file >> dff_list[i].input[1].is_port;
		circuit_file >> dff_list[i].input[1].index;
		circuit_file >> dff_list[i].output.is_port;
		circuit_file >> dff_list[i].output.index;
		circuit_file >> dff_list[i].id;
		circuit_file >> dff_list[i].type;
	}


	circuit_file.close();
	
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

