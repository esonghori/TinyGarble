`timescale 1ns / 1ps

module alu
#(
	parameter N=8 //bits
)
(
	x,
	y,
	c,
	o
);
	input[N-1:0] x;
	input[N-1:0] y;
	input[2:0] c;
	output reg[2*N-1:0] o;


	always@(*)
	begin
		case(c)
		'h00://add
			o = x + y;		
		'h01://dec
			o = x - y;
		'h02://inc
			o = x - 1;
		'h03://dec
			o = x + 1;
		'h04://mult
			o = x * y;
		'h05://dev
			o = x / y;
		default:
			o = 'h0;
		endcase
	end

endmodule
