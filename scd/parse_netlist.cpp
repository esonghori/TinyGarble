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

int ParseNetlist(const string &filename,
                 ReadCircuitString* read_circuit_string) {

  ifstream fin(filename.c_str(), std::ios::in);
  if (!fin.good()) {
    LOG(ERROR) << "file not found:" << filename << endl;
    return -1;
  }

  short gate_type = INVALGATE;
  uint64_t no_of_bits = 0;
  bool is_right_assignmnet = false;
  bool is_left_assignmnet = false;
  bool is_inport = false;
  bool is_outport = false;
  bool store_a = false;
  bool store_b = false;
  bool store_z = false;
  bool store_d = false;
  bool store_i = false;
  bool store_q = false;
  bool store_in0 = false;
  bool store_in1 = false;
  bool store_cin = false;
  bool store_sel = false;
  bool store_cout = false;
  bool store_sum = false;
  bool store_f = false;
  bool endoffile = false;

  string A = "", B = "", D = "", I = "", IN0 = "", IN1 = "", SEL = "", CIN = "",
      COUT = "", SUM = "", Z = "", Q = "", F = "";

  while (!endoffile) {
    CHECK_EXPR_MSG(fin.good(), "File is broken, no endmodule found.");
    string line = "";
    getline(fin, line);
    char_separator<char> sep(" ,()\t\r", ";");
    tokenizer<char_separator<char> > tok(line, sep);
    BOOST_FOREACH(string str, tok){
    if(!str.compare(";")) {
      if(gate_type == ANDGATE || gate_type == ANDNGATE ||
          gate_type == NANDGATE|| gate_type == NANDNGATE ||
          gate_type == ORGATE || gate_type == ORNGATE ||
          gate_type == NORGATE || gate_type == NORNGATE ||
          gate_type == XORGATE || gate_type == XNORGATE) {

        CHECK_EXPR_MSG(A!="", "A is missing: " + line);
        CHECK_EXPR_MSG(B!="", "B is missing: " + line);
        CHECK_EXPR_MSG(Z!="", "Z is missing: " + line);

        ReadGateString g;
        g.type = gate_type;
        g.input[0] = A;
        g.input[1] = B;
        g.output = Z;
        read_circuit_string->gate_list_string.push_back(g);
        A = "";
        B = "";
        Z = "";
        gate_type = INVALGATE;
      } else if(gate_type == NOTGATE) {
        CHECK_EXPR_MSG(A!="", "A is missing: " + line);
        CHECK_EXPR_MSG(Z!="", "Z is missing: " + line);

        ReadGateString g;
        g.type = gate_type;
        g.input[0] = A;
        g.input[1] = "";
        g.output = Z;
        read_circuit_string->gate_list_string.push_back(g);
        A = "";
        Z = "";
        gate_type = INVALGATE;
      } else if(gate_type == DFFGATE) {
        CHECK_EXPR_MSG(D!="", "D is missing: " + line);
        CHECK_EXPR_MSG(I!="", "I is missing: " + line);
        CHECK_EXPR_MSG(Q!="", "Q is missing: " + line);

        ReadGateString g;
        g.type = gate_type;
        g.input[0] = D;
        g.input[1] = I;
        g.output = Q;
        read_circuit_string->dff_list_string.push_back(g);
        D = "";
        I = "";
        Q = "";
        gate_type = INVALGATE;
      } else if (gate_type == MUXGATE) {

        CHECK_EXPR_MSG(IN0!="", "IN0 is missing: " + line);
        CHECK_EXPR_MSG(IN1!="", "IN1 is missing: " + line);
        CHECK_EXPR_MSG(SEL!="", "SEL is missing: " + line);
        CHECK_EXPR_MSG(F!="", "F is missing: " + line);

        ReadGateString g1, g2, g3;

        uint64_t gate_id = read_circuit_string->gate_list_string.size();

        g1.type = XORGATE;
        g1.input[0] = IN0;
        g1.input[1] = IN1;
        g1.output = "MUX_MID_1_" + std::to_string(gate_id);

        g2.type = ANDGATE;
        g2.input[0] = SEL;
        g2.input[1] = g1.output;
        g2.output = "MUX_MID_2_" + std::to_string(gate_id);

        g3.type = XORGATE;
        g3.input[0] = IN0;
        g3.input[1] = g2.output;
        g3.output = F;

        read_circuit_string->gate_list_string.push_back(g1);
        read_circuit_string->gate_list_string.push_back(g2);
        read_circuit_string->gate_list_string.push_back(g3);

        IN0 = "";
        IN1 = "";
        SEL = "";
        F = "";
        gate_type = INVALGATE;

      } else if (gate_type == HADDERGATE) {
        CHECK_EXPR_MSG(IN0!="", "IN0 is missing: " + line);
        CHECK_EXPR_MSG(IN1!="", "IN1 is missing: " + line);
        CHECK_EXPR_MSG(SUM!="" || COUT !="", "SUM and COUT are missing: " + line);

        if(SUM != "") {
          ReadGateString g;
          g.type = XORGATE;
          g.input[0] = IN0;
          g.input[1] = IN1;
          g.output = SUM;
          read_circuit_string->gate_list_string.push_back(g);
        }
        if(COUT != "") {
          ReadGateString g;
          g.type = ANDGATE;
          g.input[0] = IN0;
          g.input[1] = IN1;
          g.output = COUT;
          read_circuit_string->gate_list_string.push_back(g);
        }

        IN0 = "";
        IN1 = "";
        SUM = "";
        COUT = "";
        gate_type = INVALGATE;
      } else if (gate_type == FADDERGATE) {
        CHECK_EXPR_MSG(IN0!="", "IN0 is missing: " + line);
        CHECK_EXPR_MSG(IN1!="", "IN1 is missing: " + line);
        CHECK_EXPR_MSG(CIN!="", "CIN is missing: " + line);
        CHECK_EXPR_MSG(SUM!="" || COUT !="", "SUM and COUT are missing: " + line);

        uint64_t gate_id = read_circuit_string->gate_list_string.size();

        ReadGateString g1;
        g1.type = XORGATE;
        g1.input[0] = IN0;
        g1.input[1] = CIN;
        g1.output = "FADDER_MID_1_" + std::to_string(gate_id);
        read_circuit_string->gate_list_string.push_back(g1);

        if(SUM != "") {
          ReadGateString g2;

          g2.type = XORGATE;
          g2.input[0] = IN1;
          g2.input[1] = g1.output;
          g2.output = SUM;

          read_circuit_string->gate_list_string.push_back(g2);
        }
        if(COUT != "") {
          ReadGateString g2,g3,g4;

          g2.type = XORGATE;
          g2.input[0] = IN1;
          g2.input[1] = CIN;
          g2.output = "FADDER_MID_2_" + std::to_string(gate_id);

          g3.type = ANDGATE;
          g3.input[0] = g1.output;
          g3.input[1] = g2.output;
          g3.output = "FADDER_MID_3_" + std::to_string(gate_id);

          g4.type = XORGATE;
          g4.input[0] = CIN;
          g4.input[1] = g3.output;
          g4.output = COUT;
          read_circuit_string->gate_list_string.push_back(g2);
          read_circuit_string->gate_list_string.push_back(g3);
          read_circuit_string->gate_list_string.push_back(g4);
        }

        IN0 = "";
        IN1 = "";
        CIN = "";
        SUM = "";
        COUT = "";
        gate_type = INVALGATE;
      } else {
        is_inport = 0;
        is_outport = 0;
        no_of_bits = 0;
        is_left_assignmnet = false;
        is_right_assignmnet = false;
      }
    } else if(!str.compare("endmodule")) {
      endoffile = true;
      break;
    } else if(!str.compare("input")) {
      is_inport = 1;
    } else if(is_inport) {
      if (str.at(0) =='[') {
        tokenizer<> bits(str);
        tokenizer<>::iterator beg = bits.begin();
        string bits_str(*beg);
        no_of_bits = atoi(bits_str.c_str())+1;
      } else if(str.compare("clk") && str.compare("rst")) {
        if(!str.compare("p_init")) {
          read_circuit_string->p_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("g_init")) {
          read_circuit_string->g_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_init")) {
          read_circuit_string->e_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("p_input")) {
          read_circuit_string->p_input_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("g_input")) {
          read_circuit_string->g_input_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_input")) {
          read_circuit_string->e_input_size = (no_of_bits>0)?no_of_bits:1;
        } else {
          LOG(ERROR) << "The input name is not valid " << str << endl <<
          "valid choice: { p_init, g_init, e_init, "
          "p_input, g_input, e_input}: " << line << endl;
          return FAILURE;
        }
      }
    } else if(!str.compare("output")) {
      is_outport = 1;
    } else if(is_outport) {
      if (str.at(0) =='[') {
        tokenizer<> bits(str);
        tokenizer<>::iterator beg = bits.begin();
        string bits_str(*beg);
        no_of_bits = atoi(bits_str.c_str())+1;
      } else if(!str.compare("terminate")) {
        if(no_of_bits != 0) {
          LOG(ERROR) << "Terminate signal should be 1-bit output." << endl;
          return FAILURE;
        }
        read_circuit_string->has_terminate = true;
      } else if(!str.compare("o")) {
        read_circuit_string->output_size = (no_of_bits>0)?no_of_bits:1;
      } else {
        LOG(ERROR) << "The output name is not valid " << str << endl <<
        "valid choice: { o, terminate}" << endl;
        return FAILURE;
      }
    } else if(!str.compare("assign")) {
      is_left_assignmnet = true;
    } else if(is_left_assignmnet) {
      read_circuit_string->assignment_list_string.push_back(
          std::make_pair(str, ""));
      is_left_assignmnet = false;
    } else if(!str.compare("=")) {
      is_right_assignmnet = true;
    } else if(is_right_assignmnet) {
      const auto assign_pair = read_circuit_string->assignment_list_string.back();
      read_circuit_string->assignment_list_string.pop_back();
      read_circuit_string->assignment_list_string.push_back(
          std::make_pair(assign_pair.first, str));
      is_right_assignmnet = false;
    } else if(!str.compare("AND")) {
      gate_type = ANDGATE;
    } else if(!str.compare("ANDN")) {
      gate_type = ANDNGATE;
    } else if(!str.compare("NAND")) {
      gate_type = NANDGATE;
    } else if(!str.compare("NANDN")) {
      gate_type = NANDNGATE;
    } else if(!str.compare("OR")) {
      gate_type = ORGATE;
    } else if(!str.compare("ORN")) {
      gate_type = ORNGATE;
    } else if(!str.compare("NOR")) {
      gate_type = NORGATE;
    } else if(!str.compare("NORN")) {
      gate_type = NORNGATE;
    } else if(!str.compare("XOR")) {
      gate_type= XORGATE;
    } else if(!str.compare("XNOR")) {
      gate_type = XNORGATE;
    } else if(!str.compare("IV")) {
      gate_type = NOTGATE;
    } else if(!str.compare("DFF")) {
      gate_type = DFFGATE;
    } else if(!str.compare("MUX")) {
      gate_type = MUXGATE;
    } else if(!str.compare("HADDER")) {
      gate_type = HADDERGATE;
    } else if(!str.compare("FADDER")) {
      gate_type = FADDERGATE;
    } else if (!str.compare(".A")) {
      store_a = 1;
    } else if(store_a) {
      A = str;
      store_a = 0;
    } else if (!str.compare(".B")) {
      store_b = 1;
    } else if(store_b) {
      B = str;
      store_b = 0;
    } else if(!str.compare(".D")) {
      store_d = 1;
    } else if(store_d) {
      D = str;
      store_d = 0;
    } else if(!str.compare(".I")) {
      store_i = 1;
    } else if(store_i) {
      I = str;
      store_i = 0;
    } else if (!str.compare(".Z")) {
      store_z = 1;
    } else if(store_z) {
      Z = str;
      store_z = 0;
    } else if (!str.compare(".Q")) {
      store_q = 1;
    } else if(store_q) {
      Q = str;
      store_q = 0;
    } else if (!str.compare(".IN0")) {
      store_in0 = 1;
    } else if(store_in0) {
      IN0 = str;
      store_in0 = 0;
    } else if (!str.compare(".IN1")) {
      store_in1 = 1;
    } else if(store_in1) {
      IN1 = str;
      store_in1 = 0;
    } else if (!str.compare(".CIN")) {
      store_cin = 1;
    } else if(store_cin) {
      CIN = str;
      store_cin = 0;
    } else if (!str.compare(".SEL") ) {
      store_sel = 1;
    } else if(store_sel) {
      SEL = str;
      store_sel = 0;
    } else if (!str.compare(".COUT")) {
      store_cout = 1;
    } else if(store_cout) {
      COUT = str;
      store_cout = 0;
    } else if ( !str.compare(".SUM")) {
      store_sum = 1;
    } else if(store_sum) {
      SUM = str;
      store_sum = 0;
    } else if (!str.compare(".F")) {
      store_f = 1;
    } else if(store_f) {
      F = str;
      store_f = 0;
    }
  }
}
  return SUCCESS;
}

