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
#include <cstdlib>
#include <ctime>

#include "garbled_circuit.h"
#include "tcpip.h"
#include "scd.h"
#include "util.h"
#include "dump_hex.h"

namespace po = boost::program_options;
using std::string;
using std::vector;

int alice(GarbledCircuit& garbledCircuit, bool random_input, block R,
          int connfd) {

  int n = garbledCircuit.n;
  int g = garbledCircuit.g;
  int p = garbledCircuit.p;
  int m = garbledCircuit.m;
  int c = garbledCircuit.c;
  int e = n - g;

  int *garbler_inputs = new int[g * c];
  block *inputLabels = new block[2 * n * c];
  block *initialDFFLable = new block[2 * p];
  block *outputLabels = new block[2 * m * c];

  // initialize inputs
  for (int cid = 0; cid < c; cid++) {
    for (int j = 0; j < g; j++) {
      if (random_input) {
        garbler_inputs[cid * g + j] = rand() % 2;
      } else {
        garbler_inputs[cid * g + j] =
            ((random_input & 1 << (cid * g + j)) != 0);
      }
    }
  }

  createInputLabels(inputLabels, R, n * c);
  createInputLabels(initialDFFLable, R, p);

  // send plain-text input
  for (int cid = 0; cid < c; cid++) {
    for (int j = 0; j < g; j++) {
      if (garbler_inputs[cid * g + j] == 0)
        send_block(connfd, inputLabels[2 * (cid * n + j)]);
      else
        send_block(connfd, inputLabels[2 * (cid * n + j) + 1]);
    }

    // TODO(ebi): replace with OT
    for (int j = 0; j < e; j++) {
      int ev_input;
      read(connfd, &ev_input, sizeof(int));
      if (!ev_input)
        send_block(connfd, inputLabels[2 * (cid * n + g + j)]);
      else
        send_block(connfd, inputLabels[2 * (cid * n + g + j) + 1]);
    }
  }

  // send DFF inputs
  for (int j = 0; j < p; j++) {
    if (garbledCircuit.I[j] == CONST_ZERO) {
      // constant zero

      send_block(connfd, initialDFFLable[2 * j]);
    } else if (garbledCircuit.I[j] == CONST_ONE) {
      // constant zero

      send_block(connfd, initialDFFLable[2 * j + 1]);
    } else if (garbledCircuit.I[j] < g) {
      // belongs to Alice (garbler)

      int index = garbledCircuit.I[j];
      if (garbler_inputs[index] == 0)
        send_block(connfd, initialDFFLable[2 * j]);
      else
        send_block(connfd, initialDFFLable[2 * j + 1]);
    } else {
      // belong to Bob
      // TODO(ebi): replace with OT
      int ev_input;
      read(connfd, &ev_input, sizeof(int));
      if (!ev_input)
        send_block(connfd, initialDFFLable[2 * j]);
      else
        send_block(connfd, initialDFFLable[2 * j + 1]);
    }
  }

  garbledCircuit.globalKey = randomBlock();
  send_block(connfd, garbledCircuit.globalKey);  // send DKC key

  garble(&garbledCircuit, inputLabels, initialDFFLable, outputLabels, R,
         connfd);

  for (int cid = 0; cid < c; cid++) {
    for (int i = 0; i < m; i++) {
      short outputType = getLSB(outputLabels[2 * (m * cid + i) + 0]);
      send_type(connfd, outputType);
    }
  }

  server_close(connfd);
  removeGarbledCircuit(&garbledCircuit);

  return SUCCESS;
}

int bob(GarbledCircuit& garbledCircuit, bool random_input, int connfd) {

  int n = garbledCircuit.n;
  int g = garbledCircuit.g;
  int p = garbledCircuit.p;
  int m = garbledCircuit.m;
  int c = garbledCircuit.c;
  int e = n - g;

  int *evalator_inputs = new int[e * c];
  block *inputLabels = new block[n * c];
  block *initialDFFLable = new block[p];
  block *outputLabels = new block[m * c];

  // initialize input
  for (int cid = 0; cid < c; cid++) {
    for (int j = 0; j < e; j++) {
      if (random_input) {
        evalator_inputs[cid * e + j] = rand() % 2;
      } else {
        evalator_inputs[cid * e + j] =
            ((random_input & 1 << (cid * e + j)) != 0);
      }
    }
  }

  // receive inputs
  for (int cid = 0; cid < c; cid++) {
    for (int j = 0; j < g; j++) {
      recv_block(connfd, &inputLabels[n * cid + j]);
    }

    for (int j = 0; j < e; j++) {
      write(connfd, &evalator_inputs[cid * e + j], sizeof(int));
      recv_block(connfd, &inputLabels[cid * n + g + j]);
    }
  }

  // receive DFF inputs
  for (int j = 0; j < p; j++) {

    if (garbledCircuit.I[j] < g) {
      // initial value is constant or belongs to Alice (garbler)
      recv_block(connfd, &initialDFFLable[j]);
    } else {
      assert((garbledCircuit.I[j] - g > 0) && (garbledCircuit.I[j] - g < e));

      write(connfd, &evalator_inputs[garbledCircuit.I[j] - g], sizeof(int));
      recv_block(connfd, &initialDFFLable[j]);
    }
  }

  recv_block(connfd, &(garbledCircuit.globalKey));  //receive key
  evaluate(&garbledCircuit, inputLabels, initialDFFLable, outputLabels, connfd);

  for (int cid = 0; cid < c; cid++) {
    for (int i = 0; i < m; i++) {
      short myOutputType = getLSB(outputLabels[m * cid + i]);
      short outputType;
      recv_type(connfd, &outputType);
    }
  }

  client_close(connfd);
  removeGarbledCircuit(&garbledCircuit);
  return SUCCESS;
}

