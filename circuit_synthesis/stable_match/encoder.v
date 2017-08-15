module encoder
#(
	parameter logS=4
)
(
	in,
	out
);
	
	localparam S = 2**logS;
	input [S-1:0] in;
	output [logS-1:0] out;
	
	wire [logS-1:0] out0;
	wire [logS-1:0] out1;
	
	generate 
		if(logS == 1)
		begin
			assign out = in[1];
		end
		else
		begin
			encoder 
			#(
				.logS(logS-1)
			)
			encoder0
			(
				.in(in[S/2-1:0]),
				.out(out0[logS-2:0])
			);
			
			encoder 
			#(
				.logS(logS-1)
			)
			encoder1
			(
				.in(in[S-1:S/2]),
				.out(out1[logS-2:0])
			);
			
			assign out = {|in[S-1:S/2], out0[logS-2:0]|out1[logS-2:0]};
		end
	endgenerate

endmodule
