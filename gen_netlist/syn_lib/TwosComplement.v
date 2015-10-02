`timescale 1ns / 1ps

module TwosComplement #(parameter N = 8)(
	input [N-1:0] A,
	output [N-1:0] O
);

	ADD #(.N(N)) ADD(
		.A(~A),
		.B({N{1'b0}}),
		.CI(1'b1),
		.S(O), 
		.CO()
	);


endmodule
