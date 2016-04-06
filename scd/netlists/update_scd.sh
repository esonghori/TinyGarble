#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for verilogfile in $DIR/*.v
do
  scdfile=${verilogfile%.*}.scd
  echo "$verilogfile to $scdfile"
  $DIR/../../bin/scd/V2SCD_Main -i $verilogfile -o $scdfile
done