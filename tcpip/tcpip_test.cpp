#include "tcpip/tcpip.h"

#include <iostream>
#include <cstring>
#include "util/common.h"
#include "util/log.h"
#include "tcpip/tcpip_testsuit.h"

using std::endl;

int server_func(const void *data, int connfd) {
  uint len = strlen((char *)data) + 1;
  char *data_recv = new char[len];
  if (recv_data(connfd, data_recv, len) == FAILURE) {
    LOG(ERROR) << "recv failed, server side. Test failed" << endl;
    return FAILURE;
  }
  if (send_data(connfd, data, len) == FAILURE) {
    LOG(ERROR) << "send failed, server side. Test failed" << endl;
    return FAILURE;
  }
  if (strcmp((const char *)data, data_recv) != 0) {
    LOG(ERROR) << "data are not same, server side. Test failed" << endl;
    return FAILURE;
  }
  return SUCCESS;
}


int client_func(const void *data, int connfd) {
  uint len = strlen((char *)data) + 1;
  if (send_data(connfd, data, len) == FAILURE) {
    LOG(ERROR) << "send failed, client side. Test failed" << endl;
    return FAILURE;
  }
  char *data_recv = new char[len]; 
  if (recv_data(connfd, data_recv, len) == FAILURE) {
    LOG(ERROR) << "recv failed, client side. Test failed" << endl;
    return FAILURE;
  }
  if (strcmp((const char *)data, data_recv) != 0) {
    LOG(ERROR) << "data are not same, client side. Test failed" << endl;
    return FAILURE;
  }
  return SUCCESS;
}

int main(int argc, char* argv[]) {
  log_initial(argc, argv);
  srand(time(0));
  char data[] = "Hello World!";
  if (tcpipTestRun(server_func, (const void *)data, client_func,
    (const void *)data) == FAILURE) {
    LOG(ERROR) << "tcpip test run failed" << endl;
    return FAILURE;
  }

  log_finish();
  return SUCCESS;
}
