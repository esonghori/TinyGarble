`timescale 1ns / 1ps

module sum
#(
	parameter N=1024
)
( 
	a,
	b,
	c
);
	input  [N-1:0] a;
	input  [N-1:0] b;
	output [N:0] c;

	assign c = a + b;

endmodule