void AddWireArray(map<string, int64_t>& wire_name_table, const string& name,
                  uint64_t size, int64_t *wire_index) {
  if (size == 1) {
    wire_name_table.insert(pair<string, int64_t>(name, *wire_index));
    wire_name_table.insert(
        pair<string, int64_t>(name + "[0]", (*wire_index)++));  // some cases, it is w[0]
  } else {
    for (uint i = 0; i < size; ++i) {
      wire_name_table.insert(
          pair<string, int64_t>(name + "[" + std::to_string(i) + "]",
                                (*wire_index)++));
    }
  }
}

string GetBristWire(uint64_t w, uint64_t wire_size,
                    const ReadCircuitString& read_circuit_string) {
  if (w < read_circuit_string.g_input_size) {
    return "g_input[" + std::to_string(w) + "]";
  } else if (w
      < read_circuit_string.g_input_size + read_circuit_string.e_input_size) {
    uint64_t ind = w - read_circuit_string.g_input_size;
    return "e_input[" + std::to_string(ind) + "]";
  } else if (w >= wire_size - read_circuit_string.output_size) {
    uint64_t ind = w - wire_size + read_circuit_string.output_size;
    return "o[" + std::to_string(ind) + "]";
  }
  return "w" + std::to_string(w);
}

int ParseBrisNetlist(const string &filename,
                     ReadCircuitString* read_circuit_string) {

  ifstream fin(filename.c_str(), std::ios::in);
  if (!fin.good()) {
    LOG(ERROR) << "file not found:" << filename << endl;
    return -1;
  }

  uint64_t gate_size, wire_size;
  fin >> gate_size >> wire_size;

  CHECK_EXPR_MSG(gate_size != 0 && wire_size != 0,
                 "Number of gate or wire are zero.");

  fin >> read_circuit_string->g_input_size >> read_circuit_string->e_input_size
      >> read_circuit_string->output_size;

  for (uint64_t gid = 0; gid < gate_size; gid++) {
    string g_type;
    uint64_t inpu_num, output_num, i0, i1, o;
    //2 1 0 32 406 XOR
    fin >> inpu_num >> output_num >> i0;
    if (inpu_num == 1) {
      i1 = 0;
      fin >> o >> g_type;
    } else if (inpu_num == 2) {
      fin >> i1 >> o >> g_type;
    }

    ReadGateString g;
    g.input[0] = GetBristWire(i0, wire_size, *read_circuit_string);
    if (inpu_num > 1) {
      g.input[1] = GetBristWire(i1, wire_size, *read_circuit_string);
    } else {
      g.input[1] = "";
    }
    g.output = GetBristWire(o, wire_size, *read_circuit_string);

    if (g_type == "INV") {
      g.type = NOTGATE;
    } else if (g_type == "XOR") {
      g.type = XORGATE;
    } else if (g_type == "AND") {
      g.type = ANDGATE;
    } else {
      LOG(ERROR) << "Unknown gate type: " << g_type << endl;
      return FAILURE;
    }

    read_circuit_string->gate_list_string.push_back(g);
  }

  return SUCCESS;
}

