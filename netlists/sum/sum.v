`timescale 1ns / 1ps

module sum
#(
	parameter N=1024
	parameter CC=1
)
( 
	clk,
	rst
	a,
	b,
	c
);
	input  [N/CC-1:0] a;
	input  [N/CC-1:0] b;
	output [N/CC-1:0] c;

	reg [1:0] carry_on; 

	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
				carry_on <= 0;
			else
			begin
				{carry_on, c} = a + b + carry_on;
			end
		end
	else
		assign c = a + b;
	endgenerate
endmodule

