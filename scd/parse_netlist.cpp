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

#include "scd/parse_netlist.h"

#include <boost/tokenizer.hpp>
#include <boost/foreach.hpp>
#include <fstream>
#include <map>
#include "scd/scheduling.h"
#include "util/common.h"
#include "util/log.h"

using std::ifstream;
using boost::char_separator;
using boost::tokenizer;
using std::map;
using std::pair;

string Type2StrGate(short itype) {
  string type;
  if (itype == ANDGATE) {
    type = "AND";
  } else if (itype == ANDNGATE) {
    type = "ANDN";
  } else if (itype == NANDGATE) {
    type = "NAND";
  } else if (itype == NANDNGATE) {
    type = "NANDN";
  } else if (itype == ORGATE) {
    type = "OR";
  } else if (itype == ORNGATE) {
    type = "ORN";
  } else if (itype == NORGATE) {
    type = "NOR";
  } else if (itype == NORNGATE) {
    type = "NORN";
  } else if (itype == XORGATE) {
    type = "XOR";
  } else if (itype == XNORGATE) {
    type = "XNOR";
  } else if (itype == NOTGATE) {
    type = "IV";
  } else if (itype == DFFGATE) {
    type = "DFF";
  } else {
    type = "NOTVALID";
  }
  return type;
}

