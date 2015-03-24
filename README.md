Garbled
=======
**Caution: Under Construction!**

TinyGarble consists of two main parts: netlist generation (/genNetlist) and two party secure function evalauation (SFE). Netlist generation is partially describe in TinyGarble paper in IEEE S&P'15. It is based on upon hardware synthesis and sequential circuits. The other part of TinyGarble, two party SFE, is implemented based on [JustGarble](http://cseweb.ucsd.edu/groups/justgarble/) developed in UCSD. Beside Free-XOR, Row-reduction, and Fixed-key block cipher, TinyGarble SFE includes Half Gates which is the most recent optimization in garbled circuit (GC) protocol.

## Netlist Generation 
Netlist generation requires Synopsys Design Compiler or Yosys-ABC synthesis tools.

###Manual for Synopsys Design Compiler

1. Compile library [Already done, please skip.]

Go to `genNetlist/lib/dff_full` and run:

	$ ./compile

_Advanced detailed_: Let's suppose that our_lib.lib is located in /path/to/our_lib.

- Go inside /path/to/our_lib and run: 

	$ lc_shell
	lc_shell> set search_path [concat /path/to/our_lib/]
	lc_shell> read_lib our_lib.lib
	lc_shell> write_lib our_lib -format db
	lc_shell> exit

[Note: commands starting with "lc_shell>" should be called inside `lc_shell`. Please ignore "lc_shell>" for them].

2. Compile a benchmark:

Go inside `genNetlist/benchmark`, where benchmark is the name of the function. and run:  

	$ ./compile

You can edit `benchmark.dcsh` file to change the parameter of the function.

_Advanced detailed_: Let's suppose that our_lib.db is compiled and located in /path/to/our_lib and benchmark.v is located in /path/to/benchmark/. 

- Go to /path/to/benchmark/ and run: 

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

It creates benchmark_syn.v in the current directory. [Note: commands starting with "design_vision>" should be called inside design_vision. Please ignore "design_vision>" for them.]

3.Counting number of gates

You can use `genNetlist/script/count.sh` to count the number of gates in a verilog file. For /path/to/benchmark/benchmark_syn.v, simply run:

	$ genNetlist/script/count.sh /path/to/benchmark/benchmark_syn.v
	
###Manual for Yosys

Here is how to compile a verilog file named "benchmark.v" using the custom library "asic_cell.lib". We assume that the files are inside a folder named "Synthesis_yosys-abc" inside the "yosys" directory. The final output will be written in "benchmark_syn.v"

	$ cd ~/yosys
	$ ./yosys
	yosys> read_verilog Synthesis_yosys-abc/benchmark.v
	yosys> hierarchy -check -top benchmark
	yosys> proc; opt; memory; opt; fsm; opt; techmap; opt; 
	yosys> abc -liberty Synthesis_yosys-abc/asic_cell_extended.lib
	yosys> opt
	yosys> write_verilog Synthesis_yosys-abc/benchmark_syn.v
	yosys> exit
	
[Note: commands starting with "yosys>" should be called inside design_vision. Please ignore "yosys>" for them.]

##Two Party SFE

For using TinyGarble, the dependency should be installed and TinyGarble need to be compiled.

- Dependencies
Download msgpack-c from msgpack.org. Compile it using:

	$ ./bootstrap
	$ ./configure
	$ make 

If you have a root access run `$ sudo make install`. Otherwise add the following scripts to ~/.profile: 

	if [ -n "$LD_LIBRARY_PATH"]; 
	then
		export LD_LIBRARY_PATH=/path/to/msgpack-c/src/.libs
	else
		export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/path/to/msgpack-c/src/.libs
	fi
	export MSGPACK=path/to/msgpack-c/src

[Note: Remember replace /path/to/msgpack-c with the actual msgpack path]. This way, it doesn't need "sudo make install".

- Compile TinyGarble

Go to the root directory of TinyGarble and make it:

	$ make

And test it:

	$ debug/Alice.out readNetlist/netlists/test.scd 1515&
	$ debug/Bob.out readNetlist/netlists/test.scd 127.0.0.1 1516


##TODOs
- Upgrade README.md.
- Add synthesis library.
- Add OT.
