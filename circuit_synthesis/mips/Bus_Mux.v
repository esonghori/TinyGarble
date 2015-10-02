`include "../defined.vh"

module Bus_Mux
(
	imm_in,
	reg_source,
	a_mux,
	a_out,
	reg_target,
	b_mux,
	b_out,
	c_bus,
	c_memory,
	c_pc,
	c_pc_plus4,
	c_mux,
	reg_dest_out,
	branch_func,
	take_branch
);

	input 	[15:0] 	imm_in;
	input 	[31:0]	reg_source;
	input   [1:0]	a_mux;
	output 	[31:0]	a_out;
	reg 	[31:0]	a_out;

	input 	[31:0]	reg_target;
	input   [1:0]	b_mux;
	output 	[31:0]	b_out;
	reg 	[31:0]	b_out;

	input 	[31:0]	c_bus;
	input 	[31:0]	c_memory;
	input 	[31:2]	c_pc;
	input 	[31:2] 	c_pc_plus4;
	input 	[2:0] 	c_mux;
	output 	[31:0] 	reg_dest_out;
	reg 	[31:0] 	reg_dest_out;

	input 	[2:0]   branch_func;
	output   		take_branch;
	reg 			take_branch;
   
	always@(*)
	begin
		a_out<=32'b0;
		b_out<=32'b0;
		reg_dest_out<=32'b0;
		take_branch<=0;
		case(a_mux)
		`A_FROM_REG_SOURCE:
			a_out<=reg_source;
		`A_FROM_IMM10_6:   
			a_out<={27'b0,imm_in[10:6]};
		`A_FROM_PC:        
			a_out<={c_pc,2'b0};
		default:
			a_out<=32'b0;
		endcase
		
		case(b_mux)
		`B_FROM_REG_TARGET:
			b_out<=reg_target;
		`B_FROM_IMM:       
			b_out<={16'b0,imm_in};
		`B_FROM_SIGNED_IMM:
			b_out<={{16{imm_in[15]}},imm_in};
		`B_FROM_IMMX4:     
			b_out<={14'b0,imm_in,2'b0};
		default:
			b_out<=32'b0;
		endcase
		
		case(c_mux)
		`C_FROM_NULL:       
			reg_dest_out<=32'b0;
		`C_FROM_ALU:        
			reg_dest_out<=c_bus;
		`C_FROM_SHIFT:      
			reg_dest_out<=c_bus;
		`C_FROM_MULT:       
			reg_dest_out<=c_bus;
		`C_FROM_MEMORY:     
			reg_dest_out<=c_memory;
		`C_FROM_PC:         
			reg_dest_out<={c_pc,2'b0};
		`C_FROM_PC_PLUS4:   
			reg_dest_out<={c_pc_plus4,2'b0};
		`C_FROM_IMM_SHIFT16:
			reg_dest_out<={imm_in,16'b0};
		`C_FROM_REG_SOURCEN:
			reg_dest_out<=reg_source;
		default:
			reg_dest_out<=32'b0;
		endcase
		
		case(branch_func)
		`BRANCH_LTZ:
			take_branch<=(c_bus[31])?1:0;
		`BRANCH_LEZ:
			take_branch<=(c_bus[31])?1:(c_bus==32'b0)?1:0;
		`BRANCH_EQ:
			take_branch<=(c_bus==32'b0)?1:0;
		`BRANCH_NE: 
			take_branch<=(c_bus==32'b0)?0:1;
		`BRANCH_GEZ:
			take_branch<=(c_bus[31])?0:1;
		`BRANCH_GTZ:
			take_branch<=(c_bus[31])?0:(c_bus==32'b0)?0:1;
		`BRANCH_YES:
			take_branch<=1;
		`BRANCH_NO: 
			take_branch<=0;
		default:
			take_branch<=0;
		endcase
	end
endmodule
