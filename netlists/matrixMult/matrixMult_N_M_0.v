`timescale 1ns / 1ps
// synopsys template
module matrixMult_N_M_0
#(
	parameter N=3,
	parameter M=32
)
(
	clk,
	rst,
	x,
	y,
	o
);
	input clk,rst;
	input[M*N*N-1:0] x;
	input[M*N*N-1:0] y;
	output[M*N*N-1:0] o;

	wire [M-1:0] xij[N-1:0][N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	wire  [M-1:0] oij[N-1:0][N-1:0];
	wire  [M-1:0] oijt[N-1:0][N-1:0][N-1:0];


	genvar i;
	genvar j;
	genvar k;
	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		for (j=0;j<N;j=j+1)
		begin:ASS_COL
			assign xij[i][j] = x[M*(N*i+j+1)-1:M*(N*i+j)];
			assign yij[i][j] = y[M*(N*i+j+1)-1:M*(N*i+j)];
			assign o[M*(N*i+j+1)-1:M*(N*i+j)] = oij[i][j];
			assign oijt[i][j][0] = xij[i][0]*yij[0][j];
			assign oij[i][j] = oijt[i][j][N-1];
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW
		for (j=0;j<N;j=j+1)
		begin:MUL_COL
			for (k=1;k<N;k=k+1)
			begin:ADD_O
				ADD 
				#(
					.N(M)
				)
				ADD_
				(
					.a(xij[i][k]*yij[k][j]),
					.b(oijt[i][j][k-1]),
					.ci(1'b0),
					.s(oijt[i][j][k]),
					.co()
				);	
			end
		end
	end
	endgenerate
	
	
endmodule
