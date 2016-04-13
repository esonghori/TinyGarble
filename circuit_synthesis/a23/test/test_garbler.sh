#!/bin/bash

rm -f o.txt
rm -rf work transcript vsim.wlf
vlib work

vlog ../*.v
vlog a23_testbench.v

vsim -c -do a23_test.do a23_testbench

#for gui
# vsim -do a23_test.do a23_testbench 
