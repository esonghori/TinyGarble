#!/bin/bash 
for v in syn/*.v; do
	echo "${v%.*}"
	../../bin/scd/V2SCD_Main -i "$v" -o "${v%.*}".scd --log
done
