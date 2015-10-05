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

int Alice(GarbledCircuit& garbledCircuit, bool random_input,
          uint64_t input_data, block R, int connfd) {

  uint64_t n = garbledCircuit.n;
  uint64_t g = garbledCircuit.g;
  uint64_t p = garbledCircuit.p;
  uint64_t m = garbledCircuit.m;
  uint64_t c = garbledCircuit.c;
  uint64_t e = n - g;

  bool *garbler_inputs = new bool[g * c];
  block *inputLabels = new block[2 * n * c];
  block *initialDFFLable = new block[2 * p];
  block *outputLabels = new block[2 * m * c];

  // initialize inputs
  for (uint64_t cid = 0; cid < c; cid++) {
    for (uint64_t j = 0; j < g; j++) {
      if (random_input) {
        garbler_inputs[cid * g + j] = rand() % 2;
      } else {
        garbler_inputs[cid * g + j] = ((input_data & 1 << (cid * g + j)) != 0);
      }
    }
  }

  CreateInputLabels(inputLabels, R, n * c);
  CreateInputLabels(initialDFFLable, R, p);

  // send plain-text input
  for (uint64_t cid = 0; cid < c; cid++) {
    for (uint64_t j = 0; j < g; j++) {
      if (garbler_inputs[cid * g + j] == 0)
        SendData(connfd, &inputLabels[2 * (cid * n + j)], sizeof(block));
      else
        SendData(connfd, &inputLabels[2 * (cid * n + j) + 1], sizeof(block));
    }

    // TODO(ebi): replace with OT
    for (uint64_t j = 0; j < e; j++) {
      bool ev_input;
      RecvData(connfd, &ev_input, sizeof(bool));
      if (!ev_input)
        SendData(connfd, &inputLabels[2 * (cid * n + g + j)], sizeof(block));
      else
        SendData(connfd, &inputLabels[2 * (cid * n + g + j) + 1],
                  sizeof(block));
    }
  }

  // send DFF inputs
  for (uint64_t j = 0; j < p; j++) {
    if (garbledCircuit.I[j] == CONST_ZERO) {
      // constant zero

      SendData(connfd, &initialDFFLable[2 * j], sizeof(block));
    } else if (garbledCircuit.I[j] == CONST_ONE) {
      // constant zero

      SendData(connfd, &initialDFFLable[2 * j + 1], sizeof(block));
    } else if (garbledCircuit.I[j] < g) {
      // belongs to Alice (garbler)

      uint64_t index = garbledCircuit.I[j];
      if (garbler_inputs[index] == 0)
        SendData(connfd, &initialDFFLable[2 * j], sizeof(block));
      else
        SendData(connfd, &initialDFFLable[2 * j + 1], sizeof(block));
    } else {
      // belong to Bob
      // TODO(ebi): replace with OT
      bool ev_input;
      RecvData(connfd, &ev_input, sizeof(bool));
      if (!ev_input)
        SendData(connfd, &initialDFFLable[2 * j], sizeof(block));
      else
        SendData(connfd, &initialDFFLable[2 * j + 1], sizeof(block));
    }
  }

  garbledCircuit.globalKey = RandomBlock();
  SendData(connfd, &garbledCircuit.globalKey, sizeof(block));  // send DKC key

  Garble(&garbledCircuit, inputLabels, initialDFFLable, outputLabels, R,
         connfd);

  for (uint64_t cid = 0; cid < c; cid++) {
    for (uint64_t i = 0; i < m; i++) {
      bool outputType = get_LSB(outputLabels[2 * (m * cid + i) + 0]);
      SendData(connfd, &outputType, sizeof(bool));
    }
  }

  ServerClose(connfd);
  RemoveGarbledCircuit(&garbledCircuit);

  return SUCCESS;
}

