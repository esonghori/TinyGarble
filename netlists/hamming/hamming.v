`timescale 1ns / 1ps

module hamming
#(
	parameter N=1600,
	parameter CC=1
)
(
	clk,
	rst,
	x,
	y,
	o
);
	parameter M = N/CC; 

	input clk;
	input rst;
	input[M-1:0] x;
	input[M-1:0] y;
	output[log2(N)-1:0] o;

	function integer log2;
		input [31:0] value;
		for (log2=0; value>0; log2=log2+1)
			value = value>>1;
	endfunction


	reg[log2(N)-1:0] oglobal;
	reg[log2(M)-1:0] olocal;
	wire[M-1:0] xy;
	integer i, j;
	

	assign xy = x^y;



	generate
	if (M <= 1024) 
		always@(*)
		begin
			olocal = 'b0;
			for(i=0;i<M;i=i+1)
			begin
		 		olocal = olocal + xy[i];
			end
		end
	else if(M%1024 == 0)
		always@(*)
		begin
			olocal = 'b0;
			for(i=0;i<M/1024;i=i+1)
				for(j=0;j<1024;j = j + 1)
				begin
			 		olocal = olocal + xy[1024*i+j];
				end
		end
	else
		always@(*)
		begin
			olocal = 'b0;
			for(i=0;i<M/1024;i=i+1)
				for(j=0;j<1024;j = j + 1)
				begin
			 		olocal = olocal + xy[1024*i+j];
				end
			for(i=M-M%1024;i<M;i = i + 1)
			begin
			 		olocal = olocal + xy[i];
			end
		end
	endgenerate


	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				oglobal <= 0;
			end
			else
			begin
				oglobal <= o;
			end
		end
	else
		always@(*)
		begin
			oglobal <= 'b0;
		end
	endgenerate

	assign o = oglobal + olocal;

endmodule
