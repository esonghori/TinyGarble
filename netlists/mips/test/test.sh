#!/bin/bash

CC=$1 #clock cycle to evalute 

if [ -z "$CC" ]
then
   CC=60		#default is 60 clock cycle
fi

vlib work
vlog ../../syn_lib/*.v ../*.v Testbench.v
vsim -gCC=$CC -do test.do TestBench