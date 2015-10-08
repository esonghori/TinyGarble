/*
 This file is part of TinyGarble.

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

#ifndef SCD_V_2_SCD_H_
#define SCD_V_2_SCD_H_

#include <string>
#include <vector>
using std::vector;
using std::string;

#define MAX_NO_OF_INPUTS 20000
#define MAX_NO_OF_OUTPUTS 20000
#define MAX_NO_OF_GATES 100000
#define DEBUG_PARSER 0
#define DEBUG_SCHEDULER 0

#ifdef DEBUG
#define VERBOSE
#endif

class ReadGateString {
 public:
  string input[2];
  string output;
  short type;
};

class ReadCircuitString {

 public:
  vector<ReadGateString> gate_list_string;
  vector<ReadGateString> dff_list_string;
  uint64_t g_init_size;
  uint64_t e_init_size;
  uint64_t g_input_size;
  uint64_t e_input_size;
  uint64_t output_size;

  ReadCircuitString()
      : gate_list_string(0),
        dff_list_string(0) {
    g_init_size = 0;
    e_init_size = 0;
    g_input_size = 0;
    e_input_size = 0;
    output_size = 0;
  }
  ;
};

class ReadGate {
 public:
  int64_t input[2];
  int64_t output;
  short type;
};

class ReadCircuit {

 public:
  vector<uint64_t> output_list;
  vector<ReadGate> gate_list;
  vector<ReadGate> dff_list;
  vector<uint64_t> task_schedule;

  uint64_t g_init_size;
  uint64_t e_init_size;
  uint64_t g_input_size;
  uint64_t e_input_size;
  uint64_t dff_size;
  uint64_t gate_size;
  uint64_t output_size;

  ReadCircuit()
      : output_list(0),
        gate_list(0),
        dff_list(0),
        task_schedule(0) {
    g_init_size = 0;
    e_init_size = 0;
    g_input_size = 0;
    e_input_size = 0;
    dff_size = 0;
    gate_size = 0;
    output_size = 0;
  }
};


#endif
