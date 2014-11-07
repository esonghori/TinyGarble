`timescale 1ns / 1ps
// synopsys template
module matrixMult_N_M_2
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
	input[N*M-1:0] y;
	output reg[M-1:0] o;

	wire [M-1:0] xi[N-1:0];
	wire [M-1:0] yi[N-1:0];


	genvar i;
	integer k;

	generate
	for (i=0;i<N;i=i+1)
	begin:ASS_ROW
		assign xi[i] = x[M*(i+1)-1:M*(i)];
		assign yi[i] = y[M*(i+1)-1:M*(i)];
	end
	endgenerate


	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			o <= 'b0;
		end
		else
		begin
			for(k=0;k<N;k=k+1)
			begin
				o <= o + xi[k] * yi[k];
			end
		end
	end
endmodule
