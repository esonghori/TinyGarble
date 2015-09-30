TinyGarble
=======
**Caution: Pre-Alpha version and under construction!**

TinyGarble project consists of two main parts: netlist generation (/genNetlist) and two-party secure function evaluation (SFE). Netlist generation is partially describe in TinyGarble paper in IEEE S&P'15 (see References). It is based on upon hardware synthesis and sequential circuits. The other part of TinyGarble, hereafter called "TinyGarble", is implemented based on [JustGarble](http://cseweb.ucsd.edu/groups/justgarble/) project developed in UCSD. Beside Free-XOR, Row-reduction, OT extension, and Fixed-key block cipher, TinyGarble includes Half Gates which is the most recent optimization in garbled circuit (GC) protocol and reduces the communication 33%.

## TinyGarble 

### Prerequisites
1. Install dependencies: g++, OpenSSL, boost, for Ubuntu run:
	
	`$ sudo apt-get install g++ libssl-dev libboost-all-dev`

2. Compile TinyGarble by executing `make` in `eval_netlist/` directory (for dumping labels, use `USER_FLAGS=-DDUMP_HEX`):
```
  $ cd eval_netlist
  $ make
```
###Test
```
	$ debug/tinygarble --alice &
	$ debug/tinygarble --bob
```

## Netlist Generation 

### Prerequisites
Netlist generation requires Synopsys Design Compiler or Yosys-ABC synthesis tools.

### Manual for Synopsys Design Compiler
1. Compile library [This part is mentioned only for documentation and it is already done, please skip.]

Go to `gen_netlist/lib/dff_full` and compile the library:
```
	$ cd gen_netlist/lib/dff_full
	$ ./compile
```
_Advanced detailed_: Let's suppose that our_lib.lib is located in /path/to/our_lib.

- Go inside /path/to/our_lib and run: 
```
	$ lc_shell
	lc_shell> set search_path [concat /path/to/our_lib/]
	lc_shell> read_lib our_lib.lib
	lc_shell> write_lib our_lib -format db
	lc_shell> exit
```
[Note: commands starting with "lc_shell>" should be called inside `lc_shell`. Please ignore "lc_shell>" for them].

2. Compile a benchmark:

Go inside `genNetlist/benchmark`, where benchmark is the name of the function and compile the benchmark to generate the nestlist:  
```
	$ cd gen_netlist/benchmark
	$ ./compile
```
You can edit `benchmark.dcsh` file to change synthesis parameters.

_Advanced detailed_: Let's suppose that `our_lib.db` is compiled and located in `/path/to/our_lib` and benchmark.v is located in `/path/to/benchmark/`. 

- Go to `/path/to/benchmark/` and run: 
```
	$ design_vision
	design_vision> elaborate benchmark -architecture verilog -library DEFAULT -update
	design_vision> set_max_area -ignore_tns 0 
	design_vision> set_flatten false -design *
	design_vision> set_structure -design * false
	design_vision> set_resource_allocation area_only
	design_vision> report_compile_options
	design_vision> compile -ungroup_all -boundary_optimization  -map_effort high -area_effort high -no_design_rule
	design_vision> write -hierarchy -format verilog -output benchmark_syn.v
	design_vision> exit
```
It creates `benchmark_syn.v` in the current directory. [Note: commands starting with "design\_vision>" should be called inside `design_vision`. Please ignore "design\_vision>" for them.]

3.Counting number of gates

You can use `gen_netlist/script/count.sh` to count the number of gates in the genetrated netlist file. For counting gates in `/path/to/benchmark/benchmark_syn.v`, simply run:
```
	$ gen_netlist/script/count.sh /path/to/benchmark/benchmark_syn.v
```	
###Manual for Yosys

Here is how to compile a verilog file named "benchmark.v" using the custom library "asic\_cell.lib". We assume that the files are inside a folder named "Synthesis\_yosys-abc" inside the "yosys" directory. The final output will be written in "benchmark\_syn.v"
```
	$ cd ~/yosys
	$ ./yosys
	yosys> read_verilog Synthesis_yosys-abc/benchmark.v
	yosys> hierarchy -check -top benchmark
	yosys> proc; opt; memory; opt; fsm; opt; techmap; opt; 
	yosys> abc -liberty Synthesis_yosys-abc/asic_cell_extended.lib
	yosys> opt
	yosys> write_verilog Synthesis_yosys-abc/benchmark_syn.v
	yosys> exit
```	
[Note: commands starting with "yosys>" should be called inside design_vision. Please ignore "yosys>" for them.]

##References
- Ebrahim M. Songhori, Siam U. Hussain, Ahmad-Reza Sadeghi, Thomas Schneider and Farinaz Koushanfar, ["TinyGarble: Highly Compressed and Scalable Sequential Garbled Circuits."](http://esonghori.github.io/file/TinyGarble.pdf) <i>Security and Privacy, 2015 IEEE Symposium on</i> May, 2015.
- Mihir Bellare, Viet Tung Hoang, Sriram Keelveedhi, and Phillip Rogaway. Efficient garbling from a fixed-key blockcipher. In <i>S&P</i>, pages 478–492. IEEE, 2013.
- Samee Zahur, Mike Rosulek, and David Evans. ["Two halves make a whole: Reducing data transfer in garbled circuits using half gates."](http://eprint.iacr.org/2014/756) In <i>Eurocrypt, 2015</i>.
- G. Asharov, Y. Lindell, T. Schneider and M. Zohner: More Efficient Oblivious Transfer and Extensions for Faster Secure Computation In <i>CCS'13</i>.


##TODOs
- Add read\_netlist documentation.
- Add OT.
- Update README.md.
- Add synthesis library.
