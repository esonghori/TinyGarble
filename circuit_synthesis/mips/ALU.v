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
	

	wire [31:0] b_b_not;
	wire [31:0] adder_out;
	wire cout;
	reg cin;

	assign b_b_not = (cin)?~b_in:b_in;

	ADD 
	#(
		.N(32)
	)
	ADD_
	(
		.A(a_in),
		.B(b_b_not),
		.CI(cin),
		.S(adder_out),
		.CO(cout)
	);

	
	always@(*)
	begin
		c_alu<=32'b0;
		cin <= 0;
		case(alu_function)
		`ALU_NOTHING:
			c_alu<=32'b0;
		`ALU_ADD:
		begin
			cin <= 0;
			c_alu<=adder_out;//a_in+b_in;
		end
		`ALU_SUBTRACT:
		begin
			cin <= 1;
			c_alu<=adder_out;//a_in-b_in;
		end
		`ALU_LESS_THAN://TODO:check
		begin
			cin <= 1;
			c_alu<={31'b0, ~cout};//(a_in<b_in)?1:32'b0;
		end
		`ALU_LESS_THAN_SIGNED://TODO:check
		begin
			cin <= 1;
			c_alu<={31'b0, (a_in[31]&~b_in[31] | adder_out[31]&(~a_in[31]^b_in[31]))};//(a_in_s<b_in_s)?1:32'b0;
		end
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
