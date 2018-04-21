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

#ifndef GARBLED_CIRCUIT_GARBLED_CIRCUIT_UTIL_H_
#define GARBLED_CIRCUIT_GARBLED_CIRCUIT_UTIL_H_

#include <cstdint>
#include <string>
#include <vector>
#include <openssl/bn.h>
#include "crypto/block.h"
#include "crypto/aes.h"

using std::string;
using std::vector;

#define SECRET (-1)
#define SECRET_INV (-2)

#define IsSecret(X) ((X) < 0)

/**
 * @brief Used to store two labels.
 */
typedef struct BlockPair {
	block label0;
	block label1;
} BlockPair;

/**
 * @brief Used to store two-row table with gid
 */
typedef struct GarbledTable {
	block row[2];
	uint32_t gid;
} GarbleTable;

/**
 * @brief Used to store inputs, output, and type of gate in the circuit.
 *
 */
typedef struct GarbledGate {
	int64_t input0; /**< wire index for 1st input. */
	int64_t input1; /**< wire index for 2st input. */
	int64_t output; /**< wire index for output. */
	int type; /**< wire Type, defined in util/common.h */
	int fanout; /**< # of gates depend on this gate. */
} GarbledGate;

/**
 * @brief Stores Garbled Circuit.
 *
 * GarbledCircuit structure stores all the information required
 * for both garbling and evaluation. It is created based on SCD file.
 */
typedef struct GarbledCircuit {
	uint64_t p_init_size;  // public init
	uint64_t g_init_size;  // garbler init
	uint64_t e_init_size;  // eval init
	uint64_t p_input_size;  // public input
	uint64_t g_input_size;  // garbler input
	uint64_t e_input_size;  // eval input
	uint64_t i_input_size; // intermediate input
	uint64_t dff_size;
	uint64_t output_size;
	uint64_t terminate_id;  // terminate signal id, 0 in case of no signal
	uint64_t gate_size;

	string type;
	uint64_t max_pool_size;
	uint64_t max_output_size;

	bool conv_layer;
	uint64_t input_matrix_size;
	uint64_t output_matrix_size;
	uint64_t filter_size;
	uint64_t number_filters;
	uint64_t stride_size;
	uint64_t bit_length;

	GarbledGate* garbledGates; /*!< topologically sorted gates */
	int64_t *outputs; /*!< index of output wires */
	int64_t *D; /*!< p-length array of wire index corresponding
	 to D signal (Data) of DFF. */
	int64_t *I; /*!< p-length array of wire index corresponding
	 to I signal (Initial) of DFF. */
	uint64_t n_of_run;
	uint64_t n_of_clk;

//	block* output_labels;

	/**
	 * indexing structure:
	 * 0.p_init
	 * 1.g_init
	 * 2.e_init
	 * 3.p_input
	 * 4.g_input
	 * 5.e_input
	 * 6.i_input
	 * 7.dff
	 * 8.gate
	 */

	inline uint64_t get_init_size() const {
		return p_init_size + g_init_size + e_init_size;
	}
	inline uint64_t get_input_size() const {
		return p_input_size + g_input_size + e_input_size + i_input_size;
	}
	inline uint64_t get_wire_size() const {
		return get_init_size() + get_input_size() + dff_size + gate_size;
	}

	inline uint64_t get_secret_init_size() const {
		return g_init_size + e_init_size;
	}

	inline uint64_t get_secret_input_size() const {
		return g_input_size + e_input_size + i_input_size;
	}

	inline uint64_t get_init_lo_index() const {
		return 0;
	}

	inline uint64_t get_p_init_lo_index() const {
		return get_init_lo_index();
	}
	inline uint64_t get_p_init_hi_index() const {
		return get_p_init_lo_index() + p_init_size;
	}

	inline uint64_t get_g_init_lo_index() const {
		return get_p_init_hi_index();
	}
	inline uint64_t get_g_init_hi_index() const {
		return get_g_init_lo_index() + g_init_size;
	}

	inline uint64_t get_e_init_lo_index() const {
		return get_g_init_hi_index();
	}
	inline uint64_t get_e_init_hi_index() const {
		return get_e_init_lo_index() + e_init_size;
	}

	inline uint64_t get_init_hi_index() const {
		return get_e_init_hi_index();
	}

	inline uint64_t get_input_lo_index() const {
		return get_init_hi_index();
	}

	inline uint64_t get_p_input_lo_index() const {
		return get_input_lo_index();
	}
	inline uint64_t get_p_input_hi_index() const {
		return get_p_input_lo_index() + p_input_size;
	}

	inline uint64_t get_g_input_lo_index() const {
		return get_p_input_hi_index();
	}
	inline uint64_t get_g_input_hi_index() const {
		return get_g_input_lo_index() + g_input_size;
	}

	inline uint64_t get_e_input_lo_index() const {
		return get_g_input_hi_index();
	}
	inline uint64_t get_e_input_hi_index() const {
		return get_e_input_lo_index() + e_input_size;
	}

	inline uint64_t get_i_input_lo_index() const {
		return get_e_input_hi_index();
	}
	inline uint64_t get_i_input_hi_index() const {
		return get_i_input_lo_index() + i_input_size;
	}

	inline uint64_t get_input_hi_index() const {
		return get_i_input_hi_index();
	}

	inline uint64_t get_dff_lo_index() const {
		return get_input_hi_index();
	}
	inline uint64_t get_dff_hi_index() const {
		return get_dff_lo_index() + dff_size;
	}

	inline uint64_t get_gate_lo_index() const {
		return get_dff_hi_index();
	}
	inline uint64_t get_gate_hi_index() const {
		return get_gate_lo_index() + gate_size;
	}

	inline uint64_t get_wire_lo_index() const {
		return 0;
	}
	inline uint64_t get_wire_hi_index() const {
		return get_gate_hi_index();
	}

	inline bool has_input() const {
		return (g_init_size + e_init_size + g_input_size + e_input_size) > 0;
	}

} GarbledCircuit;

