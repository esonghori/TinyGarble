`timescale 1ns / 1ps

module compare
#(
	parameter N=16384,
	parameter CC=1
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	localparam M = N/CC; 

	input clk;
	input rst;
	input[M-1:0] g_input;
	input[M-1:0] e_input;
	output o;

	reg ci;
	wire co;
	
	ADD 
	#(
		.N(M)
	) 
	UCOMP 
	(
		.A(g_input), 
		.B(~e_input), 
		.CI(ci),
		.S(),
		.CO(co)
	);

	assign o = co;
	
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

