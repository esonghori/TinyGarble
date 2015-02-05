`include "../defined.vh"

module Shifter
(
	value,
	shift_amount,
	shift_func,
	c_shift
);
		
	input [31:0] value;
	input [4:0]  shift_amount;
	input   [1:0]  shift_func;
	output reg [31:0] c_shift;

	wire signed[31:0] value_s;
	
	assign value_s=value;

	always@(*)
	begin
		c_shift<=0;
		case(shift_func)
		`SHIFT_NOTHING:
			c_shift<=0;
		`SHIFT_LEFT_UNSIGNED:
			c_shift<=value<<shift_amount;
		`SHIFT_RIGHT_SIGNED:
			c_shift<=value_s>>>shift_amount;
		`SHIFT_RIGHT_UNSIGNED:
			c_shift<=value>>shift_amount;
		endcase
	end
endmodule

