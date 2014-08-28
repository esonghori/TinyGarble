garbled
=======

Test on garbled circuit

Rice University


#manual for design_vision


1.Changing library format using synopsis lc_shell (.lib to .db) [already done, skip]

Please create ~/our_lib/ directory and put our_lib.lib and generic.sdb inside it. Go inside the directory and call the bewlo commands. Note that commands starting with "lc_shell>" should be called inside lc_shell. Please ignore "lc_shell>" for them.

		lc_shell
		lc_shell> set search_path [concat ~/ ~/our_lib/]
		lc_shell> read_lib our_lib.lib
		lc_shell> write_lib our_lib -format db
		lc_shell> exit
2.Compile adder.v using synopsis design_vison:

Here, we supposed that our_lib.lib is located in ~/our_lib directory and adder.v is located in ~/ directory. Note that commands starting with "design_vision>" should be called inside lc_shell. Please ignore "design_vision>" for them

		design_vision
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
