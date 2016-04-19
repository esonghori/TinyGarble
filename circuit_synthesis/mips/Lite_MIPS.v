`include "../defined.vh"

module Lite_MIPS
#
(
    parameter   W = 32,
    parameter   L = 6
)
(	
	clk, 
	rst,
	g_init,
	e_init,
	o
);

	localparam  		N = 2**L;

	input 				clk;
	input 				rst;
	input 	[N*W-1:0] 	g_init;
	input 	[N*W-1:0] 	e_init;
	output 	[N*W-1:0] 	o;


  wire   [N*W-1:0]   inst_mem_in_wire;
  wire   [N*W-1:0]   data_mem_in_wire;
  wire   [N*W-1:0]   data_mem_out_wire;

  assign inst_mem_in_wire = g_init;
  assign data_mem_in_wire = e_init;
  assign o = data_mem_out_wire;



   wire [31:0]	opcode;
   wire [4:0]	rs_index;
   wire [4:0]	rt_index;
   wire [4:0]	rd_index;
   wire [4:0]	rd_indexD;
   wire [31:0]	reg_source;
   wire [31:0]	reg_target;
   wire [31:0]	reg_dest;
   wire [31:0]	reg_destD;
   wire [31:0]	a_bus;
   wire [31:0]	a_busD;  
   wire [31:0]	b_bus;
   wire [31:0]	b_busD;
   wire [31:0]	c_bus;
   wire [31:0]	c_alu;
   wire [31:0]	c_shift;
   wire [31:0]	c_mult;
   wire [31:0]	c_memory;
   wire [15:0]	imm;
   wire [31:2]	pc_current;
   wire [31:2]	pc_plus4;
   wire [3:0]	alu_func;
   wire [3:0]	alu_funcD;
   wire [1:0]	shift_func;
   wire [1:0]	shift_funcD;
   wire [3:0]	mult_func;
   wire [3:0]	mult_funcD;
   wire [2:0]	branch_func;
   wire 		take_branch;
   wire [1:0]	a_source;
   wire [1:0]	b_source;
   wire [2:0]	c_source;
   wire [1:0]	pc_source;
   wire [3:0]	mem_source;


	assign c_bus = c_alu | c_shift | c_mult;

   
	PC_Next PC_Next
	(
        .clk          (clk),
        .rst          (rst),
        .take_branch  (take_branch),
        .pc_new       (c_bus[31:2]),
        .opcode25_0   (opcode[25:0]),
        .pc_source    (pc_source),
        .pc_current   (pc_current),
        .pc_plus4     (pc_plus4)
	);



	Inst_Mem 
	#(
		.W					(W),
		.L					(L)
	)
	Inst_Mem
	(
    .clk                (clk),
    .rst                (rst),
		.inst_mem_in_wire   (inst_mem_in_wire),
		.pc                 (pc_current),
		.opcode             (opcode)
	);


	Data_Mem 
	#(
		.W					(W),
		.L					(L)
	)
	Data_Mem
	(
		.clk				(clk),
		.rst				(rst),
		.data_mem_in_wire	(data_mem_in_wire),
		.data_mem_out_wire	(data_mem_out_wire),
		.addr				(c_bus),
		.data_in			(reg_target),
		.mem_source			(mem_source),
		.data_out			(c_memory)
	);

	Control Control
	(
		.opcode					(opcode),
		.rs_index				(rs_index),
		.rt_index				(rt_index),
		.rd_index				(rd_index),
		.imm_out				(imm),
		.alu_func				(alu_func),
		.shift_func				(shift_func),
		.mult_func				(mult_func),
		.branch_func			(branch_func),
		.a_source_out			(a_source),
		.b_source_out			(b_source),
		.c_source_out			(c_source),
		.pc_source_out			(pc_source),
		.mem_source_out			(mem_source)
    );

	Reg_Bank Reg_Bank
	(
        .clk            (clk),
        .rst       		(rst),
        .rs_index       (rs_index),
        .rt_index       (rt_index),
        .rd_index       (rd_index),
        .reg_source_out (reg_source),
        .reg_target_out (reg_target),
        .reg_dest_new   (reg_dest)
    );

	Bus_Mux Bus_Mux
	(
        .imm_in       (imm),
        .reg_source   (reg_source),
        .a_mux        (a_source),
        .a_out        (a_bus),
                    
        .reg_target   (reg_target),
        .b_mux        (b_source),
        .b_out        (b_bus),
                      
        .c_bus        (c_bus),
        .c_memory     (c_memory),
        .c_pc         (pc_current),
        .c_pc_plus4   (pc_plus4),
        .c_mux        (c_source),
        .reg_dest_out (reg_dest),
                      
        .branch_func  (branch_func),
        .take_branch  (take_branch)
    );

	ALU ALU 
	(
        .a_in         (a_busD),
        .b_in         (b_busD),
        .alu_function (alu_funcD),
        .c_alu        (c_alu)
    );

	Shifter Shifter
	(
        .value        (b_busD),
        .shift_amount (a_busD[4:0]),
        .shift_func   (shift_funcD),
        .c_shift      (c_shift)
    );

	/*mult u8_mult
	(
		.clk		(clk),
		.rst		(rst),
		.a			(a_busD),
		.b			(b_busD),
		.mult_func	(mult_funcD),
		.c_mult		(c_mult)
	);*/
	assign c_mult = 32'b0;

	assign a_busD = a_bus;
	assign b_busD = b_bus;
	assign alu_funcD = alu_func;
	assign shift_funcD = shift_func;
	assign mult_funcD = mult_func;
	assign rd_indexD = rd_index;
	assign reg_destD = reg_dest;

endmodule
