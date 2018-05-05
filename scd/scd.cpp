/*
 This file is part of JustGarble.

 JustGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 JustGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with JustGarble.  If not, see <http://www.gnu.org/licenses/>.

 */
/*
 This file is part of TinyGarble. It is modified version of JustGarble
 under GNU license.

 TinyGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 TinyGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with TinyGarble.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "scd/scd.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include <cerrno>
#include <cstring>
#include <cstdlib>
#include <cmath>
#include <fstream>
#include <iostream>
#include <vector>
#include <new>
#include "util/log.h"
#include <boost/algorithm/string/split.hpp>
#include <boost/algorithm/string/classification.hpp>

int ReadSCD(const string& file_name, GarbledCircuit* garbled_circuit) {
	std::ifstream f(file_name, std::ios::out);
	if (!f.is_open()) {
		LOG(ERROR) << "can't open " << file_name << endl;
		return FAILURE;
	}

	f >> garbled_circuit->p_init_size >> garbled_circuit->g_init_size >> garbled_circuit->e_init_size >> garbled_circuit->p_input_size
			>> garbled_circuit->g_input_size >> garbled_circuit->e_input_size >> garbled_circuit->i_input_size >> garbled_circuit->dff_size
			>> garbled_circuit->output_size >> garbled_circuit->terminate_id >> garbled_circuit->gate_size;

	if (posix_memalign((void **) (&garbled_circuit->garbledGates), 128, sizeof(GarbledGate) * garbled_circuit->gate_size)) {
		LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory" << endl;
		LOG(ERROR) << strerror(errno) << endl;
		return FAILURE;
	}
	if (garbled_circuit->output_size > 0) {
		if (posix_memalign((void **) (&garbled_circuit->outputs), 128, sizeof(int64_t) * garbled_circuit->output_size)) {
			LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory" << endl;
			LOG(ERROR) << strerror(errno) << endl;
			return FAILURE;
		}
	} else {
		garbled_circuit->outputs = nullptr;
	}
	if (garbled_circuit->dff_size > 0) {
		try {
			garbled_circuit->D = new int64_t[garbled_circuit->dff_size];
			garbled_circuit->I = new int64_t[garbled_circuit->dff_size];
		} catch (std::bad_alloc& e) {
			LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory" << endl << e.what() << endl;
			return FAILURE;

		}
	} else {
		garbled_circuit->D = nullptr;
		garbled_circuit->I = nullptr;
	}

	for (uint64_t i = 0; i < garbled_circuit->gate_size; i++) {
		garbled_circuit->garbledGates[i].output = garbled_circuit->get_gate_lo_index() + i;
	}

	for (uint64_t i = 0; i < garbled_circuit->gate_size; i++) {
		f >> garbled_circuit->garbledGates[i].input0;
	}

	for (uint64_t i = 0; i < garbled_circuit->gate_size; i++) {
		f >> garbled_circuit->garbledGates[i].input1;
	}
	for (uint64_t i = 0; i < garbled_circuit->gate_size; i++) {
		f >> garbled_circuit->garbledGates[i].type;
	}
	for (uint64_t i = 0; i < garbled_circuit->output_size; i++) {
		f >> garbled_circuit->outputs[i];
	}
	for (uint64_t i = 0; i < garbled_circuit->dff_size; i++) {
		f >> garbled_circuit->D[i];
	}
	for (uint64_t i = 0; i < garbled_circuit->dff_size; i++) {
		f >> garbled_circuit->I[i];
	}

	f.close();

	return SUCCESS;
}

int WriteSCD(const ReadCircuit& read_circuit, const string &file_name) {
	std::ofstream f(file_name.c_str(), std::ios::out);
	if (!f.is_open()) {
		LOG(ERROR) << "can't open " << file_name << endl;
		return -1;
	}

	f << read_circuit.p_init_size << " " << read_circuit.g_init_size << " " << read_circuit.e_init_size << " " << read_circuit.p_input_size << " "
			<< read_circuit.g_input_size << " " << read_circuit.e_input_size << " " << read_circuit.i_input_size << " " << read_circuit.dff_size << " "
			<< read_circuit.output_size << " " << read_circuit.terminate_id << " " << read_circuit.gate_size << endl;

	/*
	 * 1st input of each gate
	 */
	for (uint64_t i = 0; i < read_circuit.gate_size; i++) {
		int gindex = read_circuit.task_schedule[i];
		f << read_circuit.gate_list[gindex].input[0] << " ";
	}
	f << endl;
	/*
	 * 2nd input of each gate
	 */
	for (uint64_t i = 0; i < read_circuit.gate_size; i++) {
		int gindex = read_circuit.task_schedule[i];
		f << read_circuit.gate_list[gindex].input[1] << " ";
	}
	f << endl;
	/*
	 *type of each gate
	 */
	for (uint64_t i = 0; i < read_circuit.gate_size; i++) {
		int gindex = read_circuit.task_schedule[i];
		f << (int) read_circuit.gate_list[gindex].type << " ";
	}
	f << endl;
	/*
	 * outputs : output wire index
	 */
	for (uint64_t i = 0; i < read_circuit.output_size; i++) {
		f << read_circuit.output_list[i] << " ";
	}
	f << endl;
	/*
	 * D : latch index
	 * it stores a wire index for DFF:
	 */
	for (uint64_t i = 0; i < read_circuit.dff_size; i++) {
		f << read_circuit.dff_list[i].input[0] << " ";  //D
	}
	f << endl;
	/*
	 * I : initial value index
	 * it store the input index or constant value for each DFF.
	 * I[i] == CONST_ZERO (== -2) : it means the initial value of the DFF is zero.
	 * At the first cycle, Garbler should send token[0] to Evaluator.
	 * I[i] == CONST_ONE (== -3) : it means the initial value of the DFF is one.
	 * At the first cycle, Garbler should send token[1] to Evaluator.
	 * I[i] > 0 : it means the initial value of the DFF is value of actual
	 * circuit init port.
	 */
	for (uint64_t i = 0; i < read_circuit.dff_size; i++) {
		f << (int64_t) read_circuit.dff_list[i].input[1] << " ";  //I
	}
	f << endl;

	f.close();

	return 0;
}

