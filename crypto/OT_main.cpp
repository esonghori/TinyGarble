/*
 * OT_main.cpp
 *
 *  Created on: Oct 2, 2015
 *      Author: ebi
 */

#include "crypto/OT.h"

#include <boost/program_options.hpp>
#include <string>
#include <iostream>
#include <cstdlib>
#include "tcpip/tcpip.h"
#include "util/util.h"

namespace po = boost::program_options;
using std::string;
using std::cout;
using std::cerr;
using std::endl;

int main(int argc, char *argv[]) {

  int port;
  string scd_file_address;
  string server_ip;
  string message0_str;
  string message1_str;
  string select_str;
  po::options_description desc("Oblivious Transfer.");
  desc.add_options()  //
  ("help,h", "produce help message")  //
  ("alice,a", "Run as Alice (server).")  //
  ("message0",
   po::value < string > (&message0_str)->default_value("1211109876543210"),
   "Alice's 128-bit message 0 in hexadecimal w/o '0x'.")  //
  ("message1",
   po::value < string > (&message1_str)->default_value("0123456789101112"),
   "Alice's 128-bit message 1 in hexadecimal w/o '0x'.")  //
  ("select", po::value < string > (&select_str)->default_value("0"),
   "Bob's 1-bit selection (0/1).")  //
  ("bob,b", "Run as Bob (client).")  //
  ("port,p", po::value<int>(&port)->default_value(1234), "socket port")  //
  ("server_ip,s", po::value < string > (&server_ip)->default_value("127.0.0.1"),
   "Server's (Alice's) IP, required when running as Bob.");

  po::variables_map vm;
  try {
    po::store(po::parse_command_line(argc, argv, desc), vm);
    if (vm.count("help")) {
      cout << desc << endl;
      return 0;
    }
    po::notify(vm);
  } catch (po::error& e) {
    cerr << "ERROR: " << e.what() << endl << endl;
    cerr << desc << endl;
    return -1;
  }

  if (vm.count("alice") == 0 && vm.count("bob") == 0) {
    cerr << "One of --alice or --bob mode flag should be used." << endl << endl;
    cerr << desc << endl;
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

    block** message = new block*[1];
    message[0] = new block[2];
    if (strToBlock(message0_str, &message[0][0]) == -1) {
      cerr << "Cannot parse message0 " << message0_str << endl;
      return -1;
    }
    if (strToBlock(message1_str, &message[0][1]) == -1) {
      cerr << "Cannot parse message1 " << message1_str << endl;
      return -1;
    }

    if (OTsend(message, 1, connfd) == -1) {
      cerr << "OTsend failed." << endl;
      return -1;
    }

    cout << "messages were " << endl;
    cout << "0: " << message[0][0] << endl;
    cout << "1: " << message[0][1] << endl;

    delete [] message[0];
    delete [] message;
    server_close(connfd);
  } else if (vm.count("bob")) {

    if (vm.count("server_ip")) {
      server_ip = vm["server_ip"].as<string>();
    }

    // open socket, connect to server
    int connfd;
    if ((connfd = client_init(server_ip.c_str(), port)) == -1) {
      cerr << "Cannot connect to " << server_ip << ":" << port << endl;
      return -1;
    }
    cout << "Connect Bob client to Alice server on " << server_ip << ":" << port
        << endl;

    bool select = (atoi(select_str.c_str()) == 1);

    block message;
    if (OTrecv(&select, 1, connfd, &message) == -1) {
      cerr << "OTsend failed." << endl;
      return -1;
    }

    cout << "select was " << (select ? "1" : "0") << endl;
    cout << "selected message = " << message << endl;

    client_close(connfd);
  }

  return 0;
}