int ParseNetlist(const string &filename, ReadCircuitString &readCircuitString) {

  ifstream fin(filename.c_str(), std::ios::in);
  if (!fin.good()) {
    LOG(ERROR) << "file not found:" << filename << endl;
    return -1;
  }

  uint64_t no_of_bits = 0;
  bool is_inport = 0;
  bool is_outport = 0;
  bool store_input0 = 0;
  bool store_input1 = 0;
  bool store_output = 0;
  bool store_d = 0;
  bool store_i = 0;
  bool store_q = 0;

  enum Block {
    MUX,
    FADDER,
    HADDER
  };

  enum Block block_type;
  bool store_in0 = 0;
  bool store_in1 = 0;
  bool store_sel_cin = 0;
  bool store_cout = 0;
  bool store_f_sum = 0;

  string buf("_");
  bool endoffile = false;
  while (!endoffile) {
    getline(fin, buf);
    char_separator<char> sep(" ,;.()\t\r");
    tokenizer<char_separator<char> > tok(buf, sep);

    BOOST_FOREACH(string str, tok){
    if(!str.compare("endmodule")) {
      endoffile = true;
      break;
    } else if(!str.compare("input")) {
      is_inport = 1;
      is_outport = 0;
      no_of_bits = 0;
    } else if(!str.compare("output")) {
      is_inport = 0;
      is_outport = 1;
      no_of_bits = 0;
    } else if(!str.compare("wire")) {
      is_outport = 0;
      is_inport = 0;
      no_of_bits = 0;
    } else if(!str.compare("AND")) {
      ReadGateString g;
      g.type = ANDGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("ANDN")) {
      ReadGateString g;
      g.type = ANDNGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("NAND")) {
      ReadGateString g;
      g.type = NANDGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("NANDN")) {
      ReadGateString g;
      g.type = NANDNGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("OR")) {
      ReadGateString g;
      g.type = ORGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("ORN")) {
      ReadGateString g;
      g.type = ORNGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("NOR")) {
      ReadGateString g;
      g.type = NORGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("NORN")) {
      ReadGateString g;
      g.type = NORNGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("XOR")) {
      ReadGateString g;
      g.type = XORGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("XNOR")) {
      ReadGateString g;
      g.type = XNORGATE;
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("IV")) {
      ReadGateString g;
      g.type = NOTGATE;
      g.input[1] = "";
      readCircuitString.gate_list_string.push_back(g);
    } else if(!str.compare("DFF")) {
      ReadGateString g;
      g.type = DFFGATE;
      g.input[1] = "";
      readCircuitString.dff_list_string.push_back(g);
    } else if(!str.compare("MUX")) {
      ReadGateString g1, g2, g3;
      block_type = MUX;
      g1.type = XORGATE;
      g2.type = ANDGATE;
      g3.type = XORGATE;
      readCircuitString.gate_list_string.push_back(g1);
      readCircuitString.gate_list_string.push_back(g2);
      readCircuitString.gate_list_string.push_back(g3);
    } else if(!str.compare("HADDER")) {
      ReadGateString g1, g2;
      block_type = HADDER;
      g1.type = ANDGATE;
      g2.type = XORGATE;
      readCircuitString.gate_list_string.push_back(g1);
      readCircuitString.gate_list_string.push_back(g2);
    } else if(!str.compare("FADDER")) {
      ReadGateString g1, g2, g3, g4, g5;
      block_type = FADDER;
      g1.type = XORGATE;
      g2.type = XORGATE;
      g3.type = ANDGATE;
      g4.type = XORGATE;
      g5.type = XORGATE;
      readCircuitString.gate_list_string.push_back(g1);
      readCircuitString.gate_list_string.push_back(g2);
      readCircuitString.gate_list_string.push_back(g3);
      readCircuitString.gate_list_string.push_back(g4);
      readCircuitString.gate_list_string.push_back(g5);
    } else if(is_inport) {
      if (str.at(0) =='[') {
        tokenizer<> bits(str);
        tokenizer<>::iterator beg = bits.begin();
        string bits_str(*beg);
        no_of_bits = atoi(bits_str.c_str())+1;
      } else if(str.compare("clk") && str.compare("rst")) {
        if(!str.compare("g_init")) {
          readCircuitString.g_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_init")) {
          readCircuitString.e_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("g_input")) {
          readCircuitString.g_input_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_input")) {
          readCircuitString.e_input_size = (no_of_bits>0)?no_of_bits:1;
        } else {
          LOG(ERROR) << "The input name is not valid " << str << endl <<
          "valid choice: { g_init,  e_init, g_input, e_input}" << endl;
          return FAILURE;
        }
      }
    } else if(is_outport) {
      if (str.at(0) =='[') {
        tokenizer<> bits(str);
        tokenizer<>::iterator beg = bits.begin();
        string bits_str(*beg);
        no_of_bits = atoi(bits_str.c_str())+1;
        continue;
      } else if(!str.compare("o")) {
        readCircuitString.output_size = no_of_bits;
      } else {
        LOG(ERROR) << "The output name is not valid " << str << endl <<
        "valid choice: { o }" << endl;
        return FAILURE;
      }
    } else if (!str.compare("A")) {
      store_input0 = 1;
    } else if(store_input0) {
      readCircuitString.gate_list_string.back().input[0] = str;
      store_input0 = 0;
    } else if(!str.compare("D")) {
      store_d = 1;
    } else if(store_d) {
      readCircuitString.dff_list_string.back().input[0] = str;
      store_d = 0;
    } else if(!str.compare("I")) {
      store_i = 1;
    } else if(store_i) {
      readCircuitString.dff_list_string.back().input[1] = str;
      store_i = 0;
    } else if (!str.compare("B")) {
      store_input1 = 1;
    } else if(store_input1) {
      readCircuitString.gate_list_string.back().input[1] = str;
      store_input1 = 0;
    } else if (!str.compare("Z")) {
      store_output = 1;
    } else if(store_output) {
      readCircuitString.gate_list_string.back().output = str;
      store_output = 0;
    } else if (!str.compare("Q")) {
      store_q = 1;
    } else if(store_q) {
      readCircuitString.dff_list_string.back().output = str;
      store_q = 0;
    } else if (!str.compare("IN0")) {
      store_in0 = 1;
    } else if(store_in0) {
      int last = readCircuitString.gate_list_string.size() - 1;
      if(block_type == MUX) {
        readCircuitString.gate_list_string[last].input[0] = str;
        readCircuitString.gate_list_string[last-2].input[0] = str;
      } else if(block_type == HADDER) {
        readCircuitString.gate_list_string[last].input[0] = str;
        readCircuitString.gate_list_string[last-1].input[0] = str;
      } else if(block_type == FADDER) {
        readCircuitString.gate_list_string[last-4].input[0] = str;
      }
      store_in0 = 0;
    } else if (!str.compare("IN1")) {
      store_in1 = 1;
    } else if(store_in1) {
      int last = readCircuitString.gate_list_string.size() - 1;
      if(block_type == MUX) {
        readCircuitString.gate_list_string[last-2].input[1] = str;
      } else if(block_type == HADDER) {
        readCircuitString.gate_list_string[last].input[1] = str;
        readCircuitString.gate_list_string[last-1].input[1] = str;
      } else if(block_type == FADDER) {
        readCircuitString.gate_list_string[last-3].input[0] = str;
        readCircuitString.gate_list_string[last].input[1] = str;
      }
      store_in1 = 0;
    } else if (!str.compare("SEL") || !str.compare("CIN")) {
      store_sel_cin = 1;
    } else if(store_sel_cin) {
      int last = readCircuitString.gate_list_string.size() - 1;
      if(block_type == MUX) {
        readCircuitString.gate_list_string[last-1].input[1] = str;
      } else if(block_type == FADDER) {
        readCircuitString.gate_list_string[last-4].input[1] = str;
        readCircuitString.gate_list_string[last-3].input[1] = str;
        readCircuitString.gate_list_string[last-1].input[1] = str;
      }
      store_sel_cin = 0;
    } else if (!str.compare("COUT")) {
      store_cout = 1;
    } else if(store_cout) {
      int last = readCircuitString.gate_list_string.size() - 1;
      if(block_type == HADDER) {
        readCircuitString.gate_list_string[last-1].output = str;
      } else if(block_type == FADDER) {
        readCircuitString.gate_list_string[last-1].output = str;
      }
      store_cout = 0;
    } else if (!str.compare("F") || !str.compare("SUM")) {
      store_f_sum = 1;
    } else if(store_f_sum) {
      int last = readCircuitString.gate_list_string.size() - 1;
      if(block_type == MUX) {
        readCircuitString.gate_list_string[last-2].output = "MUX_INT_2_" + std::to_string(last-2);

        readCircuitString.gate_list_string[last-1].input[0] = readCircuitString.gate_list_string[last-2].output;
        readCircuitString.gate_list_string[last-1].output = "MUX_INT_1_" + std::to_string(last-1);

        readCircuitString.gate_list_string[last].input[1] = readCircuitString.gate_list_string[last-1].output;
        readCircuitString.gate_list_string[last].output = str;
      } else if(block_type == HADDER) {
        readCircuitString.gate_list_string[last].output = str;
      } else if(block_type == FADDER) {
        readCircuitString.gate_list_string[last-4].output = "FADDER_INT_1" + std::to_string(last-4);

        readCircuitString.gate_list_string[last-3].output = "FADDER_INT_2" + std::to_string(last-3);

        readCircuitString.gate_list_string[last-2].input[0] = readCircuitString.gate_list_string[last-4].output;
        readCircuitString.gate_list_string[last-2].input[1] = readCircuitString.gate_list_string[last-3].output;
        readCircuitString.gate_list_string[last-2].output = "FADDER_INT_3" + std::to_string(last-2);

        readCircuitString.gate_list_string[last-1].input[0] = readCircuitString.gate_list_string[last-2].output;

        readCircuitString.gate_list_string[last].input[0] = readCircuitString.gate_list_string[last-4].output;
        readCircuitString.gate_list_string[last].output = str;

      }
      store_f_sum = 0;
    }
    // TODO(ebi): print error.
  }
}

  LOG(INFO) << "string name" << endl;
  LOG(INFO) << "g_init:" << readCircuitString.g_init_size << endl;
  LOG(INFO) << "e_init:" << readCircuitString.e_init_size << endl;
  LOG(INFO) << "g_input:" << readCircuitString.g_input_size << endl;
  LOG(INFO) << "e_input:" << readCircuitString.e_input_size << endl;

  LOG(INFO) << "dffs:" << endl;
  for (uint64_t i = 0; i < readCircuitString.dff_list_string.size(); i++) {
    LOG(INFO) << i << "\t"
              << Type2StrGate(readCircuitString.dff_list_string[i].type) << "\t"
              << readCircuitString.dff_list_string[i].input[0] << "\t"
              << readCircuitString.dff_list_string[i].input[1] << "\t"
              << readCircuitString.dff_list_string[i].output << endl;
  }
  LOG(INFO) << endl;

  LOG(INFO) << "gates:" << endl;
  for (uint64_t i = 0; i < readCircuitString.gate_list_string.size(); i++) {
    LOG(INFO) << i << "\t"
              << Type2StrGate(readCircuitString.gate_list_string[i].type)
              << "\t" << readCircuitString.gate_list_string[i].input[0] << "\t"
              << readCircuitString.gate_list_string[i].input[1] << "\t"
              << readCircuitString.gate_list_string[i].output << endl;
  }
  LOG(INFO) << endl;

  LOG(INFO) << "outputs:" << endl;
  for (uint64_t i = 0; i < readCircuitString.output_size; i++) {
    LOG(INFO) << "o[" << i << "]" << " " << i << endl;
  }
  LOG(INFO) << endl;
  return 0;
}

