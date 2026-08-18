`timescale 1ns / 1ps

// Unsigned integer division: o = g_input / e_input.
//
// Unlike div.v, this instantiates the restoring divider from syn_lib/DIV.v
// rather than the Synopsys DesignWare DW_div macro, so it can be synthesized
// with Yosys as well as Design Compiler. Division by zero is not defined.

module div_unsigned
#(
	parameter N = 8
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	input clk, rst;
	input  [N-1:0] g_input;
	input  [N-1:0] e_input;
	output [N-1:0] o;

	DIV
	#(
		.N(N),
		.M(N)
	)
	u_DIV
	(
		.A(g_input),
		.B(e_input),
		.O(o)
	);

endmodule
