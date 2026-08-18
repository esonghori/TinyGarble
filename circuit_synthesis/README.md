# Circuit Synthesis

## Dependencies
Netlist generation requires Synopsys Design Compiler or Yosys-ABC synthesis
tools.

## Manual for Synopsys Design Compiler
### Compile library
[This part is mentioned only for documentation and it is already done, please skip.]

Go to `circuit_synthesis/lib/dff_full` and compile the library:
```
	$ cd circuit_synthesis/lib/dff_full
	$ ./compile
```
_Advanced detailed_: Let's suppose that our\_lib.lib is located in
/path/to/our\_lib.

- Go inside /path/to/our\_lib and run:
```
	$ lc_shell
	lc_shell> set search_path [concat /path/to/our_lib/]
	lc_shell> read_lib our_lib.lib
	lc_shell> write_lib our_lib -format db
	lc_shell> exit
```
[Note: commands starting with "lc_shell>" should be called inside `lc_shell`.
Please ignore "lc_shell>" for them].

### Compile a benchmark
Go inside `circuit_synthesis/benchmark`, where benchmark is the name of the function
and compile the benchmark to generate the netlist:
```
	$ cd benchmark
	$ ./compile
```
You can edit `benchmark.dcsh` file to change synthesis parameters.

_Advanced detailed_: Let's suppose that `our_lib.db` is compiled and located
in `/path/to/our_lib` and benchmark.v is located in `/path/to/benchmark/`.

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
It creates `benchmark_syn.v` in the current directory. [Note: commands
starting with "design\_vision>" should be called inside `design_vision`.
Please ignore "design\_vision>" for them.]

### Counting number of gates
You can use `script/count.sh` to count the number of gates in
the generated netlist file. For counting gates in
`/path/to/benchmark/benchmark_syn.v`, simply run:
```
	$ script/count.sh /path/to/benchmark/benchmark_syn.v
```	
## Manual for Yosys

Working Yosys scripts are checked in next to the benchmarks they synthesize:
[`sum/sum.yos`](sum/sum.yos) and [`knns_td/knns_td.yos`](knns_td/knns_td.yos).
Run one from inside its own directory, since the paths in it are relative:
```
	$ cd sum
	$ yosys sum.yos
```
It writes the netlist to `sum_syn_yos.v`, which `V2SCD_Main` can then translate.

To synthesize your own `benchmark.v`, copy `sum.yos` and adapt it:
```
	read_verilog ../syn_lib/*.v
	read_verilog benchmark.v
	hierarchy -check -top benchmark
	proc; fsm; flatten; opt;
	techmap; opt;
	dfflibmap -liberty ../lib/asic_cell_yosys_extended.lib
	abc -liberty ../lib/asic_cell_yosys_extended.lib -script ../lib/script.abc;
	opt; clean;
	opt_clean -purge
	stat -liberty ../lib/asic_cell_yosys_extended.lib
	write_verilog -noattr -noexpr benchmark_syn.v
```
Notes:
- `dfflibmap` is required, otherwise the DFF cells come out without the `I`
  (initial value) pin that `V2SCD_Main` needs.
- `-noattr -noexpr` on `write_verilog` is required; the netlist parser does not
  understand attribute comments or expression syntax.
- The cell library must contain a `BUF` cell (recent Yosys/ABC versions refuse
  to map without one). Both libraries in [`lib/`](lib) have one.
- `../syn_lib` holds the hand-written sequential building blocks the benchmarks
  instantiate, so it must be read before the benchmark itself.
