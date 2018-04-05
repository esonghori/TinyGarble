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

#include "garbled_circuit/garbled_circuit_high_mem.h"

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "util/log.h"
#include "crypto/aes.h"
#include "crypto/BN.h"
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include "tcpip/tcpip.h"
#include "util/common.h"
#include "util/util.h"

int GarbleBNHighMem(const GarbledCircuitCollection& garbled_circuit_collection, uint64_t* clock_cycles, const string& output_mask, int64_t terminate_period,
		OutputMode output_mode, block R, block global_key, bool disable_OT, int connfd) {
	// ==> Assumption: we don't care about public values, clks, passing public value from one circuit to another, dependency only on previous circuit

	int number_of_circuits = garbled_circuit_collection.number_of_circuits;
	CircuitLabel all_labels[number_of_circuits];

	for (int i = 0; i < number_of_circuits; i++) {

		CHECK(GarbleMakeLabels(garbled_circuit_collection.garbled_circuits[i], all_labels[i], R));

		GarbleCopyLabels(garbled_circuit_collection, all_labels, i);

		CHECK(
				GarbleTransferLabels(garbled_circuit_collection.garbled_circuits[i], all_labels[i], garbled_circuit_collection.circuit_ios[i].party_init,
						garbled_circuit_collection.circuit_ios[i].party_input, disable_OT, connfd));

		for (uint64_t r = 0; r < garbled_circuit_collection.garbled_circuits[i].n_of_run; r++) {
			FillFanout(&garbled_circuit_collection.garbled_circuits[i]);
			GarbleHighMem(garbled_circuit_collection.garbled_circuits[i], all_labels[i], garbled_circuit_collection.circuit_ios[i].p_init,
					garbled_circuit_collection.circuit_ios[i].p_input, global_key, R, terminate_period, connfd, r);
		}
	}

	CHECK(
			GarbleTransferOutput(garbled_circuit_collection.garbled_circuits[number_of_circuits - 1], all_labels[number_of_circuits - 1], output_mask,
					output_mode, garbled_circuit_collection.circuit_ios[number_of_circuits - 1].output_bn, connfd));

	for (int i = 0; i < number_of_circuits; i++) {
		RemoveLabels(all_labels[i]);
	}

	return SUCCESS;
}

int EvaluateBNHighMem(const GarbledCircuitCollection& garbled_circuit_collection, uint64_t* clock_cycles, const string& output_mask, int64_t terminate_period,
		OutputMode output_mode, block global_key, bool disable_OT, int connfd) {

	int number_of_circuits = garbled_circuit_collection.number_of_circuits;
	CircuitLabel all_labels[number_of_circuits];

	for (int i = 0; i < number_of_circuits; i++) {

		CHECK(EvaluateMakeLabels(garbled_circuit_collection.garbled_circuits[i], all_labels[i]));

		EvaluateCopyLabels(garbled_circuit_collection, all_labels, i);

		CHECK(
				EvaluateTransferLabels(garbled_circuit_collection.garbled_circuits[i], all_labels[i], garbled_circuit_collection.circuit_ios[i].party_init,
						garbled_circuit_collection.circuit_ios[i].party_input, disable_OT, connfd));

		for (uint64_t r = 0; r < garbled_circuit_collection.garbled_circuits[i].n_of_run; r++) {
			FillFanout(&garbled_circuit_collection.garbled_circuits[i]);
			//FIX take care of next p input and init
			EvaluateHighMem(garbled_circuit_collection.garbled_circuits[i], all_labels[i], garbled_circuit_collection.circuit_ios[i].p_init,
					garbled_circuit_collection.circuit_ios[i].p_input, global_key, terminate_period, connfd, r);
		}

	}

	//FIX output when number of run for the last circuit is >1
	CHECK(
			EvaluateTransferOutput(garbled_circuit_collection.garbled_circuits[number_of_circuits - 1], all_labels[number_of_circuits - 1], output_mask,
					output_mode, garbled_circuit_collection.circuit_ios[number_of_circuits - 1].output_bn, connfd));

	for (int i = 0; i < number_of_circuits; i++) {
		RemoveLabels(all_labels[i]);
	}

	return SUCCESS;
}

