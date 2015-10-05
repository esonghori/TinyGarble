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

#ifndef UTIL_LOG_H_
#define UTIL_LOG_H_

#include <fstream>
#include <string>

#include "crypto/block.h"

using std::ostream;
using std::string;

void LogInitial(int argc, char *argv[], bool to_std = true);
void DumpInitial(const string& mode);
void LogFinish();
void DumpFinish();
ostream& LogStream(int log_code);
void Dump(const string& dump_file, const block& a);
ostream& operator <<(ostream & o, const block& v);

#ifdef DUMP_ENABLE
#define DUMP(file, block) Dump(file, block)
#else /* DUMP_ENABLE */
#define DUMP(file, block)
#endif /* DUMP_ENABLE */

#define ERROR 0
#define INFO 1

// Error: red, info:green
#define LOG_COLOR(X) (((X)==ERROR)?31:32)

#define LOG(X) LogStream((X)) << __FILE__ << ":" <<  __LINE__ << " \033[" \
  << LOG_COLOR(X) << "m" << #X << "\033[0m: "

#endif /* UTIL_LOG_H_ */
