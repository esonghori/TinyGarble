#ifndef TCPIP_TCPIP_TESTSUIT_H_
#define TCPIP_TCPIP_TESTSUIT_H_

#include <functional>

using std::function;

int tcpipTestRun(
  const function<int(const void *, int)>& server_func,
  const void* server_data,
  const function<int(const void *, int)>& client_func,
  const void* client_data);

#endif /* TCPIP_TCPIP_TESTSUIT_H_ */