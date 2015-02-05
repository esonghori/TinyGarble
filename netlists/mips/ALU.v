`include "../defined.vh"

module  ALU
( 
	a_in ,
	b_in ,
	alu_function ,
	c_alu 
);
	input [31:0]a_in;
	input [31:0]b_in;
	input [3:0]alu_function;
	output reg [31:0]c_alu;
	

	
	wire signed [31:0]a_in_s, b_in_s;
	
	assign a_in_s=a_in;
	assign b_in_s=b_in;
	
	always@(*)
	begin
		c_alu<=32'b0;
		case(alu_function)
		`ALU_NOTHING:
			c_alu<=32'b0;
		`ALU_ADD:
			c_alu<=a_in+b_in;
		`ALU_SUBTRACT:
			c_alu<=a_in-b_in;
		`ALU_LESS_THAN:
			c_alu<=(a_in<b_in)?1:32'b0;
		`ALU_LESS_THAN_SIGNED:
			c_alu<=(a_in_s<b_in_s)?1:32'b0;
		`ALU_OR:
			c_alu<=a_in|b_in;
		`ALU_AND:
			c_alu<=a_in&b_in;
		`ALU_XOR:      
			c_alu<=a_in^b_in;
		`ALU_NOR:
			c_alu<=~(a_in|b_in);
		default:
			c_alu<=32'b0;
		endcase
	end
   
   
endmodule
