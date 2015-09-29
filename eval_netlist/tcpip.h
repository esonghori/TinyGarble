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

#ifndef EVAL_NETLIST_TCPIP_H_
#define EVAL_NETLIST_TCPIP_H_

#include "block.h"

int server_init(int port);
int server_close(int sock);

int client_init(const char* ip, int port);
int client_close(int sock);

void send_block(int sock, block var);
void recv_block(int sock, block* var);

void send_type(int sock, short var);
void recv_type(int sock, short* var);

#endif /* EVAL_NETLIST_TCPIP_H_ */
