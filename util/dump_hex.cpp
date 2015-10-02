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

#include "util/dump_hex.h"

#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <map>
#include <vector>
 
#include "util/common.h"

using std::ofstream;
using std::cerr;
using std::string;
using std::map;
using std::vector;

string dump_hex_prefix = "";
map<string, ofstream*> dump_map;

void dump_initial(const string& mode) {
  vector<string> file_names = { "dff", "input", "output", "table", "r_key" };
  for (const string& file_name : file_names) {
    string file_addresss = dump_hex_prefix + file_name + "." + mode + ".hex";
    dump_map[file_name + "." + mode] = new ofstream(file_addresss.c_str(),
                                                    std::ios::out);
  }
}

void dump_finish() {
  for (const auto& dump : dump_map) {
    dump.second->close();
    delete dump.second;
  }
}

// dump_file : { "dff", "input", "output", "table", "r_key" } + {".g", ".f"}
void dump(const string& dump_file, const block& a) {
  if (dump_map.count(dump_file)) {
    uint32_t *val = (uint32_t*) &a;
    *dump_map[dump_file] << std::hex << std::setw(8) << std::setfill('0')
                         << val[3] << "\t" << val[2] << "\t" << val[1] << "\t"
                         << val[0] << std::endl;
  } else {
    cerr << "No such a dump file " << dump_file << endl;
  }
}

