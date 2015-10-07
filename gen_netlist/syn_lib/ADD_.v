`timescale 1ns / 1ps

module ADD_ #(parameter N = 8, M = N)( // N >= M
	input [N-1:0] A,
	input [M-1:0] B,
	output [N:0] O
    );
	 
	 wire [N-1:0] BB;
	 wire CO;
	 
	 generate
		if (N > M)
			assign BB = {{(N-M){B[M-1]}}, B};
		else
			assign BB = B;
	 endgenerate
	 
	 MUX #(.N(1)) MUX(
		.A(CO),
		.B(O[N-1]),
		.S(A[N-1]^B[M-1]),
		.O(O[N])
	);
		 
	 
	ADD #(.N(N)) ADD(
		.A(A),
		.B(BB),
		.CI(1'b0),
		.S(O[N-1:0]), 
		.CO(CO)
);

endmodule

