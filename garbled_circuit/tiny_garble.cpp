/*
 This file is part of JustGarble.

 JustGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 JustGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with JustGarble.  If not, see <http://www.gnu.org/licenses/>.

 */
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

#include <boost/program_options.hpp>
#include <boost/format.hpp>
#include <cstdlib>
#include <ctime>

#include "garbled_circuit/garbled_circuit.h"
#include "tcpip/tcpip.h"
#include "scd/read_scd.h"
#include "util/util.h"
#include "util/tinygarble_config.h"
#include "util/log.h"

namespace po = boost::program_options;
using std::string;
using std::vector;

int main(int argc, char* argv[]) {

  LogInitial(argc, argv);
  int port;
  string scd_file_address;
  string server_ip;

  boost::format fmter(
      "Evaluate Netlist, TinyGarble version %1%.%2%.%3%.\nAllowed options");
  fmter % TinyGarble_VERSION_MAJOR % TinyGarble_VERSION_MINOR
      % TinyGarble_VERSION_PATCH;
  po::options_description desc(fmter.str());
  desc.add_options()  //
  ("help,h", "produce help message")  //
  ("alice,a", "Run as Alice (server).")  //
  ("bob,b", "Run as Bob (client).")  //
  ("deterministic", "Run with deterministic random generator.")  //
  ("scd_file,i",
   po::value<string>(&scd_file_address)->default_value(
       "../read_netlist/netlists/test.scd"),
   "Simple circuit description (.scd) file address.")  //
  ("port,p", po::value<int>(&port)->default_value(1234), "socket port")  //
  ("server_ip,s", po::value<string>(&server_ip)->default_value("127.0.0.1"),
   "Server's (Alice's) IP, required when running as Bob.")  //
  ("dump_directory", po::value<string>(), "Directory for dumping memory hex files.")  //
  ("input_data", po::value<string>(),
   "Hexadecimal input data, if not provided, it is randomly chosen.")  //
  ("log2std", "Print Logs into standard output and error.");

  po::variables_map vm;
  try {
    po::store(po::parse_command_line(argc, argv, desc), vm);
    if (vm.count("help")) {
      std::cout << desc << endl;
      return 0;
    }
    po::notify(vm);
  } catch (po::error& e) {
    LOG(ERROR) << "ERROR: " << e.what() << endl << endl;
    std::cout << desc << endl;
    return -1;
  }

  block R;
  if (vm.count("deterministic")) {
    LOG(INFO) << "Run with deterministic random generator." << endl;
    srand(1);
    SrandSSE(1111);
    R = MakeBlock((long )(-1), (long )(-1));
  } else {
    srand(time(0));
    SrandSSE(time(0));
    R = RandomBlock();
    //TODO(ebi): check if single bit gets 1 or 8 bit.
    *((short *) (&R)) |= 1;
  }

  if (vm.count("scd_file")) {
    scd_file_address = vm["scd_file"].as<string>();
  } else {
    LOG(ERROR) << "SCD file should be specified." << endl << endl;
    std::cout << desc << endl;
    return -1;
  }

  if (vm.count("port")) {
    port = vm["port"].as<int>();
  }

  if (vm.count("alice") == 0 && vm.count("bob") == 0) {
    LOG(ERROR) << "One of --alice or --bob mode flag should be used." << endl
               << endl;
    std::cout << desc << endl;
    return -1;
  }
  if (vm.count("dump_hex")) {
    dump_prefix = vm["dump_hex"].as<string>();
  }

  uint64_t input_data = 0;
  bool random_input = true;
  if (vm.count("input_data")) {
    string input_data_str = vm["input_data"].as<string>();
    input_data = std::stoll(input_data_str, nullptr, 16);
    random_input = false;
  }

  GarbledCircuit garbledCircuit;
  if (ReadSCD(scd_file_address, &garbledCircuit) == FAILURE) {
    LOG(ERROR) << "Error while reading scd file: " << scd_file_address << endl;
    return -1;
  }

  if (vm.count("alice")) {
    // open the socket
    int connfd;
    if ((connfd = ServerInit(port)) == -1) {
      LOG(ERROR) << "Cannot open the socket in port " << port << endl;
      return -1;
    }
    LOG(INFO) << "Open Alice server on port: " << port << endl;

    Alice(garbledCircuit, random_input, input_data, R, connfd);

    ServerClose(connfd);
  } else if (vm.count("bob")) {

    if (vm.count("server_ip")) {
      server_ip = vm["server_ip"].as<string>();
    } else {
      LOG(ERROR) << "Server IP should be specified, when running as Bob."
                 << endl << endl;
      std::cout << desc << endl;
      return -1;
    }

    // open socket, connect to server
    int connfd;
    if ((connfd = ClientInit(server_ip.c_str(), port)) == -1) {
      LOG(ERROR) << "Cannot connect to " << server_ip << ":" << port << endl;
      return -1;
    }
    LOG(INFO) << "Connect Bob client to Alice server on " << server_ip << ":"
              << port << endl;

    Bob(garbledCircuit, random_input, input_data, connfd);

    ClientClose(connfd);
  }


  LogFinish();
  return 0;
}

