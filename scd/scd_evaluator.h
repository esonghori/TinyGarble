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

#ifndef SCD_SCD_EVALUATOR_H_
#define SCD_SCD_EVALUATOR_H_

#include <openssl/bn.h>
#include <string>
#include "garbled_circuit/garbled_circuit.h"

using std::string;

void EvalauatePlaintext(const GarbledCircuit& garbled_circuit,
                        const BIGNUM* g_init, const BIGNUM* e_init,
                        const BIGNUM* g_input, const BIGNUM* e_input,
                        uint64_t clock_cycles, BIGNUM** outputs);
int EvalauatePlaintextStr(const string& scd_file_address,
                          const string& g_init_str, const string& e_init_str,
                          const string& g_input_str, const string& e_input_str,
                          uint64_t clock_cycles, int output_mode,
                          string* outputs_str);

#endif /* SCD_SCD_EVALUATOR_H_ */
