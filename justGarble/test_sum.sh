#!/bin/sh

echo "average garble time	average evaluation time"
for i in 4 8 32 64 128 256 512 1024 2048 4096 8192 16384; do
	readNetlist/bin/ReadNetlist.out readNetlist/netlists/sum/sum_syn_16384_$i.v readNetlist/netlists/sum/sum_syn_16384_$i.scd $i
done

for i in 4 8 32 64 128 256 512 1024 2048 4096 8192 16384; do
	echo "c = $i"
	bin/GarbleFile.out readNetlist/netlists/sum/sum_syn_16384_$i.scd
done