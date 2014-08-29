`timescale 1ns / 1ps

module matrixMult
#(
	parameter N=3,
	parameter M=32
)
(
	x,
	y,
	o
);
	input[M*N*N-1:0] x;
	input[M*N*N-1:0] y;
	output[M*N*N-1:0] o;

	wire [M-1:0] xij[N-1:0][N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	reg [M-1:0] oij[N-1:0][N-1:0];

	genvar i;
	genvar j;
	integer k;
	generate
	for (i=0;i<N;i=i+1)
	begin
		for (j=0;j<N;j=j+1)
		begin
			assign xij[i][j] = x[M*(N*i+j+1)-1:M*(N*i+j)];
			assign yij[i][j] = y[M*(N*i+j+1)-1:M*(N*i+j)];
			assign oij[i][j] = o[M*(N*i+j+1)-1:M*(N*i+j)];
		end
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin
		for (j=0;j<N;j=j+1)
		begin
			always@(*)
			begin
				oij[i][j] = 0;
				for (k=0;k<N;k=k+1)
				begin
					oij[i][j] = oij[i][j] + x[i][k]*y[k][j];
				end			
			end
		end
	end
	endgenerate


endmodule
