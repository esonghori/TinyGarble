#include "util/util.h"

#include <iostream>
#include <sstream>
#include "util/minunit.h"

using std::cerr;
using std::cout;
using std::endl;
using std::stringstream;

void test_setup() {
}
void test_teardown() {
}

MU_TEST(str_block_seperation) {
  block v, w;
  string test_hex = "15141312 11100908 07060504 03020100";
  mu_check(strToBlock(test_hex_str, &v) == SUCCESS);
  test_hex = "15141312_11100908_07060504_03020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
  test_hex = "15141312\t11100908\t07060504\t03020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
  test_hex = "15141312111009080706050403020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
  test_hex = "1514131\t211100 90807060504_03020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
}

MU_TEST(str_block_fill_zero) {
  block v, w;
  string test_hex = "00000000 00000000 00000000 03020100";
  mu_check(strToBlock(test_hex_str, &v) == SUCCESS);
  test_hex = "3020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
  test_hex = "00000003020100";
  mu_check(strToBlock(test_hex_str, &w) == SUCCESS);
  mu_check(blockCmp(v, w)));
}

MU_TEST(str_block_lsb) {
  mu_check(strToBlock("01", &v) == SUCCESS);
  mu_check(getLSB(v));
  mu_check(strToBlock("00", &v) == SUCCESS);
  mu_check(!getLSB(v));
}

MU_TEST(str_block_operator) {
  stringstream o_stream;
  string test_hex = "15141312 11100908 07060504 03020100";
  block v;
  mu_check(strToBlock(test_hex_str, &v) == SUCCESS);
  o_stream << v;
  mu_check(o_stream.str() == test_hex);
}

MU_TEST_SUITE(test_suite) {
  MU_SUITE_CONFIGURE(&test_setup, &test_teardown);

  MU_RUN_TEST(str_block_seperation);
  MU_RUN_TEST(str_block_fill_zero);
  MU_RUN_TEST(str_block_lsb);
  MU_RUN_TEST(str_block_operator);
}

int main(int argc, char *argv[]) {
  MU_RUN_SUITE(test_suite);
  MU_REPORT()
  ;
  return 0;
}

