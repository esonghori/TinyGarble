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

#define BASE 8

int client_close(int sock);
int server_close(int sock);

int server_init(int );
int client_init(char*, int);
void send_block(int , block );
void recv_block(int , block* );

#endif
