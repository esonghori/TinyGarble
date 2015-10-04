#include "tcpip/tcpip.h"

#include <iostream>
#include <cstring>
#include "util/common.h"

using std::cerr;
using std::endl;

int server_func(const void *data, int connfd) {
  uint len = strlen((char *)data) + 1;
  char *data_recv = new char[len];
  if (recv_data(connfd_server, data_recv, len) == FAILURE) {
    cerr << "recv failed, server side. Test failed" << endl;
    return FAILURE;
  }
  if (send_data(connfd_server, data, len) == FAILURE) {
    cerr << "send failed, server side. Test failed" << endl;
    return FAILURE;
  }
  if (strcmp(data, data_recv) != 0) {
    cerr << "data are not same, server side. Test failed" << endl;
    return FAILURE;
  }
  return SUCCESS;
}


int client_func(const void *data, int connfd) {
  uint len = strlen((char *)data) + 1;
  if (send_data(connfd_client, data, len) == FAILURE) {
    cerr << "send failed, client side. Test failed" << endl;
    return FAILURE;
  }
  char *data_recv = new char[len]; 
  if (recv_data(connfd_client, data_recv, len) == FAILURE) {
    cerr << "recv failed, client side. Test failed" << endl;
    return FAILURE;
  }
  if (strcmp(data, data_recv) != 0) {
    cerr << "data are not same, client side. Test failed" << endl;
    return FAILURE;
  }
  return SUCCESS;
}

int main(int argc, char* argv[]) {

  srand(time(0));
  char data[] = "Hello World!";
  if (tcpipTestRun(server_func, (void *)data, client_func,
    (void *)data) == FAILURE) {
    cerr << "tcpip test run failed" << endl;
    return FAILURE;
  }

  return SUCCESS;
}
