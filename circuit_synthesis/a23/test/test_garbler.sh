#!/bin/bash

rm -f o.txt
rm -rf work transcript vsim.wlf
vlib work


#vlog ../../syn_lib/MUX.v
#vlog ../*.v

vlog ../../lib/dff_full/dff_full.v
vlog ../../../bin/scd/netlists/a23_gc_main_64_w_n_cc.v

vlog a23_testbench.v

#w/o gui
#vsim -c -do a23_test.do a23_testbench

#w/ gui
vsim -do a23_test.do a23_testbench
