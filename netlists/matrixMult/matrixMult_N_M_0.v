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
	reg  [M-1:0] oij[N-1:0][N-1:0];

	genvar i;
	genvar j;
	integer k;
	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		for (j=0;j<N;j=j+1)
		begin:ASS_COL
			assign xij[i][j] = x[M*(N*i+j+1)-1:M*(N*i+j)];
			assign yij[i][j] = y[M*(N*i+j+1)-1:M*(N*i+j)];
			assign o[M*(N*i+j+1)-1:M*(N*i+j)] = oij[i][j];
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW
		for (j=0;j<N;j=j+1)
		begin:MUL_COL
			always@(*)
			begin
				oij[i][j] = xij[i][j]&yij[i][j];
				oij[i][j] = 0;
				for (k=0;k<N;k=k+1)
				begin
					oij[i][j] = oij[i][j] + xij[i][k]*yij[k][j];
				end			
			end
		end
	end
	endgenerate

endmodule
