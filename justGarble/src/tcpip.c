#include <stdio.h>
#include<string.h>
#include <errno.h>
#include "../include/tcpip.h"

int server_init(int port)
{
	int connfd, listenfd;
	socklen_t clilen;
	struct sockaddr_in serv_addr, cli_addr;
	int n;
	listenfd = socket(AF_INET, SOCK_STREAM, 0);
	if (listenfd < 0)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	bzero((char *) &serv_addr, sizeof(serv_addr));

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	serv_addr.sin_port = htons(port);
	if (bind(listenfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	listen(listenfd,5);
	clilen = sizeof(cli_addr);
	printf("Wait for client\n");
	connfd = accept(listenfd, (struct sockaddr *) &cli_addr, &clilen);
	if (connfd < 0)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	
	printf("Connected\n");
	int flag = 1;
	int result = setsockopt(connfd, IPPROTO_TCP, TCP_NODELAY, (char *) &flag, sizeof(int)); 
	if (result < 0){
		printf("%s \n", strerror(errno));
		return -1;
	}
	return connfd;
}

int client_init(char* ip, int port)
{
	int sockfd;
	struct hostent *server;
	struct sockaddr_in serv_addr;
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	server = gethostbyname(ip);
	if (server == NULL)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	bzero((char *) &serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
	serv_addr.sin_port = htons(port);
	if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0)
	{
		printf("%s \n", strerror(errno));
		return -1;
	}
	printf("Connected\n");
	int flag = 1;
	int result = setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, (char *) &flag, sizeof(int)); 
	if (result < 0){
		printf("%s \n", strerror(errno));
		return -1;
	}	
	return sockfd;
}

void send_block(int sock, block var)
{
	uint8_t *val = (uint8_t*) &var;
	write(sock, val, 16);
}

void recv_block(int sock, block* var)
{
	uint8_t *val = (uint8_t*) var;
	read(sock, val, 16);	
}
