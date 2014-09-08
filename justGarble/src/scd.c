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


#include "../include/common.h"
#include "../include/garble.h"
#include "../include/justGarble.h"

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <msgpack.h>
#include <malloc.h>
#include <sys/stat.h>

long fsize(const char *filename) {
	struct stat st;

	if (stat(filename, &st) == 0)
		return st.st_size;

	return -1;
}

int writeCircuitToFile(GarbledCircuit *garbledCircuit, char *fileName) {
	FILE *f = fopen(fileName, "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return FAILURE;
	}
	msgpack_sbuffer* buffer = msgpack_sbuffer_new();
	msgpack_packer* pk = msgpack_packer_new(buffer, msgpack_sbuffer_write);
	msgpack_sbuffer_clear(buffer);
	int n = garbledCircuit->n;
	int q = garbledCircuit->q;
	int m = garbledCircuit->m;
	GarbledGate *garbledGate;
	msgpack_pack_array(pk, 3 + 3 * q + m);
	msgpack_pack_int(pk, n);
	msgpack_pack_int(pk, m);
	msgpack_pack_int(pk, q);
	int i;
	for (i = 0; i < q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		msgpack_pack_int(pk, garbledGate->input0);
	}
	for (i = 0; i < q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		msgpack_pack_int(pk, garbledGate->input1);
	}
	for (i = 0; i < q; i++) {
		garbledGate = &(garbledCircuit->garbledGates[i]);
		msgpack_pack_int(pk, garbledGate->type);
	}
	for (i = 0; i < m; i++) {
		msgpack_pack_int(pk, garbledCircuit->outputs[i]);

	}
	fwrite(buffer->data, (buffer->size), 1, f);
	fclose(f);
	return SUCCESS;
}

int readCircuitFromFile(GarbledCircuit *garbledCircuit, char *fileName) {
	int fs = fsize(fileName);
	FILE *f = fopen(fileName, "rb");
	if (f == NULL) {
		printf("READ:Error in opening file %s.\n", fileName);
		return FAILURE;
	}
	msgpack_sbuffer* buffer = msgpack_sbuffer_new();
	void *storage = malloc(fs);
	fread(storage, fs, 1, f);
	fclose(f);
	buffer->data = storage;
	buffer->size = fs;
	msgpack_unpacked msg;
	msgpack_unpacked_init(&msg);
	msgpack_unpack_next(&msg, buffer->data, buffer->size, NULL);
	msgpack_object obj = msg.data;
	msgpack_object* p = obj.via.array.ptr;
	int n = (*p).via.i64;
	++p;
	int m = (*p).via.i64;
	++p;
	int q = (*p).via.i64;
	garbledCircuit->m = m;
	garbledCircuit->n = n;
	garbledCircuit->q = q;
	garbledCircuit->r = n+q+2;

	garbledCircuit->outputs = (int *) memalign(128, sizeof(int) * m);
	garbledCircuit->garbledGates = (GarbledGate *) memalign(128,
			sizeof(GarbledGate) * q);
	garbledCircuit->garbledTable = (GarbledTable *) memalign(128,
			sizeof(GarbledTable) * q);
	garbledCircuit->wires = (Wire *) malloc(sizeof(Wire) * garbledCircuit->r);
	if (garbledCircuit->garbledGates == NULL
			|| garbledCircuit->garbledGates == NULL
			|| garbledCircuit->wires == NULL) {
		printf("Linux is a cheap miser that refuses to give us memory\n");
		return FAILURE;
	}
	int i;
	for (i = 0; i < garbledCircuit->r; i++) {
		garbledCircuit->wires[i].id = 0;
	}
	for (i = 0; i < q; i++) {
		garbledCircuit->garbledGates[i].id = 0;
		garbledCircuit->garbledGates[i].output = n+i+1;
       }
	for (i = 0; i < q; i++) {
		++p;
		garbledCircuit->garbledGates[i].input0 = (*p).via.i64;
	}
	for (i = 0; i < q; i++) {
		++p;
		garbledCircuit->garbledGates[i].input1 = (*p).via.i64;
	}
	for (i = 0; i < q; i++) {
		++p;
		garbledCircuit->garbledGates[i].type = (*p).via.i64;
	}
	for (i = 0; i < m; i++) {
		++p;
		garbledCircuit->outputs[i] = (*p).via.i64;
	}
	return SUCCESS;
}

