TinyGarble
=======
TinyGarble is a full implementation of Yao's Garbled Circuit (GC) protocol for 
two-party Secure Function Evaluation (SFE) in which the parties are able to 
execute any function on their private inputs and learn the output without 
leaking any information about their inputs.
The project consists of two main parts: (1) circuit synthesis 
(`circuit_synthesis`) and (2) secure function evaluation. 
Circuit synthesis is partially described in TinyGarble paper in IEEE S&P'15 (see 
References). It is based on upon hardware synthesis and sequential circuit 
concept and outputs a netlist Verilog (`.v`) file. The other part of TinyGarble, 
hereafter called "TinyGarble", is implemented 
based on [JustGarble](http://cseweb.ucsd.edu/groups/justgarble/) 
project developed in UCSD. Beside Free-XOR, Row-reduction, OT extension, and 
Fixed-key block cipher, TinyGarble includes Half Gates which is the most recent 
optimization on GC protocol and reduces the communication by 33%. 
TinyGarble also includes communication and Oblivious Transfer (OT) which were 
missing in JustGarble. OT is a crucial part for the security of the GC protocol.

TinyGarble general flow:
1. Write a Verilog file (`.v`) describing the function. 
2. Synthesis the Verilog file using TinyGarble's *circuit synthesis* to generate 
a netlist Verilog file (`.v`).
3. Translate the netlist file (`.v`) to a simple circuit description file 
(`.scd`) using TinyGarble's `V2SCD` and then provide both parties with the 
file.
4. Execute `TinyGarble` using `--alice` flag on one party and `--bob` flag 
on the other plus other appropriate arguments.

Any questions or comments: [Ebrahim Songhori](mailto:e.songhori@gmail.com)

## TinyGarble 

### Dependencies
Install dependencies: g++, OpenSSL (1.0.1f <), boost(1.55.0 <), and cmake 
(3.1.0 <). on Ubuntu:

* g++:
```
	$ sudo apt-get install g++
```
* OpenSSL:
```
	$ sudo apt-get install libssl-dev
```
* boost:
```
  $ sudo apt-get install libboost-all-dev
```
* cmake:
```
  $ sudo apt-get install software-properties-common
  $ sudo add-apt-repository ppa:george-edison55/cmake-3.x
  $ sudo apt-get update
  $ sudo apt-get upgrade
  $ sudo apt-get install cmake
```
### Compile
Confing TinyGarble and then compile it in `bin` directory:
```
  $ ./config
  $ cd bin
  $ make
```

### Test
In `bin` directory call `ctest`:
```
	$ ctest
```

### Binaries
#### Main binary
1. `V2SCD`: Translating netlist Verilog (`.v`) file to simple circuit 
description (`.scd`) file. 
```
  -h [ --help ]                         produce help message.
  -i [ --netlist ] arg (=scd/netlists/test.v)
                                        Input netlist (verilog .v) file 
                                        address.
  -o [ --scd ] arg (=scd/netlists/test.scd)
                                        Output simple circuit description (scd)
                                        file address.

```
2. `garbled_circuit/TinyGarble`: TinyGarble main binary:
```
  -h [ --help ]                         produce help message
  -a [ --alice ]                        Run as Alice (server).
  -b [ --bob ]                          Run as Bob (client).
  -i [ --scd_file ] arg (=../read_netlist/netlists/test.scd)
                                        Simple circuit description (.scd) file 
                                        address.
  -p [ --port ] arg (=1234)             socket port
  -s [ --server_ip ] arg (=127.0.0.1)   Server's (Alice's) IP, required when 
                                        running as Bob.
  --init arg                            Hexadecimal init for initializing DFFs,
                                        if not provided, it will be random.
  --input arg                           Hexadecimal input, if not provided, it 
                                        will be random.
  --clock_cycles arg (=1)               Number of clock cycles to evaluate the 
                                        circuit.
  --dump_directory arg                  Directory for dumping memory hex files.
  --disable_OT                          Disable Oblivious Transfer (OT) for 
                                        transferring labels. WARNING: OT is 
                                        crucial for GC security.
  --output_mode arg (=0)                0: normal, 1:separated by clock 2:last 
                                        clock.
```
#### Other binary
1. `scd/SCD_Evaluator_Main`: Evaluating a simple circuit description (`.scd`) file:
```
  -h [ --help ]                         produce help message
  -i [ --scd_file ] arg (=../scd/netlists/test4.scd)
                                        scd address
  --clock_cycles arg (=1)               Number of clock cycles to evaluate the 
                                        circuit.
  --g_init arg (=0)                     g_init in hexadecimal.
  --e_init arg (=0)                     e_init in hexadecimal.
  --g_input arg (=5)                    g_input in hexadecimal.
  --e_input arg (=4)                    e_input in hexadecimal.
  --output_mode arg (=0)                0: normal, 1:separated by clock 2:last 
                                        clock.
``` 
2. `crypto/OT_Main`: Oblivious Transfer binary:
```
  -h [ --help ]                         produce help message
  -a [ --alice ]                        Run as Alice (server).
  --message0 arg (=15141312_11100908_07060504_03020100)
                                        Alice's 128-bit message 0 in 
                                        hexadecimal w/o '0x'.
  --message1 arg (=00010203_04050607_08091011_12131415)
                                        Alice's 128-bit message 1 in 
                                        hexadecimal w/o '0x'.
  --select arg (=0)                     Bob's 1-bit selection (0/1).
  -b [ --bob ]                          Run as Bob (client).
  -p [ --port ] arg (=1234)             socket port
  -s [ --server_ip ] arg (=127.0.0.1)   Server's (Alice's) IP, required when 
                                        running as Bob.
```
#### Test binary
1. `Util_Test`
2. `TCPIP_Test`
3. `BN_Test`
4. `OT_Test`
5. `OT_Extension_Test`
6. `SCD_Evaluator_Test`
7. `Garbled_Circuit_Test`

## Circuit Synthesis

### Dependencies
Netlist generation requires Synopsys Design Compiler or Yosys-ABC synthesis
tools.

### Manual for Synopsys Design Compiler
#### Compile library 
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

#### Compile a benchmark
Go inside `circuit_synthesis/benchmark`, where benchmark is the name of the function
and compile the benchmark to generate the netlist:  
```
	$ cd gen_netlist/benchmark
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

#### Counting number of gates
You can use `gen_netlist/script/count.sh` to count the number of gates in
the generated netlist file. For counting gates in
`/path/to/benchmark/benchmark_syn.v`, simply run:
```
	$ gen_netlist/script/count.sh /path/to/benchmark/benchmark_syn.v
```	
### Manual for Yosys

Here is how to compile a verilog file named "benchmark.v" using the custom
library "asic\_cell.lib". We assume that the files are inside a folder named
"Synthesis\_yosys-abc" inside the "yosys" directory. The final output will be 
written in "benchmark\_syn.v"
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
[Note: commands starting with "yosys>" should be called inside design_vision.
Please ignore "yosys>" for them.]

## References
- Ebrahim M. Songhori, Siam U. Hussain, Ahmad-Reza Sadeghi, Thomas Schneider
and Farinaz Koushanfar, ["TinyGarble: Highly Compressed and Scalable Sequential
Garbled Circuits."](http://esonghori.github.io/file/TinyGarble.pdf) <i>Security
and Privacy, 2015 IEEE Symposium on</i> May, 2015.
- Mihir Bellare, Viet Tung Hoang, Sriram Keelveedhi, and Phillip Rogaway.
Efficient garbling from a fixed-key blockcipher. In <i>S&P</i>, pages 478–492.
IEEE, 2013.
- Samee Zahur, Mike Rosulek, and David Evans. ["Two halves make a whole:
Reducing data transfer in garbled circuits using half
gates."](http://eprint.iacr.org/2014/756)
In <i>Eurocrypt, 2015</i>.
- G. Asharov, Y. Lindell, T. Schneider and M. Zohner: More Efficient Oblivious
Transfer and Extensions for Faster Secure Computation In <i>CCS'13</i>.

## TODOs
- Fix read netlist for Yosys.
- Add synthesis library.
