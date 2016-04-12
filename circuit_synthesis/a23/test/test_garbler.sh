#!/bin/bash

rm -rf work transcript vsim.wlf
vlib work
vlog ./a23_gc_main.v ../*.v
vsim -do a23_test.do a23_testbench
