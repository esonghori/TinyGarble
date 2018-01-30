/*
 * GarbledCircuit.h
 *
 *  Created on: Jan 8, 2018
 *      Author: sadegh
 */

#ifndef GARBLEDCIRCUIT_H_
#define GARBLEDCIRCUIT_H_

#include <string>

using std::string;

class GarbledCircuit {
public:
	GarbledCircuit();
	virtual ~GarbledCircuit();

	string netlistFile;
};

#endif /* GARBLEDCIRCUIT_H_ */
