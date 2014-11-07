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
	

	reg carry_on; 
	wire carry_on_d;


	generate
	if(CC>1)
	begin
		always@(posedge clk or posedge rst)
		begin
			if(rst)
				carry_on <= 0;
			else
				carry_on <= carry_on_d;
		end
	end
	endgenerate

	generate
	if(CC>1)
	begin
		assign {carry_on_d, c} = a + b + carry_on;
	end
	else
	begin
		assign c = a + b;
	end
	endgenerate
endmodule

