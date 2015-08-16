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

#include "include/read_netlist.h"

void verilog2SCD(const string &infilename, const string &outfilename, int c) {

  ReadCircuitString readCircuitString;
  ReadCircuit readCircuit;

  parse_netlist(infilename, readCircuitString);
  id_assignment(readCircuitString, readCircuit);
  topological_sort(readCircuit);

  writeSCD(readCircuit, c, outfilename);
}

void writeSCD(const ReadCircuit &readCircuit, int _c, const string &fileName) {
  ofstream f(fileName.c_str(), ios::out);
  if (!f.is_open()) {
    cout << "can't open " << fileName << endl;
    return;
  }

  int n = readCircuit.no_of_inports;  // # of inputs
  int g = readCircuit.no_of_g_inports;  // # of g inputs
  int p = readCircuit.no_of_dffs;  // # of DFF
  int m = readCircuit.no_of_outports;  // # of outputs
  int q = readCircuit.no_of_gates;  // # of gates
  int c = _c;  // # of sequential cycle

  f << n << " " << g << " " << p << " " << m << " " << q << " " << c << endl;

  /*
   * 1st input of each gate
   */
  for (int i = 0; i < q; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << readCircuit.gate_list[gindex].input[0] << " ";
  }
  f << endl;
  /*
   * 2nd input of each gate
   */
  for (int i = 0; i < q; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << readCircuit.gate_list[gindex].input[1] << " ";
  }
  f << endl;
  /*
   *type of each gate
   */
  for (int i = 0; i < q; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << (int) readCircuit.gate_list[gindex].type << " ";
  }
  f << endl;
  /*
   * outputs : output wire index
   */
  for (int i = 0; i < m; i++) {
    f << readCircuit.output_list[i] << " ";
  }
  f << endl;
  /*
   * D : latch index
   * it stores a wire index for DFF:
   */
  for (int i = 0; i < p; i++) {
    f << readCircuit.dff_list[i].input[0] << " ";  //D
  }
  f << endl;
  /*
   * I : initial value index
   * it store the input index or constant value for each DFF.
   * I[i] == CONST_ZERO (== -2) : it means the initial value of the DFF is zero. At the first cycle, Garbler should send token[0] to Evaluator.
   * I[i] == CONST_ONE (== -3) : it means the initial value of the DFF is one. At the first cycle, Garbler should send token[1] to Evaluator.
   * I[i] > 0 : it means the initial value of the DFF is value of actual circuit input (wire I[i]). At the first cycle, Evaluator should received the tokens from the Garbler (using OT or directly).
   */
  //TODO: some of the input wires are only connected to initial signal. Those wires do not require communication in cycles c > 1.
  for (int i = 0; i < p; i++) {
    f << readCircuit.dff_list[i].input[1] << " ";  //I
  }
  f << endl;

  f.close();
}

int main(int argc, char** argv) {
  if (argc < 4) {
    cout << "usage: " << argv[0]
        << " <verilog infilename> <scd outfilename> <c>" << endl;
    return -1;
  }
  string infilename(argv[1]);
  string outfilename(argv[2]);
  int c = atoi(argv[3]);
  verilog2SCD(infilename, outfilename, c);
}