int main(int argc, char* argv[]) {

  po::options_description desc("Allowed options");
  desc.add_options()  //
  ("help", "produce help message")  //
  ("alice", "Run as Alice (server).")  //
  ("bob", "Run as Bob (client).")  //
  ("deterministic", "Run with deterministic random generator.")  //
  ("scd_file",
   po::value<string>()->default_value("../read_netlist/netlists/test.scd"),
   "Simple circuit description (.scd) file address.")  //
  ("port", po::value<int>()->default_value(1234), "socket port")  //
  ("server_ip", po::value<string>()->default_value("127.0.0.1"),
   "Server's (Alice's) IP, required when running as Bob.")  //
  ("dump_hex", po::value<string>(), "Directory for dumping memory hex files.")  //
  ("input_data", po::value<string>(),
   "Hexadecimal input data, if not provided, it is randomly chosen.");

  po::variables_map vm;
  po::store(po::parse_command_line(argc, argv, desc), vm);
  po::notify(vm);

  if (vm.count("help")) {
    cout << desc << endl;
    return 1;
  }

  block R;
  if (vm.count("deterministic")) {
    cout << "Run with deterministic random generator.\n";
    srand(1);
    srand_sse(1111);
    R = makeBlock((long )(-1), (long )(-1));
  } else {
    srand(time(NULL));
    srand_sse(time(NULL));
    R = randomBlock();
    *((short *) (&R)) = 1;
  }

  string scd_file_address;
  if (vm.count("scd_file")) {
    scd_file_address = vm["scd_file"].as<string>();
  } else {
    cerr << "SCD file should be specified." << endl;
    return -1;
  }

  int port;
  if (vm.count("port")) {
    port = vm["port"].as<int>();
  } else {
    cerr << "Socket port should be specified." << endl;
    return -1;
  }

  if (vm.count("alice") == 0 && vm.count("bob") == 0) {
    cerr << "One of --alice or --bob mode flag should be used." << endl;
    return -1;
  }
  if (vm.count("dump_hex")) {
    dump_hex_prefix = vm["dump_hex"].as<string>();
  }

  unsigned long long input_data = 0;
  bool random_input = true;
  if (vm.count("input_data")) {
    string input_data_str = vm["input_data"].as<string>();
    input_data = std::stoll(input_data_str, nullptr, 16);
    random_input = false;
  }

  GarbledCircuit garbledCircuit;
  if (readCircuitFromFile(scd_file_address, &garbledCircuit) == FAILURE) {
    cerr << "Error while reading scd file: " << scd_file_address << endl;
    return -1;
  }

  if (vm.count("alice")) {
    // open the socket
    int connfd;
    if ((connfd = server_init(port)) == -1) {
      cerr << "Cannot open the socket in port " << port << endl;
      return -1;
    }
    cout << "Open Alice server on port: " << port << endl;

    if (dump_hex_prefix != "")
      dump_initial("g");

    alice(garbledCircuit, random_input, R, connfd);

  } else if (vm.count("bob")) {

    string server_ip;
    if (vm.count("server_ip")) {
      server_ip = vm["server_ip"].as<string>();
    } else {
      cerr << "Server IP should be specified, when running as Bob." << endl;
      return -1;
    }

    // open socket, connect to server
    int connfd;
    if ((connfd = client_init(server_ip.c_str(), port)) == -1) {
      cerr << "Cannot connect to " << server_ip << ":" << port << endl;
      return -1;
    }
    cout << "Connect Bob client to Alice server on " << server_ip << ":" << port
         << endl;

    if (dump_hex_prefix != "")
      dump_initial("e");

    bob(garbledCircuit, random_input, connfd);

  }

  if (dump_hex_prefix != "") {
    dump_finish();
  }

  return 0;
}