typedef struct CircuitIO {
	BIGNUM* p_init;
	BIGNUM* p_input;
	BIGNUM* party_init;
	BIGNUM* party_input;
	BIGNUM* output_bn;
} CircuitIO;

typedef struct CircuitLabel {
	block* init_labels;
	block* input_labels;
	block* output_labels;
	block* input_matrix_labels;
	block* filters_labels;
	short* output_vals;
} CircuitLabel;

typedef struct GarbledCircuitCollection {
	int number_of_circuits;
	GarbledCircuit* garbled_circuits;
	CircuitIO* circuit_ios;
	int** i_circuit_inputs;
	int* n_of_run;
	int* n_of_clk;
} GarbledCircuitCollection;

enum class OutputMode {
	consecutive = 0, separated_clock = 1, last_clock = 2
};

typedef struct GarbledCircuitIO {
  string circuitInput;//probably useless
  string circuitOutput;
} GarbledCircuitIO;





uint64_t NumOfNonXor(const GarbledCircuit& garbled_circui);
void RemoveGarbledCircuit(GarbledCircuit *garbled_circuit);
void RemoveGarbledCircuitCollection(GarbledCircuitCollection* garbled_circuit_collection);
void RemoveLabels(CircuitLabel& labels);

int ParseInitInputStr(const string& init_str, const string&input_str, BIGNUM** init, BIGNUM** input);
void GarbleEvalGateKnownValue(short input0_value, short input1_value, int type, short* output_value);
void GarbleGate(BlockPair input0_labels, short input0_value, BlockPair input1_labels, short input1_value, int type, uint64_t cid, uint64_t gid,
		GarbledTable* garbled_tables, uint64_t* garbled_table_ind, block R, AES_KEY AES_Key, BlockPair* output_labels, short* output_value);
void EvalGate(block input0_labels, short input0_value, block input1_labels, short input1_value, int type, uint64_t cid, uint64_t gid,
		GarbledTable* garbled_tables, uint64_t* garbled_table_ind, AES_KEY AES_Key, block* output_labels, short* output_value);
int FillFanout(GarbledCircuit* garbled_circuit);
void ReduceFanout(const GarbledCircuit& garbled_circuit, int *fanout, int64_t wid, int64_t gate_bias);

void PrintPredecessorsEval(const GarbledCircuit& garbled_circuit, block *wires, int64_t cid, int64_t gid);
void PrintPredecessorsGarble(const GarbledCircuit& garbled_circuit, BlockPair *wires, int64_t cid, int64_t gid);

int GarbleTransferTerminate(const GarbledCircuit& garbled_circuit, const BlockPair &terminate_label, short terminate_val, bool* is_terminate, int connfd);
int EvaluateTransferTerminate(const GarbledCircuit& garbled_circuit, const block &terminate_label, short terminate_val, bool* is_terminate, int connfd);

#endif /* GARBLED_CIRCUIT_GARBLED_CIRCUIT_UTIL_H_ */
