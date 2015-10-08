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
/**
 * @file justGarble.h
 * @author JustGarble & Ebi
 * @date 27 Mar 2015
 * @brief File containing the definition of main structures and functions
 *
 */

#ifndef GARBLED_CIRCUIT_GARBLED_CIRCUIT_H_
#define GARBLED_CIRCUIT_GARBLED_CIRCUIT_H_

#include <cstdint>
#include <string>
#include "crypto/block.h"

using std::string;

/**
 * @brief Used to store two labels.
 */
typedef struct BlockPair {
  block label0;
  block label1;
} BlockPair;

/**
 * @brief Used to store inputs, output, and type of gate in the circuit.
 *
 */
typedef struct GarbledGate {
  uint64_t input0; /**< wire index for 1st input. */
  uint64_t input1; /**< wire index for 2st input. */
  uint64_t output; /**< wire index for output. */
  int type; /**< wire Type, defined in util/common.h */
} GarbledGate;

/**
 * @brief Stores Garbled Circuit.
 *
 * GarbledCircuit structure stores all the information required
 * for both garbling and evaluation. It is created based on SCD file.
 */
typedef struct GarbledCircuit {
  uint64_t g_init_size;
  uint64_t e_init_size;
  uint64_t g_input_size;
  uint64_t e_input_size;
  uint64_t dff_size;
  uint64_t output_size;
  uint64_t gate_size;

  GarbledGate* garbledGates; /*!< topologically sorted gates */
  uint64_t *outputs; /*!< index of output wires */
  uint64_t *D; /*!< p-length array of wire index corresponding
   to D signal (Data) of DFF. */
  int64_t *I; /*!< p-length array of wire index corresponding
   to I signal (Initial) of DFF. */

  inline uint64_t get_init_size() const {
    return g_init_size + e_init_size;
  }
  inline uint64_t get_input_size() const {
    return g_input_size + e_input_size;
  }
  inline uint64_t get_wire_size() const {
    return get_init_size() + get_input_size() + dff_size + gate_size;
  }

  /**
   * indexing structure:
   * 0.g_init
   * 1.e_init
   * 2.g_input
   * 3.e_input
   * 4.dff
   * 5.gate
   */
  inline uint64_t get_init_lo_index() const {
    return 0;
  }
  inline uint64_t get_g_init_lo_index() const {
    return 0;
  }
  inline uint64_t get_g_init_hi_index() const {
    return g_init_size;
  }

  inline uint64_t get_e_init_lo_index() const {
    return get_g_init_hi_index();
  }
  inline uint64_t get_e_init_hi_index() const {
    return get_g_init_hi_index() + e_init_size;
  }
  inline uint64_t get_init_hi_index() const {
    return get_e_init_hi_index();
  }

  inline uint64_t get_input_lo_index() const {
    return get_e_init_hi_index();
  }
  inline uint64_t get_g_input_lo_index() const {
    return get_e_init_hi_index();
  }
  inline uint64_t get_g_input_hi_index() const {
    return get_e_init_hi_index() + g_input_size;
  }

  inline uint64_t get_e_input_lo_index() const {
    return get_g_input_hi_index();
  }
  inline uint64_t get_e_input_hi_index() const {
    return get_g_input_hi_index() + e_input_size;
  }
  inline uint64_t get_input_hi_index() const {
    return get_e_input_hi_index();
  }

  inline uint64_t get_dff_lo_index() const {
    return get_e_input_hi_index();
  }
  inline uint64_t get_dff_hi_index() const {
    return get_e_input_hi_index() + dff_size;
  }

  inline uint64_t get_gate_lo_index() const {
    return get_dff_hi_index();
  }
  inline uint64_t get_gate_hi_index() const {
    return get_dff_hi_index() + gate_size;
  }

  inline uint64_t get_wire_lo_index() const {
    return 0;
  }
  inline uint64_t get_wire_hi_index() const {
    return get_gate_hi_index();
  }

} GarbledCircuit;

