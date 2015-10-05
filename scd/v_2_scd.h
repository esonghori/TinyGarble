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
  vector<string> inport_list;
  vector<string> outport_list;
  vector<ReadGateString> gate_list_string;
  vector<ReadGateString> dff_list_string;
  uint no_of_g_inports;

  ReadCircuitString()
      : inport_list(0),
        outport_list(0),
        gate_list_string(0),
        dff_list_string(0) {
    no_of_g_inports = 0;
  }
  ;
};

class ReadGate {
 public:
  int input[2];
  int output;
  short type;
};

class ReadCircuit {

 public:
  vector<int> output_list;
  vector<ReadGate> gate_list;
  vector<ReadGate> dff_list;
  vector<int> task_schedule;

  uint no_of_inports;
  uint no_of_g_inports;

  uint no_of_outports;
  uint no_of_gates;
  uint no_of_dffs;

  ReadCircuit()
      : output_list(0),
        gate_list(0),
        dff_list(0),
        task_schedule(0) {
    no_of_inports = 0;
    no_of_g_inports = 0;
    no_of_outports = 0;
    no_of_gates = 0;
    no_of_dffs = 0;
  }
};

int TopSort(const vector<ReadGate>& G, int no_task, int *index);
int Schedule(const ReadCircuit &readCircuit, int no_core, int **core);
void QuickSort(int *, int *, int, int);
int GetMinIndex(int *, int);
int GetMax(int *, int);
int WriteSCD(const ReadCircuit &readCircuit, int c, const string &fileName);

#endif
