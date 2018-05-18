#!/bin/bash 
mkdir -p syn

if [ $1 == "1" ]; then
	design_vision -no_gui -f k_nns_seq_td.dcsh
fi
if [ $2 == "1" ]; then
	design_vision -no_gui -f first_nns_seq_td.dcsh
fi 
if [ $3 == "1" ]; then
	design_vision -no_gui -f first_nns_comb_td.dcsh
fi 

rm *.pvl *.syn *.mr *.log *.svf
