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

#include "bmr/bmr.h"

#include <cerrno>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <new>
#include "util/log.h"
#include "util/common.h"

int WriteBMRcircuit(const ReadBMRCircuit& read_circuit, const string &file_name) {
	//NOT_GATE_HACK: could not make NOT gates working with BMR. As a work around creating a "always 1" wire by XNORing the first input with itself, then XORing with that wire for inverting.
  std::ofstream f(file_name.c_str(), std::ios::out);
  if (!f.is_open()) {
    LOG(ERROR) << "can't open " << file_name << endl;
    return -1;
  }
  
  f << "# first row is comment" << endl;
  //NOT_GATE_HACK: both number of gates and number of wires increase by 1
  f << read_circuit.gate_size + 1 << " " << read_circuit.no_of_parties << " " << read_circuit.wire_size + 1 << endl; 							

  int input_index = 0;
  for (uint64_t i = 0; i < read_circuit.no_of_parties; i++){
	  f << "P" << i << " " << read_circuit.input_size[i] << endl;
	  for (uint64_t j = 0; j < read_circuit.input_size[i]; j++)
		f << input_index++  << endl;
  }
  f << "Out " << read_circuit.output_size << endl;
  for (uint64_t i = 0; i < read_circuit.output_size; i++){
    f << read_circuit.output_list[i] << endl;
  }
  
  int64_t total_input_size = read_circuit.get_init_input_size();
  f << "# list of gates" << endl;
   //NOT_GATE_HACK: XNORing the first two inputs and assigning the last index to the "always 1" wire
  f << "0 0 " << read_circuit.wire_size << " 1001" << endl;
  
  for (uint64_t i = 0; i < read_circuit.gate_size; i++) {
    int gindex = read_circuit.task_schedule[i];
    f << read_circuit.gate_list[gindex].input[0] << " ";
	//NOT_GATE_HACK: if input[1] is -1 (NOT_GATE) replace it with the "always 1" wire
	if (read_circuit.gate_list[gindex].input[1] > -1)
		f << read_circuit.gate_list[gindex].input[1] << " ";
	else
		f << read_circuit.wire_size << " ";
	f << i + total_input_size << " ";
	if (read_circuit.gate_list[gindex].type == ANDGATE) f << "0001" << endl;
	else if (read_circuit.gate_list[gindex].type == ANDNGATE) f << "0010" << endl;
	else if (read_circuit.gate_list[gindex].type == NANDGATE) f << "1110" << endl;
	else if (read_circuit.gate_list[gindex].type == NANDNGATE) f << "1101" << endl;
	else if (read_circuit.gate_list[gindex].type == ORGATE) f << "0111" << endl;
	else if (read_circuit.gate_list[gindex].type == ORNGATE) f << "1011" << endl;
	else if (read_circuit.gate_list[gindex].type == NORGATE) f << "1000" << endl;
	else if (read_circuit.gate_list[gindex].type == NORNGATE) f << "0100" << endl;
	else if (read_circuit.gate_list[gindex].type == XORGATE) f << "0110" << endl;
	else if (read_circuit.gate_list[gindex].type == XNORGATE) f << "1001" << endl;
	else if (read_circuit.gate_list[gindex].type == NOTGATE) f << "0110" << endl; //NOT_GATE_HACK: XORing with "always 1" wire to invert 
  }

  f.close();

  return 0;
}
