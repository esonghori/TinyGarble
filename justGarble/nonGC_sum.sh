#!/bin/sh

readNetlist/bin/ReadNetlist.out readNetlist/netlists/sum/sum_syn_1024_1024.v readNetlist/netlists/sum/sum_syn_1024_1024.scd 1024

bin/SCDCircuitTest.out readNetlist/netlists/sum/sum_syn_1024_1024.scd
