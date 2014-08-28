`timescale 1ns / 1ps

module mult
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
	output [2*N-1:0] z;
		
	assign z = a*b;

endmodule

