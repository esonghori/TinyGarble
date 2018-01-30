/*
 * GarbledCircuit.cpp
 *
 *  Created on: Jan 8, 2018
 *      Author: sadegh
 */

#include "GarbledCircuit.h"

#include "scd/scd.h"
#include "scd/scd_evaluator.h"
#include "crypto/aes.h"
#include "crypto/BN.h"
#include "crypto/OT.h"
#include "crypto/OT_extension.h"
#include "garbled_circuit/garbled_circuit.h"
#include "garbled_circuit/garbled_circuit_util.h"
#include "garbled_circuit/garbled_circuit_high_mem.h"
#include "garbled_circuit/garbled_circuit_low_mem.h"
#include "tcpip/tcpip.h"
#include "util/log.h"
#include "util/common.h"
#include "util/util.h"

GarbledCircuit::GarbledCircuit() {
	// TODO Auto-generated constructor stub

}

GarbledCircuit::~GarbledCircuit() {
	// TODO Auto-generated destructor stub
}

