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

#ifndef GATES_H_
#define GATES_H_

inline int ANDGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext, int input0, int input1, int output);
inline int ORGate(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
inline int XORGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext, int input0, int input1, int output);
int genericGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,  int input0, int input1, int output, int *vals, int type);
int fixedZeroWire(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext);
int fixedOneWire(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext);
int NOTGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,  int input0, int output);

#endif /* GATES_H_ */
