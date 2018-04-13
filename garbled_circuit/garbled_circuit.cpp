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

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "crypto/aes.h"
#include "crypto/BN.h"
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include "garbled_circuit/garbled_circuit_high_mem.h"
#include "garbled_circuit/garbled_circuit_low_mem.h"
#include "tcpip/tcpip.h"
#include "util/log.h"
#include "util/common.h"
#include "util/util.h"

int GarbleStr(const string& file_address, uint64_t clock_cycles, const string& output_mask, int64_t terminate_period, OutputMode output_mode, bool disable_OT,
		bool low_mem_foot, string* output_str, int connfd) {
	if (clock_cycles == 0) {
		return FAILURE;
	}

	GarbledCircuitCollection garbled_circuit_collection;
	if (ReadTGX(file_address, &garbled_circuit_collection) == FAILURE) {
		LOG(ERROR) << "Error while reading tgx file: " << file_address << endl;
		return FAILURE;
	}

	garbled_circuit_collection.circuit_ios = new CircuitIO[garbled_circuit_collection.number_of_circuits];
	//FIX need to handle multiple circuits --- connection of public wires
	for (int i = 0; i < garbled_circuit_collection.number_of_circuits; i++) {
//		FillFanout(&garbled_circuit_collection.garbled_circuits[i]);

		garbled_circuit_collection.garbled_circuits[i].n_of_run = garbled_circuit_collection.n_of_run[i];
		garbled_circuit_collection.garbled_circuits[i].n_of_clk = garbled_circuit_collection.n_of_clk[i];

		char buffer1[50];
		char buffer2[50];
		garbled_circuit_collection.circuit_ios[i].p_init = BN_new();
		garbled_circuit_collection.circuit_ios[i].p_input = BN_new();
		sprintf(buffer1, "./Inputs/%d_p_init.txt", i);
		sprintf(buffer2, "./Inputs/%d_p.txt", i);
		string p_init_str = ReadFileOrPassHex(string(buffer1));
		string p_input_str = ReadFileOrPassHex(string(buffer2));
		CHECK(ParseInitInputStr(p_init_str, p_input_str, &garbled_circuit_collection.circuit_ios[i].p_init, &garbled_circuit_collection.circuit_ios[i].p_input));

		char buffer3[50];
		char buffer4[50];
		garbled_circuit_collection.circuit_ios[i].party_init = BN_new();
		garbled_circuit_collection.circuit_ios[i].party_input = BN_new();
		sprintf(buffer3, "./Inputs/%d_g_init.txt", i);
		sprintf(buffer4, "./Inputs/%d_g.txt", i);
		string init_str = ReadFileOrPassHex(string(buffer3));
		string input_str = ReadFileOrPassHex(string(buffer4));
		CHECK(
				ParseInitInputStr(init_str, input_str, &garbled_circuit_collection.circuit_ios[i].party_init,
						&garbled_circuit_collection.circuit_ios[i].party_input));

		garbled_circuit_collection.circuit_ios[i].output_bn = BN_new();
	}

	//FIX needs to handle terminate
//	if (terminate_period != 0 && garbled_circuit.terminate_id == 0) {
//		LOG(ERROR) << "There is no terminate signal in the circuit."
//				" The terminate period should be 0." << endl;
//		return FAILURE;
//	}

	block R = RandomBlock();  // secret label
	*((short *) (&R)) |= 1;

	// global key
	block global_key = RandomBlock();
	CHECK(SendData(connfd, &global_key, sizeof(block)));  // send global key

	CHECK(GarbleBNHighMem(garbled_circuit_collection, &clock_cycles, output_mask, terminate_period, output_mode, R, global_key, disable_OT, connfd));
	CHECK(OutputBN2StrHighMem(garbled_circuit_collection, clock_cycles, output_mode, output_str)); //output_str is brought to here and sent back... only usage in this func

	RemoveGarbledCircuitCollection(&garbled_circuit_collection);

	return SUCCESS;
}

int EvaluateStr(const string& file_address, uint64_t clock_cycles, const string& output_mask, int64_t terminate_period, OutputMode output_mode, bool disable_OT,
		bool low_mem_foot, string* output_str, int connfd) {

	if (clock_cycles == 0) {
		return FAILURE;
	}

	GarbledCircuitCollection garbled_circuit_collection;
	if (ReadTGX(file_address, &garbled_circuit_collection) == FAILURE) {
		LOG(ERROR) << "Error while reading tgx file: " << file_address << endl;
		return FAILURE;
	}

	garbled_circuit_collection.circuit_ios = new CircuitIO[garbled_circuit_collection.number_of_circuits];
	//FIX need to handle multiple circuits --- connection of public wires
	for (int i = 0; i < garbled_circuit_collection.number_of_circuits; i++) {

		garbled_circuit_collection.garbled_circuits[i].n_of_run = garbled_circuit_collection.n_of_run[i];
		garbled_circuit_collection.garbled_circuits[i].n_of_clk = garbled_circuit_collection.n_of_clk[i];

		char buffer1[50];
		char buffer2[50];
		garbled_circuit_collection.circuit_ios[i].p_init = BN_new();
		garbled_circuit_collection.circuit_ios[i].p_input = BN_new();
		sprintf(buffer1, "./Inputs/%d_p_init.txt", i);
		sprintf(buffer2, "./Inputs/%d_p.txt", i);
		string p_init_str = ReadFileOrPassHex(string(buffer1));
		string p_input_str = ReadFileOrPassHex(string(buffer2));
		CHECK(ParseInitInputStr(p_init_str, p_input_str, &garbled_circuit_collection.circuit_ios[i].p_init, &garbled_circuit_collection.circuit_ios[i].p_input));

		char buffer3[50];
		char buffer4[50];
		garbled_circuit_collection.circuit_ios[i].party_init = BN_new();
		garbled_circuit_collection.circuit_ios[i].party_input = BN_new();
		sprintf(buffer3, "./Inputs/%d_e_init.txt", i);
		sprintf(buffer4, "./Inputs/%d_e.txt", i);
		string init_str = ReadFileOrPassHex(string(buffer3));
		string input_str = ReadFileOrPassHex(string(buffer4));
		CHECK(
				ParseInitInputStr(init_str, input_str, &garbled_circuit_collection.circuit_ios[i].party_init,
						&garbled_circuit_collection.circuit_ios[i].party_input));

		garbled_circuit_collection.circuit_ios[i].output_bn = BN_new();
	}

	//FIX needs to handle terminate
//	if (terminate_period != 0 && garbled_circuit.terminate_id == 0) {
//		LOG(ERROR) << "There is no terminate signal in the circuit."
//				" The terminate period should be 0." << endl;
//		return FAILURE;
//	}

	// global key
	block global_key = RandomBlock();
	CHECK(RecvData(connfd, &global_key, sizeof(block)));  // receive global key

	CHECK(EvaluateBNHighMem(garbled_circuit_collection, &clock_cycles, output_mask, terminate_period, output_mode, global_key, disable_OT, connfd));
	CHECK(OutputBN2StrHighMem(garbled_circuit_collection, clock_cycles, output_mode, output_str));


	RemoveGarbledCircuitCollection(&garbled_circuit_collection);
	return SUCCESS;
}

