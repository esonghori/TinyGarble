#!/bin/sh

echo "make scd files from verilog"


echo "aes"
bin/Readnetlists.out netlists/aes/aes_syn_10.v netlists/aes/aes_syn_10.scd 10

echo "sum"
bin/Readnetlists.out netlists/sum/sum_syn_262144_262144.v netlists/rsa/sum_syn_262144_262144.scd 262144

echo "sha3"
bin/Readnetlists.out netlists/sha3/sha3_syn_24.v netlists/sha3/sha3_syn_24.scd 24

echo "hamming"
bin/Readnetlists.out netlists/hamming/hamming_syn_16000_16000.v netlists/hamming/hamming_syn_16000_16000.scd 16000

echo "compare"
bin/Readnetlists.out netlists/compare/compare_syn_16384_16384.v netlists/compare/compare_syn_16384_16384.scd 16384

echo "stackMachine"
bin/Readnetlists.out netlists/stackMachine/stackMachine_syn_32.v netlists/stackMachine/stackMachine_syn_32.scd 1000

echo "rsa"
bin/Readnetlists.out netlists/rsa/modexp_syn_1024_2097152.v netlists/rsa/modexp_syn_1024_2097152.scd 2097152
