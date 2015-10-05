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

#ifndef EVAL_NETLIST_DUMP_HEX_H_
#define EVAL_NETLIST_DUMP_HEX_H_

#include <fstream>
#include <string>

#include "crypto/block.h"

using std::ostream;
using std::string;

void log_initial(int argc, char *argv[], bool to_std = true);
void dump_initial(const string& mode);
void log_finish();
void dump_finish();
ostream& log_stream(int log_code);
void dump(const string& dump_file, const block& a);
ostream& operator <<(ostream & o, const block& v);

#ifdef DUMP_ENABLE
#define DUMP(file, block) dump(file, block)
#else /* DUMP_ENABLE */
#define DUMP(file, block)
#endif /* DUMP_ENABLE */

#define ERROR 0
#define INFO 1

#define LOG(X) log_stream((X)) << __FILE__ << ":" <<  __LINE__ << " " << #X <<": "

#endif /* EVAL_NETLIST_DUMP_HEX_H_ */
