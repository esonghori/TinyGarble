#include "tcpip/tcpip_testsuit.h"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <cstdlib>
#include <iostream>
#include "util/common.h"
#include "tcpip/tcpip.h"
#include "util/log.h"

using std::endl;

#define PORT_TRIAL 10
#define SLEEP_BEFORE_SEC 1 // sleep before connection in client

int tcpipTestRun(
  const function<int(const void *, int)>& server_func,
  const void* server_data,
  const function<int(const void *, int)>& client_func,
  const void* client_data) {
  
  char server_ip[] = "127.0.0.1";
  int port = rand() % 5000 + 1000;
  for(int i=0;i<PORT_TRIAL;i++) {
    if (serverOpenSocket(port) == FAILURE) {
      port = rand() % 5000 + 1000;
      LOG(ERROR) << "Cannot open the socket in port " << port;
      if(i==PORT_TRIAL-1) {
        LOG(ERROR) << "Connection failed." << endl;
      }
      return FAILURE;
    }
    else {
      break;
    }
  }

  pid_t childPID = fork();
  if (childPID >= 0) {  // fork was successful
    if (childPID == 0) {  // client
      sleep(SLEEP_BEFORE_SEC);
      int client_connfd;
      if ((client_connfd = client_init(server_ip, port)) == -1) {
        LOG(ERROR) << "Cannot connect to " << server_ip << ":" << port << endl;
        LOG(ERROR) << "Connection failed." << endl;
        return FAILURE;
      }
      if (client_func(client_data, client_connfd) == FAILURE) {
        LOG(ERROR) << "client failed." << endl;
        return FAILURE;
      }
      if (client_close(client_connfd) == FAILURE) {
        LOG(ERROR) << "closing client failed." << endl;
        return FAILURE;
      }
    } else {  //server
      int server_connfd;
      if((server_connfd = serverWaitForClient()) ==  FAILURE) {
        LOG(ERROR) << "server connection failed." << endl;
        return FAILURE;
      }
      if (server_func(server_data, server_connfd) == FAILURE) {
        LOG(ERROR) << "server failed." << endl;
        return FAILURE;
      }
      if (server_close(server_connfd) == FAILURE) {
        LOG(ERROR) << "closing server failed." << endl;
        return FAILURE;
      }
      int client_returnStatus;    
      waitpid(childPID, &client_returnStatus, 0);
      if (client_returnStatus == FAILURE) {
        LOG(ERROR) << "client failed." << endl;
        return FAILURE;
      }
    }
  } else {  // fork failed
    LOG(ERROR) << "Fork failed." << endl;
    return FAILURE;
  }

  return SUCCESS;
}