/**
 * @brief Create 2*n input labels and initial DFF labels.
 *
 * The function generates n random pair token. Token 0 is
 * generated randomly, token 1 is generated by token0 ^ R.
 * inputLabels[2*i + 0] represent token0 for input i and
 * inputLabels[2*i + 1] represent token1 for input i.
 *
 * @param param1 pointer to allocated 2*n inputLables.
 * @param param2 Garbling secret random block R.
 * @param param3 Number of pain tokens.
 *
 * @see JustGarble paper.
 *
 */
void CreateInputLabels(block* inputLabels, block R, uint64_t n);

/**
 * @brief Garble the circuit described in garbledCircuit.
 *
 * For efficiency reasons, we use the garbledCircuit data-structure for representing the input
 * circuit and the garbled output. The garbling process is non-destructive and
 * only affects the garbledTable member of the GarbledCircuit data-structure.
 * In other words, the same GarbledCircuit object can be reused multiple times,
 * to create multiple garbled circuit copies,
 * by just switching the garbledTable field to a new one. Also, the garbledTable
 * field is the only one that should be sent over the network in the case of an
 * MPC-type application, as the topology is expected to be available to the
 * receiver, and the gate-types are to be hidden away.
 * The inputLabels field is expected to contain 2n fresh input labels, obtained
 * by calling createInputLabels. The outputMap is expected to be a 2m-block sized
 * empty array.
 *
 * Half-Gate is replaced with the old code in JustGarble.
 *
 * @param param1 pointer to read garbledCircuit.
 * @param param2 pointer to generated pair inputLabels.
 * @param param3 pointer to generated pair initialDFFLabels.
 * @param param4 pointer to allocated pair output. The output labels will be filled.
 * @param param5 garbling secret random block R.
 * @param param6 opened socket to evaluator.
 * @return Number of clock cycle measure with RDTSC for garbling
 *
 * @see JustGarble paper.
 * @see Half-Gate paper.
 */
uint64_t Garble(GarbledCircuit& garbled_circuit, block** const_labels,
                block** init_labels, block*** input_labels, block global_key,
                block R, uint64_t clock_cycles, int connfd,
                block*** output_labels);

/**
 * @brief Evaluate a garbled circuit
 *
 * Evaluate a garbled circuit, using n input labels in the Extracted Labels
 * to return m output labels. The garbled circuit might be generated either in
 * one piece, as the result of running garbleCircuit, or may be pieced together,
 * by building the circuit (startBuilding ... finishBuilding), and adding
 * garbledTable from another source, say, a network transmission.
 *
 * Half-Gate is replaced with the old code in JustGarble.
 *
 * @param param1 pointer to read garbledCircuit.
 * @param param2 pointer to generated inputLabels.
 * @param param3 pointer to generated initialDFFLabels.
 * @param param4 pointer to allocated output. The output labels will be filled..
 * @param param5 opened socket to garbler.
 * @return Number of clock cycle measure with RDTSC for garbling
 *
 * @see JustGarble paper.
 * @see TinyGarble paper.
 * @see Half-Gate paper.
 */

uint64_t Evaluate(GarbledCircuit& garbled_circuit, block* const_labels,
                  block* init_labels, block** input_labels, block global_key,
                  uint64_t clock_cycles, int connfd, block** output_labels);

/**
 * @brief Deallocates garbledCircuit
 *
 *
 * @param param1 pointer to garbledCircuit. The garbledCircuit will be deallocated.
 */
void RemoveGarbledCircuit(GarbledCircuit *garbledCircuit);

int Alice(GarbledCircuit& garbled_circuit, const string& init_str,
          const string& input_str, uint64_t clock_cycles, int connfd);
int Bob(GarbledCircuit& garbled_circuit, const string& init_str,
        const string& input_str, uint64_t clock_cycles, int connfd);

#endif /* GARBLED_CIRCUIT_GARBLED_CIRCUIT_H_ */
