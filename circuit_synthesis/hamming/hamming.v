`timescale 1ns / 1ps

module hamming
#(
	parameter N=8,
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
	output[log2(N)-1:0] o;

	function integer log2;
		input [31:0] value;
		reg [31:0] temp;
	begin
		temp = value;
		for (log2=0; temp>0; log2=log2+1)
			temp = temp>>1;
	end
	endfunction

	reg		[log2(N)-1:0] 	oglobal;
	wire 	[log2(M)-1:0] 	olocal;
	wire	[M-1:0] 		xy;
	

	assign xy = g_input^e_input;

	
	COUNT
	#(
		.N(M)
	)
	COUNT_
	(
		.A(xy),
		.S(olocal)
	);



	generate
	if(CC>1)
	begin
	    ADD
 		#(
 			.N(log2(N))
 		)
 		ADD_
 		(
 			.A(oglobal),
 			.B({{(log2(N) - log2(M)){1'b0}}, olocal}),
 			.CI(1'b0),
 			.S(o),
 			.CO()
 		);

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
	end
	else
	begin
	  	assign o = olocal;
		always@(*)
		begin
			oglobal <= 'b0;
		end
	end
	endgenerate

	

endmodule


