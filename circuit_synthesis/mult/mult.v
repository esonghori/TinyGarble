`timescale 1ns / 1ps
// synopsys template

module MULT
#(
	parameter N=8
)
( 
	A,
	B,
	O
);
	input  [N-1:0] A;
	input  [N-1:0] B;
	output [N-1:0] O;
	

	wire [N-1:0] w[N-1:0];

	
	assign w[0] = (A[0])?B:0;
	assign O = w[N-1];
	
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
				.A(((A[g])?{B[N-1-g:0], {g{1'b0}}}:{N{1'b0}})),
				.B(w[g-1]), 
				.CI(1'b0), 
				.S(w[g]), 
				.CO()
			);
	end
	endgenerate
	
endmodule
