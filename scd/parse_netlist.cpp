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
#include "util/common.h"

using std::ifstream;
using boost::char_separator;
using boost::tokenizer;
using std::map;
using std::pair;

string typetoStrGate(short itype) {
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

int parse_netlist(const string &filename,
                  ReadCircuitString &readCircuitString) {

  ifstream fin(filename.c_str(), std::ios::in);
  if (!fin.good()) {
    cerr << "file not found:" << filename << endl;
    return -1;
  }
  int i;

  int no_of_bits = 0;
  bool is_inport = 0;
  bool is_outport = 0;
  bool store_input0 = 0;
  bool store_input1 = 0;
  bool store_output = 0;
  bool store_d = 0;
  bool store_i = 0;
  bool store_q = 0;

  string buf("_");
  bool endoffile = false;
  while (!endoffile) {
    getline(fin, buf);
    char_separator<char> sep(" ,;.()\t\r");
    tokenizer<char_separator<char> > tok(buf, sep);

    BOOST_FOREACH(string str, tok) {
      if(!str.compare("endmodule"))
      {
        endoffile = true;
        break;
      }
      else if(!str.compare("input"))
      {
        is_inport = 1;
      }
      else if(is_inport)
      {
        if (str.at(0) =='[')
        {
          tokenizer<> bits(str);
          tokenizer<>::iterator beg = bits.begin();
          string bits_str(*beg);
          no_of_bits = atoi(bits_str.c_str())+1;
          continue;
        }

        if(str.compare("clk") && str.compare("rst"))
        {
          if (no_of_bits)
          {
            for(i = 0; i < no_of_bits; i++)
            {
              string t =str + "[" + std::to_string(i) + "]";
              readCircuitString.inport_list.push_back(t);
            }
          }
          else
          {
            readCircuitString.inport_list.push_back(str);
          }

          if(!str.compare("g"))
          {
            readCircuitString.no_of_g_inports = (no_of_bits>0)?no_of_bits:1;
          }
        }
        no_of_bits = 0;
        is_inport = 0;
      }
      else if(!str.compare("output"))
      {
        is_outport = 1;
      }
      else if(is_outport)
      {
        if (str.at(0) =='[')
        {
          tokenizer<> bits(str);
          tokenizer<>::iterator beg = bits.begin();
          string bits_str(*beg);
          no_of_bits = atoi(bits_str.c_str())+1;
          continue;
        }

        if (no_of_bits)
        {
          for(i = 0; i < no_of_bits; i++)
          {
            string t = str + "[" + std::to_string(i) + "]";
            readCircuitString.outport_list.push_back(t);
          }
        }
        else
        {
          readCircuitString.outport_list.push_back(str);
        }
        no_of_bits = 0;
        is_outport = 0;
      }
      else if(!str.compare("AND"))
      {
        ReadGateString g;
        g.type = ANDGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("ANDN"))
      {
        ReadGateString g;
        g.type = ANDNGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("NAND"))
      {
        ReadGateString g;
        g.type = NANDGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("NANDN"))
      {
        ReadGateString g;
        g.type = NANDNGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("OR"))
      {
        ReadGateString g;
        g.type = ORGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("ORN"))
      {
        ReadGateString g;
        g.type = ORNGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("NOR"))
      {
        ReadGateString g;
        g.type = NORGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("NORN"))
      {
        ReadGateString g;
        g.type = NORNGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("XOR"))
      {
        ReadGateString g;
        g.type = XORGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("XNOR"))
      {
        ReadGateString g;
        g.type = XNORGATE;
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("IV"))
      {
        ReadGateString g;
        g.type = NOTGATE;
        g.input[1] = "";
        readCircuitString.gate_list_string.push_back(g);
      }
      else if(!str.compare("DFF"))
      {
        ReadGateString g;
        g.type = DFFGATE;
        g.input[1] = "";
        readCircuitString.dff_list_string.push_back(g);
      }
      else if (!str.compare("A"))
      {
        store_input0 = 1;
      }
      else if(store_input0)
      {
        readCircuitString.gate_list_string.back().input[0] = str;
        store_input0 = 0;
      }
      else if(!str.compare("D"))
      {
        store_d = 1;
      }
      else if(store_d)
      {
        readCircuitString.dff_list_string.back().input[0] = str;
        store_d = 0;
      }
      else if(!str.compare("I"))
      {
        store_i = 1;
      }
      else if(store_i)
      {
        readCircuitString.dff_list_string.back().input[1] = str;
        store_i = 0;
      }
      else if (!str.compare("B"))
      {
        store_input1 = 1;
      }
      else if(store_input1)
      {
        readCircuitString.gate_list_string.back().input[1] = str;
        store_input1 = 0;
      }
      else if (!str.compare("Z"))
      {
        store_output = 1;
      }
      else if(store_output)
      {
        readCircuitString.gate_list_string.back().output = str;
        store_output = 0;
      }
      else if (!str.compare("Q"))
      {
        store_q = 1;
      }
      else if(store_q)
      {
        readCircuitString.dff_list_string.back().output = str;
        store_q = 0;
      }
    }
  }

#ifdef VERBOSE
  cout << endl << "string name" << endl;
  cout << "g inputs:" << endl;
  for (i = 0; i < readCircuitString.no_of_g_inports; i++)
  {
    cout << readCircuitString.inport_list[i] << " " << i << endl;
  }
  cout << endl;

  cout << "e inputs:" << endl;
  for (i = readCircuitString.no_of_g_inports; i < readCircuitString.inport_list.size(); i++)
  {
    cout << readCircuitString.inport_list[i] << " " << i << endl;
  }
  cout << endl;

  cout << "outputs:" << endl;
  for (i = 0; i < readCircuitString.outport_list.size(); i++)
  {
    cout << readCircuitString.outport_list[i] << " " << i << endl;
  }
  cout << endl;

  cout << "gates:" << endl;
  for (i = 0; i < readCircuitString.gate_list_string.size(); i++)
  {
    cout << i << "\t"
    << typetoStrGate(readCircuitString.gate_list_string[i].type) << "\t"
    << readCircuitString.gate_list_string[i].input[0] << "\t"
    << readCircuitString.gate_list_string[i].input[1] << "\t"
    << readCircuitString.gate_list_string[i].output
    << endl;
  }
  cout << endl;

  cout << "dffs:" << endl;
  for (i = 0; i < readCircuitString.dff_list_string.size(); i++)
  {
    cout << i << "\t"
    << typetoStrGate(readCircuitString.dff_list_string[i].type) << "\t"
    << readCircuitString.dff_list_string[i].input[0] << "\t"
    << readCircuitString.dff_list_string[i].input[1] << "\t"
    << readCircuitString.dff_list_string[i].output
    << endl;
  }
  cout << endl;
#endif
  return 0;
}

int id_assignment(const ReadCircuitString& readCircuitString,
                  ReadCircuit &readCircuit) {
  readCircuit.no_of_g_inports = readCircuitString.no_of_g_inports;
  readCircuit.no_of_inports = readCircuitString.inport_list.size();
  readCircuit.no_of_outports = readCircuitString.outport_list.size();
  readCircuit.no_of_gates = readCircuitString.gate_list_string.size();
  readCircuit.no_of_dffs = readCircuitString.dff_list_string.size();

  map<string, int> wire_name_table;
  int wire_index = 0;
  for (int i = 0; i < readCircuit.no_of_inports; i++) {
    wire_name_table.insert(
        pair<string, int>(readCircuitString.inport_list[i], wire_index++));  // inputs
  }

  for (int i = 0; i < readCircuit.no_of_dffs; i++) {
    wire_name_table.insert(
        pair<string, int>(readCircuitString.dff_list_string[i].output,
                          wire_index++));  //DFF Qs
  }

  for (int i = 0; i < readCircuit.no_of_gates; i++) {
    wire_name_table.insert(
        pair<string, int>(readCircuitString.gate_list_string[i].output,
                          wire_index++));  // gates' output
  }
  wire_name_table.insert(pair<string, int>("", -1));
  wire_name_table.insert(pair<string, int>("1'b0", CONST_ZERO));
  wire_name_table.insert(pair<string, int>("1'b1", CONST_ONE));

  readCircuit.gate_list.resize(readCircuit.no_of_gates);
  readCircuit.output_list.resize(readCircuit.no_of_outports);
  readCircuit.dff_list.resize(readCircuit.no_of_dffs);

  for (int i = 0; i < readCircuit.no_of_gates; i++) {
    readCircuit.gate_list[i].type = readCircuitString.gate_list_string[i].type;
    readCircuit.gate_list[i].input[0] = wire_name_table[readCircuitString
        .gate_list_string[i].input[0]];
    readCircuit.gate_list[i].input[1] = wire_name_table[readCircuitString
        .gate_list_string[i].input[1]];
    readCircuit.gate_list[i].output = wire_name_table[readCircuitString
        .gate_list_string[i].output];
  }

  for (int i = 0; i < readCircuit.no_of_dffs; i++) {
    readCircuit.dff_list[i].type = readCircuitString.dff_list_string[i].type;

    readCircuit.dff_list[i].input[0] = wire_name_table[readCircuitString
        .dff_list_string[i].input[0]];
    readCircuit.dff_list[i].input[1] = wire_name_table[readCircuitString
        .dff_list_string[i].input[1]];
    readCircuit.dff_list[i].output = wire_name_table[readCircuitString
        .dff_list_string[i].output];
  }

  for (int i = 0; i < readCircuit.no_of_outports; i++) {
    readCircuit.output_list[i] =
        wire_name_table[readCircuitString.outport_list[i]];
  }

#ifdef VERBOSE
  cout << endl << "ID assignment" << endl;
  cout << "outputs:" << endl;
  for (int i = 0; i < readCircuit.no_of_outports; i++)
  {
    cout << readCircuit.output_list[i] << endl;
  }
  cout << endl;

  cout << "gates:" << endl;
  for (int i = 0; i < readCircuit.no_of_gates; i++)
  {
    cout << i << "\t"
    << typetoStrGate(readCircuit.gate_list[i].type) << "\t"
    << readCircuit.gate_list[i].input[0] << "\t"
    << readCircuit.gate_list[i].input[1] << "\t"
    << readCircuit.gate_list[i].output
    << endl;
  }
  cout << endl;

  cout << "dffs:" << endl;
  for (int i = 0; i < readCircuit.no_of_dffs; i++)
  {
    cout << i << "\t"
    << typetoStrGate(readCircuit.dff_list[i].type) << "\t"
    << readCircuit.dff_list[i].input[0] << "\t"
    << readCircuit.dff_list[i].input[1] << "\t"
    << readCircuit.dff_list[i].output
    << endl;
  }
  cout << endl;
#endif

  return 0;
}

int topological_sort(ReadCircuit &readCircuit) {

  int **core;
  core = new int*[1];  // no of rows = no_core
  core[0] = new int[readCircuit.no_of_gates + 1];  // no of columns = no_of_gates+1
  memset(core[0], -1, (readCircuit.no_of_gates + 1) * sizeof(int));

  schedule(readCircuit, 1, core);

  readCircuit.task_schedule.resize(readCircuit.no_of_gates);

  vector<int> ts(readCircuit.no_of_gates);

  for (int i = 0; i < readCircuit.no_of_gates; i++) {
    readCircuit.task_schedule[i] = core[0][i];
    ts[i] = core[0][i] + readCircuit.no_of_inports + readCircuit.no_of_dffs;
  }

  vector<int> ts_1(
      readCircuit.no_of_gates + readCircuit.no_of_inports
          + readCircuit.no_of_dffs);

  for (int i = 0; i < readCircuit.no_of_inports + readCircuit.no_of_dffs; i++) {
    ts_1[i] = i;
  }

  for (int i = 0; i < readCircuit.no_of_gates; i++) {
    ts_1[ts[i]] = i + readCircuit.no_of_inports + readCircuit.no_of_dffs;
  }

  for (int i = 0; i < readCircuit.no_of_outports; i++) {
    readCircuit.output_list[i] = ts_1[readCircuit.output_list[i]];
  }
  for (int i = 0; i < readCircuit.no_of_gates; i++) {
    readCircuit.gate_list[i].input[0] = ts_1[readCircuit.gate_list[i].input[0]];
    if (readCircuit.gate_list[i].input[1] > 0)  //IV has -1 input
      readCircuit.gate_list[i].input[1] =
          ts_1[readCircuit.gate_list[i].input[1]];
    readCircuit.gate_list[i].output = ts_1[i + readCircuit.no_of_inports
        + readCircuit.no_of_dffs];
  }

  for (int i = 0; i < readCircuit.no_of_dffs; i++) {
    readCircuit.dff_list[i].input[0] = ts_1[readCircuit.dff_list[i].input[0]];
    if (readCircuit.dff_list[i].input[1] > 0)  // Constant values are negative
      readCircuit.dff_list[i].input[1] = ts_1[readCircuit.dff_list[i].input[1]];
    readCircuit.dff_list[i].output = ts_1[readCircuit.dff_list[i].output];
  }

#ifdef VERBOSE
  cout << endl << "Topological Sort" << endl;
  cout << "outputs:" << endl;
  for (int i = 0; i < readCircuit.no_of_outports; i++)
  {
    cout << readCircuit.output_list[i] << endl;
  }
  cout << endl;

  cout << "gates:" << endl;
  for (int i = 0; i < readCircuit.no_of_gates; i++)
  {
    int gid = readCircuit.task_schedule[i];
    cout << i << "\t"
    << typetoStrGate(readCircuit.gate_list[gid].type) << "\t"
    << readCircuit.gate_list[gid].input[0] << "\t"
    << readCircuit.gate_list[gid].input[1] << "\t"
    << readCircuit.gate_list[gid].output
    << endl;
  }
  cout << endl;

  cout << "dffs:" << endl;
  for (int i = 0; i < readCircuit.no_of_dffs; i++)
  {
    cout << i << "\t"
    << typetoStrGate(readCircuit.dff_list[i].type) << "\t"
    << readCircuit.dff_list[i].input[0] << "\t"
    << readCircuit.dff_list[i].input[1] << "\t"
    << readCircuit.dff_list[i].output
    << endl;
  }
  cout << endl;

#endif

  delete[] core[0];
  delete[] core;
  return 0;
}

