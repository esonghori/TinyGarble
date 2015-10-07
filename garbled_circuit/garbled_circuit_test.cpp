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

#include <openssl/bn.h>
#include "util/common.h"

void EvalauatePlaintext(const GarbledCircuit *garbledCircuit,
                        const BIGNUM* inputs, const BIGNUM* initialDFFs,
                        BIGNUM** outputs) {
  uint64_t n = garbledCircuit->n;
  uint64_t m = garbledCircuit->m;
  uint64_t p = garbledCircuit->p;
  uint64_t q = garbledCircuit->q;
  uint64_t r = garbledCircuit->r;
  uint64_t c = garbledCircuit->c;

  bool* wires = new bool[r];

  if (*outputs == nullptr) {
    *outputs = BN_new();
  }
  bn_expand(*outputs, c * m);

  for (uint64_t cid = 0; cid < c; cid++) {  //for each clock cycle
    for (uint64_t i = 0; i < n; i++) {  //inputs
      wires[i] = BN_is_bit_set(inputs, cid * n + i);
    }

    if (cid == 0) {  //dff initial value
      for (uint64_t i = 0; i < p; i++) {
        wires[n + i] = BN_is_bit_set(initialDFFs, i);
      }
    } else {  //copy latched labels
      for (uint64_t i = 0; i < p; i++) {
        uint64_t wireIndex = garbledCircuit->D[i];
        wires[n + i] = wires[wireIndex];
      }
    }

    for (uint64_t i = 0; i < q; i++) {  //for each gates
      GarbledGate *garbledGate = &(garbledCircuit->garbledGates[i]);

      uint64_t input0 = garbledGate->input0;
      uint64_t input1 = garbledGate->input1;
      uint64_t output = garbledGate->output;
      int type = garbledGate->type;

      if (type != NOTGATE)
        wires[output] = GateOperator(type, wires[input0], wires[input1]);
      else
        wires[output] = GateOperator(type, wires[input0]);
    }

    for (uint64_t i = 0; i < m; i++) {
      if (wires[garbledCircuit->outputs[i]])
        BN_set_bit(*outputs, cid * m + i);
      else
        BN_clear_bit(*outputs, cid * m + i);
    }
  }
  delete[] wires;
}



