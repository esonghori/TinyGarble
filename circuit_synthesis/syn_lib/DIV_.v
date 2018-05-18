`timescale 1ns / 1ps

module DIV_ #( parameter N = 8, M = N )( 
	input  [N-1:0] A,
	input  [M-1:0] B,
	output [N-1:0] O
);

	wire  [N-1:0] A_, A__;
	wire  [M-1:0] B_, B__;
	wire	[N-1:0] O_, O__;
	
	TwosComplement #(.N(N)) TwosComplement_A( 
		.A(A),
		.O(A_)
    );
	 
	 MUX #(.N(N)) MUX_A(
		.A(A),
		.B(A_),
		.S(A[N-1]),
		.O(A__)
	);
	
	TwosComplement #(.N(M)) TwosComplement_B( 
		.A(B),
		.O(B_)
    );
	 
	 MUX #(.N(M)) MUX_B(
		.A(B),
		.B(B_),
		.S(B[M-1]),
		.O(B__)
	);
	
	DIV #(.N(N), .M(M)) DIV ( 
		.A(A__),
		.B(B__),
		.O(O_)
	);
	
	TwosComplement #(.N(N)) TwosComplement_O( 
		.A(O_),
		.O(O__)
    );
	 
	 MUX #(.N(N)) MUX_O(
		.A(O_),
		.B(O__),
		.S(A[N-1]^B[M-1]),
		.O(O)
	);

endmodule
