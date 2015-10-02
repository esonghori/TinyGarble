#ifndef SCD_PARSE_NETLIST_H_
#define SCD_PARSE_NETLIST_H_

#include "scd/v_2_scd.h"

string typetoStrGate(short itype);
int parse_netlist(const string &filename,
                  ReadCircuitString &readCircuitString);
int id_assignment(const ReadCircuitString& readCircuitString,
                  ReadCircuit &readCircuit);
int topological_sort(ReadCircuit &readCircuit);


#endif /* SCD_PARSE_NETLIST_H_ */
