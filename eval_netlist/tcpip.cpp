/*
 This file is part of TinyGarble.

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

#include "tcpip.h"

#include <arpa/inet.h>
#include <cstdio>
#include <cstring>
#include <cerrno>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <unistd.h>
#include <netinet/tcp.h>

#include "common.h"

int listenfd = 0;

int server_init(int port) {
  int connfd;
  socklen_t clilen;
  struct sockaddr_in serv_addr, cli_addr;
  int n;
  listenfd = socket(AF_INET, SOCK_STREAM, 0);
  if (listenfd < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  bzero((char *) &serv_addr, sizeof(serv_addr));

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = INADDR_ANY;
  serv_addr.sin_port = htons(port);
  if (bind(listenfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  listen(listenfd, 5);
  clilen = sizeof(cli_addr);
  printf("Wait for client\n");
  connfd = accept(listenfd, (struct sockaddr *) &cli_addr, &clilen);
  if (connfd < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }

  printf("Connected\n");
  int flag = 1;
  int result = setsockopt(connfd, IPPROTO_TCP, TCP_NODELAY, (char *) &flag,
                          sizeof(int));
  if (result < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  return connfd;
}

int server_close(int sock) {
  close(sock);
  close(listenfd);
  return SUCCESS;
}

int client_init(const char* ip, int port) {
  int sockfd;
  struct hostent *server;
  struct sockaddr_in serv_addr;
  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  server = gethostbyname(ip);
  if (server == NULL) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  bzero((char *) &serv_addr, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  bcopy((char *) server->h_addr, (char *) &serv_addr.sin_addr.s_addr,
        server->h_length);
  serv_addr.sin_port = htons(port);
  if (connect(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }

  int flag = 1;
  int result = setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, (char *) &flag,
                          sizeof(int));
  if (result < 0) {
    cerr << strerror(errno) << endl;
    return FAILURE;
  }
  return sockfd;
}

int client_close(int sock) {
  close(sock);
  return SUCCESS;
}

void send_block(int sock, block var) {
  uint8_t *val = (uint8_t*) &var;
  write(sock, val, 16);
}

void recv_block(int sock, block* var) {
  uint8_t *val = (uint8_t*) var;
  read(sock, val, 16);
}

void send_type(int sock, short var) {
  const void *val = (const void*) &var;
  // TODO(ebi): check if all the data is written.
  write(sock, val, sizeof(short));
}

void recv_type(int sock, short* var) {
  void *val = (void*) var;
  read(sock, val, sizeof(short));
}

