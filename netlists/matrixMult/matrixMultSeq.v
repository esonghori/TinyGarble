`timescale 1ns / 1ps

module matrixMultSeq
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

	function integer log2;
		input [31:0] value;
		for (log2=0; value>0; log2=log2+1)
			value = value>>1;
	endfunction

	input[M*N*N-1:0] x;
	input[M*N*N-1:0] y;
	output[M*N*N-1:0] o;

	wire [M-1:0] xij[N-1:0][N-1:0];
	wire [M-1:0] yij[N-1:0][N-1:0];
	reg  [M-1:0] oij[N-1:0][N-1:0];

	reg[log2(N)-1:0] i;
	reg[log2(N)-1:0] j;
	reg[log2(N)-1:0] k;
	reg[M-1:0] sum;
	
	always@(posedge clk)
	begin
		oij <= 'b0;
		if(rst)
		begin
			i <= 'b0;
			j <= 'b0;
			k <= 'b0;
			sum <= 'b0;
		end
		else
		begin
			if(i<N)
			begin
				sum <= sum + xij[i][k] * yij[k][j]; 
				k <= k + 1;
				if(k==N-1)
				begin
					k <= 0;
					j <= j + 1;
					if(j==N-1)
					begin
						j <= 0;
						i <= i + 1;
					end
				end
			end
		end
	end
endmodule
