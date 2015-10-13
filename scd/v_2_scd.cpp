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
#include "scd/scd.h"
#include "scd/parse_netlist.h"
#include "util/log.h"

namespace po = boost::program_options;
using std::ofstream;
using std::endl;

int Verilog2SCD(const string &infilename, const string &outfilename) {

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

  if (WriteSCD(readCircuit,outfilename) == -1) {
    LOG(ERROR) << "write result to SCD file failed." << endl;
    return -1;
  }

  return 0;
}

int main(int argc, char** argv) {
  LogInitial(argc, argv);

  string input_netlist_file;
  string output_scd_file;

  po::options_description desc(
      "Read Netlist, TinyGarble version 0.1\nAllowed options");
  desc.add_options()  //
  ("help,h", "produce help message.")  //
  ("netlist,i",
   po::value<string>(&input_netlist_file)->default_value("scd/netlists/test.v"),
   "Input netlist (verilog .v) file address.")  //
  ("scd,o",
   po::value<string>(&output_scd_file)->default_value("scd/netlists/test.scd"),
   "Output simple circuit description (scd) file address.");

  po::variables_map vm;
  try {
    po::parsed_options parsed = po::command_line_parser(argc, argv).options(
        desc).allow_unregistered().run();
    po::store(parsed, vm);
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

  if (Verilog2SCD(input_netlist_file, output_scd_file) == -1) {
    LOG(ERROR) << "Verilog to SCD failed." << endl;
    return -1;
  }

  LogFinish();
  return 0;
}
