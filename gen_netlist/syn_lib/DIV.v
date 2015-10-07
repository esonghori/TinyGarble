`timescale 1ns / 1ps

module DIV #( parameter N = 8, M = N )( 
	input  [N-1:0] A,
	input  [M-1:0] B,
	output [N-1:0] O
);

	wire	[N+M-1:0] A_[N:0];
	wire	[N+M-1:0] D[N-1:0];
	
	assign	A_[N] = {{M{1'b0}}, A};
	
	genvar g;
	
	generate
	for(g = N-1; g >= 0;g = g - 1)
	begin:DIV_UNIT
		if (g > 0)
		ADD #(.N(N+M)) SUB(
			.A(A_[g+1]),
			.B({{(N-g){1'b1}}, ~B, {g{1'b1}}}),
			.CI(1'b1),
			.S(D[g]), 
			.CO(O[g])
		);
		else 
		ADD #(.N(N+M)) SUB(
			.A(A_[g+1]),
			.B({{(N-g){1'b1}}, ~B}),
			.CI(1'b1),
			.S(D[g]), 
			.CO(O[g])
		);
		MUX #(.N(N+M)) MUX(
			.A(A_[g+1]),
			.B(D[g]),
			.S(O[g]),
			.O(A_[g])
		);
	end
	endgenerate

endmodule
