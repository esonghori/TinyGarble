`timescale 1ns / 1ps

module FA( 
	input A, B, CI,
	output S, CO
);

	wire   n1, n2, n3;

	assign n1 = A^CI;
	assign n2 = B^CI;
	assign n3 = n1&n2;
	assign S  = n1^B;
	assign CO = n3^CI;

  
endmodule

