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

#include "garbled_circuit/garbled_circuit.h"

#include <boost/program_options.hpp>
#include <openssl/bn.h>
#include "util/common.h"
#include "util/log.h"
#include "util/util.h"
#include "scd/scd.h"

namespace po = boost::program_options;
using std::string;

void EvalauatePlaintext(const GarbledCircuit& garbled_circuit,
                        const BIGNUM* g_init, const BIGNUM* e_init,
                        const BIGNUM* g_input, const BIGNUM* e_input,
                        uint64_t clock_cycles,
                        BIGNUM** outputs) {

  bool* wires = new bool[garbled_circuit.get_wire_size()];

  if (*outputs == nullptr) {
    *outputs = BN_new();
  }
  bn_expand(*outputs,
            clock_cycles * garbled_circuit.output_size);

  for (uint64_t cid = 0; cid < clock_cycles; cid++) {  //for each clock cycle
    //dff initial value
    uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
    if (cid == 0) {
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        int64_t wire_index = garbled_circuit.I[i];
        if (wire_index == CONST_ZERO) {
          wires[dff_bias + i] = false;
        } else if (wire_index == CONST_ONE) {
          wires[dff_bias + i] = true;
        } else if (wire_index >= 0) {
          if (wire_index < (int64_t) garbled_circuit.g_init_size) {
            wires[dff_bias + i] = BN_is_bit_set(g_init, wire_index);
          } else {
            wires[dff_bias + i] = BN_is_bit_set(
                g_init, wire_index - (int64_t) garbled_circuit.g_init_size);
          }
        } else {
          LOG(ERROR) << "Invalid I: " << wire_index << endl;
        }

      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
        uint64_t wire_index = garbled_circuit.D[i];
        wires[dff_bias + i] = wires[wire_index];
      }
    }

    // inputs
    uint64_t input_bias = garbled_circuit.get_input_lo_index();
    for (int64_t i = 0; i < (int64_t) garbled_circuit.get_input_size(); i++) {
      if (i < (int64_t) garbled_circuit.g_input_size) {  // input belongs to g
        wires[input_bias + i] = BN_is_bit_set(
            g_input, cid * garbled_circuit.g_input_size + i);
        LOG(INFO) << "g_input " << i << " = " <<  wires[input_bias + i] << endl;
      } else {
        wires[input_bias + i] = BN_is_bit_set(
            e_input,
            cid * garbled_circuit.e_input_size
                + (i - (int64_t) garbled_circuit.g_input_size));
        LOG(INFO) << "e_input " << i << " = " <<  wires[input_bias + i] << endl;
      }
    }

    for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) {  // for each gates
      GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
      uint64_t input0 = garbledGate.input0;
      uint64_t input1 = garbledGate.input1;
      uint64_t output = garbledGate.output;
      int type = garbledGate.type;

      if (type != NOTGATE)
        wires[output] = GateOperator(type, wires[input0], wires[input1]);
      else
        wires[output] = GateOperator(type, wires[input0]);
    }

    for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
      if (wires[garbled_circuit.outputs[i]])
        BN_set_bit(*outputs, cid * garbled_circuit.output_size + i);
      else
        BN_clear_bit(*outputs, cid * garbled_circuit.output_size + i);
    }
  }
  delete[] wires;
}

int main(int argc, char*argv[]) {
  LogInitial(argc, argv);

  string scd_file_address;
  string g_init_str;
  string e_init_str;
  string g_input_str;
  string e_input_str;
  uint64_t clock_cycles;
  po::options_description desc("");
  desc.add_options()("help,h", "produce help message")  //
  ("scd_file,i",
   po::value<string>(&scd_file_address)->default_value(
       "../scd/netlists/test4.scd"),
   "scd address")  // default is sum circuit scd
  ("clock_cycles", po::value<uint64_t>(&clock_cycles)->default_value(1),
      "Number of clock cycles to evaluate the circuit.")  //
   ("g_init", po::value<string>(&g_init_str)->default_value("0"),
   "g_init in hexadecimal.")  //
  ("e_init", po::value<string>(&e_init_str)->default_value("0"),
   "e_init in hexadecimal.")  //
  ("g_input", po::value<string>(&g_input_str)->default_value("5"),
   "g_input in hexadecimal.")  //
  ("e_input", po::value<string>(&e_input_str)->default_value("4"),
   "e_input in hexadecimal.");

  po::variables_map vm;
  try {
    po::parsed_options parsed = po::command_line_parser(argc, argv).options(
        desc).allow_unregistered().run();
    po::store(parsed, vm);
    if (vm.count("help")) {
      std::cout << desc << endl;
      return SUCCESS;
    }
    po::notify(vm);
  } catch (po::error& e) {
    LOG(ERROR) << "ERROR: " << e.what() << endl << endl;
    std::cout << desc << endl;
    return FAILURE;
  }

  BIGNUM* g_init = BN_new();
  BIGNUM* e_init = BN_new();
  BIGNUM* g_input = BN_new();
  BIGNUM* e_input = BN_new();

  BN_hex2bn(&g_init, g_init_str.c_str());
  BN_hex2bn(&e_init, e_init_str.c_str());
  BN_hex2bn(&g_input, g_input_str.c_str());
  BN_hex2bn(&e_input, e_input_str.c_str());

  GarbledCircuit garbled_circuit;
  if (ReadSCD(scd_file_address, &garbled_circuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return FAILURE;
  }

  BIGNUM* outputs = BN_new();
  EvalauatePlaintext(garbled_circuit, g_init, e_init, g_input, e_input, clock_cycles,
                     &outputs);

  BN_print_fp(stdout, outputs);
  std::cout << endl;

  LogFinish();
  return SUCCESS;
}

