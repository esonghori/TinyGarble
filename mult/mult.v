`timescale 1ns / 1ps

module mult
#(
	parameter N=128
)
( 
	a,
	b,
	c
);
	input  [N-1:0] a;
	input  [N-1:0] b;
	output [2*N-1:0] c;
		
	assign c = a*b;

endmodule

