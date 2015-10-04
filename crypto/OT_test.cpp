/*
 * OT_test.cpp
 *
 *  Created on: Oct 4, 2015
 *      Author: Ebi
 */

#include "crypto/OT.h"

#include <iostream>
#include "tcpip/tcpip.h"
#include "tcpip/tcpip_testsuit.h"
#include "util/common.h"

using std::cerr;
using std::cout;
using std::endl;

struct OTTestStruct {
  block** message;
  bool* select;
  uint len;
};

int alice(void* data, int connfd) {
  OTTestStruct* OT_test_str = (OTTestStruct*)data;
  block **message = data->message;
  uint len = data->len;
  bool *select = data->select;
  if (OTsend(message, len, connfd) == FAILURE) {
    cerr << "OTsend failed." << endl;
    return FAILURE;
  }
  return SUCCESS;
}

int bob(void *data, int connfd) {
  OTTestStruct* OT_test_str = (OTTestStruct*)data;
  block **message = data->message;
  bool *select = data->select;
  uint len = data->len;
  block* message_recv = new block[len];

  if (OTrecv(select, len, connfd, message_recv) == FAILURE) {
    cerr << "OTsend failed." << endl;
    return FAILURE;
  }

  for (int i = 0; i < len; i++) {
    if (!blockCmp(message[i][select[i] ? 1 : 0], message_recv[i])) {
      cerr << message_recv[i] << "!=" << message[i][select[i] ? 1 : 0] << endl;
      cerr << "Equality test failed" << endl;
      return FAILURE;
    }
  }

  delete[] message_recv;
  return SUCCESS;
}

int main(int argc, char* argv[]) {

  srand(time(0));
  srand_sse(time(0));

  uint len = rand()%5 + 1;
  block** message = new block*[len];
  bool* select = new bool[len];
  for (int i = 0; i < len; i++) {
    message[i] = new block[2];
    for (int j = 0; j < 2; j++) {
      message[i][j] = randomBlock();
    }
    select[i] = (rand() % 2 == 1);
  }

  OTTestStruct OT_test_str;
  OT_test_str.message = message;
  OT_test_str.select = select;
  OT_test_str.len = len;

  if (tcpipTestRun(alice, (void *)&OT_test_str, bob,
    (void *)&OT_test_str) == FAILURE) {
    cerr << "tcpip test run failed." << endl;
    return FAILURE;
  }

  for (int i = 0; i < len; i++) {
    delete[] message[i];
  }
  delete[] message;

  return SUCCESS;
}

