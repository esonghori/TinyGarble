#!/bin/bash

rm -f o.txt
rm -rf work transcript vsim.wlf
vlib work

vlog ../*.v
vlog a23_testbench.v

#w/o gui
#vsim -c -do a23_test.do a23_testbench

#w/ gui
vsim -do a23_test.do a23_testbench 
