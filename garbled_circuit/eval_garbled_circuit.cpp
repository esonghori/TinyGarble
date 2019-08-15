#include <boost/program_options.hpp>
#include <boost/format.hpp>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <memory>
#include <stdexcept>
#include <string>
#include <sstream>
#include <array>
#include <unistd.h>
#include "util/tinygarble_config.h"
#include "garbled_circuit/garbled_circuit_util.h"

#define FREQ 2.5E6

using namespace std;
namespace po = boost::program_options;

std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
    if (!pipe) {
        throw std::runtime_error("popen() failed!");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}

int main(int argc, char** argv) {	
		
	pid_t pid = fork(); //parent: Alice. child: Bob
#if TIMING_EVAL
	if (pid == 0) cout << "Automated timing evaluation. ";
#else
	if (pid == 0) cout << "Please set TIMING_EVAL to 1 in garbled_circuit/garbled_circuit_util.h to run automated timing evaluation." << endl;
	return 0;
#endif
	
	int port;
	string netlist_address;
	string server_ip;
	string input_hex_str, init_hex_str, output_hex_str;
	int cycles, repeat, output_mode;
	string in_file, eval_file;	
	string benchmark, bit_width;
	int num_eval;
	
	po::options_description desc{"Evaluation of TinyGarble sequential execution \nAllowed options"};
	desc.add_options()  //
	("help,h", "produce help message")  //
	("port,p", po::value<int>(&port)->default_value(1234), "socket port")  //
	("server_ip,s", po::value<string>(&server_ip)->default_value("127.0.0.1"), "server's IP.")  //
	("repeat,r", po::value<int>(&repeat)->default_value(1),"number of times to repeat the run") //
	("file,f", po::value<string>(&in_file)->default_value(string(TINYGARBLE_BINARY_DIR) + "/scd/benchmarks.txt"),"netlist, cycles, output_mode read from this file") //
	("num_eval,t", po::value<int>(&num_eval)->default_value(5),"number of times to average evaluation"); 
	
	po::variables_map vm;
	try {
		po::parsed_options parsed = po::command_line_parser(argc, argv).options(desc).allow_unregistered().run();
		po::store(parsed, vm);
		if (vm.count("help")) {
			cout << desc << endl;
			return 0;
		}
		po::notify(vm);
	}catch (po::error& e) {
		cout << "ERROR: " << e.what() << endl << endl;
		cout << desc << endl;
		return -1;
	}	
		
	ifstream fin(in_file.c_str(), std::ios::in);
	if (!fin.good()){
		perror(in_file.c_str());
		exit(-1);
	}
	
	uint64_t dc[3]; 
	double dt[3], DT[3], DC[3]; 
	string cmd, output;
	
	eval_file = string(TINYGARBLE_BINARY_DIR) + "/eval_TG";	
	if(pid > 0) eval_file += "_A";
	else eval_file += "_B";
	eval_file += ("_r=" + to_string(repeat) + ".csv");
		
	ofstream f_eval(eval_file.c_str(), std::ios::out);
	if (!f_eval.good()){
		perror(eval_file.c_str());
		exit(-1);
	}	
	
	if (pid > 0) f_eval << "Alice: ";
	else f_eval << "Bob: ";
		
	f_eval << "Averaged over " << num_eval << " executions." << endl;
	if (pid == 0)  cout  << "Averaged over " << num_eval << " executions." << endl;
	
	f_eval << "Bench," << "Bit-width," << "Labels,," << "g/e,," << "Total," << endl;
	if (pid == 0) cout << "Bench\t" << "Bit-width\t" << "Labels\t\t\t" << "g/e\t\t\t" << "Total\t" << endl;
	f_eval << "," << "," << "cc,ms," << "cc,ms," << "cc,ms," << endl;
	if (pid == 0) cout << "\t" << "\t" << "\tcc\t\tms\t" << "cc\t\tms\t" << "cc\t\tms\t" << endl;
		
	while(true) {
		fin >> netlist_address;
		if(netlist_address == "terminate") break;
		fin >> cycles >> output_mode >> benchmark >> bit_width;
		
		//cmd += " --log2std";
		
		int port_inc = 0;
		
		//cout << cmd << endl;
		
		//continue;
		
		memset(DC, 0, 3*sizeof(double));
		memset(DT, 0, 3*sizeof(double));
		
		for (int i = 0; i < num_eval; ++i){		
			cmd = string(TINYGARBLE_BINARY_DIR) + "/garbled_circuit/TinyGarble " \
														+ " -i " + netlist_address \
														+ " -p " + to_string(port + port_inc) \
														+ " -s " + server_ip \
														+ " -c " + to_string(cycles) \
														+ " --output_mode " + to_string(output_mode) ;
			
			if (pid > 0) cmd += " -a";
			else cmd += " -b";
			
			port_inc += 10;
			
			usleep(500);
			if (pid == 0) usleep(500);	
			output = exec(cmd.c_str());
			if (pid == 0) usleep(1000);	
			stringstream stream(output);
			for (int j = 0; j < 3; ++j){
				stream >> dc[j];
				dt[j] = dc[j]/FREQ;
				DC[j] += dc[j];
				DT[j] += dt[j];
			}
			stream >> output_hex_str;
		}
		
		//cout << output << endl;
		
		//continue;

		for (int j = 0; j < 3; ++j){
			DC[j] = DC[j]/num_eval;
			DT[j] = DT[j]/num_eval;	
		}
		
		f_eval << benchmark << ","  << bit_width << ",";  
		if (pid == 0) cout << benchmark << "\t"  << bit_width << "\t\t";  
		f_eval << setprecision(2) << scientific << DC[0] << "," << fixed << DT[0] << ",";			
		if (pid == 0) cout << setprecision(2) << scientific << DC[0] << "\t" << fixed << DT[0] << "\t";	
		f_eval << setprecision(2) << scientific << DC[1] + DC[2] << "," << fixed << DT[1] + DT[2] << ",";			
		if (pid == 0) cout << setprecision(2) << scientific << DC[1] + DC[2] << "\t" << fixed << DT[1] + DT[2] << "\t";	
		f_eval << setprecision(2) << scientific << DC[0]+ DC[1] + DC[2] << "," << fixed << DT[0] + DT[1] + DT[2] << ",";			
		if (pid == 0) cout << setprecision(2) << scientific << DC[0] + DC[1] + DC[2] << "\t" << fixed << DT[0] + DT[1] + DT[2];			
	
		f_eval << endl;
		if (pid == 0) cout << endl;
	}	

	f_eval << "Note: Processor frequency is assummed to be " << setprecision(2) << scientific << FREQ*1000 << " in computing time in ms." << endl;
	if (pid == 0) cout << "Note: Processor frequency is assummed to be " << setprecision(2) << scientific << FREQ*1000 << " in computing time in ms." << endl;
	if (pid == 0) cout << "Run lscpu | grep GHz on the command line to check if this is correct or change the macro FREQ accordingly" << endl;
		
	fin.close();	
	f_eval.close();

	if (pid > 0) usleep(5000);		
	
	return 0;
}