int GarbleHighMem(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, BIGNUM* p_init, BIGNUM* p_input, block global_key, block R,
		int64_t terminate_period, int connfd, int r) {

	uint64_t clock_cycles = garbled_circuit.n_of_clk;
	block* init_labels = &labels.init_labels[r * garbled_circuit.get_init_size() * clock_cycles * 2];
	block* input_labels = &labels.input_labels[r * garbled_circuit.get_secret_input_size() * clock_cycles * 2];
	block* output_labels = &labels.output_labels[r * garbled_circuit.output_size * clock_cycles * 2];
	short* output_vals = &labels.output_vals[r * garbled_circuit.output_size * clock_cycles];

	DUMP("r_key") << R << endl;
	DUMP("r_key") << global_key << endl;

	BlockPair *wires = nullptr;
	CHECK_ALLOC(wires = new BlockPair[garbled_circuit.get_wire_size()]);
	/*
	 * The actual value of wire, 0,1 and unknown: -1.
	 */
	short *wires_val = nullptr;
	CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
	for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
		wires_val[i] = SECRET;  // All wires are initialed with secret.
	}

	BlockPair *dff_latch = nullptr;
	CHECK_ALLOC(dff_latch = new BlockPair[garbled_circuit.dff_size]);
	short *dff_latch_val = nullptr;
	CHECK_ALLOC(dff_latch_val = new short[garbled_circuit.dff_size]);
	for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
		dff_latch_val[i] = SECRET; // All wires are initialed with secret.
	}

	int *fanout = nullptr;
	CHECK_ALLOC(fanout = new int[garbled_circuit.gate_size]);

	uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
	uint64_t garbled_tables_size = num_of_non_xor;
	GarbledTable* garbled_tables_temp = nullptr;
	CHECK_ALLOC(garbled_tables_temp = new GarbledTable[garbled_tables_size]);
	GarbledTable* garbled_tables = nullptr;
	CHECK_ALLOC(garbled_tables = new GarbledTable[garbled_tables_size]);

	uint64_t num_skipped_non_xor_gates = 0;

	uint64_t comm_time = 0;
	uint64_t garble_time = 0;

	AES_KEY AES_Key;
	AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

	for (uint64_t cid = 0; cid < clock_cycles; cid++) {
		uint64_t garble_start_time = RDTSC;
		// init
		uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
		int64_t gate_bias = (int64_t) garbled_circuit.get_gate_lo_index();
		if (cid == 0) {
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				int64_t wire_index = garbled_circuit.I[i];
				if (wire_index == CONST_ZERO) {
					wires_val[dff_bias + i] = 0;
				} else if (wire_index == CONST_ONE) {
					wires_val[dff_bias + i] = 1;
				} else if (wire_index >= 0 && wire_index < (int64_t) garbled_circuit.get_init_size()) {
					if (wire_index < (int64_t) garbled_circuit.get_p_init_hi_index()) {
						wires_val[dff_bias + i] = BN_is_bit_set(p_init, wire_index - (int64_t) garbled_circuit.get_p_init_lo_index());
					} else {
						int64_t label_index = wire_index - (int64_t) garbled_circuit.get_p_init_hi_index();

						wires[dff_bias + i].label0 = init_labels[label_index * 2 + 0];
						wires[dff_bias + i].label1 = init_labels[label_index * 2 + 1];
						wires_val[dff_bias + i] = SECRET;
					}
				} else {
					LOG(ERROR) << "Invalid I: " << wire_index << endl;
					wires_val[dff_bias + i] = 0; // Wire with invalid I values become 0.
				}
				DUMP("dff") << wires[dff_bias + i].label0 << endl;
			}
		} else {  //copy latched labels
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				int64_t wire_index = garbled_circuit.D[i];
				if (wire_index == CONST_ZERO) {
					dff_latch_val[i] = 0;
				} else if (wire_index == CONST_ONE) {
					dff_latch_val[i] = 1;
				} else if (wire_index >= 0 && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
					dff_latch[i].label0 = wires[wire_index].label0;
					dff_latch[i].label1 = wires[wire_index].label1;
					dff_latch_val[i] = wires_val[wire_index];
				} else {
					LOG(ERROR) << "Invalid D: " << wire_index << endl;
					dff_latch_val[i] = 0; // Wire with invalid D values become 0.
				}
			}
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				wires[dff_bias + i].label0 = dff_latch[i].label0;
				wires[dff_bias + i].label1 = dff_latch[i].label1;
				wires_val[dff_bias + i] = dff_latch_val[i];
			}
		}
		// inputs
		uint64_t p_input_bias = garbled_circuit.get_p_input_lo_index();
		for (uint64_t i = 0; i < garbled_circuit.p_input_size; i++) {
			wires_val[p_input_bias + i] = BN_is_bit_set(p_input, cid * garbled_circuit.p_input_size + i);
		}
		uint64_t input_bias = garbled_circuit.get_g_input_lo_index();
		for (uint64_t i = 0; i < garbled_circuit.get_secret_input_size(); i++) {
			wires[input_bias + i].label0 = input_labels[(cid * garbled_circuit.get_secret_input_size() + i) * 2 + 0];
			wires[input_bias + i].label1 = input_labels[(cid * garbled_circuit.get_secret_input_size() + i) * 2 + 1];
			DUMP("input") << input_labels[(cid * garbled_circuit.get_secret_input_size() + i) * 2 + 0] << endl;
		}

		for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) { //known value
			fanout[i] = garbled_circuit.garbledGates[i].fanout; // init fanout

			GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
			int64_t input0 = garbledGate.input0;
			int64_t input1 = garbledGate.input1;
			int64_t output = garbledGate.output;
			int type = garbledGate.type;

			short input0_value = SECRET;
			if (input0 == CONST_ZERO) {
				input0_value = 0;
			} else if (input0 == CONST_ONE) {
				input0_value = 1;
			} else if (input0 >= 0 && input0 < (int64_t) garbled_circuit.get_wire_size()) {
				input0_value = wires_val[input0];
			} else {
				LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
				input0_value = 0;
			}

			short input1_value = SECRET;
			if (input1 == CONST_ZERO) {
				input1_value = 0;
			} else if (input1 == CONST_ONE) {
				input1_value = 1;
			} else if (input1 >= 0 && input1 < (int64_t) garbled_circuit.get_wire_size()) {
				input1_value = wires_val[input1];
			} else if (type != NOTGATE) {
				LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
				input1_value = 0;
			}

			GarbleEvalGateKnownValue(input0_value, input1_value, type, &wires_val[output]);

			if (!IsSecret(wires_val[output])) {
				fanout[i] = 0;
				if (IsSecret(input0_value)) {
					ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
				}
				if (IsSecret(input1_value)) {
					ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
				}
			}
		}

		uint64_t garbled_table_ind_temp = 0;

		for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) { //secret value
			GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
			int64_t input0 = garbledGate.input0;
			int64_t input1 = garbledGate.input1;
			int64_t output = garbledGate.output;
			int type = garbledGate.type;

			if (fanout[i] > 0 && IsSecret(wires_val[output])) {
				BlockPair input0_labels = { ZeroBlock(), ZeroBlock() };
				short input0_value = SECRET;
				if (input0 == CONST_ZERO) {
					input0_value = 0;
				} else if (input0 == CONST_ONE) {
					input0_value = 1;
				} else if (input0 >= 0 && input0 < (int64_t) garbled_circuit.get_wire_size()) {
					input0_labels = wires[input0];
					input0_value = wires_val[input0];
				} else {
					LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
					input0_value = 0;
				}

				BlockPair input1_labels = { ZeroBlock(), ZeroBlock() };
				short input1_value = SECRET;
				if (input1 == CONST_ZERO) {
					input1_value = 0;
				} else if (input1 == CONST_ONE) {
					input1_value = 1;
				} else if (input1 >= 0 && input1 < (int64_t) garbled_circuit.get_wire_size()) {
					input1_labels = wires[input1];
					input1_value = wires_val[input1];
				} else if (type != NOTGATE) {
					LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
					input1_value = 0;
				}

				GarbleGate(input0_labels, input0_value, input1_labels, input1_value, type, cid, i, garbled_tables_temp, &garbled_table_ind_temp, R, AES_Key,
						&wires[output], &wires_val[output]);
				if (!IsSecret(wires_val[output])) {
					fanout[i] = 0;
					if (IsSecret(input0_value)) {
						ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
					}
					if (IsSecret(input1_value)) {
						ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
					}
				}
			}
		}

		uint64_t garbled_table_ind = 0;  // fill from 0

		// table select
		for (uint64_t i = 0; i < garbled_table_ind_temp; i++) {
			GarbledTable &table = garbled_tables_temp[i];
			if (fanout[table.gid] > 0) {
				garbled_tables[garbled_table_ind++] = table;
				DUMP("table") << table.row[0] << endl;
				DUMP("table") << table.row[1] << endl;
			}
		}

		for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
			output_labels[(cid * garbled_circuit.output_size + i) * 2 + 0] = wires[garbled_circuit.outputs[i]].label0;
			output_labels[(cid * garbled_circuit.output_size + i) * 2 + 1] = wires[garbled_circuit.outputs[i]].label1;
			output_vals[cid * garbled_circuit.output_size + i] = wires_val[garbled_circuit.outputs[i]];
			DUMP("output") << wires[garbled_circuit.outputs[i]].label0 << endl;
		}
		garble_time += RDTSC - garble_start_time;

		uint64_t comm_start_time = RDTSC;
		{
			CHECK(SendData(connfd, &garbled_table_ind, sizeof(uint64_t)));
			CHECK(SendData(connfd, garbled_tables, garbled_table_ind * sizeof(GarbledTable)));
		}
		comm_time += RDTSC - comm_start_time;

		num_skipped_non_xor_gates += num_of_non_xor - garbled_table_ind;

		//if has terminate signal
		if (terminate_period != 0 && garbled_circuit.terminate_id > 0) {
			if (cid % terminate_period == 0) {
				bool is_terminate = false;
				CHECK(
						GarbleTransferTerminate(garbled_circuit, wires[garbled_circuit.terminate_id], wires_val[garbled_circuit.terminate_id], &is_terminate,
								connfd));

				if (is_terminate) {
					LOG(INFO) << "Alice Terminated in " << cid + 1 << "cc out of " << clock_cycles << "cc." << endl;
					clock_cycles = cid + 1;
					break;
				}
			}
			//last clock cycle, not terminated
			if (cid == (clock_cycles) - 1) {
				LOG(ERROR) << "Alice Not enough clock cycles. Circuit is not terminated in " << clock_cycles << "cc." << endl;
			}
		}

	}

	LOG(INFO) << "Non-secret skipped non-XOR gates = " << num_skipped_non_xor_gates << " out of " << num_of_non_xor * (clock_cycles) << "\t ("
			<< (100.0 * num_skipped_non_xor_gates) / (num_of_non_xor * (clock_cycles)) << "%)" << endl;

	LOG(INFO) << "Total garbled non-XOR gates = " << num_of_non_xor * (clock_cycles) - num_skipped_non_xor_gates << endl;

	LOG(INFO) << "Alice communication time (cc) = " << comm_time << endl;
	LOG(INFO) << "Alice garbling time (cc) = " << garble_time << endl;

	delete[] wires;
	delete[] wires_val;
	delete[] dff_latch;
	delete[] dff_latch_val;
	delete[] fanout;
	delete[] garbled_tables;
	delete[] garbled_tables_temp;
	return SUCCESS;
}

