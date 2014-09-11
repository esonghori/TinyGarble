`timescale 1ns / 1ps

module matrixMultSeq
#(
	parameter N=3,
	parameter M=32
)
(
	clk,
	x,
	y,
	o
);

	function integer log2;
		input [31:0] value;
		for (log2=0; value>0; log2=log2+1)
			value = value>>1;
	endfunction

	input clk;
	input[M*N*N-1:0] x;
	input[M*N*N-1:0] y;
	output[M*N*N-1:0] o;

	wire [M-1:0] xij[N-1:0][N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	reg  [M-1:0] oij[N-1:0][N-1:0];


	genvar gi;
	genvar gj;
	generate
	for (gi=0;gi<N;gi=gi+1)
	begin:ASS_ROW
		for (gj=0;gj<N;gj=gj+1)
		begin:ASS_COL
			assign xij[gi][gj] = x[M*(N*gi+gj+1)-1:M*(N*gi+gj)];
			assign yij[gi][gj] = y[M*(N*gi+gj+1)-1:M*(N*gi+gj)];
			assign o[M*(N*gi+gj+1)-1:M*(N*gi+gj)] = oij[gi][gj];
		end
	end
	endgenerate


	reg[log2(N)-1:0] i;
	reg[log2(N)-1:0] j;
	reg[log2(N)-1:0] k;
	reg[M-1:0] sum;
	
	
`ifndef SYNTHESIS
	integer ii,jj;
	initial
	begin
		i = 'b0;
		j = 'b0;
		k = 'b0;
		sum = 'b0; 
		for(ii=0;ii<N;ii=ii+1) 
		begin
				for(jj=0;jj<N;jj=jj+1)
				begin
			      oij[ii][jj] = 'b0;
				end
		end
	end
`endif
	
	always@(posedge clk)
	begin
			if(i<N)
			begin
				sum <= sum + xij[i][k] * yij[k][j]; 
				k <= k + 1;
				if(k==N-1)
				begin
					k <= 0;
					oij[i][j] <= sum;
					j <= j + 1;
					if(j==N-1)
					begin
						j <= 0;
						i <= i + 1;
					end
				end
			end
	end
endmodule
