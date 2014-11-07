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

#ifdef __cplusplus
extern "C" {
#endif

int ANDGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int ANDNGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int NANDGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int NANDNGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int ORGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int ORNGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int NORGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int NORNGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int XORGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int XNORGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output);
int NOTGate		(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int output);
int genericGate	(GarbledCircuit *gc, GarblingContext *garblingContext, int input0, int input1, int output, int *vals, int type);
int fixedZeroWire(GarbledCircuit *gc, GarblingContext *garblingContext);
int fixedOneWire(GarbledCircuit *gc, GarblingContext *garblingContext);


#ifdef __cplusplus
}
#endif

#endif /* GATES_H_ */
