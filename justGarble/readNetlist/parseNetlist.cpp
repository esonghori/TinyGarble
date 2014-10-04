#include "include/read_netlist.h"


void parse_netlist(string filename){

	fstream fin;
	string vfilename(filename);
	fin.open(vfilename.c_str());
	if (!fin.good()){ 
		cout << "Specified v file not found" << endl;
		exit(1); 
	}
	
	int i;
	
 	string inport_list[MAX_NO_OF_INPUTS];
	int inport_index = 0, no_of_bits = 0, no_of_inports;
	bool is_inport = 0;
	
 	string outport_list[MAX_NO_OF_OUTPUTS];
	int outport_index = 0,  no_of_outports;
	bool is_outport = 0;
	
	GarbledGateString gate_list_string[MAX_NO_OF_GATES];
	int gate_index = 0, no_of_gates;
	bool store_input0, store_input1, store_output;
	
	string net_list[MAX_NO_OF_GATES];
	
	string buf("_");
	
	while (buf.compare("endmodule")){
		getline(fin, buf);		
		char_separator<char> sep(" ,;.()");		
		tokenizer<char_separator<char> > tok(buf, sep);
		
		BOOST_FOREACH(string str, tok){
	
			if(is_inport){
				if (str.at(0) =='['){
					tokenizer<> bits(str);
					tokenizer<>::iterator beg = bits.begin(); 
					string bits_str(*beg);
					no_of_bits = atoi(bits_str.c_str())+1;
					continue;
				}
				
				if (no_of_bits)
					for(i = 0; i < no_of_bits; i++)
						inport_list[inport_index++] = str + "[" + to_string(i) + "]";
				else inport_list[inport_index++] = str;
				no_of_bits = 0;
				is_inport = 0;
			}
			else if(!str.compare("input")) is_inport = 1;
			
			else if(is_outport){
				if (str.at(0) =='['){
					tokenizer<> bits(str);
					tokenizer<>::iterator beg = bits.begin(); 
					string bits_str(*beg);
					no_of_bits = atoi(bits_str.c_str())+1;
					continue;
				}
				
				if (no_of_bits)
					for(i = 0; i < no_of_bits; i++)
						outport_list[outport_index++] = str + "[" + to_string(i) + "]";
				else outport_list[outport_index++] = str;
				no_of_bits = 0;
				is_outport = 0;
			}
			else if(!str.compare("output")) is_outport = 1;
				
			else if(!str.compare("XOR")){
				gate_list_string[gate_index].type = XOR;
				gate_list_string[gate_index].id = gate_index;
			}
			
			else if(!str.compare("IV")){
				gate_list_string[gate_index].type = IV;
				gate_list_string[gate_index].id = gate_index;
				gate_list_string[gate_index].input[1] = "-1";
			}
			
			else if(!str.compare("NOR")){
				gate_list_string[gate_index].type = NOR;
				gate_list_string[gate_index].id = gate_index;
			}
			
			else if(store_input0){
				gate_list_string[gate_index].input[0] = str;
				store_input0 = 0;
			}
			else if (!str.compare("A")) store_input0 = 1;
			
			else if(store_input1){
				gate_list_string[gate_index].input[1] = str;
				store_input1 = 0;
			}
			else if (!str.compare("B")) store_input1 = 1;
			
			else if(store_output){
				gate_list_string[gate_index].output = str;
				net_list[gate_index] = str;
				gate_index++;
				store_output = 0;
			}
			else if (!str.compare("Z") || !str.compare("Y")) store_output = 1;
			
		}
	}
	
	no_of_inports = inport_index;
	no_of_outports = outport_index;
	no_of_gates = gate_index;
	
	int circuit_size[3];
	circuit_size[0] = no_of_inports;
	circuit_size[1] = no_of_outports;
	circuit_size[2] = no_of_gates;
	
#if DEBUG_PARSER	
	for (i = 0; i < no_of_inports; i++)
		cout << inport_list[i] << endl;
	cout << endl;
	
	for (i = 0; i < no_of_outports; i++)
		cout << outport_list[i] << endl;
	cout << endl;
	
	for (i = 0; i < no_of_gates; i++)
		cout << gate_list_string[i].id << "\t" << gate_list_string[i].type << "\t"<< gate_list_string[i].input[0] << "\t" << gate_list_string[i].input[1] << "\t"<< gate_list_string[i].output << "\t"   << endl;
	cout << endl;
#endif	
	
	GarbledGateS *gate_list;
	gate_list = new GarbledGateS[no_of_gates];
	int index, total_weight = 0;
	
	for (i = 0; i < no_of_gates; i++){
		gate_list[i].id = gate_list_string[i].id;
		gate_list[i].type = gate_list_string[i].type;
		
		index = search(gate_list_string[i].input[0], net_list, i, no_of_gates);
		if (index > -1){
			gate_list[i].input[0].is_port = 0;
			gate_list[i].input[0].index = index;			
		}
		else {
			gate_list[i].input[0].is_port = 1;
			gate_list[i].input[0].index = search(gate_list_string[i].input[0], inport_list, i, no_of_inports);
		}
		
		if (!gate_list_string[i].input[1].compare("-1")){
			gate_list[i].input[1].is_port = 0;
			gate_list[i].input[1].index = -1;
		}
		else{
			index = search(gate_list_string[i].input[1], net_list, i, no_of_gates);
			if (index > -1){
				gate_list[i].input[1].is_port = 0;
				gate_list[i].input[1].index = index;			
			}
			else {
				gate_list[i].input[1].is_port = 1;
				gate_list[i].input[1].index = search(gate_list_string[i].input[1], inport_list, i, no_of_inports);
			}
		}
		
		index = search(gate_list_string[i].output, outport_list, i, no_of_outports);
		if (index > -1){
			gate_list[i].output.is_port = 1;
			gate_list[i].output.index = index;			
		}
		else {
			gate_list[i].output.is_port = 0;
			gate_list[i].output.index = search(gate_list_string[i].output, net_list, i, no_of_gates);
		}
		
		total_weight = total_weight + get_weight(gate_list[i].type);
	}
	
	write_gate_list(gate_list, circuit_size, filename);
	
	int  **core;
	core = new int*[1]; // no of rows = no_core
	core[0] = new int[no_of_gates+1]; // no of columns = no_of_gates+1
	memset (core[0], -1, (no_of_gates+1)*sizeof(int));
	
	schedule(1, core, filename);
	write_task_schedule(core[0], no_of_gates, filename);
	
}

int search (string target, string *pool, int guess, int size){
	int i, k, index = -1;
	
	if(guess < size) k = guess;
	else k = size-1;
	
	for (i = 0; i < size; i++){
		if(!target.compare(pool[k])){
			index = k;
			break;
		}
		if (k == 0) k = size;
		k--;
	}
	return index;
}

int get_weight(int type){
	int weight;
	if ((type == XOR) || (type == IV)) weight = 1;
	else if ((type == NOR)) weight = 5;
	return weight;
}