int EvaluateHighMem(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, BIGNUM* p_init, BIGNUM* p_input, block global_key, int64_t terminate_period,
		int connfd, int r) {

	//FIX is clock_cycles read only or not
	uint64_t clock_cycles = garbled_circuit.n_of_clk;
	block* init_labels = &labels.init_labels[r * garbled_circuit.get_init_size() * clock_cycles];
	block* input_labels = &labels.input_labels[r * garbled_circuit.get_secret_input_size() * clock_cycles];
	block* output_labels = &labels.output_labels[r * garbled_circuit.output_size * clock_cycles];
	short* output_vals = &labels.output_vals[r * garbled_circuit.output_size * clock_cycles];

	DUMP("r_key") << global_key << endl;

	block *wires = nullptr;
	CHECK_ALLOC(wires = new block[garbled_circuit.get_wire_size()]);
	short *wires_val = nullptr;
	CHECK_ALLOC(wires_val = new short[garbled_circuit.get_wire_size()]);
	for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
		wires_val[i] = SECRET;  // All wires are initialed with unknown.
	}

	block *dff_latch = nullptr;
	CHECK_ALLOC(dff_latch = new block[garbled_circuit.dff_size]);
	short *dff_latch_val = nullptr;
	CHECK_ALLOC(dff_latch_val = new short[garbled_circuit.get_wire_size()]);
	for (uint64_t i = 0; i < garbled_circuit.get_wire_size(); i++) {
		dff_latch_val[i] = SECRET; // All wires are initialed with unknown.
	}

	int *fanout = nullptr;
	CHECK_ALLOC(fanout = new int[garbled_circuit.gate_size]);

	uint64_t num_of_non_xor = NumOfNonXor(garbled_circuit);
	GarbledTable* garbled_tables = nullptr;
	CHECK_ALLOC(garbled_tables = new GarbledTable[num_of_non_xor]);

	uint64_t comm_time = 0;
	uint64_t eval_time = 0;

	AES_KEY AES_Key;
	AESSetEncryptKey((unsigned char *) &(global_key), 128, &AES_Key);

	for (uint64_t cid = 0; cid < clock_cycles; cid++) {
		uint64_t garbled_table_ind_rcv = 0; // #of tables received from garbler
		uint64_t garbled_table_ind = 0;

		uint64_t comm_start_time = RDTSC;
		{
			CHECK(RecvData(connfd, &garbled_table_ind_rcv, sizeof(uint64_t)));
			CHECK(RecvData(connfd, garbled_tables, garbled_table_ind_rcv * sizeof(GarbledTable)));
		}
		comm_time += RDTSC - comm_start_time;

		uint64_t eval_start_time = RDTSC;
		// init
		uint64_t dff_bias = garbled_circuit.get_dff_lo_index();
		int64_t gate_bias = (int64_t) garbled_circuit.get_gate_lo_index();
		if (cid == 0) {
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				int64_t wire_index = garbled_circuit.I[i];
				if (wire_index == CONST_ZERO) {
					wires_val[dff_bias + i] = 0;
				} else if (wire_index == CONST_ONE) {
					wires_val[dff_bias + i] = 1;
				} else if (wire_index >= 0 && wire_index < (int64_t) garbled_circuit.get_init_size()) {

					if (wire_index < (int64_t) garbled_circuit.get_p_init_hi_index()) {
						wires_val[dff_bias + i] = BN_is_bit_set(p_init, wire_index - (int64_t) garbled_circuit.get_p_init_lo_index());
					} else {
						int64_t label_index = wire_index - (int64_t) garbled_circuit.get_p_init_hi_index();

						wires[dff_bias + i] = init_labels[label_index];
						wires_val[dff_bias + i] = SECRET;
					}
				} else {
					LOG(ERROR) << "Invalid I: " << wire_index << endl;
					wires_val[dff_bias + i] = 0;
				}
				DUMP("dff") << wires[dff_bias + i] << endl;
			}
		} else {  //copy latched labels
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				int64_t wire_index = garbled_circuit.D[i];
				if (wire_index == CONST_ZERO) {
					dff_latch_val[i] = 0;
				} else if (wire_index == CONST_ONE) {
					dff_latch_val[i] = 1;
				} else if (wire_index >= 0 && wire_index < (int64_t) garbled_circuit.get_wire_size()) {
					dff_latch[i] = wires[wire_index];
					dff_latch_val[i] = wires_val[wire_index];
				} else {
					LOG(ERROR) << "Invalid D: " << wire_index << endl;
					dff_latch_val[i] = 0;
				}
			}
			for (uint64_t i = 0; i < garbled_circuit.dff_size; i++) {
				wires[dff_bias + i] = dff_latch[i];
				wires_val[dff_bias + i] = dff_latch_val[i];
			}
		}
		// inputs
		uint64_t p_input_bias = garbled_circuit.get_p_input_lo_index();
		for (uint64_t i = 0; i < garbled_circuit.p_input_size; i++) {
			wires_val[p_input_bias + i] = BN_is_bit_set(p_input, cid * garbled_circuit.p_input_size + i);
		}

		uint64_t input_bias = garbled_circuit.get_g_input_lo_index();
		for (uint64_t i = 0; i < garbled_circuit.get_secret_input_size(); i++) {
			wires[input_bias + i] = input_labels[cid * garbled_circuit.get_secret_input_size() + i];
			DUMP("input") << input_labels[cid * garbled_circuit.get_secret_input_size() + i] << endl;
		}

		for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) { // known values
			fanout[i] = garbled_circuit.garbledGates[i].fanout; // init fanout

			GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
			int64_t input0 = garbledGate.input0;
			int64_t input1 = garbledGate.input1;
			int64_t output = garbledGate.output;
			int type = garbledGate.type;

			short input0_value = SECRET;
			if (input0 == CONST_ZERO) {
				input0_value = 0;
			} else if (input0 == CONST_ONE) {
				input0_value = 1;
			} else if (input0 >= 0 && input0 < (int64_t) garbled_circuit.get_wire_size()) {
				input0_value = wires_val[input0];
			} else {
				LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
				input0_value = 0;
			}

			short input1_value = SECRET;
			if (input1 == CONST_ZERO) {
				input1_value = 0;
			} else if (input1 == CONST_ONE) {
				input1_value = 1;
			} else if (input1 >= 0 && input1 < (int64_t) garbled_circuit.get_wire_size()) {
				input1_value = wires_val[input1];
			} else if (type != NOTGATE) {
				LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
				input1_value = 0;
			}

			GarbleEvalGateKnownValue(input0_value, input1_value, type, &wires_val[output]);
			if (!IsSecret(wires_val[output])) {
				fanout[i] = 0;
				if (IsSecret(input0_value)) {
					ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
				}
				if (IsSecret(input1_value)) {
					ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
				}
			}
		}

		for (uint64_t i = 0; i < garbled_circuit.gate_size; i++) { // secret values
			GarbledGate& garbledGate = garbled_circuit.garbledGates[i];
			int64_t input0 = garbledGate.input0;
			int64_t input1 = garbledGate.input1;
			int64_t output = garbledGate.output;
			int type = garbledGate.type;

			if (fanout[i] > 0 && IsSecret(wires_val[output])) {
				block input0_labels = ZeroBlock();
				short input0_value = SECRET;
				if (input0 == CONST_ZERO) {
					input0_value = 0;
				} else if (input0 == CONST_ONE) {
					input0_value = 1;
				} else if (input0 >= 0 && input0 < (int64_t) garbled_circuit.get_wire_size()) {
					input0_labels = wires[input0];
					input0_value = wires_val[input0];
				} else {
					LOG(ERROR) << "Invalid input0 index: " << input0 << endl;
					input0_value = 0;
				}

				block input1_labels = ZeroBlock();
				short input1_value = SECRET;
				if (input1 == CONST_ZERO) {
					input1_value = 0;
				} else if (input1 == CONST_ONE) {
					input1_value = 1;
				} else if (input1 >= 0 && input1 < (int64_t) garbled_circuit.get_wire_size()) {
					input1_labels = wires[input1];
					input1_value = wires_val[input1];
				} else if (type != NOTGATE) {
					LOG(ERROR) << "Invalid input1 index: " << input1 << endl;
					input1_value = 0;
				}

				EvalGate(input0_labels, input0_value, input1_labels, input1_value, type, cid, i, garbled_tables, &garbled_table_ind, AES_Key, &wires[output],
						&wires_val[output]);
				if (!IsSecret(wires_val[output])) {
					fanout[i] = 0;
					if (IsSecret(input0_value)) {
						ReduceFanout(garbled_circuit, fanout, input0, gate_bias);
					}
					if (IsSecret(input1_value)) {
						ReduceFanout(garbled_circuit, fanout, input1, gate_bias);
					}
				}
			}
		}

		for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
			output_labels[cid * garbled_circuit.output_size + i] = wires[garbled_circuit.outputs[i]];
			output_vals[cid * garbled_circuit.output_size + i] = wires_val[garbled_circuit.outputs[i]];
			DUMP("output") << output_labels[cid * garbled_circuit.output_size + i] << endl;
		}
		eval_time += RDTSC - eval_start_time;
		CHECK_EXPR_MSG(garbled_table_ind == garbled_table_ind_rcv, "Number of garbled tables generated "
				"by Alice and received by Bob are not equal.");

		for (uint64_t j = 0; j < garbled_table_ind; j++) { // clear tables
			garbled_tables[j].gid = (uint32_t)(-1);
		}

		//if has terminate signal
		if (terminate_period != 0 && garbled_circuit.terminate_id > 0) {
			if (cid % terminate_period == 0) {
				bool is_terminate = false;
				CHECK(
						EvaluateTransferTerminate(garbled_circuit, wires[garbled_circuit.terminate_id], wires_val[garbled_circuit.terminate_id], &is_terminate,
								connfd));

				if (is_terminate) {
					LOG(INFO) << "Bob Terminated in " << cid + 1 << "cc out of " << clock_cycles << "cc." << endl;
					clock_cycles = cid + 1;
					break;
				}
			}
			//last clock cycle, not terminated
			if (cid == clock_cycles - 1) {
				LOG(ERROR) << "Bob Not enough clock cycles. Circuit is not terminated in " << clock_cycles << "cc." << endl;
			}
		}
	}

	LOG(INFO) << "Bob communication time (cc) = " << comm_time << endl;
	LOG(INFO) << "Bob evaluation time (cc) = " << eval_time << endl;

	delete[] wires;
	delete[] wires_val;
	delete[] dff_latch;
	delete[] dff_latch_val;
	delete[] fanout;
	delete[] garbled_tables;
	return SUCCESS;
}

