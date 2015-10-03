/*
 * OT_main.cpp
 *
 *  Created on: Oct 2, 2015
 *      Author: ebi
 */

#include <boost/program_options.hpp>
#include <string>
#include "crypto/OT.h"

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
  ("message0", po::value<string>(&message0_str)->default_value("1211109876543210"),
   "Alice's message 0 in hexadecimal w/o '0x'.")  //
  ("message1", po::value<string>(&message1_str)->default_value("0123456789101112"),
   "Alice's message 1 in hexadecimal w/o '0x'.")  //
  ("select", po::value<string>(&select_str)->default_value("0"),
   "Bob's selection in hexadecimal w/o '0x'.")  //
  ("bob,b", "Run as Bob (client).")  //
  ("port,p", po::value<int>(&port)->default_value(1234), "socket port")  //
  ("server_ip,s", po::value<string>(&server_ip)->default_value("127.0.0.1"),
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


    string message0_str;
    string message1_str;
    string select_str;


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





    client_close(connfd);
  }

  return 0;
}

