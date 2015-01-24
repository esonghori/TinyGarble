`timescale 1ns / 1ps
// synopsys template

module FA
( 
	A, 
	B, 
	CI, 
	S, 
	CO 
);

	input A, B, CI;
	output S, CO;

	wire   n1, n2, n3;


	assign n1 = A^CI;
	assign n2 = B^CI;
	assign n3 = n1&n2;
	assign S  = n1^B;
	assign CO = n3^CI;
	
/*
	XOR U1 ( .A(A), .B(CI), .Y(n1) );
	XOR U2 ( .A(B), .B(CI), .Y(n2) );
	AND U3 ( .A(n1), .B(n2), .Y(n3) );
	XOR U4 ( .A(n1), .B(B), .Y(S) );
	XOR U5 ( .A(n3), .B(CI), .Y(CO) );
*/
  
endmodule