int GarbleOT(const GarbledCircuit& garbled_circuit, block* init_labels, block* input_labels, uint64_t clock_cycles, int connfd) {

	//FIX merge OTs
	uint32_t message_len = garbled_circuit.n_of_run * (garbled_circuit.e_init_size + clock_cycles * garbled_circuit.e_input_size);
	block **message = nullptr;
	CHECK_ALLOC(message = new block*[message_len]);

	for (uint64_t r = 0; r < garbled_circuit.n_of_run; r++) {
		for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
			CHECK_ALLOC(message[i] = new block[2]);
			for (uint j = 0; j < 2; j++) {
				message[i][j] = init_labels[(r * garbled_circuit.get_init_size() + garbled_circuit.g_init_size + i) * 2 + j];
			}
		}
	}

	for (uint64_t r = 0; r < garbled_circuit.n_of_run; r++) {
		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
				uint idx = r * clock_cycles * garbled_circuit.e_input_size + garbled_circuit.n_of_run * garbled_circuit.e_init_size
						+ cid * garbled_circuit.e_input_size + i;
				CHECK_ALLOC(message[idx] = new block[2]);
				for (uint j = 0; j < 2; j++) {
					message[idx][j] = input_labels[(r * clock_cycles * garbled_circuit.get_secret_input_size() + cid * garbled_circuit.get_secret_input_size()
							+ i + garbled_circuit.g_input_size) * 2 + j];
				}
			}
		}
	}

	if (message_len > OT_EXT_LEN) {
		CHECK(OTExtSend(message, message_len, connfd));
	} else {
		CHECK(OTSend(message, message_len, connfd));
	}

	if (message != nullptr) {
		for (uint i = 0; i < message_len; i++) {
			delete[] message[i];
		}
		delete[] message;
	}

	return SUCCESS;
}

