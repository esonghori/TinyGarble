`timescale 1ns / 1ps

module compare
#(
	parameter N=16384,
	parameter CC=1
)
(
	clk,
	rst,
	x,
	y,
	g,
	e
);
	parameter M = N/CC; 

	input clk;
	input rst;
	input[M-1:0] x;
	input[M-1:0] y;
	output g;
	output e;


	reg greg;
	reg ebreg;


	assign g= greg;
	assign e= ~ebreg;

	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				greg <= 0;
				ebreg <= 0;
			end
			else
			begin
				if(!ebreg && x!=y)
				begin
					ebreg <= 1;
					greg <= (x>y)?1'b1:1'b0;
				end
			end
		end
	else
		always@(*)
		begin
			greg  <= (x>y) ?1'b1:1'b0;
			ebreg <= (x==y)?1'b0:1'b1;
		end
	endgenerate

endmodule
