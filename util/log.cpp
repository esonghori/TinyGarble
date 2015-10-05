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

#include "util/log.h"

#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <map>
#include <vector>
#include "util/common.h"
#include "util/util.h"

using std::string;
using std::map;
using std::vector;

string dump_prefix = "";
map<string, ostream*> dump_map;
ostream* log_map[2];  // ERROR, INFO

void LogInitial(int argc, char *argv[], bool to_std /* = true*/) {
  if (to_std) {
    log_map[ERROR] = &std::cerr;
    log_map[INFO] = &std::cout;
  } else {
    string file_addresss_error = string(argv[0]) + "-error.log";
    log_map[ERROR] = new std::ofstream(file_addresss_error.c_str(),
                                       std::ios::out);
    string file_addresss_info = string(argv[0]) + "-error.log";
    log_map[INFO] = new std::ofstream(file_addresss_info.c_str(),
                                      std::ios::out);
  }
}

void DumpInitial(const string& mode) {
  vector<string> file_names = { "dff", "input", "output", "table", "r_key" };
  for (const string& file_name : file_names) {
    string file_addresss = dump_prefix + file_name;
    if (mode != "") {
      file_addresss += "." + mode;
    }
    file_addresss += ".hex";
    dump_map[file_name + "." + mode] = new std::ofstream(file_addresss.c_str(),
                                                         std::ios::out);
  }
}

void LogFinish() {
  if (std::ofstream* log_of = dynamic_cast<std::ofstream*>(log_map[ERROR])) {
    log_of->close();
    delete log_map[ERROR];
  }
  if (std::ofstream* log_of = dynamic_cast<std::ofstream*>(log_map[INFO])) {
    log_of->close();
    delete log_map[INFO];
  }
}

void DumpFinish() {
  for (const auto& dump : dump_map) {
    if (std::ofstream* dump_of = dynamic_cast<std::ofstream*>(dump.second)) {
      dump_of->close();
      delete dump.second;
    }
  }
}

// dump_file : { "dff", "input", "output", "table", "r_key" } + {".g", ".f"}
void Dump(const string& dump_file, const block& a) {
  if (dump_map.count(dump_file)) {
    *dump_map[dump_file] << a << std::endl;
  } else {
    LOG(ERROR) << "No such a dump file " << dump_file << endl;
  }
}

ostream& LogStream(int log_code) {
  return *log_map[log_code];
}

std::ostream & operator <<(std::ostream & o, const block& v) {
  uint32_t *v_u32 = (uint32_t*) &v;
  std::ios::fmtflags f(o.flags());
  o << std::hex << std::setfill('0') << std::setw(8) << v_u32[3] << " "
    << std::setfill('0') << std::setw(8) << v_u32[2] << " " << std::setfill('0')
    << std::setw(8) << v_u32[1] << " " << std::setfill('0') << std::setw(8)
    << v_u32[0];
  o.flags(f);
  return o;
}
