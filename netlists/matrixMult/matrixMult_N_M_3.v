`timescale 1ns / 1ps
// synopsys template
module matrixMult_N_M_3
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

	wire [M-1:0] xy;
	wire [M-1:0] oi;
	
	//assign xy = x*y;
	MULT 
	#(
		.N(M)
	) 
	MULT_ 
	(
		.A(x), 
		.B(y), 
		.O(xy)
	);
	
	
	ADD 
	#(
		.N(M)
	) 
	ADD_ 
	(
		.A(xy), 
		.B(o), 
		.CI(1'b0), 
		.S(oi), 
		.CO()
	);

	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			o <= 'b0;
		end
		else
		begin
			o <= oi;
		end
	end
endmodule
