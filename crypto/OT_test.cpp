/*
 * OT_test.cpp
 *
 *  Created on: Oct 4, 2015
 *      Author: Ebi
 */

#include "crypto/OT.h"

#include <cunistd>
#include <sys/types.h>
#include <cerrno>
#include <cstdio>
#include <sys/wait.h>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <ctime>
#include "tcpip/tcpip.h"
#include "util/common.h"

using std::cerr;
using std::cout;
using std::endl;

#define MESSAGE_LEN 10

int main(int argc, char* argv[]) {

  srand(time(0));
  srand_sse(time(0));
  char server_ip[] = "127.0.0.1";
  int port = rand() % 5000 + 1000;

  block message[2][MESSAGE_LEN];
  bool select[MESSAGE_LEN]
  for (int i = 0; i < MESSAGE_LEN; i++) {
    for (int j = 0; j < 2; j++) {
      message[j][i] = randomBlock();
    }
    select[i] = (rand() % 2 == 1);
  }

  int connfd_server;
  if ((connfd_server = server_init(port)) == -1) {
    cerr << "Cannot open the socket in port." << port << " Test failed" << endl;
    return FAILURE;
  }

  pid_t childPID = fork();
  if (childPID >= 0) {  // fork was successful
    if (childPID == 0) {  // client
      int connfd_client;
      if ((connfd_client = client_init(server_ip.c_str(), port)) == -1) {
        cerr << "Cannot connect to " << server_ip << ":" << port << endl;
        return FAILURE;
      }
      if (OTsend(&message, MESSAGE_LEN, connfd_client) == -1) {
        cerr << "OTsend failed." << endl;
        return -1;
      }

      if (client_close(connfd_client) == FAILURE) {
        cerr << "closing client failed. Test failed" << endl;
        return FAILURE;
      }
    } else {  //server

      block message_recv[MESSAGE_LEN];
      if (OTrecv(select, MESSAGE_LEN, connfd_server, message_recv) == -1) {
        cerr << "OTsend failed." << endl;
        return -1;
      }

      for (int i = 0; i < MESSAGE_LEN; i++) {
        if (!blockCmp(message_recv[i], message[select[i] ? 1 : 0][i])) {
          cerr << "messages are not equal. test failed" << endl;
          return -1;
        }
      }

      if (server_close(connfd_server) == FAILURE) {
        cerr << "closing server failed. Test failed" << endl;
        return FAILURE;
      }
    }
  } else {  // fork failed
    cerr << "Fork failed. Test failed" << endl;
    return FAILURE;
  }

  return SUCCESS;
}

