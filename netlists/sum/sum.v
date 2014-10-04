`timescale 1ns / 1ps
// synopsys template
module sum
#(
	parameter N=1024,
	parameter CC=1
)
( 
	clk,
	rst,
	a,
	b,
	c
);
	input clk, rst;
	input  [N/CC-1:0] a;
	input  [N/CC-1:0] b;
	output [N/CC-1:0] c;
	
	reg [N/CC-1:0] rc;
	reg carry_on; 

	assign c = rc;

	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
				carry_on <= 0;
			else
			begin
				{carry_on, rc} <= a + b + carry_on;
			end
		end
	else
		always@(*)
			rc <= a + b;
	endgenerate
endmodule

