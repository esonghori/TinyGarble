#!/bin/bash

rm -rf work transcript vsim.wlf
vlib work
vlog ../*.v ./aes_testbench.v ../../lib/dff_full/dff_full.v
vsim -do aes_test.do aes_testbench