void AddWireArray(map<string, uint64_t>& wire_name_table, const string& name,
                  uint size, uint64_t& wire_index) {
  if (size == 1) {
    wire_name_table.insert(pair<string, uint64_t>(name, wire_index++));
  } else {
    for (uint i = 0; i < size; ++i) {
      wire_name_table.insert(
          pair<string, uint64_t>(name + "[" + std::to_string(i) + "]",
                                 wire_index++));
    }
  }
}

int IdAssignment(const ReadCircuitString& readCircuitString,
                 ReadCircuit &readCircuit) {
  readCircuit.g_init_size = readCircuitString.g_init_size;
  readCircuit.e_init_size = readCircuitString.e_init_size;
  readCircuit.g_input_size = readCircuitString.g_input_size;
  readCircuit.e_input_size = readCircuitString.e_input_size;

  readCircuit.dff_size = readCircuitString.dff_list_string.size();
  readCircuit.gate_size = readCircuitString.gate_list_string.size();
  readCircuit.output_size = readCircuitString.output_size;

  map<string, uint64_t> wire_name_table;
  uint64_t wire_index = 0;

  AddWireArray(wire_name_table, "g_init", readCircuit.g_init_size, wire_index);
  AddWireArray(wire_name_table, "e_init", readCircuit.e_init_size, wire_index);
  AddWireArray(wire_name_table, "g_input", readCircuit.g_input_size,
               wire_index);
  AddWireArray(wire_name_table, "e_input", readCircuit.e_input_size,
               wire_index);

  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    wire_name_table.insert(
        pair<string, uint64_t>(readCircuitString.dff_list_string[i].output,
                               wire_index++));  //DFF Qs
  }

  for (uint i = 0; i < readCircuit.gate_size; i++) {
    wire_name_table.insert(
        pair<string, uint64_t>(readCircuitString.gate_list_string[i].output,
                               wire_index++));  // gates' output
  }
  wire_name_table.insert(pair<string, uint64_t>("", ((uint64_t) -1)));
  wire_name_table.insert(pair<string, uint64_t>("1'b0", CONST_ZERO));
  wire_name_table.insert(pair<string, uint64_t>("1'b1", CONST_ONE));

  readCircuit.gate_list.resize(readCircuit.gate_size);
  readCircuit.output_list.resize(readCircuit.output_size);
  readCircuit.dff_list.resize(readCircuit.dff_size);

  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    readCircuit.gate_list[i].type = readCircuitString.gate_list_string[i].type;
    readCircuit.gate_list[i].input[0] = wire_name_table[readCircuitString
        .gate_list_string[i].input[0]];
    readCircuit.gate_list[i].input[1] = wire_name_table[readCircuitString
        .gate_list_string[i].input[1]];
    readCircuit.gate_list[i].output = wire_name_table[readCircuitString
        .gate_list_string[i].output];
  }

  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    readCircuit.dff_list[i].type = readCircuitString.dff_list_string[i].type;

    readCircuit.dff_list[i].input[0] = wire_name_table[readCircuitString
        .dff_list_string[i].input[0]];
    readCircuit.dff_list[i].input[1] = wire_name_table[readCircuitString
        .dff_list_string[i].input[1]];
    readCircuit.dff_list[i].output = wire_name_table[readCircuitString
        .dff_list_string[i].output];
  }

  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    readCircuit.output_list[i] =
        wire_name_table["o[" + std::to_string(i) + "]"];
  }

  LOG(INFO) << "ID assignment" << endl;

  LOG(INFO) << "dffs:" << endl;
  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    LOG(INFO) << i << "\t" << Type2StrGate(readCircuit.dff_list[i].type) << "\t"
              << readCircuit.dff_list[i].input[0] << "\t"
              << readCircuit.dff_list[i].input[1] << "\t"
              << readCircuit.dff_list[i].output << endl;
  }
  LOG(INFO) << endl;
  LOG(INFO) << "gates:" << endl;
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    LOG(INFO) << i << "\t" << Type2StrGate(readCircuit.gate_list[i].type)
              << "\t" << readCircuit.gate_list[i].input[0] << "\t"
              << readCircuit.gate_list[i].input[1] << "\t"
              << readCircuit.gate_list[i].output << endl;
  }
  LOG(INFO) << endl;
  LOG(INFO) << "outputs:" << endl;
  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    LOG(INFO) << readCircuit.output_list[i] << endl;
  }
  LOG(INFO) << endl;

  return 0;
}