int IdAssignment(const ReadCircuitString& read_circuit_string,
                 ReadCircuit* read_circuit) {
  read_circuit->p_init_size = read_circuit_string.p_init_size;
  read_circuit->g_init_size = read_circuit_string.g_init_size;
  read_circuit->e_init_size = read_circuit_string.e_init_size;
  read_circuit->p_input_size = read_circuit_string.p_input_size;
  read_circuit->g_input_size = read_circuit_string.g_input_size;
  read_circuit->e_input_size = read_circuit_string.e_input_size;

  read_circuit->dff_size = read_circuit_string.dff_list_string.size();
  read_circuit->gate_size = read_circuit_string.gate_list_string.size();
  read_circuit->output_size = read_circuit_string.output_size;

  int64_t wire_index = 0;
  map<string, int64_t> wire_name_table;

  AddWireArray(wire_name_table, "p_init", read_circuit->p_init_size,
               &wire_index);
  AddWireArray(wire_name_table, "g_init", read_circuit->g_init_size,
               &wire_index);
  AddWireArray(wire_name_table, "e_init", read_circuit->e_init_size,
               &wire_index);
  AddWireArray(wire_name_table, "p_input", read_circuit->p_input_size,
               &wire_index);
  AddWireArray(wire_name_table, "g_input", read_circuit->g_input_size,
               &wire_index);
  AddWireArray(wire_name_table, "e_input", read_circuit->e_input_size,
               &wire_index);

  for (uint64_t i = 0; i < read_circuit->dff_size; i++) {
    wire_name_table.insert(
        pair<string, int64_t>(read_circuit_string.dff_list_string[i].output,
                              wire_index++));  //DFF Qs
  }

  for (uint i = 0; i < read_circuit->gate_size; i++) {
    wire_name_table.insert(
        pair<string, int64_t>(read_circuit_string.gate_list_string[i].output,
                              wire_index++));  // gates' output
  }
  wire_name_table.insert(pair<string, int64_t>("", ((uint64_t) - 1)));
  wire_name_table.insert(pair<string, int64_t>("1'b0", CONST_ZERO));
  wire_name_table.insert(pair<string, int64_t>("1'b1", CONST_ONE));

  for (uint64_t i = 0; i < read_circuit_string.assignment_list_string.size();
      i++) {
    const auto assign_pair = read_circuit_string.assignment_list_string[i];
    if (wire_name_table.count(assign_pair.first)) {
      wire_name_table[assign_pair.second] = wire_name_table[assign_pair.first];
    } else if (wire_name_table.count(assign_pair.second)) {
      wire_name_table[assign_pair.first] = wire_name_table[assign_pair.second];
    } else {
      LOG(ERROR) << "Can not find wire " << assign_pair.first << " or "
          << assign_pair.second
          << " which were mentioned in an assignment statement" << endl;
    }
  }

  read_circuit->gate_list.resize(read_circuit->gate_size);
  read_circuit->output_list.resize(read_circuit->output_size);
  read_circuit->dff_list.resize(read_circuit->dff_size);

  for (uint64_t i = 0; i < read_circuit->gate_size; i++) {
    read_circuit->gate_list[i].type = read_circuit_string.gate_list_string[i]
        .type;
    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.gate_list_string[i].input[0])
            != 0,
        read_circuit_string.gate_list_string[i].input[0] + " "
            + read_circuit_string.gate_list_string[i].output);
    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.gate_list_string[i].input[1])
            != 0,
        read_circuit_string.gate_list_string[i].input[1]);
    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.gate_list_string[i].output)
            != 0,
        read_circuit_string.gate_list_string[i].output);
    read_circuit->gate_list[i].input[0] = wire_name_table[read_circuit_string
        .gate_list_string[i].input[0]];
    read_circuit->gate_list[i].input[1] = wire_name_table[read_circuit_string
        .gate_list_string[i].input[1]];
    read_circuit->gate_list[i].output = wire_name_table[read_circuit_string
        .gate_list_string[i].output];
  }

  for (uint64_t i = 0; i < read_circuit->dff_size; i++) {
    read_circuit->dff_list[i].type =
        read_circuit_string.dff_list_string[i].type;

    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.dff_list_string[i].input[0])
            != 0,
        read_circuit_string.dff_list_string[i].input[0]);
    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.dff_list_string[i].input[1])
            != 0,
        read_circuit_string.dff_list_string[i].input[1]);
    CHECK_EXPR_MSG(
        wire_name_table.count(read_circuit_string.dff_list_string[i].output)
            != 0,
        read_circuit_string.dff_list_string[i].output);

    read_circuit->dff_list[i].input[0] = wire_name_table[read_circuit_string
        .dff_list_string[i].input[0]];
    read_circuit->dff_list[i].input[1] = wire_name_table[read_circuit_string
        .dff_list_string[i].input[1]];
    read_circuit->dff_list[i].output = wire_name_table[read_circuit_string
        .dff_list_string[i].output];
  }

  for (uint64_t i = 0; i < read_circuit->output_size; i++) {
    if (read_circuit->output_size == 1) {
      CHECK_EXPR(
          wire_name_table.count("o[0]") != 0 || wire_name_table.count("o") != 0);

      if (wire_name_table.count("o[0]")) {
        read_circuit->output_list[i] = wire_name_table["o[0]"];
      } else {
        read_circuit->output_list[i] = wire_name_table["o"];
      }
    } else {
      CHECK_EXPR_MSG(wire_name_table.count("o[" + std::to_string(i) + "]") != 0,
                     "o[" + std::to_string(i) + "]");
      read_circuit->output_list[i] = wire_name_table["o[" + std::to_string(i)
          + "]"];
    }
  }

  if (read_circuit_string.has_terminate) {
    CHECK_EXPR(wire_name_table["terminate"] != 0);
    read_circuit->terminate_id = wire_name_table["terminate"];
  }

  return SUCCESS;
}
