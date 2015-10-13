`timescale 1ns / 1ps
// synopsys template

module MULT
#(
	parameter N=8
)
( 
	g_input,
	e_input,
	o
);
	input  [N-1:0] g_input;
	input  [N-1:0] e_input;
	output [N-1:0] o;
	

	wire [N-1:0] w[N-1:0];

	
	assign w[0] = (g_input[0])?e_input:0;
	assign o = w[N-1];
	
	genvar g,h;
	
	generate
	for(g=1;g<N;g=g+1)
	begin:FAINST
			ADD 
			#(
				.N(N)
			) 
			ADD_
			(
				.g_input(((g_input[g])?{e_input[N-1-g:0], {g{1'b0}}}:{N{1'b0}})),
				.e_input(w[g-1]), 
				.CI(1'b0), 
				.S(w[g]), 
				.CO()
			);
	end
	endgenerate
	
endmodule
