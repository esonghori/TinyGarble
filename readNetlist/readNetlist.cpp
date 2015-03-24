/*
	This file is part of TinyGarble.

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


#include "include/read_netlist.h"


void verilog2SCD(const string &infilename, const string &outfilename, int c)
{

	ReadCircuitString readCircuitString;
	ReadCircuit readCircuit;

	parse_netlist(infilename, readCircuitString);
	id_assignment(readCircuitString, readCircuit);
	topological_sort(readCircuit);

	writeSCD(readCircuit,  c, outfilename);
}

void writeSCD(const ReadCircuit &readCircuit,  int _c, const string &fileName)
{
	ofstream f(fileName.c_str(), ios::binary | ios::out);
	if(!f.is_open())
	{
		cout << "can't open "<< fileName << endl;
		return;
	}

	msgpack_sbuffer* buffer = msgpack_sbuffer_new();
	msgpack_packer* pk = msgpack_packer_new(buffer, msgpack_sbuffer_write);
	msgpack_sbuffer_clear(buffer);

	int n = readCircuit.no_of_inports; // # of inputs
	int g = readCircuit.no_of_g_inports; // # of g inputs
	int p = readCircuit.no_of_dffs; // # of DFF
	int m = readCircuit.no_of_outports; // # of outputs
	int q = readCircuit.no_of_gates; // # of gates
	int c = _c; // # of sequential cycle

	msgpack_pack_array(pk, 6 + 3 * q + m + p + p);
	msgpack_pack_int(pk, n);
	msgpack_pack_int(pk, g);
	msgpack_pack_int(pk, p);
	msgpack_pack_int(pk, m);
	msgpack_pack_int(pk, q);
	msgpack_pack_int(pk, c);


	/*
	 * 1st input of each gate
	 */
	for (int i = 0; i < q; i++)
	{
		int gindex = readCircuit.task_schedule[i];
		msgpack_pack_int(pk, readCircuit.gate_list[gindex].input[0]);
	}
	/*
	 * 2nd input of each gate
	 */
	for (int i = 0; i < q; i++)
	{
		int gindex = readCircuit.task_schedule[i];
		msgpack_pack_int(pk, readCircuit.gate_list[gindex].input[1]);
	}
	/*
	 *type of each gate
	 */
	for (int i = 0; i < q; i++)
	{
		int gindex = readCircuit.task_schedule[i];
		msgpack_pack_int(pk, (int)readCircuit.gate_list[gindex].type);
	}
	/*
	 * outputs : output wire index
	 */
	for (int i = 0; i < m; i++)
	{
		msgpack_pack_int(pk, readCircuit.output_list[i]);
	}

	/*
	 * D : latch index
	 * it stores a wire index for DFF:
	 */
	for (int i = 0; i < p; i++)
	{
		msgpack_pack_int(pk, readCircuit.dff_list[i].input[0]);//D
	}
	/*
	 * I : initial value index
	 * it store the input index or constant value for each DFF.
	 * I[i] == CONST_ZERO (== -2) : it means the initial value of the DFF is zero. At the first cycle, Garbler should send token[0] to Evaluator.
	 * I[i] == CONST_ONE (== -3) : it means the initial value of the DFF is one. At the first cycle, Garbler should send token[1] to Evaluator.
	 * I[i] > 0 : it means the initial value of the DFF is value of actual circuit input (wire I[i]). At the first cycle, Evaluator should received the tokens from the Garbler (using OT or directly).
	 */
	//TODO: some of the input wires are only connected to initial signal. Those wires do not require communication in cycles c > 1.
	for (int i = 0; i < p; i++)
	{
		msgpack_pack_int(pk, readCircuit.dff_list[i].input[1]);//I
	}

	msgpack_unpacked msg;
	msgpack_unpacked_init(&msg);
	int success = msgpack_unpack_next(&msg, buffer->data, buffer->size, NULL);


	f.write(buffer->data, buffer->size);
	f.close();
}

int main(int argc, char** argv)
{
	if(argc < 4)
	{
		cout << "usage: " << argv[0] << " <verilog infilename> <scd outfilename> <c>" << endl;
		return -1;
	}
	string infilename(argv[1]);
	string outfilename(argv[2]);
	int c = atoi(argv[3]);
	verilog2SCD(infilename, outfilename, c);
}