int EvalauteOT(const GarbledCircuit& garbled_circuit, BIGNUM* e_init, block* init_labels, BIGNUM* e_input, block* input_labels, uint64_t clock_cycles,
		int connfd) {
	uint32_t message_len = garbled_circuit.n_of_run * (garbled_circuit.e_init_size + clock_cycles * garbled_circuit.e_input_size);
	bool *select = nullptr;
	CHECK_ALLOC(select = new bool[message_len]);

	for (uint i = 0; i < garbled_circuit.n_of_run * garbled_circuit.e_init_size; i++) {
		select[i] = BN_is_bit_set(e_init, i);
	}

	for (uint64_t r = 0; r < garbled_circuit.n_of_run; r++) {
		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
				uint indx = r * clock_cycles * garbled_circuit.e_input_size + cid * garbled_circuit.e_input_size
						+ garbled_circuit.n_of_run * garbled_circuit.e_init_size + i;
				select[indx] = BN_is_bit_set(e_input, r * clock_cycles * garbled_circuit.e_input_size + cid * garbled_circuit.e_input_size + i);
			}
		}
	}

	block* message = nullptr;
	CHECK_ALLOC(message = new block[message_len]);

	if (message_len > OT_EXT_LEN) {
		CHECK(OTExtRecv(select, message_len, connfd, message));
	} else {
		CHECK(OTRecv(select, message_len, connfd, message));
	}

	for (uint64_t r = 0; r < garbled_circuit.n_of_run; r++) {
		for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
			init_labels[i + garbled_circuit.g_init_size + r * garbled_circuit.get_init_size()] = message[i];
		}
	}

	for (uint64_t r = 0; r < garbled_circuit.n_of_run; r++) {
		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
				uint indx = garbled_circuit.e_init_size * clock_cycles * garbled_circuit.n_of_run + r * clock_cycles * garbled_circuit.e_input_size
						+ cid * garbled_circuit.e_input_size + i;
				input_labels[r * clock_cycles * garbled_circuit.get_secret_input_size() + cid * garbled_circuit.get_secret_input_size() + i
						+ garbled_circuit.g_input_size] = message[indx];
			}
		}
	}

	delete[] select;
	delete[] message;

	return SUCCESS;
}

