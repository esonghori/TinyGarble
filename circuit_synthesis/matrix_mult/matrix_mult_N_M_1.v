`timescale 1ns / 1ps
// synopsys template
module matrix_mult_N_M_1
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
	input[N*M-1:0] g_input;
	input[N*N*M-1:0] e_input;
	output[N*M-1:0] o;

	wire [M-1:0] xi[N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	reg [M-1:0] oi[N-1:0];

	wire [2*M-1:0] xyij[N-1:0][N-1:0];

	wire [M-1:0] oij[N-1:0][N:0];

	genvar i;
	genvar j;
	genvar k;

	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		assign xi[i] = g_input[M*(i+1)-1:M*(i)];
		assign o[M*(i+1)-1:M*(i)] = oi[i];
		for (j=0;j<N;j=j+1)
		begin:ASS_COL
			assign yij[i][j] = e_input[M*(N*i+j+1)-1:M*(N*i+j)];
		end
	end
	endgenerate



	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW
		for (k=0;k<N;k=k+1)
		begin:MULT_O
			//assign xyij[i][k] = xi[k]*yij[k][i];
			MULT 
			#(
				.N(M)
			)
			MULT_
			(
				.A(xi[k]),
				.B(yij[k][i]),
				.O(xyij[i][k])
			);	
		end
	end
	endgenerate 

	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_O
		assign oij[i][0] = oi[i];
	end
	endgenerate 

	generate
	for (i=0;i<N;i=i+1)
	begin:ADD_ROW
		for (k=0;k<N;k=k+1)
		begin:ADD_O
			ADD 
			#(
				.N(M)
			)
			ADD_
			(
				.A(xyij[i][k][M-1:0]),
				.B(oij[i][k]),
				.CI(1'b0),
				.S(oij[i][k+1]),
				.CO()
			);	
		end
	end
	endgenerate 



	generate
	for (i=0;i<N;i=i+1)
	begin:REG_ROW
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				oi[i] <= 'b0;
			end
			else
			begin
				oi[i] <= oij[i][N];
			end
		end
	end
	endgenerate

endmodule
