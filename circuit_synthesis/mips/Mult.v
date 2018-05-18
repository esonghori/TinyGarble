`include "../defined.vh"

module Mult 
(
	clk,
	rst,
	a,
	b,
	mult_func,
	c_mult
);
	input clk;
	input rst;
	input [31:0] a;
	input [31:0] b;
	input [3:0] mult_func;
	output reg [31:0] c_mult;
	
	reg[31:0] Hi,Lo;
	reg write_Lo,write_Hi;
	reg[2:0] comm;
	
	wire signed[31:0] a_s,b_s; 
	
	
	assign a_s=a;
	assign b_s=b;

	
	always@(*)
	begin
		c_mult<=0;
		write_Lo<=0;
		write_Hi<=0;
		comm<=0;
		case(mult_func)
		`MULT_NOTHING:
			c_mult<=0;
		`MULT_READ_LO:      
			c_mult<=Lo;
		`MULT_READ_HI:      
			c_mult<=Hi;
		`MULT_WRITE_LO:     
			write_Lo<=1;
		`MULT_WRITE_HI:     
			write_Hi<=1;
		`MULT_MULT:         
			comm<=1;
		`MULT_SIGNED_MULT:  
			comm<=2;
		`MULT_DIVIDE:       
			comm<=3;
		`MULT_SIGNED_DIVIDE:
			comm<=4;
		endcase
	end
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			Hi<=0;
			Lo<=0;
		end
		else if(comm==0)
		begin
			if(write_Lo)
				Lo<=a;
			if(write_Hi)
				Hi<=a;
		end
		else if(comm==1)//mult
			{Hi,Lo}<=a*b;
		else if(comm==2)//mult_signed
			{Hi,Lo}<=a_s*b_s;
		else if(comm==3)//div
		begin
			if(b!=32'b0)
			begin
				Lo<=32'b0;//FIXME: DIV is removed a/b;
				Hi<=32'b0;//FIXME: DIV is removed a%b;
			end
		end
		else if(comm==4)//div_signed
		begin
			if(b_s!=32'b0)
			begin
				Lo<=32'b0;//FIXME: DIV is removed a_s/b_s;
				Hi<=32'b0;//FIXME: DIV is removed a_s%b_s;
			end
		end
	end
endmodule
