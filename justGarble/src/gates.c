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

#include "../include/garble.h"
#include "../include/common.h"
#include "../include/gates.h"
#include "../include/justGarble.h"

int ANDGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,
		int input0, int input1, int output) {
	int vals[] = { 0, 0, 0, 1 };
	return genericGate(garbledCircuit, garblingContext, input0, input1, output,
			vals, ANDGATE);
}

#ifdef FREE_XOR

int XORGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext, int input0, int input1, int output) {
	if(garbledCircuit->wires[input0].id == 0) {
		printf("ERROR: Uninitialized input at wire 0 %d, gate %ld\n", input0, garblingContext->gateIndex);
	}
	if(garbledCircuit->wires[input1].id == 0) {
		printf("ERROR: Uninitialized input at wire 1 %d, gate %ld\n", input1, garblingContext->gateIndex);
	}
	if(garbledCircuit->wires[output].id != 0) {
		printf("ERROR: Reusing output at wire %d\n", output);
	}
	createNewWire(&(garbledCircuit->wires[output]), garblingContext, output);

	garbledCircuit->wires[output].label0 = xorBlocks(garbledCircuit->wires[input0].label0, garbledCircuit->wires[input1].label0);
	garbledCircuit->wires[output].label1 = xorBlocks(garbledCircuit->wires[input0].label1, garbledCircuit->wires[input1].label0);
	GarbledGate *garbledGate = &(garbledCircuit->garbledGates[garblingContext->gateIndex]);
	if (garbledGate->id != 0)
	dbgs("Reusing a gate");
	garbledGate->id = XOR_ID;
	garbledGate->type = XORGATE;
	garblingContext->gateIndex++;
	garbledGate->input0 = input0;
	garbledGate->input1 = input1;
	garbledGate->output = output;

	return 0;

}

#else
int XORGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,
		int input0, int input1, int output) {
	int vals[] = { 0, 1, 1, 0 };
	return genericGate(garbledCircuit, garblingContext, input0, input1, output,
			vals, XORGATE);
}
#endif

int ORGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,
		int input0, int input1, int output) {
	int vals[] = { 0, 1, 1, 1 };
	return genericGate(garbledCircuit, garblingContext, input0, input1, output,
			vals, ORGATE);
}

int fixedZeroWire(GarbledCircuit *garbledCircuit,
		GarblingContext *garblingContext) {
	int ind = getNextWire(garblingContext);
	garblingContext->fixedWires[ind] = FIXED_ZERO_GATE;
	Wire *wire = &garbledCircuit->wires[ind];
	if (wire->id != 0)
		printf("ERROR: Reusing output at wire %d\n", ind);
	wire->id = ind;
	wire->label0 = randomBlock();
	wire->label1 = xorBlocks(garblingContext->R, wire->label0);
	return ind;

}
int fixedOneWire(GarbledCircuit *garbledCircuit,
		GarblingContext *garblingContext) {
	int ind = getNextWire(garblingContext);
	garblingContext->fixedWires[ind] = FIXED_ONE_GATE;
	Wire *wire = &garbledCircuit->wires[ind];
	wire->id = ind;
	wire->label0 = randomBlock();
	wire->label1 = xorBlocks(garblingContext->R, wire->label0);
	return ind;
}

int NOTGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext,
		int input0, int output) {
	int vals[] = { 1, 0, 1, 0 };
	return genericGate(garbledCircuit, garblingContext, 0, input0, output, vals,
			NOTGATE);
}

#ifdef ROW_REDUCTION

int genericGate(GarbledCircuit *garbledCircuit, GarblingContext *garblingContext, int input0, int input1, int output, int *vals, int type) {
	createNewWire(&(garbledCircuit->wires[output]), garblingContext, output);

	GarbledGate *garbledGate = &(garbledCircuit->garbledGates[garblingContext->gateIndex]);
	GarbledTable *garbledTable = &(garbledCircuit->garbledTable[garblingContext->tableIndex]);

	garbledGate->id = garblingContext->gateIndex;
	garbledGate->type = type;
	garbledGate->input0 = input0;
	garbledGate->input1 = input1;
	garbledGate->output = output;

	block blocks[4];
	block keys[4];
	long lsb0 = getLSB(garbledCircuit->wires[input0].label0);
	long lsb1 = getLSB(garbledCircuit->wires[input1].label0);
	block tweak;
	block keyToEncrypt;

	tweak = makeBlock(garblingContext->gateIndex, (long)0);
	garblingContext->gateIndex++;
	garblingContext->tableIndex++;

	return garbledGate->id;
}
#else

int genericGate(GarbledCircuit *garbledCircuit,
		GarblingContext *garblingContext, int input0, int input1, int output,
		int *vals, int type) {
	createNewWire(&(garbledCircuit->wires[output]), garblingContext, output);
	GarbledGate *garbledGate =
			&(garbledCircuit->garbledGates[garblingContext->gateIndex]);

	garbledGate->id = garblingContext->gateIndex;
	garbledGate->type = type;
	garbledGate->input0 = input0;
	garbledGate->input1 = input1;
	garbledGate->output = output;

	garblingContext->gateIndex++;
	garblingContext->tableIndex++;
	return garbledGate->id;
}

#endif
