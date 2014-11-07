#include "include/read_netlist.h"

#include "../include/garble.h"


string typetoStrGate(short itype)
{
	string type;
	if (itype == ANDGATE)
	{
		type = "AND";
	}
	else if (itype == ANDNGATE)
	{
		type = "ANDN";
	}
	else if (itype == NANDGATE)
	{
		type = "NAND";
	}
	else if (itype == NANDNGATE)
	{
		type = "NANDN";
	}
	else if (itype == ORGATE)
	{
		type = "OR";
	}
	else if (itype == ORNGATE)
	{
		type = "ORN";
	}
	else if (itype == NORGATE)
	{
		type = "NOR";
	}
	else if (itype == NORNGATE)
	{
		type = "NORN";
	}
	else if (itype == XORGATE)
	{
		type = "XOR";
	}
	else if (itype == XNORGATE)
	{
		type = "XNOR";
	}
	else if (itype == NOTGATE)
	{
		type = "IV";
	}
	else if (itype == DFFGATE)
	{
		type = "DFF";
	}
	else
	{
		type = "NOTVALID";
	}
	return type;
}


void parse_netlist(const string &filename){

	fstream fin;
	string vfilename(filename);
	fin.open(vfilename.c_str());
	if (!fin.good())
	{
		cout << "Specified v file not found" << endl;
		exit(1); 
	}
	
	int i;
	
 	vector<string> inport_list;
	int no_of_bits = 0;
	int no_of_inports = 0;
	bool is_inport = 0;
	
 	vector<string> outport_list;
	int  no_of_outports = 0;
	bool is_outport = 0;
	
	vector<GarbledGateString> gate_list_string;
	int no_of_gates = 0;
	bool store_input0 = 0;
	bool store_input1 = 0;
	bool store_output = 0;
	
	vector<GarbledGateString> dff_list_string;
	int no_of_dffs = 0;
	bool store_d = 0;
	bool store_q = 0;
	
	string buf("_");
	
	while (buf.compare("endmodule"))
	{
		getline(fin, buf);		
		char_separator<char> sep(" ,;.()\t");
		tokenizer<char_separator<char> > tok(buf, sep);
		
		BOOST_FOREACH(string str, tok)
		{
			if(is_inport)
			{
				if (str.at(0) =='[')
				{
					tokenizer<> bits(str);
					tokenizer<>::iterator beg = bits.begin(); 
					string bits_str(*beg);
					no_of_bits = atoi(bits_str.c_str())+1;
					continue;
				}
				
				if(str.compare("clk") && str.compare("rst"))
				{
					if (no_of_bits)
					{
						for(i = 0; i < no_of_bits; i++)
						{
							string t =str + "[" + std::to_string(i) + "]";
							inport_list.push_back(t);
						}
					}
					else
					{
						inport_list.push_back(str);
					}
				}
				no_of_bits = 0;
				is_inport = 0;
			}
			else if(!str.compare("input"))
			{
				is_inport = 1;
			}
			else if(is_outport)
			{
				if (str.at(0) =='[')
				{
					tokenizer<> bits(str);
					tokenizer<>::iterator beg = bits.begin(); 
					string bits_str(*beg);
					no_of_bits = atoi(bits_str.c_str())+1;
					continue;
				}
				
				if (no_of_bits)
				{
					for(i = 0; i < no_of_bits; i++)
					{
						string t = str + "[" + to_string(i) + "]";
						outport_list.push_back(t);
					}
				}
				else
				{
					outport_list.push_back(str);
				}
				no_of_bits = 0;
				is_outport = 0;
			}
			else if(!str.compare("output"))
			{
				is_outport = 1;
			}
			else if(!str.compare("AND"))
			{
				GarbledGateString g;
				g.type = ANDGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("ANDN"))
			{
				GarbledGateString g;
				g.type = ANDNGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("NAND"))
			{
				GarbledGateString g;
				g.type = NANDGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("NANDN"))
			{
				GarbledGateString g;
				g.type = NANDNGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("OR"))
			{
				GarbledGateString g;
				g.type = ORGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("ORN"))
			{
				GarbledGateString g;
				g.type = ORNGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("NOR"))
			{
				GarbledGateString g;
				g.type = NORGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("NORN"))
			{
				GarbledGateString g;
				g.type = NORNGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("XOR"))
			{
				GarbledGateString g;
				g.type = XORGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("XNOR"))
			{
				GarbledGateString g;
				g.type = XNORGATE;
				g.id = gate_list_string.size();
				gate_list_string.push_back(g);
			}
			else if(!str.compare("IV"))
			{
				GarbledGateString g;
				g.type = NOTGATE;
				g.id = gate_list_string.size();
				g.input[1] = "-1";
				gate_list_string.push_back(g);
			}
			else if(!str.compare("DFF"))
			{
				GarbledGateString g;
				g.type = DFFGATE;
				g.id = dff_list_string.size();
				g.input[1] = "-1";
				dff_list_string.push_back(g);
			}
			else if (!str.compare("A"))
			{
				store_input0 = 1;
			}
			else if(store_input0)
			{
				gate_list_string.back().input[0] = str;
				store_input0 = 0;
			}
			else if(!str.compare("D"))
			{
				store_d = 1;
			}
			else if(store_d)
			{
				dff_list_string.back().input[0] = str;
				store_d = 0;
			}
			else if (!str.compare("B"))
			{
				store_input1 = 1;
			}
			else if(store_input1)
			{
				gate_list_string.back().input[1] = str;
				store_input1 = 0;
			}
			else if (!str.compare("Z") || !str.compare("Y"))
			{
				store_output = 1;
			}
			else if(store_output)
			{
				gate_list_string.back().output = str;
				store_output = 0;
			}
			else if (!str.compare("Q"))
			{
				store_q = 1;
			}
			else if(store_q)
			{
				dff_list_string.back().output = str;
				store_q = 0;
			}
		}
	}
	

	// add Q and D to inputs and outputs
	for(int i=0;i < dff_list_string.size(); i++)
	{
		inport_list.push_back(dff_list_string[i].output);
		if(find(outport_list.begin(), outport_list.end(), dff_list_string[i].input[0]) == outport_list.end()) // D is not output itself
		{
			outport_list.push_back(dff_list_string[i].input[0]);
		}
	}



	no_of_inports = inport_list.size();
	no_of_outports = outport_list.size();
	no_of_gates = gate_list_string.size();
	no_of_dffs = dff_list_string.size();
	
	int circuit_size[4];
	circuit_size[0] = no_of_inports;
	circuit_size[1] = no_of_outports;
	circuit_size[2] = no_of_gates;
	circuit_size[3] = no_of_dffs;
	

	GarbledGateS *gate_list = new GarbledGateS[no_of_gates];
	int index, total_weight = 0;
	
	for (i = 0; i < no_of_gates; i++)
	{
		gate_list[i].id = gate_list_string[i].id;
		gate_list[i].type = gate_list_string[i].type;
		
		index = findOutputGateID(gate_list_string[i].input[0], gate_list_string);
		if (index > -1)
		{
			gate_list[i].input[0].is_port = 0;
			gate_list[i].input[0].index = index + no_of_inports;
		}
		else
		{
			gate_list[i].input[0].is_port = 1;
			gate_list[i].input[0].index = search(gate_list_string[i].input[0], inport_list, i, no_of_inports);
		}
		
		if (!gate_list_string[i].input[1].compare("-1"))
		{
			gate_list[i].input[1].is_port = 0;
			gate_list[i].input[1].index = -1;
		}
		else
		{
			index = findOutputGateID(gate_list_string[i].input[1], gate_list_string);
			if (index > -1)
			{
				gate_list[i].input[1].is_port = 0;
				gate_list[i].input[1].index = index + no_of_inports;
			}
			else
			{
				gate_list[i].input[1].is_port = 1;
				gate_list[i].input[1].index = search(gate_list_string[i].input[1], inport_list, i, no_of_inports);
			}
		}
		
		index = search(gate_list_string[i].output, outport_list, i, no_of_outports);
		if (index > -1)
		{
			gate_list[i].output.is_port = 1;
		}
		else
		{
			gate_list[i].output.is_port = 0;
		}
		gate_list[i].output.index = i+ no_of_inports;
		
		total_weight = total_weight + get_weight(gate_list[i].type);
	}
	
	GarbledGateS *dff_list = new GarbledGateS[no_of_dffs];

	for (i = 0; i < no_of_dffs; i++)
	{
		dff_list[i].id = dff_list_string[i].id;
		dff_list[i].type = dff_list_string[i].type;

		index = findOutputGateID(dff_list_string[i].input[0], gate_list_string);
		if(index < 0) //might be an input, although it is odd
		{
			index = search(dff_list_string[i].input[0], inport_list, 0, no_of_inports);
			assert(index > -1);
		}
		else
		{
			index += no_of_inports;
		}
		dff_list[i].input[0].is_port = 0;
		dff_list[i].input[0].index = index;

		index = search(dff_list_string[i].output, inport_list, 0, no_of_inports);
		assert(index > -1);
		dff_list[i].output.is_port = 1;
		dff_list[i].output.index = index;

	}

#ifdef VERBOSE
	cout << "inputs:" << endl;
	for (i = 0; i < no_of_inports; i++)
	{
		cout << inport_list[i] << " " << i << endl;
	}
	cout << endl;

	cout << "outputs:" << endl;
	for (i = 0; i < no_of_outports; i++)
	{
		cout << outport_list[i] << " " << i << endl;
	}
	cout << endl;

	cout << "gates:" << endl;
	for (i = 0; i < no_of_gates; i++)
	{
		cout << gate_list_string[i].id << "\t" << typetoStrGate(gate_list_string[i].type) << "\t"
			<< gate_list_string[i].input[0] << "\t" << gate_list_string[i].input[1]
			<< "\t"<< gate_list_string[i].output << endl;
	}
	cout << endl;

	cout << "dffs:" << endl;
	for (i = 0; i < no_of_dffs; i++)
	{
		cout << dff_list_string[i].id << "\t" << typetoStrGate(dff_list_string[i].type) << "\t"
			<< dff_list_string[i].input[0]  << "\t" << dff_list_string[i].output << endl;
	}
	cout << endl;
#endif

	write_circuit_list(gate_list, dff_list, circuit_size, filename);
	
	int  **core;
	core = new int*[1]; // no of rows = no_core
	core[0] = new int[no_of_gates+1]; // no of columns = no_of_gates+1
	memset (core[0], -1, (no_of_gates+1)*sizeof(int));
	
	schedule(1, core, filename);
	write_task_schedule(core[0], no_of_gates, filename);
	
}

int search (const string &target, const vector<string> & pool, int guess, int size)
{
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

int findOutputGateID(const string &target, const vector<GarbledGateString> &gate_list_string)
{
	for(int i=0;i<gate_list_string.size();i++)
	{
		if(!target.compare(gate_list_string[i].output))
		{
			return i;
		}
	}
	return -1;
}


int get_weight(int type){
	int weight;
	if ((type == XORGATE) || (type == NOTGATE))
		weight = 1;
	else if ((type == NORGATE))
		weight = 5;
	return weight;
}
