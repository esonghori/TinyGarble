# Circuit Synthesis

## Source for the shipped netlists

The netlists that appear in `bin/scd/netlists/` after a build are synthesized
from Verilog that is checked into this directory, one subdirectory per function.
The netlist file names carry their parameters, so `mult_64bit_64cc` is
`mult/mult.v` at 64 bits over 64 clock cycles:

| Shipped netlist | Source |
| --- | --- |
| `sum_8bit_1cc`, `sum_nbit_ncc` | [`sum/sum.v`](sum/sum.v) |
| `mult_*bit_*cc` | [`mult/mult.v`](mult/mult.v) |
| `hamming_*bit_*cc` | [`hamming/hamming.v`](hamming/hamming.v) |
| `compare_nbit_ncc` | [`compare/compare.v`](compare/compare.v) |
| `encoder_32bit_1cc` | [`encoder/encoder.v`](encoder/encoder.v) |
| `aes_1cc`, `aes_11cc` | [`aes/`](aes) |
| `sha3_24cc` | [`sha3/`](sha3) |
| `cordic_32bit_31cc` | [`cordic/`](cordic) |
| `matrix_mult_nxn_32bit_n3cc` | [`matrix_mult/`](matrix_mult) |
| `k_nns_31bit_4nei_ncc` | [`knns/`](knns) |
| `knns_td_32bit_4nei_ncc` | [`knns_td/`](knns_td) |
| `rsa_1024bit_2097152cc` | [`rsa/`](rsa) |
| `mips_32bit_64mem_ncc` | [`mips/`](mips) |
| `a23_gc_main_*_w_n_cc` | [`a23/`](a23) |
| `public_test_8bit_ncc` | [`public_test/public_test.v`](public_test/public_test.v) |
| `non_secret_test_8bit_ncc` | [`non_secret_test/non_secret_test.v`](non_secret_test/non_secret_test.v) |

The one exception is `mux_8bit_1cc`, which is a hand-written netlist (it
instantiates `MUX` cells directly) and so has no higher-level source.

Several functions have source here but no pre-built netlist, and need
synthesizing before use: [`div`](div), [`float`](float), [`argmax`](argmax),
[`select`](select), [`stable_match`](stable_match),
[`stack_machine`](stack_machine).

The shared building blocks the benchmarks instantiate (`ADD`, `MULT`, `COMP`,
`DIV`, `MUX`, shifters, ...) live in [`syn_lib/`](syn_lib) and must be read in
before the benchmark itself.

For a walkthrough of all four stages on one function, from `sum.v` to two
parties running the protocol, see the
[complete workflow example](../README.md#complete-workflow-example).

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

Yosys is a free alternative to Design Compiler and is enough to take a
benchmark all the way to a `.scd` file. This flow is verified end to end with
**Yosys 0.33 and Yosys 0.68**: synthesis, `V2SCD_Main` translation, and a
functional check of the result with `SCD_Evaluator_Main`.

### Running a checked-in benchmark

Working Yosys scripts live next to the benchmarks they synthesize:
[`sum/sum.yos`](sum/sum.yos) and [`knns_td/knns_td.yos`](knns_td/knns_td.yos).
Run one from inside its own directory, since the paths in it are relative, and
note that a script file is passed with `-s`:
```
	$ cd sum
	$ yosys -s sum.yos
```
That writes the netlist to `sum_syn_yos.v`. Translate it and check it:
```
	$ bin/scd/V2SCD_Main -i circuit_synthesis/sum/sum_syn_yos.v -o sum.scd
	$ bin/scd/SCD_Evaluator_Main -i sum.scd --g_input 05 --e_input 03
	08
```

### Synthesizing your own function

Copy `sum.yos` and adapt it. For a function in `benchmark.v` with top module
`benchmark`:
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
Each step that is not obvious is there for a reason:

- **`dfflibmap` is required.** `abc` maps combinational logic only and leaves
  flip-flops as Yosys internal cells, so without this step the DFFs never get
  the `I` (initial value) pin that `V2SCD_Main` needs, and you get an error
  about a missing `I`.
- **`-noattr -noexpr` on `write_verilog` is required.** The netlist parser does
  not understand Verilog attributes or expression syntax. Comments are fine.
- **The cell library needs a `BUF` cell.** Yosys 0.68 warns `genlib library
  reader cannot detect the buffer gate` without one, and newer ABC versions can
  refuse to map at all. Both libraries in [`lib/`](lib) now have one. A `BUF` in
  the resulting netlist is free — it becomes a wire alias, not a gate.
- **`../syn_lib` must be read before the benchmark**, since it holds the
  hand-written building blocks (`ADD`, `MULT`, `COMP`, ...) that the benchmarks
  instantiate.

To override a benchmark's parameters, pass them to `hierarchy`. The sequential
8-bit / 8-cycle version of `sum`, which adds one bit per clock cycle, is:
```
	hierarchy -check -top sum -chparam N 8 -chparam CC 8
```
Its netlist is checked in as
[`scd/netlists/test/sum_yosys_1bit_8cc.v`](../scd/netlists/test/sum_yosys_1bit_8cc.v)
and is covered by the test suite, so it doubles as a reference for what a
current Yosys emits.

### Verifying the result

Always cross-check a freshly synthesized circuit in the clear before running the
GC protocol, since a mis-synthesized circuit and a protocol bug look alike:
```
	$ bin/scd/SCD_Evaluator_Main -i sum_seq.scd -c 8 --g_input 6D --e_input 39
	A6
```
Sequential circuits need `-c <clock_cycles>`; without it only the first cycle is
evaluated and the answer looks wrong rather than failing outright.
