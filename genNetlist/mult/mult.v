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
	output [N-1:0] c;
	
	reg [2*N-1:0] sreg;
	wire [N-1:0] swire;
	wire [N-1:0] clocal;


	wire  [N-1:0] bexp;


	generate
	if(CC>1)
	begin
		assign c = {swire[N/CC-1:0], sreg[N-1:N/CC]};
		assign bexp = {{(N-N/CC){1'b0}},b};
		//assign swire  = sreg + {clocal,{(N-N/CC){1'b0}}};
	end
	else
	begin
		assign c = clocal;
		assign bexp = b;
	end		
	endgenerate


	assign clocal = a*bexp;
	/*MULT 
	#(
		.N(N)
	)
	MULT_
	(
		.A(a),
		.B(bexp),
		.O(clocal)
	);*/	
	
	generate
	if(CC>1)
	begin
		ADD 
		#(
			.N(N)
		)
		ADD_
		(
			.A(sreg[2*N-1:N]),
			.B(clocal),
			.CI(1'b0),
			.S(swire),
			.CO()
		);	
	end
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
				sreg <= {{(N/CC){1'b0}}, swire[N-1:0], sreg[N-1:N/CC]};     
			end
		end
	endgenerate


endmodule

