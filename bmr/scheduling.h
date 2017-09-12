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

#ifndef BMR_SCHEDULING_H_
#define BMR_SCHEDULING_H_

#include "bmr/v_2_bmr.h"

int SortNetlist(ReadBMRCircuit* read_circuit,
                const ReadBMRCircuitString& read_circuit_string);
int WriteMapping(const ReadBMRCircuitString& read_circuit_string,
                 const ReadBMRCircuit &read_circuit,
                 const string& out_mapping_filename);

#endif /* BMR_SCHEDULING_H_ */
