`timescale 1ns / 1ps

module hamming
#(
	parameter N=1600
)
(
	x,
	y,
	o
);
	input[N-1:0] x;
	input[N-1:0] y;
	output reg[log2(N)-1:0] o;


	function integer log2;
		input [31:0] value;
		for (log2=0; value>0; log2=log2+1)
			value = value>>1;
	endfunction


	wire[N-1:0] xy;
	integer i, j;
	

	assign xy = x^y;


	generate if (N <= 1024) 
		always@(*)
		begin
			for(i=0;i<N;i=i+1)
			begin
		 		o = o + xy[i];
			end
		end
	else if(N%1024 == 0)
		always@(*)
		begin
			for(i=0;i<N/1024;i=i+1)
				for(j=0;j<1024;j = j + 1)
				begin
			 		o = o + xy[1024*i+j];
				end
		end
	else
		always@(*)
		begin
			for(i=0;i<N/1024;i=i+1)
				for(j=0;j<1024;j = j + 1)
				begin
			 		o = o + xy[1024*i+j];
				end
			for(i=N-N%1024;i<N;i = i + 1)
			begin
			 		o = o + xy[i];
			end
		end
	endgenerate

endmodule
