`include "../defined.vh"


module Reg_Bank
(
	clk,
	rst,
	rs_index,
	rt_index,
	rd_index,
	reg_source_out,
	reg_target_out,
	reg_dest_new
);

	input			clk;
	input        	rst;
	input 	[4:0]	rs_index;
	input 	[4:0]	rt_index;
	input 	[4:0]	rd_index;
	output 	[31:0]	reg_source_out;
	output 	[31:0]	reg_target_out;
	input  	[31:0]	reg_dest_new;
	
	
	reg		[31:0]	registers[31:0];
		
	
	integer i;
	

	assign reg_source_out = registers[rs_index];
	assign reg_target_out = registers[rt_index];

	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(i=0;i<32;i=i+1)
			begin
				registers[i] <= 32'b0;				
			end
		end
		else if(rd_index != 5'b0)
		begin
			registers[rd_index[4:0]] <= reg_dest_new;
		end
	end

endmodule