int GarbleTransferLabels(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, BIGNUM* g_init, BIGNUM* g_input, bool disable_OT, int connfd) {
	if (garbled_circuit.e_init_size == 0 && garbled_circuit.e_input_size == 0 && garbled_circuit.g_init_size == 0 && garbled_circuit.g_input_size == 0)
		return 0;

	uint64_t n_of_run = garbled_circuit.n_of_run;
	uint64_t clock_cycles = garbled_circuit.n_of_clk;

// g_init
	for (uint64_t i = 0; i < garbled_circuit.g_init_size * n_of_run; i++) {
		if (i >= (uint) BN_num_bits(g_init) || BN_is_bit_set(g_init, i) == 0) {
			CHECK(SendData(connfd, &labels.init_labels[i * 2 + 0], sizeof(block)));
		} else {
			CHECK(SendData(connfd, &labels.init_labels[i * 2 + 1], sizeof(block)));
		}
	}

// g_input
	for (uint64_t r = 0; r < n_of_run; r++) {
		int offset = garbled_circuit.get_secret_input_size() * r;
		int bit_offset = r * clock_cycles * garbled_circuit.g_input_size;

		for (uint64_t cid = 0; cid < clock_cycles; cid++) {
			for (uint64_t i = 0; i < garbled_circuit.g_input_size; i++) {
				if (cid * garbled_circuit.g_input_size + i >= (uint) BN_num_bits(g_input)
						|| BN_is_bit_set(g_input, bit_offset + cid * garbled_circuit.g_input_size + i) == 0) {
					CHECK(SendData(connfd, &labels.input_labels[(offset + cid * garbled_circuit.get_secret_input_size() + i) * 2 + 0], sizeof(block)));
				} else {
					CHECK(SendData(connfd, &labels.input_labels[(offset + cid * garbled_circuit.get_secret_input_size() + i) * 2 + 1], sizeof(block)));
				}
			}
		}
	}

	if (disable_OT) {
		// e_init
		BIGNUM* e_init = BN_new();
		CHECK(RecvBN(connfd, e_init));
		for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
			if (i >= (uint) BN_num_bits(e_init) || BN_is_bit_set(e_init, i) == 0) {
				CHECK(SendData(connfd, &labels.init_labels[(i + garbled_circuit.g_init_size) * 2 + 0], sizeof(block)));
			} else {
				CHECK(SendData(connfd, &labels.init_labels[(i + garbled_circuit.g_init_size) * 2 + 1], sizeof(block)));
			}
		}
		// e_input
		BIGNUM* e_input = BN_new();
		CHECK(RecvBN(connfd, e_input));
		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
				if (cid * garbled_circuit.e_input_size + i >= (uint) BN_num_bits(e_input)
						|| BN_is_bit_set(e_input, cid * garbled_circuit.e_input_size + i) == 0) {
					CHECK(
							SendData(connfd, &labels.input_labels[(cid * garbled_circuit.get_secret_input_size() + i + garbled_circuit.g_input_size) * 2 + 0],
									sizeof(block)));
				} else {
					CHECK(
							SendData(connfd, &labels.input_labels[(cid * garbled_circuit.get_secret_input_size() + i + garbled_circuit.g_input_size) * 2 + 1],
									sizeof(block)));
				}
			}
		}

		BN_free(e_init);
		BN_free(e_input);

	} else if (garbled_circuit.e_init_size > 0 || garbled_circuit.e_input_size > 0) {
		CHECK(GarbleOT(garbled_circuit, labels.init_labels, labels.input_labels, clock_cycles, connfd));
	}
	return SUCCESS;
}

int EvaluateTransferLabels(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, BIGNUM* e_init, BIGNUM* e_input, bool disable_OT, int connfd) {

	if (garbled_circuit.e_init_size == 0 && garbled_circuit.e_input_size == 0 && garbled_circuit.g_init_size == 0 && garbled_circuit.g_input_size == 0)
		return 0;
	uint64_t n_of_run = garbled_circuit.n_of_run;
	uint64_t clock_cycles = garbled_circuit.n_of_clk;

	block* init_labels = labels.init_labels;
	block* input_labels = labels.input_labels;

// g_init
	for (uint i = 0; i < garbled_circuit.g_init_size * n_of_run; i++) {
		CHECK(RecvData(connfd, &init_labels[i], sizeof(block)));
	}

// g_input
	for (uint64_t r = 0; r < n_of_run; r++) {
		int offset = garbled_circuit.get_secret_input_size() * r;

		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.g_input_size; i++) {
				CHECK(RecvData(connfd, &input_labels[offset + cid * garbled_circuit.get_secret_input_size() + i], sizeof(block)));
			}
		}
	}

	if (disable_OT) {
		// e_init
		CHECK(SendBN(connfd, e_init));
		for (uint i = 0; i < garbled_circuit.e_init_size; i++) {
			CHECK(RecvData(connfd, &init_labels[i + garbled_circuit.g_init_size], sizeof(block)));
		}
		// e_input
		CHECK(SendBN(connfd, e_input));
		for (uint cid = 0; cid < clock_cycles; cid++) {
			for (uint i = 0; i < garbled_circuit.e_input_size; i++) {
				CHECK(RecvData(connfd, &input_labels[cid * garbled_circuit.get_secret_input_size() + i + garbled_circuit.g_input_size], sizeof(block)));
			}
		}
	} else if (garbled_circuit.e_init_size > 0 || garbled_circuit.e_input_size > 0) {
		CHECK(EvalauteOT(garbled_circuit, e_init, init_labels, e_input, input_labels, clock_cycles, connfd));
	}
	return SUCCESS;
}

