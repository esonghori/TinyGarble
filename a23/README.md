
- Follow the steps in the ReadMe of TinyGarble

- Install the additional tools for ARM2GC:

```
sudo apt install binutils-arm-linux-gnueabi

sudo apt install gcc-arm-linux-gnueabi
```

- Run one of the benchmarks from *aes, cordic, hamming, mul, sha3, bubble-sort, compare, dijkstra, matrix-mul, merge-sort, sum*

`cd <benchmark_directory>`

Compile the source code and write the Assembly instructions to `p.txt`

`make`

Run ARM2GC with the compiled binary

On Alice's terminal:

```
bin/garbled_circuit/TinyGarble -a -i bin/scd/netlists/a23_gc_main_64_w_n_cc.scd --p_init a23/<benchmark_directory>/p.txt --init a23/<benchmark_directory>/test/g.txt -c 1000 -t 1 --log2std
```

On Bob's terminal:

```
bin/garbled_circuit/TinyGarble -b -i bin/scd/netlists/a23_gc_main_64_w_n_cc.scd --p_init a23/<benchmark_directory>/p.txt --init a23/<benchmark_directory>/test/e.txt -c 1000 -t 1 --output_mode 2 --log2std
```

To check if the result is correct by simulator: 

```
bin/scd/SCD_Evaluator_Main -i bin/scd/netlists/a23_gc_main_64_w_n_cc.scd -c 1000 --p_init a23/<benchmark_directory>/p.txt --g_init a23/<benchmark_directory>/test/g.txt --e_init a23/<benchmark_directory>/test/e.txt -t 1 --output_mode 2 --log2std
```
run_arm2gc.txt
Displaying run_arm2gc.txt.
