garbled
=======

Test on garbled circuit

Rice University


##manual for design_vision


1.Changing library format using synopsis lc_shell (.lib to .db) [already done, skip]

Please create ~/our_lib/ directory and put our_lib.lib and generic.sdb inside it. Go inside the directory and call the bewlo commands. Note that commands starting with "lc_shell>" should be called inside lc_shell. Please ignore "lc_shell>" for them.

		$ lc_shell
		lc_shell> set search_path [concat ~/ ~/our_lib/]
		lc_shell> read_lib our_lib.lib
		lc_shell> write_lib our_lib -format db
		lc_shell> exit
2.Compile adder.v using synopsis design_vison:

Here, we supposed that our_lib.lib is located in ~/our_lib directory and adder.v is located in ~/ directory. Note that commands starting with "design_vision>" should be called inside lc_shell. Please ignore "design_vision>" for them

		$ design_vision
		design_vision> set search_path [concat ~/ ~/our_lib/]
		design_vision> set target_library ~/our_lib/our_lib.db
		design_vision> set link_library ~/our_lib/our_lib.db
		design_vision> set symbol_library ~/our_lib/generic.sdb
		design_vision> analyze -format verilog {~/adder.v}
		design_vision> elaborate adder -architecture verilog -library DEFAULT -update
		design_vision> set_max_area 0
		design_vision> compile_ultra -exact_map -no_design_rule -area_high_effort_script
		design_vision> report_area
		design_vision> write -hierarchy -format verilog -output adder_syn.v
		design_vision> exit
3.Counting # of gates in adder_syn.v


##manual for Yosys

Here is how to compile a verilog file named "hamming.v" using the custom library "asic_cell.lib". We assume that the files are inside a folder named "Synthesis_yosys-abc" inside the "yosys" directory. The final output will be written in "hamming_synth.v"

	$ cd ~/yosys
	$ ./yosys
	yosys> read_verilog Synthesis_yosys-abc/hamming.v
	yosys> hierarchy -check -top hamming
	yosys> proc; opt; memory; opt; fsm; opt; techmap; opt; 
	yosys> abc -liberty Synthesis_yosys-abc/asic_cell_extended.lib
	yosys> opt
	yosys> write_verilog Synthesis_yosys-abc/hamming_synth.v
	yosys> exit
	
Note that commands starting with "yosys>" should be called inside yosys. Please ignore "yosys>" for them

##compile just garbled

Download msgpack-c from msgpack.org. Compile it using:

	$ ./bootstrap
	$ ./configure
	$ make 

Add these two ~/.profile: 

	if [ -n "$LD_LIBRARY_PATH"]; 
	then
		export LD_LIBRARY_PATH=path/to/msgpack-c/src/.libs
	else
		export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:path/to/msgpack-c/src/.libs
	fi
	export MSGPACK=path/to/msgpack-c/src

Remember change path/to/msgpack-c to msgpack path. This way, it doesn't need "sudo make install".
Go to justGarble and make it:

	$ make

And test it:

	$ bin/AESFullTest.out