int GarbleMakeLabels(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, block R) {

// RULE: TODO new block unless output of previous circuit is a direct input to the next circuit

// allocate and generate random init and inputs label pairs
	labels.init_labels = nullptr;
	labels.input_labels = nullptr;
	labels.output_labels = nullptr;
	labels.output_vals = nullptr;
	int clock_cycles = garbled_circuit.n_of_clk;

	if (garbled_circuit.get_secret_init_size() > 0) {
		CHECK_ALLOC(labels.init_labels = new block[garbled_circuit.get_secret_init_size() * 2 * garbled_circuit.n_of_run]);
		for (uint i = 0; i < garbled_circuit.get_secret_init_size() * garbled_circuit.n_of_run; i++) {
			labels.init_labels[i * 2 + 0] = RandomBlock();
			labels.init_labels[i * 2 + 1] = XorBlock(R, labels.init_labels[i * 2 + 0]);
		}
	}

//FIX: don't make lables for i_input
	if (garbled_circuit.get_secret_input_size() > 0) {
		CHECK_ALLOC(labels.input_labels = new block[clock_cycles * garbled_circuit.get_secret_input_size() * 2 * garbled_circuit.n_of_run]);
		for (uint i = 0; i < garbled_circuit.get_secret_input_size() * clock_cycles * garbled_circuit.n_of_run; i++) {
			labels.input_labels[i * 2 + 0] = RandomBlock();
			labels.input_labels[i * 2 + 1] = XorBlock(R, labels.input_labels[i * 2 + 0]);
		}
	}

	if (garbled_circuit.output_size > 0) {
		CHECK_ALLOC(labels.output_labels = new block[clock_cycles * garbled_circuit.output_size * 2 * garbled_circuit.n_of_run]);
		CHECK_ALLOC(labels.output_vals = new short[clock_cycles * garbled_circuit.output_size * garbled_circuit.n_of_run]);
	}

	return SUCCESS;
}

int EvaluateMakeLabels(const GarbledCircuit& garbled_circuit, CircuitLabel& labels) {
	labels.init_labels = nullptr;
	labels.input_labels = nullptr;
	labels.output_labels = nullptr;
	labels.output_vals = nullptr;
	int clock_cycles = garbled_circuit.n_of_clk;

	if (garbled_circuit.get_secret_init_size() > 0) {
		CHECK_ALLOC(labels.init_labels = new block[garbled_circuit.get_secret_init_size() * garbled_circuit.n_of_run]);
	}

	if (garbled_circuit.get_input_size() > 0) {
		CHECK_ALLOC(labels.input_labels = new block[clock_cycles * garbled_circuit.get_secret_input_size() * garbled_circuit.n_of_run]);
	}
	if (garbled_circuit.output_size > 0) {
		CHECK_ALLOC(labels.output_labels = new block[clock_cycles * garbled_circuit.output_size * garbled_circuit.n_of_run]);
		CHECK_ALLOC(labels.output_vals = new short[clock_cycles * garbled_circuit.output_size * garbled_circuit.n_of_run]);
	}
	return SUCCESS;
}

int GarbleCopyLabels(const GarbledCircuitCollection& garbled_circuit_collection, CircuitLabel* all_labels, int circuitID) {

	if (garbled_circuit_collection.garbled_circuits[circuitID].i_input_size == 0)
		return SUCCESS;

	//FIX replace with memcpy
	//FIX does not support multiple i inputs from different circuits
	//NOTE our policy is to cpy only the last clk labels

	GarbledCircuit& this_circuit = garbled_circuit_collection.garbled_circuits[circuitID];
	int cpy_circuitID = garbled_circuit_collection.i_circuit_inputs[circuitID][1];
	int n_of_run = this_circuit.n_of_run;
	int n_of_clk = garbled_circuit_collection.garbled_circuits[cpy_circuitID].n_of_clk; // number of clk for previous circuit (copy_from circuit)

	for (int r = 0; r < n_of_run; r++) {
		int offset = (r * this_circuit.get_secret_input_size() + this_circuit.get_i_input_lo_index()) * 2;
		int output_offset = 0;

		uint64_t input_size = this_circuit.i_input_size;
		uint64_t output_size = garbled_circuit_collection.garbled_circuits[cpy_circuitID].output_size;
		uint64_t total_out_size = output_size * garbled_circuit_collection.garbled_circuits[cpy_circuitID].n_of_run;
		uint64_t total_in_size = input_size * n_of_run;

		if (total_out_size == total_in_size) {
			uint64_t ratio = output_size / input_size;

			if (input_size >= output_size) {
				output_offset = r * (output_size * n_of_clk); //continue copying not broadcast
				output_offset += (n_of_clk - 1) * output_size; //extract only the last clock
				output_offset *= 2; //2 labels per bit
			} else {
				output_offset = (r % ratio) * input_size + (r / ratio) * (output_size * n_of_clk); //extract mode
				output_offset += (n_of_clk - 1) * output_size; //extract only the last clock
				output_offset *= 2; //2 labels per bit
			}

			for (uint64_t i = 0; i < input_size * 2; i++) { // *2 labels per bit
				all_labels[circuitID].input_labels[offset + i] = all_labels[cpy_circuitID].output_labels[output_offset + i];
			}
		} else { //if not, out cannot be bigger than in: out smaller than in: broadcast, start output_offset from the beginning
			// Broadcast
			//FIX not sure, need to debug
			uint64_t ratio = input_size / output_size;
			uint64_t output_offset_start = r * ratio * output_size * n_of_clk;
			for (uint64_t j = 0; j < ratio; j++) {
				output_offset = output_offset_start + j * (output_size * n_of_clk) + (n_of_clk - 1) * output_size;
				output_offset *= 2; //2 labels per bit
				for (uint64_t i = 0; i < output_size * 2; i++) { // *2 labels per bit
					all_labels[circuitID].input_labels[offset + j * (output_size * 2) + i] = all_labels[cpy_circuitID].output_labels[output_offset + i];
				}
			}

		}

	}

	return SUCCESS;
}

