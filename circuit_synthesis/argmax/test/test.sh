#!/bin/bash

rm -rf work transcript vsim.wlf
vlib work


vlog ../argmax.v testbench.v

#w/o gui
vsim -c -do test.do testbench

#w/ gui
#vsim -do test.do testbench 
