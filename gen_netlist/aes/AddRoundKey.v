module AddRoundKey(
x,
y,
z);

	input [127:0] x;
	input [127:0] y;
	output [127:0] z;

	assign z = x ^ y;
	
endmodule

