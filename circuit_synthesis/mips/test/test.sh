#!/bin/bash

CC=$1 #clock cycle to evalute 

if [ -z "$CC" ]
then
   CC=100		#default is 100 clock cycle
fi

vlib work
vlog ../../syn_lib/*.v ../*.v Test_Bench.v
vsim -gCC=$CC -do test.do Test_Bench
