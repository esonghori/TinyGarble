Simple Circuit Description (SCD)
=======
The initial idea of a Simple Circuit Description (SCD) was proposed in JustGarble 
paper (S&P'13) to represent a acyclic Boolean circuit. TinyGarble paper (S&P'15)
proposed a modified version of SCD which supports a sequential circuit with 
flip-flops.

## Circuit Format
TinyGarble's V2SCD accepts Verilog netlist circuits with a special format.
The circuit's input ports should be in {`clk`, `rst`, `p_init`, `g_init`,
`e_init`, `p_input`, `g_input`, `e_input`} and its output ports in
{`o`, `terminate`}:

| Port | Meaning |
| --- | --- |
| `clk` | clock |
| `rst` | active high reset |
| `p_init` | public (known to both parties) initial values |
| `g_init` | garbler's (Alice's) initial values |
| `e_init` | evaluator's (Bob's) initial values |
| `p_input` | public input |
| `g_input` | garbler's input |
| `e_input` | evaluator's input |
| `o` | output |
| `terminate` | optional 1-bit signal; when high the parties may stop early |

The `*_init` ports are read only at the first clock cycle and must be connected
to Flip-Flops' `I` (initial) ports.
The `*_input` ports are read at every clock cycle, thus their bit-width should
be multiplied by the number of clock cycles.
It is also true for the `o` port which will be provided at every clock cycle.
`terminate` must be exactly 1 bit; it is only checked when TinyGarble is run
with a non-zero `--terminate_period`.

## Wire Indexing
Every wire in the circuit has a single global index. Wires are numbered in this
order, each block starting where the previous one ended:  
1- `p_init`  
2- `g_init`  
3- `e_init`  
4- `p_input`  
5- `g_input`  
6- `e_input`  
7- Flip-Flops' `Q` (output) — one wire per Flip-Flop, in file order  
8- gates' output — a gate's output index is the gate's index plus the gate
	output offset, which is equal to the size of all init, input, and Flip-Flop
	wires.  

Two negative indices are used as constants instead of wires: `-2`
(`CONST_ZERO`) and `-3` (`CONST_ONE`), both defined in
[util/common.h](../util/common.h).

## SCD Format
Unlike JustGarble's SCD, TinyGarble's SCD is in ASCII format and human-readable.
The format consists of seven whitespace-separated lines:

1- ten header values, in order:  
&nbsp;&nbsp;`p_init_size`, `g_init_size`, `e_init_size`, `p_input_size`,
	`g_input_size`, `e_input_size`, `dff_size`, `output_size`, `terminate_id`,
	`gate_size`.  
&nbsp;&nbsp;The six `*_size` input values and `output_size` are per-clock-cycle
	bit-widths of the corresponding ports. `dff_size` is the number of
	Flip-Flops and `gate_size` the number of gates. `terminate_id` is the wire
	index of the `terminate` signal, or `0` when the circuit has none.  
2- gate's `input0` index, one per gate, in topologically sorted order  
3- gate's `input1` index (ignored for the 1-input `IV` gate)  
4- gate's `type` (defined in [util/common.h](../util/common.h))  
5- `outputs` index — the wire index driving each bit of `o`  
6- Flip-Flop's `D` (data wire index)  
7- Flip-Flop's `I` (initial value): an index into the `*_init` wires, or
	`CONST_ZERO`/`CONST_ONE` for a hard-wired initial value.  

Lines 2-4 have `gate_size` entries, line 5 has `output_size` entries, and lines
6-7 have `dff_size` entries each. Gates are stored topologically sorted, so a
gate only ever references wires produced earlier.

## References
- Mihir Bellare, Viet Tung Hoang, Sriram Keelveedhi, and Phillip Rogaway.
Efficient garbling from a fixed-key blockcipher. In <i>S&P</i>, pages 478–492.
IEEE, 2013. 
- Ebrahim M. Songhori, Siam U. Hussain, Ahmad-Reza Sadeghi, Thomas Schneider
and Farinaz Koushanfar, ["TinyGarble: Highly Compressed and Scalable Sequential
Garbled Circuits."](http://esonghori.github.io/file/TinyGarble.pdf) <i>Security
and Privacy, 2015 IEEE Symposium on</i> May, 2015.

