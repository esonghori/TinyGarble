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


#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <msgpack.h>
#include <malloc.h>
#include <sys/stat.h>
#define FAILURE -1
#define SUCCESS 0
 

long fsize(const char *filename) {
	struct stat st;

	if (stat(filename, &st) == 0)
		return st.st_size;

	return -1;
}

typedef struct {
 long n, m, q;
 long *A, *B, *G, *O;
} Circuit;

int writeSCDFile(Circuit *circuit, char *fileName) {
	FILE *f = fopen(fileName, "wb");
	if (f == NULL) {
		printf("Write: Error in opening file.\n");
		return FAILURE;
	}
	msgpack_sbuffer* buffer = msgpack_sbuffer_new();
	msgpack_packer* pk = msgpack_packer_new(buffer, msgpack_sbuffer_write);
	msgpack_sbuffer_clear(buffer);
	int n = circuit->n;
	int q = circuit->q;
	int m = circuit->m;
	msgpack_pack_array(pk, 3 + 3 * q + m);
	msgpack_pack_int(pk, n);
	msgpack_pack_int(pk, m);
	msgpack_pack_int(pk, q);
	int i;
	for (i = 0; i < q; i++) {
		msgpack_pack_int(pk, circuit->A[i]);
	}
	for (i = 0; i < q; i++) {
		msgpack_pack_int(pk, circuit->B[i]);
	}
	for (i = 0; i < q; i++) {
		msgpack_pack_int(pk, circuit->G[i]);
	}
	for (i = 0; i < m; i++) {
		msgpack_pack_int(pk, circuit->O[i]);

	}
	fwrite(buffer->data, (buffer->size), 1, f);
	fclose(f);
	return SUCCESS;
}

int readSCDFile(Circuit *circuit, char *fileName) {
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
	circuit->m = m;
	circuit->n = n;
	circuit->q = q;

	circuit->O = (long *) malloc(sizeof(long) * m);
	circuit->A = (long *) malloc(sizeof(long) * q);
	circuit->B = (long *) malloc(sizeof(long) * q);
	circuit->G = (long *) malloc(sizeof(long) * q);
	
	int i;
	for (i = 0; i < q; i++) {
		++p;
		circuit->A[i] = (*p).via.i64;
	}
	for (i = 0; i < q; i++) {
		++p;
		circuit->B[i] = (*p).via.i64;
	}
	for (i = 0; i < q; i++) {
		++p;
		circuit->G[i] = (*p).via.i64;
	}
	for (i = 0; i < m; i++) {
		++p;
		circuit->O[i] = (*p).via.i64;
	}
	return SUCCESS;
}

int main(){
 Circuit c1,c2;
 long n = 3;
 long m = 1;
 long q = 2;
 long A[] = {1,4};
 long B[] = {2,3};
 long G[] = {8,15};
 long    O[] = {5};
 c1.n = n;
 c1.q = q;
 c1.m = m;
 c1.A = (long *) A;
 c1.B = B;
 c1.G = G;
 c1.O = O;
 writeSCDFile(&c1, "test.scd");
 readSCDFile(&c2, "test.scd");
 
 int result = SUCCESS;
 if ((c1.n != c2.n) |  (c1.m != c2.m) | (c1.q != c2.q))
   result = FAILURE;

 int i = 0;
 for (i=0; i < q; i++){
   if ((c1.A[i] != c2.A[i]) |(c1.B[i] != c2.B[i]) | (c1.G[i] != c2.G[i]))
     result = FAILURE;
 }   
 for (i=0; i < m; i++){
   if ((c1.O[i] != c2.O[i]))
     result = FAILURE;
 }
  if (result == SUCCESS)
    printf("Original and recovered circuits are the same!\n");
  else
    printf("Original and recovered circuits are different!\n");
   
}
