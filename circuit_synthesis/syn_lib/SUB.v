`timescale 1ns / 1ps

module SUB #( parameter N = 8, M = N)( // N >= M
	input [N-1:0] A,
	input [M-1:0] B,
	output CO,
	output [N-1:0] S
);

	wire [N-1:0] BB;
	assign BB = {{(N-M){1'b0}}, B};

	wire C[N:0];

	assign C[0] = 1'b1;
	assign CO = C[N];
	
	genvar g,h;
	
	localparam MAX_LOOP = 512;
	
	generate
	if(N < MAX_LOOP) begin: IF1
		for(g=0;g<N;g=g+1)
		begin:FAINST
			FA FA_ (
				.A(A[g]), 
				.B(~BB[g]), 
				.CI(C[g]), 
				.S(S[g]), 
				.CO(C[g+1])
			);
		end
	end	else begin: IF1_N
		for(h=0;h<N/MAX_LOOP;h=h+1)
		begin:FA_INST_0
			for(g=0;g<MAX_LOOP;g=g+1)
			begin:FA_INST_1
				FA FA_ (
					.A(A[h*MAX_LOOP + g]), 
					.B(~BB[h*MAX_LOOP + g]), 
					.CI(C[h*MAX_LOOP + g]), 
					.S(S[h*MAX_LOOP + g]), 
					.CO(C[h*MAX_LOOP + g +1])
				);
			end
		end
		for(g=(N/MAX_LOOP)*MAX_LOOP;g <N;g=g+1)
		begin:FA_INST_1
			FA FA_ (
				.A(A[g]), 
				.B(~BB[g]), 
				.CI(C[g]), 
				.S(S[g]), 
				.CO(C[g+1])
			);
		end
	end
	endgenerate
endmodule

