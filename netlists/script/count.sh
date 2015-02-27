#!/bin/bash
echo "$1"


grep -w -c 'AND' $1
grep -w -c 'ANDN' $1
grep -w -c 'NAND' $1
grep -w -c 'NANDN' $1
grep -w -c 'OR' $1
grep -w -c 'ORN' $1
grep -w -c 'NOR' $1
grep -w -c 'NORN' $1
grep -w -c 'MUX' $1
grep -w -c 'FA' $1
grep -w -c 'HA' $1
grep -w -c 'XOR' $1
grep -w -c 'XNOR' $1
grep -w -c 'IV' $1
grep -w -c 'DFF' $1