int ReadTGX(const string& file_name, GarbledCircuitCollection* garbled_circuit_collection) {
	using namespace boost::algorithm;

	std::ifstream f(file_name, std::ios::out);
	if (!f.is_open()) {
		LOG(ERROR) << "can't open " << file_name << endl;
		return FAILURE;
	}

	string line_temp;
	int number_of_lines = 0;
	while (std::getline(f, line_temp))
		++number_of_lines;
	garbled_circuit_collection->number_of_circuits = number_of_lines - 1;
	//reset f
	f.clear();
	f.seekg(0, std::ios::beg);

	garbled_circuit_collection->i_circuit_inputs = new int*[garbled_circuit_collection->number_of_circuits];
	garbled_circuit_collection->n_of_run = new int[garbled_circuit_collection->number_of_circuits];
	garbled_circuit_collection->n_of_clk = new int[garbled_circuit_collection->number_of_circuits];

	if (posix_memalign((void **) (&garbled_circuit_collection->garbled_circuits), 128,
			sizeof(GarbledCircuit) * garbled_circuit_collection->number_of_circuits)) {
		LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory" << endl;
		LOG(ERROR) << strerror(errno) << endl;
		return FAILURE;
	}

	string newLine;
//	getline(f, newLine);

	getline(f, newLine);
	vector < string > parsedLine;
	split(parsedLine, newLine, is_any_of(" "));
	garbled_circuit_collection->garbled_circuits[0].input_matrix_size = stoi(parsedLine[1], nullptr);
	garbled_circuit_collection->garbled_circuits[0].input_number_channels = stoi(parsedLine[2], nullptr);
	garbled_circuit_collection->garbled_circuits[0].bit_length = stoi(parsedLine[3], nullptr);

	for (int i = 0; i < garbled_circuit_collection->number_of_circuits; i++) {
		string scd_file;
		vector < string > parsedLine;
		getline(f, newLine);
		split(parsedLine, newLine, is_any_of(" "));

		//newLine format: %name Window_Size #filter stride PAD?N/Y

		int n = parsedLine.size();
		garbled_circuit_collection->garbled_circuits[i].circuitID = i;

		if (parsedLine[0] == string("CONV")) {
			garbled_circuit_collection->garbled_circuits[i].type = string("conv");
			garbled_circuit_collection->garbled_circuits[i].conv_layer = true;

			if (i > 0) {  //this conv layer is not an input layer... calculate parameters
				garbled_circuit_collection->garbled_circuits[i].input_matrix_size = garbled_circuit_collection->garbled_circuits[i - 1].output_matrix_size;
				garbled_circuit_collection->garbled_circuits[i].input_number_channels = garbled_circuit_collection->garbled_circuits[i - 1]
						.input_number_channels;
				garbled_circuit_collection->garbled_circuits[i].bit_length = 1;

			}

			uint64_t input_size = garbled_circuit_collection->garbled_circuits[i].input_matrix_size;
			uint64_t input_number_channels = garbled_circuit_collection->garbled_circuits[i].input_number_channels;
			uint64_t bit_length = garbled_circuit_collection->garbled_circuits[i].bit_length;

			uint64_t filter_size = garbled_circuit_collection->garbled_circuits[i].filter_size = stoi(parsedLine[1], nullptr);
			uint64_t number_filters = garbled_circuit_collection->garbled_circuits[i].number_filters = stoi(parsedLine[2], nullptr);
			uint64_t stride = garbled_circuit_collection->garbled_circuits[i].stride_size = stoi(parsedLine[3], nullptr);

			garbled_circuit_collection->n_of_run[i] = number_filters * (input_size - filter_size + 1) * (input_size - filter_size + 1);
			garbled_circuit_collection->n_of_clk[i] = 1;  // need to be updated to single MAC later on
			uint64_t dot_size = filter_size * filter_size;

			garbled_circuit_collection->i_circuit_inputs[i] = new int[2];
			garbled_circuit_collection->i_circuit_inputs[i][0] = 0;
			garbled_circuit_collection->i_circuit_inputs[i][1] = i - 1;

			uint64_t cc = (1 << bit_length) - 1;
			uint64_t output_bit_length = garbled_circuit_collection->garbled_circuits[i].output_bit_length = ceil(
					log2(cc * input_number_channels * filter_size * filter_size + 1));

			if (n == 6) {  //conv 5 16 1 N OCA
				if (parsedLine[5] == string("OCA")) {
					garbled_circuit_collection->garbled_circuits[i].type = string("oca");
					garbled_circuit_collection->garbled_circuits[i].conv_layer = false;

					garbled_circuit_collection->n_of_run[i] = garbled_circuit_collection->n_of_run[i - 1];
					int bit_length = garbled_circuit_collection->garbled_circuits[i - 1].output_bit_length;
					garbled_circuit_collection->garbled_circuits[i].number_filters = garbled_circuit_collection->garbled_circuits[i].input_number_channels =
							garbled_circuit_collection->garbled_circuits[i - 1].number_filters;
					garbled_circuit_collection->garbled_circuits[i].output_matrix_size = garbled_circuit_collection->garbled_circuits[i - 1].output_matrix_size;

					char buffer[200];

					char t = 'R';
					if (i > 0) {
						t = 'I';
					}

					if (i > 1) {
						sprintf(buffer, "./scd/netlists/CMP%c%d.scd", t, bit_length);
					} else {
						sprintf(buffer, "./scd/netlists/CMPS%c%d.scd", t, bit_length);
					}
				}
			}

			if (parsedLine[4] == string("N")) {
				garbled_circuit_collection->garbled_circuits[i].output_matrix_size = (input_size - filter_size) / stride + 1;
			} else {
				garbled_circuit_collection->garbled_circuits[i].output_matrix_size = input_size;
			}

			if (i == 0) {
				char buffer[200];
				if (garbled_circuit_collection->garbled_circuits[i].type == string("oca")) {
					sprintf(buffer, "./scd/netlists/sum%d.scd", (int) bit_length);
				} else {
					sprintf(buffer, "./scd/netlists/fxdBinDot%d_%d.scd", (int) bit_length, (int) dot_size);
				}
				scd_file = string(buffer);
			} else {
				char buffer[200];
				uint64_t popCountSize = dot_size * input_number_channels;
				sprintf(buffer, "./scd/netlists/XnorPopCount%d.scd", (int) popCountSize);
				scd_file = string(buffer);
			}

		} else {
			garbled_circuit_collection->garbled_circuits[i].conv_layer = false;

//			int n_before_io = 3;
//			int io = n - n_before_io;
//
//			garbled_circuit_collection->n_of_run[i] = stoi(parsedLine[0], nullptr);
			garbled_circuit_collection->n_of_clk[i] = 1;
//
//			scd_file = parsedLine[n_before_io - 1];

			// store the number of run
//			if (io == 0 || scd_file == string("MaxPool") || scd_file == string("CMPS") || scd_file == string("CMP") || scd_file == string("FC")) { //even though there is a number after name... set dependencies to i-1
			garbled_circuit_collection->i_circuit_inputs[i] = new int[2];
			garbled_circuit_collection->i_circuit_inputs[i][0] = 1;
			garbled_circuit_collection->i_circuit_inputs[i][1] = i - 1;
//			} else {
//				garbled_circuit_collection->i_circuit_inputs[i] = new int[io + 1];
//				garbled_circuit_collection->i_circuit_inputs[i][0] = io;
//				//		LOG(ERROR)<<endl<<garbled_circuit_collection->i_circuit_inputs[i][0]<<endl<<garbled_circuit_collection->n_of_run[i]<<endl<<garbled_circuit_collection->n_of_clk[i]<<endl;
//				for (int j = 1; j <= io; j++) { //iterating over circuit inputs matrix
//					garbled_circuit_collection->i_circuit_inputs[i][j] = stoi(parsedLine[j + n_before_io - 1], nullptr);
//				}
//			}

			if (parsedLine[0] == string("ACT")) {
				garbled_circuit_collection->garbled_circuits[i].type = string("act");
				garbled_circuit_collection->n_of_run[i] = garbled_circuit_collection->n_of_run[i - 1];
				int bit_length = garbled_circuit_collection->garbled_circuits[i - 1].output_bit_length;
				garbled_circuit_collection->garbled_circuits[i].number_filters = garbled_circuit_collection->garbled_circuits[i].input_number_channels =
						garbled_circuit_collection->garbled_circuits[i - 1].number_filters;
				garbled_circuit_collection->garbled_circuits[i].output_matrix_size = garbled_circuit_collection->garbled_circuits[i - 1].output_matrix_size;

				char buffer[200];

				char t = 'R';
				if (i > 0) {
					t = 'I';
				}

				if (i > 1) {
					sprintf(buffer, "./scd/netlists/CMP%c%d.scd", t, bit_length);
				} else {
					sprintf(buffer, "./scd/netlists/CMPS%c%d.scd", t, bit_length);
				}

				scd_file = string(buffer);
			}

			if (parsedLine[0] == string("MAXPOOL")) {
				garbled_circuit_collection->garbled_circuits[i].type = string("MaxPool");
				int mps = garbled_circuit_collection->garbled_circuits[i].max_pool_size = stoi(parsedLine[1], nullptr); // name size
				garbled_circuit_collection->n_of_run[i] = garbled_circuit_collection->n_of_run[i - 1] / mps / mps;
				garbled_circuit_collection->garbled_circuits[i].number_filters = garbled_circuit_collection->garbled_circuits[i].input_number_channels =
						garbled_circuit_collection->garbled_circuits[i - 1].number_filters;
				garbled_circuit_collection->garbled_circuits[i].output_matrix_size = garbled_circuit_collection->garbled_circuits[i - 1].output_matrix_size
						/ mps;

				char buffer[200];
				sprintf(buffer, "./scd/netlists/maxPool%d.scd", mps * mps);
				scd_file = string(buffer);
			}

			if (parsedLine[0] == string("FC")) {
				garbled_circuit_collection->garbled_circuits[i].type = string("FC");
				char buffer[200];
				garbled_circuit_collection->n_of_run[i] = stoi(parsedLine[1], nullptr); // name output_size
				int popCountSize = garbled_circuit_collection->n_of_run[i - 1];
				garbled_circuit_collection->garbled_circuits[i].output_bit_length = ceil(log2(popCountSize + 1));

				sprintf(buffer, "./scd/netlists/XnorPopCount%d.scd", popCountSize);
				scd_file = string(buffer);
			}

		}

		if (ReadSCD(scd_file, &garbled_circuit_collection->garbled_circuits[i]) == FAILURE) {
			LOG(ERROR) << "Error while reading scd file: " << scd_file << endl;
			return FAILURE;
		}

	}

	f.close();

	return SUCCESS;
}
