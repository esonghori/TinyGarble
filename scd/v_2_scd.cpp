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

#include "scd/parse_netlist.h"
#include "scd/scd.h"
#include "scd/scheduling.h"
#include "util/log.h"

using std::endl;

int Verilog2SCD(const string &infilename, const string &outfilename) {

  ReadCircuitString readCircuitString;
  ReadCircuit readCircuit;

  if (ParseNetlist(infilename, readCircuitString) == FAILURE) {
    LOG(ERROR) << "parsing verilog netlist failed." << endl;
    return FAILURE;
  }
  if (IdAssignment(readCircuitString, readCircuit) == FAILURE) {
    LOG(ERROR) << "id assignment to netlist components failed." << endl;
    return FAILURE;
  }
  if (SortNetlist(readCircuit, readCircuitString) == FAILURE) {
    LOG(ERROR) << "topological sort failed." << endl;
    return FAILURE;
  }

  if (WriteSCD(readCircuit, outfilename) == FAILURE) {
    LOG(ERROR) << "write result to SCD file failed." << endl;
    return FAILURE;
  }

  return SUCCESS;
}
