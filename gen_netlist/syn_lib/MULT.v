`timescale 1ns / 1ps

module MULT #(parameter N = 8, M = N)
( 
	input  [N-1:0] A,
	input  [M-1:0] B,
	output [N+M-1:0] O
);	

	wire [N+M-1:0] w[N-1:0];
	wire [N+M-1:0] AA[N-1:0];
	wire [N+M-1:0] B_;

	
	assign w[0] = (A[0])?B_:0;
	assign B_ = {{N{1'b0}}, B};
	assign O = w[N-1];
	
	genvar g;
	
	generate
	for(g=1;g<N;g=g+1)
	begin:MULT_UNIT
			MUX #(.N(N+M)) MUX(
				.A({(N+M){1'b0}}),
				.B({B_[N+M-1-g:0], {g{1'b0}}}),
				.S(A[g]),
				.O(AA[g])
			);
			ADD #(.N(N+M)) ADD_(
				.A(AA[g]),
				.B(w[g-1]), 
				.CI(1'b0), 
				.S(w[g]), 
				.CO()
			);
	end
	endgenerate
	
endmodule


