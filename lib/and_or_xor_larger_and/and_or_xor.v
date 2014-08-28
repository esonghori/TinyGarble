module AND(A, B , Z);
	input A, B;
	output Z;
	
	assign Z = A&B;

endmodule 
module OR(A, B , Z);
	input A, B;
	output Z;
	
	assign Z = A|B;

endmodule 
module IV(A, Z);
	input A;
	output Z;
	
	assign Z = ~A;

endmodule 
module XOR(A, B , Z);
	input A, B;
	output Z;
	
	assign Z = A^B;

endmodule 