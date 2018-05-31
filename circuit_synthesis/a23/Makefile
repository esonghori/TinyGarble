.PHONY: clean syn

all: syn a23_mem.v a23_gc_main.v a23_alu.v a23_decode.v a23_fetch.v  a23_register_bank.v a23_barrel_shift.v a23_core.v a23_execute.v a23_multiply.v a23_config_defines.vh  a23_functions.vh  a23_localparams.vh  global_defines.vh
	design_vision -no_gui -f a23.dcsh

syn:
	mkdir -p syn

clean:
	rm -rf syn/ *.log *.pvl *.syn *.mr *.svf
