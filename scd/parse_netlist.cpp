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
        readCircuitString.gate_list_string.push_back(g);
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
        readCircuitString.gate_list_string.push_back(g);
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
        readCircuitString.dff_list_string.push_back(g);
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

        uint64_t gate_id = readCircuitString.gate_list_string.size();

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

        readCircuitString.gate_list_string.push_back(g1);
        readCircuitString.gate_list_string.push_back(g2);
        readCircuitString.gate_list_string.push_back(g3);

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
          readCircuitString.gate_list_string.push_back(g);
        }
        if(COUT != "") {
          ReadGateString g;
          g.type = ANDGATE;
          g.input[0] = IN0;
          g.input[1] = IN1;
          g.output = COUT;
          readCircuitString.gate_list_string.push_back(g);
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

        uint64_t gate_id = readCircuitString.gate_list_string.size();

        ReadGateString g1;
        g1.type = XORGATE;
        g1.input[0] = IN0;
        g1.input[1] = CIN;
        g1.output = "FADDER_MID_1_" + std::to_string(gate_id);
        readCircuitString.gate_list_string.push_back(g1);

        if(SUM != "") {
          ReadGateString g2;

          g2.type = XORGATE;
          g2.input[0] = IN1;
          g2.input[1] = g1.output;
          g2.output = SUM;

          readCircuitString.gate_list_string.push_back(g2);
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
          readCircuitString.gate_list_string.push_back(g2);
          readCircuitString.gate_list_string.push_back(g3);
          readCircuitString.gate_list_string.push_back(g4);
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
          readCircuitString.p_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("g_init")) {
          readCircuitString.g_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_init")) {
          readCircuitString.e_init_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("p_input")) {
          readCircuitString.p_input_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("g_input")) {
          readCircuitString.g_input_size = (no_of_bits>0)?no_of_bits:1;
        } else if(!str.compare("e_input")) {
          readCircuitString.e_input_size = (no_of_bits>0)?no_of_bits:1;
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
      } else if(!str.compare("o")) {
        readCircuitString.output_size = (no_of_bits>0)?no_of_bits:1;
      } else {
        LOG(ERROR) << "The output name is not valid " << str << endl <<
        "valid choice: { o }" << endl;
        return FAILURE;
      }
    } else if(!str.compare("assign")) {
      is_left_assignmnet = true;
    } else if(is_left_assignmnet) {
      readCircuitString.assignment_list_string.push_back(
          std::make_pair(str, ""));
      is_left_assignmnet = false;
    } else if(!str.compare("=")) {
      is_right_assignmnet = true;
    } else if(is_right_assignmnet) {
      const auto assign_pair = readCircuitString.assignment_list_string.back();
      readCircuitString.assignment_list_string.pop_back();
      readCircuitString.assignment_list_string.push_back(
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

  LOG(INFO) << "p_init:" << readCircuitString.p_init_size << " g_init:"
            << readCircuitString.g_init_size << " e_init:"
            << readCircuitString.e_init_size << " p_input:"
            << readCircuitString.p_input_size << " g_input:"
            << readCircuitString.g_input_size << " e_input:"
            << readCircuitString.e_input_size << endl;

  LOG(INFO) << "dffs:\tD\tI\tQ" << endl;
  for (uint64_t i = 0; i < readCircuitString.dff_list_string.size(); i++) {
    LOG(INFO) << i << "\t"
              << Type2StrGate(readCircuitString.dff_list_string[i].type) << "\t"
              << readCircuitString.dff_list_string[i].input[0] << "\t"
              << readCircuitString.dff_list_string[i].input[1] << "\t"
              << readCircuitString.dff_list_string[i].output << endl;
  }

  LOG(INFO) << "gates:\tI0\tI1\tO" << endl;
  for (uint64_t i = 0; i < readCircuitString.gate_list_string.size(); i++) {
    LOG(INFO) << i << "\t"
              << Type2StrGate(readCircuitString.gate_list_string[i].type)
              << "\t" << readCircuitString.gate_list_string[i].input[0] << "\t"
              << readCircuitString.gate_list_string[i].input[1] << "\t"
              << readCircuitString.gate_list_string[i].output << endl;
  }

  LOG(INFO) << "outputs:" << endl;
  for (uint64_t i = 0; i < readCircuitString.output_size; i++) {
    LOG(INFO) << "o[" << i << "]" << " " << i << endl;
  }

  LOG(INFO) << "assignments:" << endl;
  for (uint64_t i = 0; i < readCircuitString.assignment_list_string.size();
      i++) {
    LOG(INFO) << readCircuitString.assignment_list_string[i].first << " = "
              << readCircuitString.assignment_list_string[i].second << endl;
  }

  return 0;
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

int IdAssignment(const ReadCircuitString& readCircuitString,
                 ReadCircuit &readCircuit) {
  readCircuit.p_init_size = readCircuitString.p_init_size;
  readCircuit.g_init_size = readCircuitString.g_init_size;
  readCircuit.e_init_size = readCircuitString.e_init_size;
  readCircuit.p_input_size = readCircuitString.p_input_size;
  readCircuit.g_input_size = readCircuitString.g_input_size;
  readCircuit.e_input_size = readCircuitString.e_input_size;

  readCircuit.dff_size = readCircuitString.dff_list_string.size();
  readCircuit.gate_size = readCircuitString.gate_list_string.size();
  readCircuit.output_size = readCircuitString.output_size;

  map<string, int64_t> wire_name_table;
  int64_t wire_index = 0;

  AddWireArray(wire_name_table, "p_init", readCircuit.p_init_size, &wire_index);
  AddWireArray(wire_name_table, "g_init", readCircuit.g_init_size, &wire_index);
  AddWireArray(wire_name_table, "e_init", readCircuit.e_init_size, &wire_index);
  AddWireArray(wire_name_table, "p_input", readCircuit.p_input_size,
               &wire_index);
  AddWireArray(wire_name_table, "g_input", readCircuit.g_input_size,
               &wire_index);
  AddWireArray(wire_name_table, "e_input", readCircuit.e_input_size,
               &wire_index);

  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    wire_name_table.insert(
        pair<string, int64_t>(readCircuitString.dff_list_string[i].output,
                              wire_index++));  //DFF Qs
  }

  for (uint i = 0; i < readCircuit.gate_size; i++) {
    wire_name_table.insert(
        pair<string, int64_t>(readCircuitString.gate_list_string[i].output,
                              wire_index++));  // gates' output
  }
  wire_name_table.insert(pair<string, int64_t>("", ((uint64_t) -1)));
  wire_name_table.insert(pair<string, int64_t>("1'b0", CONST_ZERO));
  wire_name_table.insert(pair<string, int64_t>("1'b1", CONST_ONE));

  for (uint64_t i = 0; i < readCircuitString.assignment_list_string.size();
      i++) {
    const auto assign_pair = readCircuitString.assignment_list_string[i];
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

  readCircuit.gate_list.resize(readCircuit.gate_size);
  readCircuit.output_list.resize(readCircuit.output_size);
  readCircuit.dff_list.resize(readCircuit.dff_size);

  for (uint64_t i = 0; i < readCircuit.gate_size; i++) {
    readCircuit.gate_list[i].type = readCircuitString.gate_list_string[i].type;
    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.gate_list_string[i].input[0])
            != 0,
        readCircuitString.gate_list_string[i].input[0] + " "
            + readCircuitString.gate_list_string[i].output);
    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.gate_list_string[i].input[1])
            != 0,
        readCircuitString.gate_list_string[i].input[1]);
    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.gate_list_string[i].output)
            != 0,
        readCircuitString.gate_list_string[i].output);
    readCircuit.gate_list[i].input[0] = wire_name_table[readCircuitString
        .gate_list_string[i].input[0]];
    readCircuit.gate_list[i].input[1] = wire_name_table[readCircuitString
        .gate_list_string[i].input[1]];
    readCircuit.gate_list[i].output = wire_name_table[readCircuitString
        .gate_list_string[i].output];
  }

  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    readCircuit.dff_list[i].type = readCircuitString.dff_list_string[i].type;

    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.dff_list_string[i].input[0])
            != 0,
        readCircuitString.dff_list_string[i].input[0]);
    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.dff_list_string[i].input[1])
            != 0,
        readCircuitString.dff_list_string[i].input[1]);
    CHECK_EXPR_MSG(
        wire_name_table.count(readCircuitString.dff_list_string[i].output) != 0,
        readCircuitString.dff_list_string[i].output);

    readCircuit.dff_list[i].input[0] = wire_name_table[readCircuitString
        .dff_list_string[i].input[0]];
    readCircuit.dff_list[i].input[1] = wire_name_table[readCircuitString
        .dff_list_string[i].input[1]];
    readCircuit.dff_list[i].output = wire_name_table[readCircuitString
        .dff_list_string[i].output];
  }

  for (uint64_t i = 0; i < readCircuit.output_size; i++) {
    if (readCircuit.output_size == 1) {
      CHECK_EXPR(
          wire_name_table.count("o[0]") != 0 || wire_name_table.count("o") != 0);

      if (wire_name_table.count("o[0]")) {
        readCircuit.output_list[i] = wire_name_table["o[0]"];
      } else {
        readCircuit.output_list[i] = wire_name_table["o"];
      }
    } else {
      CHECK_EXPR_MSG(wire_name_table.count("o[" + std::to_string(i) + "]") != 0,
                     "o[" + std::to_string(i) + "]");
      readCircuit.output_list[i] = wire_name_table["o[" + std::to_string(i)
          + "]"];
    }
  }

  LOG(INFO) << "dffs:\tD\tI\tQ" << endl;
  for (uint64_t i = 0; i < readCircuit.dff_size; i++) {
    LOG(INFO) << i << "\t" << Type2StrGate(readCircuit.dff_list[i].type) << "\t"
              << readCircuit.dff_list[i].input[0] << "\t"
              << readCircuit.dff_list[i].input[1] << "\t"
              << readCircuit.dff_list[i].output << endl;
  }
  LOG(INFO) << endl;
  LOG(INFO) << "gates:\tI0\tI1\tO" << endl;
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
