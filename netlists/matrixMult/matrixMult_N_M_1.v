`timescale 1ns / 1ps
// synopsys template
module matrixMult_N1
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
	input[N*M-1:0] x;
	input[N*N*M-1:0] y;
	output[N*M-1:0] o;

	wire [M-1:0] xi[N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	reg [M-1:0] oi[N-1:0];


	genvar i;
	genvar j;
	integer k;

	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		assign xi[i] = x[M*(i)-1:M*(i)];
		assign o[M*(i)-1:M*(i)] = oi[i];
		for (j=0;j<N;j=j+1)
		begin:ASS_COL
			assign yij[i][j] = y[M*(N*i+j+1)-1:M*(N*i+j)];
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:MUL_ROW
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				oi[i] <= 'b0;
			end
			else
			begin
				for(k=0;k<N;k=k+1)
				begin
					oi[i] <= oi[i] + xi[k] * yij[k][i];
				end
			end
		end
	end
	endgenerate

endmodule
