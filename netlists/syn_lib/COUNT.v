`timescale 1ns / 1ps

module COUNT
#(
	parameter N=7
)
(
	A,
	S
);
	
	function integer log2;
		input [31:0] value;
		reg [31:0] temp;
	begin
		temp = value;
		for (log2=0; temp>0; log2=log2+1)
			temp = temp>>1;
	end
	endfunction



	localparam K = log2(N);

	input[N-1:0] A;
	output[K-1:0] S;

	wire [K-2:0] S1, S2;

    generate 
    if(N==7)
    begin
		ADD
		#(
			.N(1)
		)
		ADD_1
		(
			.A(A[2]),
			.B(A[3]),
			.CI(A[1]),
			.S(S1[0]),
			.CO(S1[1])
		);

		ADD
		#(
			.N(1)
		)
		ADD_2
		(
			.A(A[5]),
			.B(A[6]),
			.CI(A[4]),
			.S(S2[0]),
			.CO(S2[1])
		);

		ADD
		#(
			.N(2)
		)
		ADD_3
		(
			.A(S1),
			.B(S2),
			.CI(A[0]),
			.S(S[K-2:0]),
			.CO(S[K-1])
		);
      
      
    end
    else
    begin
	    COUNT
		#(
			.N(2**(K-1)-1)
		)
		COUNT_1
		(
			.A(A[(N-1)/2:1]),
			.S(S1)
		);

		COUNT
		#(
			.N(2**(K-1)-1)
		)
		COUNT_2
		(
			.A(A[N-1:(N-1)/2+1]),
			.S(S2)
		);

		ADD
		#(
			.N(K-1)
		)
		ADD_
		(
			.A(S1),
			.B(S2),
			.CI(A[0]),
			.S(S[K-2:0]),
			.CO(S[K-1])
		
		);
    end
    endgenerate
endmodule
