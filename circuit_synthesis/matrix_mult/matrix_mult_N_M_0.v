`timescale 1ns / 1ps
// synopsys template
module matrix_mult_N_M_0
#(
	parameter N=3,
	parameter M=32
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	input clk,rst;
	input[M*N*N-1:0] g_input;
	input[M*N*N-1:0] e_input;
	output[M*N*N-1:0] o;

	wire [M-1:0] xij[N-1:0][N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	wire  [M-1:0] oij[N-1:0][N-1:0];
	wire  [M-1:0] oijk[N-1:0][N-1:0][N-1:0];


	wire  [2*M-1:0] xyijk[N-1:0][N-1:0][N-1:0];

	genvar i;
	genvar j;
	genvar k;

	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		for (j=0;j<N;j=j+1)
		begin:ASS_COL
			assign xij[i][j] = g_input[M*(N*i+j+1)-1:M*(N*i+j)];
			assign yij[i][j] = e_input[M*(N*i+j+1)-1:M*(N*i+j)];
			assign o[M*(N*i+j+1)-1:M*(N*i+j)] = oij[i][j];
			assign oijk[i][j][0] = xyijk[i][j][0][M-1:0];
			assign oij[i][j] = oijk[i][j][N-1];
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW_MULT
		for (j=0;j<N;j=j+1)
		begin:MUL_COL_MULT
			for (k=0;k<N;k=k+1)
			begin:MULT_O
				assign xyijk[i][j][k] = xij[i][k]*yij[k][j];
			end
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW_ADD
		for (j=0;j<N;j=j+1)
		begin:MUL_COL_ADD
			for (k=1;k<N;k=k+1)
			begin:ADD_O
				assign oijk[i][j][k] = xyijk[i][j][k][M-1:0] + oijk[i][j][k-1];
			end
		end
	end
	endgenerate


endmodule
