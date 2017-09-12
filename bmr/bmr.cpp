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
  std::ofstream f(file_name.c_str(), std::ios::out);
  if (!f.is_open()) {
    LOG(ERROR) << "can't open " << file_name << endl;
    return -1;
  }
  
  uint64_t no_parties = 3;
  
  f << "# first row is comment" << endl;
  f << read_circuit.gate_size << " " << no_parties << " " << read_circuit.wire_size << endl;
  //for (uint64_t i = 0; i < no_parties; i++){
	  f << "P" << 0 << " " << read_circuit.g_input_size << endl;
	  for (uint64_t j = 0; j < read_circuit.g_input_size; j++)
		f << j << endl;
	  f << "P" << 1 << " " << read_circuit.e_input_size << endl;
	  for (uint64_t j = 0; j < read_circuit.e_input_size; j++)
		f << j + read_circuit.g_input_size << endl;
  //}
  f << "Out " << read_circuit.output_size << endl;
  for (uint64_t i = 0; i < read_circuit.output_size; i++){
    f << read_circuit.output_list[i] << endl;
  }
  
  f << "# list of gates" << endl;
  for (uint64_t i = 0; i < read_circuit.gate_size; i++) {
    int gindex = read_circuit.task_schedule[i];
    f << read_circuit.gate_list[gindex].input[0] << " " << read_circuit.gate_list[gindex].input[1] << " " << gindex << " ";
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
	else if (read_circuit.gate_list[gindex].type == NOTGATE) f << "0011" << endl;
  }

  f.close();

  return 0;
}
