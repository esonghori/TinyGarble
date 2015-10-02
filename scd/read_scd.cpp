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

#include "scd/read_scd.h"

#include <cerrno>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <iostream>


int readSCD(const string& fileName,
                        GarbledCircuit *garbledCircuit) {
  std::ifstream f(fileName, std::ios::out);
  if (!f.is_open()) {
    cerr << "can't open " << fileName << endl;
    return FAILURE;
  }

  uint64_t n;
  uint64_t g;
  uint64_t p;
  uint64_t m;
  uint64_t q;
  uint64_t c;

  f >> n >> g >> p >> m >> q >> c;

  garbledCircuit->n = n;
  garbledCircuit->g = g;
  garbledCircuit->p = p;
  garbledCircuit->m = m;
  garbledCircuit->q = q;
  garbledCircuit->c = c;
  garbledCircuit->r = n + p + q;

  if(posix_memalign((void **) (&garbledCircuit->garbledGates), 128,
                 sizeof(GarbledGate) * q)) {
    cerr << "Linux is a cheap miser that refuses to give us memory" << endl;
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  if(posix_memalign((void **) (&garbledCircuit->outputs), 128,
    sizeof(uint64_t) * m)) {
    cerr << "Linux is a cheap miser that refuses to give us memory" << endl;
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  garbledCircuit->wires = new Wire[garbledCircuit->r];
  garbledCircuit->D = new uint64_t[garbledCircuit->p];
  garbledCircuit->I = new uint64_t[garbledCircuit->p];

  if (garbledCircuit->garbledGates == nullptr
      || garbledCircuit->outputs == nullptr || garbledCircuit->wires == nullptr
      || garbledCircuit->D == nullptr || garbledCircuit->I == nullptr) {
    cerr << "Linux is a cheap miser that refuses to give us memory" << endl;
    return FAILURE;
  }

  for (uint64_t i = 0; i < q; i++) {
    garbledCircuit->garbledGates[i].output = n + p + i;
  }

  for (uint64_t i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].input0;
  }

  for (uint64_t i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].input1;
  }
  for (uint64_t i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].type;
  }
  for (uint64_t i = 0; i < m; i++) {
    f >> garbledCircuit->outputs[i];
  }
  for (uint64_t i = 0; i < p; i++) {
    f >> garbledCircuit->D[i];
  }
  for (uint64_t i = 0; i < p; i++) {
    f >> garbledCircuit->I[i];
  }

  f.close();

  return SUCCESS;
}
