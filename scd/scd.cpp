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

#include <cerrno>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include "util/log.h"

int ReadSCD(const string& fileName, GarbledCircuit* garbledCircuit) {
  std::ifstream f(fileName, std::ios::out);
  if (!f.is_open()) {
    LOG(ERROR) << "can't open " << fileName << endl;
    return FAILURE;
  }

  f >> garbledCircuit->g_init_size >> garbledCircuit->e_init_size
      >> garbledCircuit->g_input_size >> garbledCircuit->e_input_size
      >> garbledCircuit->dff_size >> garbledCircuit->output_size
      >> garbledCircuit->gate_size;

  if (posix_memalign((void **) (&garbledCircuit->garbledGates), 128,
                     sizeof(GarbledGate) * garbledCircuit->gate_size)) {
    LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory"
               << endl;
    LOG(ERROR) << strerror(errno) << endl;
    return FAILURE;
  }
  if (posix_memalign((void **) (&garbledCircuit->outputs), 128,
                     sizeof(int64_t) * garbledCircuit->output_size)) {
    LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory"
               << endl;
    LOG(ERROR) << strerror(errno) << endl;
    return FAILURE;
  }
  garbledCircuit->D = new int64_t[garbledCircuit->dff_size];
  garbledCircuit->I = new int64_t[garbledCircuit->dff_size];

  if (garbledCircuit->garbledGates == nullptr
      || garbledCircuit->outputs == nullptr || garbledCircuit->D == nullptr
      || garbledCircuit->I == nullptr) {
    LOG(ERROR) << "Linux is a cheap miser that refuses to give us memory"
               << endl;
    return FAILURE;
  }

  for (uint64_t i = 0; i < garbledCircuit->gate_size; i++) {
    garbledCircuit->garbledGates[i].output = garbledCircuit->get_gate_lo_index()
        + i;
  }

  for (uint64_t i = 0; i < garbledCircuit->gate_size; i++) {
    f >> garbledCircuit->garbledGates[i].input0;
  }

  for (uint64_t i = 0; i < garbledCircuit->gate_size; i++) {
    f >> garbledCircuit->garbledGates[i].input1;
  }
  for (uint64_t i = 0; i < garbledCircuit->gate_size; i++) {
    f >> garbledCircuit->garbledGates[i].type;
  }
  for (uint64_t i = 0; i < garbledCircuit->output_size; i++) {
    f >> garbledCircuit->outputs[i];
  }
  for (uint64_t i = 0; i < garbledCircuit->dff_size; i++) {
    f >> garbledCircuit->D[i];
  }
  for (uint64_t i = 0; i < garbledCircuit->dff_size; i++) {
    f >> garbledCircuit->I[i];
  }

  f.close();

  return SUCCESS;
}

int WriteSCD(const ReadCircuit& readCircuit, const string &fileName) {
  std::ofstream f(fileName.c_str(), std::ios::out);
  if (!f.is_open()) {
    LOG(ERROR) << "can't open " << fileName << endl;
    return -1;
  }

  f << readCircuit.g_init_size << " " << readCircuit.e_init_size << " "
    << readCircuit.g_input_size << " " << readCircuit.e_input_size << " "
    << readCircuit.dff_size << " " << readCircuit.output_size << " "
    << readCircuit.gate_size << endl;

  /*
   * 1st input of each gate
   */
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << readCircuit.gate_list[gindex].input[0] << " ";
  }
  f << endl;
  /*
   * 2nd input of each gate
   */
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << readCircuit.gate_list[gindex].input[1] << " ";
  }
  f << endl;
  /*
   *type of each gate
   */
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    int gindex = readCircuit.task_schedule[i];
    f << (int) readCircuit.gate_list[gindex].type << " ";
  }
  f << endl;
  /*
   * outputs : output wire index
   */
  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    f << readCircuit.output_list[i] << " ";
  }
  f << endl;
  /*
   * D : latch index
   * it stores a wire index for DFF:
   */
  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
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
  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    f << (int64_t) readCircuit.dff_list[i].input[1] << " ";  //I
  }
  f << endl;

  f.close();

  return 0;
}
