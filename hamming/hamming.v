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


	reg[N-1:0] xy;
	integer i, j;

	always@(*)
	begin
		o = 0;
		xy = x^y;
		for(j=0;j<N/1024;j=j+1)
			for(i=0;i<1024;i=i+1)
			begin
				if(xy[j*1024+i])
					o = o + 1;
			end
		for(i=N-N%1024;i<N;i=i+1)
		begin
			if(xy[i])
           			o = o + 1;
		end
	end

endmodule

