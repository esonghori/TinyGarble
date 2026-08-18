`timescale 1ns / 1ps

// Multidimensional inputs and outputs with flat ports.
//
// TinyGarble's netlist parser requires the ports to be named g_input, e_input
// and o, and to be one-dimensional: a synthesized port bit is matched as
// g_input[k], so a 2-D port such as g_input[1][3] is rejected. This is a
// property of the .scd format, which is a flat vector of wires.
//
// That restriction applies only to the module's ports, not to the module. This
// example keeps the ports flat and unpacks them into 2-D arrays on the first
// line of the body, so all the logic is written against the arrays. Synthesis
// flattens it back out, so the unpacking costs no gates.
//
// Here each party supplies ROWS x COLS values of WIDTH bits, and the output is
// the elementwise sum, again ROWS x COLS values of WIDTH bits.

module multidim
#(
	parameter ROWS  = 2,
	parameter COLS  = 2,
	parameter WIDTH = 4
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	localparam CELLS = ROWS * COLS;

	input clk, rst;
	input  [CELLS*WIDTH-1:0] g_input;
	input  [CELLS*WIDTH-1:0] e_input;
	output [CELLS*WIDTH-1:0] o;

	// The 2-D views. Verilog lets a packed array be indexed as [row][col] once
	// it is declared this way; the ports above stay flat.
	wire [WIDTH-1:0] g [ROWS-1:0][COLS-1:0];
	wire [WIDTH-1:0] e [ROWS-1:0][COLS-1:0];
	wire [WIDTH-1:0] result [ROWS-1:0][COLS-1:0];

	genvar r, c;

	// Unpack the flat ports into the arrays, row-major, cell 0 in the low bits.
	generate
	for (r = 0; r < ROWS; r = r + 1) begin: UNPACK_ROW
		for (c = 0; c < COLS; c = c + 1) begin: UNPACK_COL
			localparam integer BASE = (r * COLS + c) * WIDTH;

			assign g[r][c] = g_input[BASE +: WIDTH];
			assign e[r][c] = e_input[BASE +: WIDTH];

			// The actual computation, written against the 2-D arrays.
			ADD
			#(
				.N(WIDTH)
			)
			u_ADD
			(
				.A(g[r][c]),
				.B(e[r][c]),
				.CI(1'b0),
				.S(result[r][c]),
				.CO()
			);

			// Pack the result back into the flat output port.
			assign o[BASE +: WIDTH] = result[r][c];
		end
	end
	endgenerate

endmodule
