#ifndef TCPIP
#define TCPIP

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h> 
#include <netinet/tcp.h> 
#include "../include/common.h"


int server_init(int port);
int server_close(int sock);

int client_init(char* ip, int port);
int client_close(int sock);

void send_block(int sock, block var);
void recv_block(int sock, block* var);

void send_type(int sock, short var);
void recv_type(int sock, short* var);

#endif
