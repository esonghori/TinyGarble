`timescale 1ns / 1ps

module mult
#(
	parameter N=128,
	parameter CC=1
)
( 
	clk,
	rst,
	a,
	b,
	c
);
	input  clk;
	input  rst;
	input  [N-1:0] a;
	input  [N/CC-1:0] b;
	output [2*N-1:0] c;
	
	reg [2*N-1:0] sreg;
	wire [2*N-1:0] swire;

	wire [N+N/CC-1:0] clocal;

	assign clocal = a*b;



	generate
	if(CC>1)
		assign swire  = sreg + {clocal,{(N-N/CC){1'b0}}};
	endgenerate

	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				sreg <= 'b0;
			end
			else
			begin
				sreg <= {{N/CC{1'b0}},swire[2*N-1:N/CC]};     
			end
		end
	endgenerate

	generate 
	if(CC>1)
		assign c = swire;
	else
		assign c = clocal;
	endgenerate
endmodule