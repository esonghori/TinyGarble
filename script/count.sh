#!/bin/bash
echo "$1"

grep -c 'XOR' $1
grep -c 'IV' $1 
grep -c 'NOR' $1
