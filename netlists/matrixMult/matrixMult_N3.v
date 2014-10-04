`timescale 1ns / 1ps

module matrixMult_N3
#(
	parameter N=3,
	parameter M=32
)
(
	clk,
	rst,
	x,
	y,
	o
);
	input clk,rst;
	input[M-1:0] x;
	input[M-1:0] y;
	output reg[M-1:0] o;

	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			o <= 'b0;
		end
		else
		begin
			o <= o + x*y;
		end
	end
endmodule