int EvaluateCopyLabels(const GarbledCircuitCollection& garbled_circuit_collection, CircuitLabel* all_labels, int circuitID) {

	if (garbled_circuit_collection.garbled_circuits[circuitID].i_input_size == 0)
		return SUCCESS;

	GarbledCircuit& this_circuit = garbled_circuit_collection.garbled_circuits[circuitID];
	int cpy_circuitID = garbled_circuit_collection.i_circuit_inputs[circuitID][1];
	int n_of_run = this_circuit.n_of_run;
	int n_of_clk = garbled_circuit_collection.garbled_circuits[cpy_circuitID].n_of_clk; // number of clk for previous circuit (copy_from circuit)

	for (int r = 0; r < n_of_run; r++) {
		int offset = (r * this_circuit.get_secret_input_size() + this_circuit.get_i_input_lo_index());
		int output_offset = 0;

		uint64_t input_size = this_circuit.i_input_size;
		uint64_t output_size = garbled_circuit_collection.garbled_circuits[cpy_circuitID].output_size;
		uint64_t total_out_size = output_size * garbled_circuit_collection.garbled_circuits[cpy_circuitID].n_of_run;
		uint64_t total_in_size = input_size * n_of_run;

		if (total_out_size == total_in_size) {
			uint64_t ratio = output_size / input_size;

			if (input_size >= output_size) {
				output_offset = r * (output_size * n_of_clk); //continue copying not broadcast
				output_offset += (n_of_clk - 1) * output_size; //extract only the last clock
			} else {
				output_offset = (r % ratio) * input_size + (r / ratio) * (output_size * n_of_clk); //extract mode
				output_offset += (n_of_clk - 1) * output_size; //extract only the last clock
			}

			for (uint64_t i = 0; i < input_size; i++) { // *2 labels per bit
				all_labels[circuitID].input_labels[offset + i] = all_labels[cpy_circuitID].output_labels[output_offset + i];
			}
		} else { //if not, out cannot be bigger than in: out smaller than in: broadcast, start output_offset from the beginning
			// Broadcast
			//FIX not sure, need to debug
			uint64_t ratio = input_size / output_size;
			uint64_t output_offset_start = r * ratio * output_size * n_of_clk;
			for (uint64_t j = 0; j < ratio; j++) {
				output_offset = output_offset_start + j * (output_size * n_of_clk) + (n_of_clk - 1) * output_size;

				for (uint64_t i = 0; i < output_size; i++) { // *2 labels per bit
					all_labels[circuitID].input_labels[offset + j * (output_size) + i] = all_labels[cpy_circuitID].output_labels[output_offset + i];
				}
			}

		}

	}

	return SUCCESS;
}

int GarbleTransferOutput(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, const string& output_mask, OutputMode output_mode, BIGNUM* output_bn,
		int connfd) {

	BIGNUM* output_mask_bn = BN_new();
	BN_hex2bn(&output_mask_bn, output_mask.c_str());

	block* output_labels = labels.output_labels;
	short* output_vals = labels.output_vals;
	uint64_t clock_cycles = garbled_circuit.n_of_clk;

	uint64_t n_of_run = garbled_circuit.n_of_run;
	uint64_t jump_size = clock_cycles * garbled_circuit.output_size;

	for (uint64_t r = 0; r < n_of_run; r++) {
		for (uint64_t cid = 0; cid < clock_cycles; cid++) {
			for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
				if (output_vals[r * jump_size + cid * garbled_circuit.output_size + i] == 0) {
					BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
				} else if (output_vals[r * jump_size + cid * garbled_circuit.output_size + i] == 1) {
					if (i < (uint64_t) BN_num_bits(output_mask_bn) && BN_is_bit_set(output_mask_bn, i) == 1) {
						BN_set_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
					}
				} else {
					short garble_output_type = get_LSB(output_labels[(r * jump_size + cid * garbled_circuit.output_size + i) * 2 + 0]);
					short eval_output_type;
					if (i >= (uint64_t) BN_num_bits(output_mask_bn) || BN_is_bit_set(output_mask_bn, i) == 0) {
						CHECK(SendData(connfd, &garble_output_type, sizeof(short)));
						BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
					} else {
						CHECK(RecvData(connfd, &eval_output_type, sizeof(short)));
						if (eval_output_type != garble_output_type) {
							BN_set_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
						} else {
							BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
						}
					}
				}
			}
		}
	}

	BN_free(output_mask_bn);
	return SUCCESS;
}

int EvaluateTransferOutput(const GarbledCircuit& garbled_circuit, CircuitLabel& labels, const string& output_mask, OutputMode output_mode, BIGNUM* output_bn,
		int connfd) {

	block* output_labels = labels.output_labels;
	short* output_vals = labels.output_vals;
	uint64_t clock_cycles = garbled_circuit.n_of_clk;

	BIGNUM* output_mask_bn = BN_new();
	BN_hex2bn(&output_mask_bn, output_mask.c_str());

	uint64_t n_of_run = garbled_circuit.n_of_run;
	uint64_t jump_size = clock_cycles * garbled_circuit.output_size;

	for (uint64_t r = 0; r < n_of_run; r++) {
		for (uint64_t cid = 0; cid < clock_cycles; cid++) {
			for (uint64_t i = 0; i < garbled_circuit.output_size; i++) {
				if (output_vals[r * jump_size + cid * garbled_circuit.output_size + i] == 0) {
					BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
				} else if (output_vals[r * jump_size + cid * garbled_circuit.output_size + i] == 1) {
					if (i >= (uint64_t) BN_num_bits(output_mask_bn) && BN_is_bit_set(output_mask_bn, i) == 0) {
						BN_set_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
					}
				} else {
					short garble_output_type;
					short eval_output_type = get_LSB(output_labels[r * jump_size + cid * garbled_circuit.output_size + i]);
					if (i >= (uint64_t) BN_num_bits(output_mask_bn) || BN_is_bit_set(output_mask_bn, i) == 0) {
						CHECK(RecvData(connfd, &garble_output_type, sizeof(short)));
						if (eval_output_type != garble_output_type) {
							BN_set_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
						} else {
							BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
						}
					} else {
						CHECK(SendData(connfd, &eval_output_type, sizeof(short)));
						BN_clear_bit(output_bn, r * jump_size + cid * garbled_circuit.output_size + i);
					}
				}
			}
		}
	}

	BN_free(output_mask_bn);
	return SUCCESS;
}

