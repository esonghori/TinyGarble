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

#include "scd/v_2_scd.h"
 
#include <boost/program_options.hpp>
#include <iostream>
#include <fstream>
#include "scd/parse_netlist.h"
#include "util/log.h"

namespace po = boost::program_options;
using std::ofstream;
using std::endl;

int Verilog2SCD(const string &infilename, const string &outfilename, int c) {

  ReadCircuitString readCircuitString;
  ReadCircuit readCircuit;

  if (ParseNetlist(infilename, readCircuitString) == -1) {
    LOG(ERROR) << "parsing verilog netlist failed." << endl;
    return -1;
  }
  if (IdAssignment(readCircuitString, readCircuit) == -1) {
    LOG(ERROR) << "id assignment to netlist components failed." << endl;
    return -1;
  }
  if (TopologicalSort(readCircuit) == -1) {
    LOG(ERROR) << "topological sort failed." << endl;
    return -1;
  }

  if (WriteSCD(readCircuit, c, outfilename) == -1) {
    LOG(ERROR) << "write result to SCD file failed." << endl;
    return -1;
  }

  return 0;
}

int WriteSCD(const ReadCircuit &readCircuit, int c_, const string &fileName) {
  ofstream f(fileName.c_str(), std::ios::out);
  if (!f.is_open()) {
    LOG(ERROR) << "can't open " << fileName << endl;
    return -1;
  }

  int n = readCircuit.no_of_inports;  // # of inputs
  int g = readCircuit.no_of_g_inports;  // # of g inputs
  int p = readCircuit.no_of_dffs;  // # of DFF
  int m = readCircuit.no_of_outports;  // # of outputs
  int q = readCircuit.no_of_gates;  // # of gates
  int c = c_;  // # of sequential cycle

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
   * I[i] == CONST_ZERO (== -2) : it means the initial value of the DFF is zero.
   * At the first cycle, Garbler should send token[0] to Evaluator.
   * I[i] == CONST_ONE (== -3) : it means the initial value of the DFF is one.
   * At the first cycle, Garbler should send token[1] to Evaluator.
   * I[i] > 0 : it means the initial value of the DFF is value of actual
   * circuit input (wire I[i]). At the first cycle, Evaluator should received
   * the tokens from the Garbler (using OT or directly).
   */
  // TODO(ebi): some of the input wires are only connected to initial signal.
  // Those wires do not require communication in cycles c > 1.
  for (int i = 0; i < p; i++) {
    f << readCircuit.dff_list[i].input[1] << " ";  //I
  }
  f << endl;

  f.close();

  return 0;
}

int main(int argc, char** argv) {

  string input_netlist_file;
  string output_scd_file;
  int clock_cycles;

  po::options_description desc(
      "Read Netlist, TinyGarble version 0.1\nAllowed options");
  desc.add_options()  //
  ("help,h", "produce help message.")  //
  ("netlist,i", po::value<string>(&input_netlist_file)->default_value("netlists/test.v"),
   "Input netlist (verilog .v) file address.")  //
  ("scd,o", po::value<string>(&output_scd_file)->default_value("netlists/test.scd"),
   "Output simple circuit description (scd) file address.")  //
  ("clock,c", po::value<int>(&clock_cycles)->default_value(1),
   "Number of clock cycles for sequential circuits");

  po::variables_map vm;
  try {
    po::store(po::parse_command_line(argc, argv, desc), vm);
    if (vm.count("help")) {
      std::cout << desc << endl;
      return 0;
    }
    po::notify(vm);
  } catch (po::error& e) {
    LOG(ERROR) << "ERROR: " << e.what() << endl << endl;
    std::cout << desc << endl;
    return -1;
  }
  if (vm.count("netlist")) {
    input_netlist_file = vm["netlist"].as<string>();
  }

  if (vm.count("scd")) {
    output_scd_file = vm["scd"].as<string>();
  }
  if (vm.count("scd")) {
    clock_cycles = vm["clock"].as<int>();
  }

  if (Verilog2SCD(input_netlist_file, output_scd_file, clock_cycles) == -1) {
    LOG(ERROR) << "Verilog to SCD failed." << endl;
    return -1;
  }
  return 0;
}
