#include "tcpip/tcpip.h"

#include <cunistd>
#include <sys/types.h>
#include <cerrno>
#include <cstdio>
#include <sys/wait.h>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <ctime>
#include "util/common.h"

using std::cerr;
using std::cout;
using std::endl;

int main(int argc, char* argv[]) {

  srand(time(0));
  char server_ip[] = "127.0.0.1";
  int port = rand() % 5000 + 1000;

  char data_send[] = "Hello World!";
  char data_recv[20] = { 0 };

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
      if (send_data(connfd_client, data_send, strlen(data_send) + 1) == FAILURE) {
        cerr << "send failed, client side. Test failed" << endl;
        return FAILURE;
      }
      if (recv_data(connfd_client, data_recv, strlen(data_send) + 1) == FAILURE) {
        cerr << "recv failed, client side. Test failed" << endl;
        return FAILURE;
      }
      if (strcmp(data_send, data_recv) != 0) {
        cerr << "data are not same, client side. Test failed" << endl;
        return FAILURE;
      }
      if (client_close(connfd_client) == FAILURE) {
        cerr << "closing client failed. Test failed" << endl;
        return FAILURE;
      }
    } else {  //server
      if (recv_data(connfd_server, data_recv, strlen(data_send) + 1) == FAILURE) {
        cerr << "recv failed, server side. Test failed" << endl;
        return FAILURE;
      }
      if (send_data(connfd_server, data_send, strlen(data_send) + 1) == FAILURE) {
        cerr << "send failed, server side. Test failed" << endl;
        return FAILURE;
      }
      if (strcmp(data_send, data_recv) != 0) {
        cerr << "data are not same, server side. Test failed" << endl;
        return FAILURE;
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
