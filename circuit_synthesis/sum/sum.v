`timescale 1ns / 1ps
// synopsys_ template
module sum
#(
	parameter N=8,
	parameter CC=1
)
( 
	clk,
	rst,
	g_input,
	e_input,
	o
);
	input clk, rst;
	input  [N/CC-1:0] g_input;
	input  [N/CC-1:0] e_input;
	output [N/CC-1:0] o;
	

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
		//assign {carry_on_d, o} = g_input + e_input + carry_on;
		ADD 
		#(
			.N(N/CC)
		)
		ADD_
		(
			.A(g_input),
			.B(e_input),
			.CI(carry_on),
			.S(o),
			.CO(carry_on_d)
		);
	end
	else
	begin
		//assign o = g_input + e_input;
		ADD 
		#(
			.N(N/CC)
		)
		ADD_
		(
			.A(g_input),
			.B(e_input),
			.CI(1'b0),
			.S(o),
			.CO()
		);
	end
	endgenerate
endmodule

