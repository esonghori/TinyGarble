#!/bin/bash

rm -f o.txt
rm -rf work transcript vsim.wlf
vlib work

vlog ../*.v
vlog a23_gc_main.v

vsim -do a23_test.do a23_testbench
