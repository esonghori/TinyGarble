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

#ifndef SCD_READ_SCD_H_
#define SCD_READ_SCD_H_

#include "util/common.h"
#include "garbled_circuit/garbled_circuit.h"

/**
 * @brief Read SCD file and initialize garbledCircuit
 *
 *
 * @param param1 SCD file name.
 * @param param2 pointer to garbledCircuit. The garbledCircuit will be filled.
 * @return 0 in success and -1 in failure.
 *
 * @see JustGarble paper.
 * @see TinyGarble paper.
 */
int ReadSCD(const string& fileName, GarbledCircuit *garbledCircuit);


#endif /* SCD_READ_SCD_H_ */
