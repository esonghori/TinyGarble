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



	localparam K  = log2(N);
	localparam K2 = log2(N - 2**(K-1));

	input	[N-1:0] 	A;
	output	[K-1:0] 	S;

	wire 	[K-2:0] 	S1;
	wire 	[K-2:0] 	S2pad;
	wire 	[K2-1:0] 	S2;

	generate
		if(K2==0) begin: g1
			assign S2pad = {(K-1){1'b0}};
		end else if (K-K2-1>0) begin: g2
			assign S2pad = {{(K-K2-1){1'b0}}, S2};
		end else begin: g3
			assign S2pad = S2;
		end
	endgenerate


  generate 
  if(N==1) begin: g4
  	assign S=A[0];
  end else if(N==2) begin: g5
		ADD
		#(
			.N(1)
		)
		ADD_3
		(
			.A(A[1]),
			.B({1'b0}),
			.CI(A[0]),
			.S(S[0]),
			.CO(S[1])
		);
	end else if(N==3) begin: g6
		ADD
		#(
			.N(1)
		)
		ADD_3
		(
			.A(A[1]),
			.B(A[2]),
			.CI(A[0]),
			.S(S[K-2:0]),
			.CO(S[K-1])
		);
  end else if (N>3) begin: g7
	  COUNT
		#(
			.N(2**(K-1)-1)
		)
		COUNT_1
		(
			.A(A[N-1:N-2**(K-1)+1]),
			.S(S1)
		);
		if(N-2**(K-1)>0) begin: g8
			COUNT
			#(
				.N(N-2**(K-1))
			)
			COUNT_2
			(
				.A(A[N-2**(K-1):1]),
				.S(S2)
			);
		end

		ADD
		#(
			.N(K-1)
		)
		ADD_
		(
			.A(S1),
			.B(S2pad),
			.CI(A[0]),
			.S(S[K-2:0]),
			.CO(S[K-1])
		);
    end
  endgenerate
endmodule
