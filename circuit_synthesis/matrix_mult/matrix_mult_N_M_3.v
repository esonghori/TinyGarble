`timescale 1ns / 1ps
// synopsys template
module matrix_mult_N_M_3
#(
	parameter N=3,
	parameter M=32
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	input clk,rst;
	input[M-1:0] g_input;
	input[M-1:0] e_input;
	output[M-1:0] o;

	wire [2*M-1:0] xy;
	reg [M-1:0] o_reg;

	assign xy = g_input*e_input;
	assign o = xy[M-1:0] + o_reg;

	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			o_reg <= 'b0;
		end
		else
		begin
			o_reg <= o;
		end
	end
endmodule
