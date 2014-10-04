#!/bin/bash
echo "$1"


grep -c 'AND' $1
grep -c 'ANDN' $1
grep -c 'NAND' $1
grep -c 'NANDN' $1

grep -c 'OR' $1
grep -c 'ORN' $1
grep -c 'NOR' $1
grep -c 'NORN' $1

grep -c 'XOR' $1
grep -c 'XNOR' $1

grep -c 'IV' $1 