int Bob(GarbledCircuit& garbledCircuit, bool random_input, uint64_t input_data,
        int connfd) {

  uint64_t n = garbledCircuit.n;
  uint64_t g = garbledCircuit.g;
  uint64_t p = garbledCircuit.p;
  uint64_t m = garbledCircuit.m;
  uint64_t c = garbledCircuit.c;
  uint64_t e = n - g;

  bool *evalator_inputs = new bool[e * c];
  block *inputLabels = new block[n * c];
  block *initialDFFLable = new block[p];
  block *outputLabels = new block[m * c];

  // initialize input
  for (uint64_t cid = 0; cid < c; cid++) {
    for (uint64_t j = 0; j < e; j++) {
      if (random_input) {
        evalator_inputs[cid * e + j] = rand() % 2;
      } else {
        evalator_inputs[cid * e + j] = ((input_data & 1 << (cid * e + j)) != 0);
      }
    }
  }

  // receive inputs
  for (uint64_t cid = 0; cid < c; cid++) {
    for (uint64_t j = 0; j < g; j++) {
      RecvData(connfd, &inputLabels[n * cid + j], sizeof(block));
    }

    for (uint64_t j = 0; j < e; j++) {
      SendData(connfd, &evalator_inputs[cid * e + j], sizeof(bool));
      RecvData(connfd, &inputLabels[cid * n + g + j], sizeof(block));
    }
  }

  // receive DFF inputs
  for (uint64_t j = 0; j < p; j++) {
    if (garbledCircuit.I[j] < g) {
      // initial value is constant or belongs to Alice (garbler)
      RecvData(connfd, &initialDFFLable[j], sizeof(block));
    } else {
      assert((garbledCircuit.I[j] - g > 0) && (garbledCircuit.I[j] - g < e));

      SendData(connfd, &evalator_inputs[garbledCircuit.I[j] - g],
                sizeof(bool));
      RecvData(connfd, &initialDFFLable[j], sizeof(block));
    }
  }

  RecvData(connfd, &(garbledCircuit.globalKey), sizeof(block));  //receive key
  Evaluate(&garbledCircuit, inputLabels, initialDFFLable, outputLabels, connfd);

  // TODO(ebi): change to LOG(INFO)
  LOG(INFO) << "output:" << endl;
  for (uint64_t cid = 0; cid < c; cid++) {
    // TODO(ebi): change to LOG(INFO)
    LOG(INFO) << "c = " << cid << endl;
    for (uint64_t i = 0; i < m; i++) {
      bool myOutputType = get_LSB(outputLabels[m * cid + i]);
      bool outputType;
      RecvData(connfd, &outputType, sizeof(bool));
      // TODO(ebi): change to LOG(INFO)
      // myOutputType XOR outputType
      LOG(INFO) << ((myOutputType != outputType) ? '0' : '1');
    }
    // TODO(ebi): change to LOG(INFO)
    LOG(INFO) << endl;
  }

  ClientClose(connfd);
  RemoveGarbledCircuit(&garbledCircuit);
  return SUCCESS;
}

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
  ("dump_hex", po::value<string>(), "Directory for dumping memory hex files.")  //
  ("input_data", po::value<string>(),
   "Hexadecimal input data, if not provided, it is randomly chosen.");

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
    *((short *) (&R)) = 1;
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
    LOG(ERROR) << "One of --alice or --bob mode flag should be used." << endl << endl;
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

    if (dump_prefix != "")
      DumpInitial("g");

    Alice(garbledCircuit, random_input, input_data, R, connfd);

    ServerClose(connfd);
  } else if (vm.count("bob")) {

    if (vm.count("server_ip")) {
      server_ip = vm["server_ip"].as<string>();
    } else {
      LOG(ERROR) << "Server IP should be specified, when running as Bob." << endl
           << endl;
      std::cout << desc << endl;
      return -1;
    }

    // open socket, connect to server
    int connfd;
    if ((connfd = ClientInit(server_ip.c_str(), port)) == -1) {
      LOG(ERROR) << "Cannot connect to " << server_ip << ":" << port << endl;
      return -1;
    }
    LOG(INFO) << "Connect Bob client to Alice server on " << server_ip << ":" << port
         << endl;

    if (dump_prefix != "")
      DumpInitial("e");

    Bob(garbledCircuit, random_input, input_data, connfd);

     ClientClose(connfd);
  }

  if (dump_prefix != "") {
    DumpFinish();
  }
  LogFinish();
  return 0;
}

