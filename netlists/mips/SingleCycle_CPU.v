// UCA 2010
//=========================================================
// Single Cycle MIPS CPU
//=========================================================
// Supported instructions
// R-type: add, sub, and, or, slt
// I-type: addi, andi, ori, lw, sw, beq
//
//=========================================================
// Input/Output Signals:
// positive-edge triggered clock    clk
// active high asynchronous reset   rst
//
//=========================================================
// Wire/Reg Specifications:
// control signals                  RegDST, Branch, MemRead,
//                                  MemtoReg, ALUOp, MemWrite,   
//                                  ALUSrc, RegWrite
// MUX output signals               MUX_RegDST, MUX_ALUSrc, 
//                                  MUX_Branch, MUX_MemtoReg
//
//=========================================================

module SingleCycle_CPU
#
(
    parameter W=32,
    parameter L=6
)
(
    clk,
    rst,
    inst_mem_in_wire,
    data_mem_in_wire,
    data_mem_out_wire
);


localparam N = 2**L;

// input/output declaration
input               clk;
input               rst;

input   [W*N-1:0]   inst_mem_in_wire;
input   [W*N-1:0]   data_mem_in_wire;
output  [W*N-1:0]   data_mem_out_wire;

// Wire/Reg declaration
wire                RegDST, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Branch_Zero;
wire    [2:0]       ALUOp;
wire    [3:0]       ALUCtrl;
wire    [4:0]       mux_RegDST;
wire    [W-1:0]     mux_ALUSrc, mux_Branch, mux_MemtoReg, Instr, pc, PC_4, Rs_Data, Rt_Data, Immediate, Offset, PC_Offset, ALUResult, MemData;

assign Offset       = Immediate << 2;
assign Branch_Zero  = Branch & Zero;
   

PC  
#(
    .W(W)
)
PC
(
    .clk        (clk),
    .rst        (rst),
    .pc_in      (mux_Branch),
    .pc_out     (pc)
);


Adder PC_Add_4
(
    .data1_in   (pc),
    .data2_in   ({{(W-3){1'b0}}, 3'b100}), // 32'd4
    .data_out   (PC_4)
);


Instr_Memory  
#(
    .W(W),
    .L(L)
)
Instr_Memory
(
    .inst_mem_in_wire   (inst_mem_in_wire),
    .addr               (pc[L+1:0]), 
    .instr              (Instr)
);


Control Control
(
    .opcode     (Instr[31:26]),
    .RegDst     (RegDST),
    .Branch     (Branch),
    .MemRead    (MemRead),
    .MemtoReg   (MemtoReg),
    .ALUOp      (ALUOp),
    .MemWrite   (MemWrite),
    .ALUSrc     (ALUSrc),
    .RegWrite   (RegWrite)
);


MUX_5bit MUX_RegDst
(
    .data1_in   (Instr[20:16]),
    .data2_in   (Instr[15:11]),
    .select     (RegDST),
    .data_out   (mux_RegDST)
);


Register_File 
#(
    .W(W),
    .L(5) //32 registers
) 
Register_File
(
    .clk        (clk),
    .rst        (rst),
    .Rs_addr    (Instr[25:21]),
    .Rt_addr    (Instr[20:16]),
    .Rd_addr    (mux_RegDST), 
    .Rd_data    (mux_MemtoReg),
    .RegWrite   (RegWrite), 
    .Rs_data    (Rs_Data), 
    .Rt_data    (Rt_Data) 
);


Signed_Extend Signed_Extend
(
    .data_in    (Instr[15:0]),
    .data_out   (Immediate)
);


Adder PC_Add_Offset
(
    .data1_in   (PC_4),
    .data2_in   (Offset),
    .data_out   (PC_Offset)
);



MUX_32bit MUX_ALUSrc
(
    .data1_in   (Rt_Data),
    .data2_in   (Immediate),
    .select     (ALUSrc),
    .data_out   (mux_ALUSrc)
);


ALU_Control ALU_Control
(
    .funct      (Instr[5:0]),
    .ALUOp      (ALUOp),
    .ALUCtrl    (ALUCtrl)
);

  
ALU 
#(
    .W(W)
) 
ALU
(
    .data1_in   (Rs_Data),
    .data2_in   (mux_ALUSrc),
    .ALUCtrl    (ALUCtrl),
    .data       (ALUResult),
    .Zero       (Zero)
);


MUX_32bit MUX_Branch
(
    .data1_in   (PC_4),
    .data2_in   (PC_Offset),
    .select     (Branch_Zero),
    .data_out   (mux_Branch)
);


Data_Memory 
#(
    .W(W),
    .L(L)
)
Data_Memory
(
    .clk                (clk),
    .rst                (rst),
    .data_mem_in_wire   (data_mem_in_wire),
    .data_mem_out_wire  (data_mem_out_wire),
    .addr               (ALUResult[L+1:0]),
    .data_in            (Rt_Data),
    .MemRead            (MemRead),
    .MemWrite           (MemWrite),
    .data_out           (MemData)
);


MUX_32bit MUX_MemtoReg
(
    .data1_in   (ALUResult),
    .data2_in   (MemData),
    .select     (MemtoReg),
    .data_out   (mux_MemtoReg)
);

endmodule