int TopologicalSort(ReadCircuit &readCircuit) {

  uint64_t **core;
  core = new uint64_t*[1];  // no of rows = no_core
  core[0] = new uint64_t[readCircuit.gate_size + 1];  // no of columns = no_of_gates+1
  memset(core[0], -1, (readCircuit.gate_size + 1) * sizeof(uint64_t));

  Schedule(readCircuit, 1, core);

  readCircuit.task_schedule.resize(readCircuit.gate_size);

  vector<uint64_t> ts(readCircuit.gate_size);

  uint input_size = readCircuit.g_init_size + readCircuit.e_init_size
      + readCircuit.g_input_size + readCircuit.e_input_size;
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    readCircuit.task_schedule[i] = core[0][i];
    ts[i] = core[0][i] + input_size + readCircuit.dff_size;
  }

  vector<uint64_t> ts_1(
      input_size + readCircuit.dff_size + readCircuit.gate_size);

  for (uint64_t i = 0; i < input_size + readCircuit.dff_size; i++) {
    ts_1[i] = i;
  }

  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    ts_1[ts[i]] = i + input_size + readCircuit.dff_size;
  }

  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    readCircuit.output_list[i] = ts_1[readCircuit.output_list[i]];
  }
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    readCircuit.gate_list[i].input[0] = ts_1[readCircuit.gate_list[i].input[0]];
    if (readCircuit.gate_list[i].input[1] > 0)  //IV has -1 input
      readCircuit.gate_list[i].input[1] =
          ts_1[readCircuit.gate_list[i].input[1]];
    readCircuit.gate_list[i].output =
        ts_1[i + input_size + readCircuit.dff_size];
  }

  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    readCircuit.dff_list[i].input[0] = ts_1[readCircuit.dff_list[i].input[0]];
    if (readCircuit.dff_list[i].input[1] > 0)  // Constant values are negative
      readCircuit.dff_list[i].input[1] = ts_1[readCircuit.dff_list[i].input[1]];
    readCircuit.dff_list[i].output = ts_1[readCircuit.dff_list[i].output];
  }

  LOG(INFO) << endl << "Topological Sort" << endl;
  LOG(INFO) << "dffs:" << endl;
  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    LOG(INFO) << i << "\t" << Type2StrGate(readCircuit.dff_list[i].type) << "\t"
              << readCircuit.dff_list[i].input[0] << "\t"
              << readCircuit.dff_list[i].input[1] << "\t"
              << readCircuit.dff_list[i].output << endl;
  }
  LOG(INFO) << endl;

  LOG(INFO) << "gates:" << endl;
  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    uint64_t gid = readCircuit.task_schedule[i];
    LOG(INFO) << i << "\t" << Type2StrGate(readCircuit.gate_list[gid].type)
              << "\t" << readCircuit.gate_list[gid].input[0] << "\t"
              << readCircuit.gate_list[gid].input[1] << "\t"
              << readCircuit.gate_list[gid].output << endl;
  }
  LOG(INFO) << endl;

  LOG(INFO) << "outputs:" << endl;
  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    LOG(INFO) << readCircuit.output_list[i] << endl;
  }
  LOG(INFO) << endl;
  delete[] core[0];
  delete[] core;
  return 0;
}

