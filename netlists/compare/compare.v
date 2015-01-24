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
	g
);
	localparam M = N/CC; 

	input clk;
	input rst;
	input[M-1:0] x;
	input[M-1:0] y;
	output g;

	reg ci;
	wire co;
	
	ADD 
	#(
		.N(M)
	) 
	UCOMP 
	(
		.A(x), 
		.B(~y), 
		.CI(ci),
		.S(),
		.CO(co)
	);

	assign g = co;
	
	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				ci <= 1'b1;
			end
			else
			begin
				ci <= co;	
			end
		end
	else
		always@(*)
		begin
			ci <= 1'b1;
		end
	endgenerate

endmodule

