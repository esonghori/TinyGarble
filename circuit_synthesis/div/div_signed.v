`timescale 1ns / 1ps

// Signed (two's complement) integer division: o = g_input / e_input, with the
// quotient truncated toward zero.
//
// Instantiates syn_lib/DIV_.v, which sign-corrects the operands, divides, then
// sign-corrects the quotient. Synthesizable with Yosys, unlike div.v.
//
// Note the operands are interpreted as signed, so with N=8 an input of 0x82 is
// -126 and not 130: 0x82 / 0x05 gives 0xE7 (-25), not 0x1A (26). Use
// div_unsigned.v if the inputs are unsigned.

module div_signed
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

	DIV_
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
