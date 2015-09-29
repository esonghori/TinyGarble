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

#include "scd.h"

#include <cstdlib>
#include <fstream>
#include <iostream>

int readCircuitFromFile(const string& fileName,
                        GarbledCircuit *garbledCircuit) {
  std::ifstream f(fileName, std::ios::out);
  if (!f.is_open()) {
    cerr << "can't open " << fileName << endl;
    return FAILURE;
  }

  int n;
  int g;
  int p;
  int m;
  int q;
  int c;

  f >> n >> g >> p >> m >> q >> c;

  garbledCircuit->n = n;
  garbledCircuit->g = g;
  garbledCircuit->p = p;
  garbledCircuit->m = m;
  garbledCircuit->q = q;
  garbledCircuit->c = c;
  garbledCircuit->r = n + p + q;

  posix_memalign((void **) (&garbledCircuit->garbledGates), 128,
                 sizeof(GarbledGate) * q);
  posix_memalign((void **) (&garbledCircuit->outputs), 128, sizeof(int) * m);
  garbledCircuit->wires = new Wire[garbledCircuit->r];
  garbledCircuit->D = new int[garbledCircuit->p];
  garbledCircuit->I = new int[garbledCircuit->p];

  if (garbledCircuit->garbledGates == nullptr
      || garbledCircuit->outputs == nullptr || garbledCircuit->wires == nullptr
      || garbledCircuit->D == nullptr || garbledCircuit->I == nullptr) {
    cerr << "Linux is a cheap miser that refuses to give us memory" << endl;
    return FAILURE;
  }

  int i;
  for (i = 0; i < q; i++) {
    garbledCircuit->garbledGates[i].output = n + p + i;
  }

  for (i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].input0;
  }

  for (i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].input1;
  }
  for (i = 0; i < q; i++) {
    f >> garbledCircuit->garbledGates[i].type;
  }
  for (i = 0; i < m; i++) {
    f >> garbledCircuit->outputs[i];
  }
  for (i = 0; i < p; i++) {
    f >> garbledCircuit->D[i];
  }
  for (i = 0; i < p; i++) {
    f >> garbledCircuit->I[i];
  }

  f.close();

  return SUCCESS;
}
