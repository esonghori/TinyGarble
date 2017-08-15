//////////////////////////////////////////////////////////////////
//                                                              //
//  Decode stage of Amber 2 Core                                //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  This module is the most complex part of the Amber core      //
//  It decodes and sequences all instructions and handles all   //
//  interrupts                                                  //
//                                                              //
//  Author(s):                                                  //
//      - Conor Santifort, csantifort.amber@gmail.com           //
//                                                              //
//////////////////////////////////////////////////////////////////
//                                                              //
// Copyright (C) 2010 Authors and OPENCORES.ORG                 //
//                                                              //
// This source file may be used and distributed without         //
// restriction provided that this copyright statement is not    //
// removed from the file and that any derivative work contains  //
// the original copyright notice and the associated disclaimer. //
//                                                              //
// This source file is free software; you can redistribute it   //
// and/or modify it under the terms of the GNU Lesser General   //
// Public License as published by the Free Software Foundation; //
// either version 2.1 of the License, or (at your option) any   //
// later version.                                               //
//                                                              //
// This source is distributed in the hope that it will be       //
// useful, but WITHOUT ANY WARRANTY; without even the implied   //
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      //
// PURPOSE.  See the GNU Lesser General Public License for more //
// details.                                                     //
//                                                              //
// You should have received a copy of the GNU Lesser General    //
// Public License along with this source; if not, download it   //
// from http://www.opencores.org/lgpl.shtml                     //
//                                                              //
//////////////////////////////////////////////////////////////////
`include "global_defines.vh"

module a23_decode
(
input                       i_clk,
input                       i_rst,
input       [31:0]          i_read_data,
input       [31:0]          i_execute_address,              // Registered address output by execute stage
                                                            // 2 LSBs of read address used for calculating
                                                            // shift in LDRB ops
input                       i_multiply_done,                // multiply unit is nearly done


// --------------------------------------------------
// Control signals to execute stage
// --------------------------------------------------
output reg  [31:0]          o_read_data,
output reg  [4:0]           o_read_data_alignment,  // 2 LSBs of read address used for calculating shift in LDRB ops

output reg  [31:0]          o_imm32,
output reg  [4:0]           o_imm_shift_amount,
output wire [3:0]           o_condition,
output reg  [3:0]           o_rm_sel,
output reg  [3:0]           o_rds_sel,
output reg  [3:0]           o_rn_sel,
output      [3:0]           o_rm_sel_nxt,
output      [3:0]           o_rds_sel_nxt,
output      [3:0]           o_rn_sel_nxt,
output reg  [1:0]           o_barrel_shift_amount_sel,
output reg  [1:0]           o_barrel_shift_data_sel,
output reg  [1:0]           o_barrel_shift_function,
output reg  [8:0]           o_alu_function,
output reg                  o_use_carry_in,
output reg  [1:0]           o_multiply_function,
output wire [3:0]           o_address_sel,
output wire [1:0]           o_pc_sel,
output reg  [1:0]           o_byte_enable_sel,        // byte, halfword or word write
output reg  [2:0]           o_status_bits_sel,
output reg  [2:0]           o_reg_write_sel,

output reg                  o_write_data_wen,
output wire                 o_pc_wen,
output reg  [14:0]          o_reg_bank_wen,
output reg                  o_status_bits_flags_wen
);

`include "a23_localparams.vh"
`include "a23_functions.vh"

localparam [4:0] RST_WAIT1      = 5'd0,
                 RST_WAIT2      = 5'd1,
                 INT_WAIT1      = 5'd2,
                 INT_WAIT2      = 5'd3,
                 EXECUTE        = 5'd4,
                 PRE_FETCH_EXEC = 5'd5,  // Execute the Pre-Fetched Instruction
                 MEM_WAIT1      = 5'd6,  // conditionally decode current instruction, in case
                                         // previous instruction does not execute in S2
                 MEM_WAIT2      = 5'd7,
                 PC_STALL1      = 5'd8,  // Program Counter altered
                                         // conditionally decude current instruction, in case
                                         // previous instruction does not execute in S2
                 PC_STALL2      = 5'd9,
                 MTRANS_EXEC1   = 5'd10,
                 MTRANS_EXEC2   = 5'd11,
                 MTRANS_EXEC3   = 5'd12,
                 MTRANS_EXEC3B  = 5'd13,
                 MTRANS_EXEC4   = 5'd14,
                 //MTRANS5_ABORT  = 5'd15,
                 MULT_PROC1     = 5'd16,  // first cycle, save pre fetch instruction
                 MULT_PROC2     = 5'd17,  // do multiplication
                 MULT_STORE     = 5'd19;  // save RdLo
                 //MULT_ACCUMU    = 5'd20;  // Accumulate add lower 32 bits
                 //SWAP_WRITE     = 5'd22,
                 //SWAP_WAIT1     = 5'd23,
                 //SWAP_WAIT2     = 5'd24,
                 //COPRO_WAIT     = 5'd25;


// ========================================================
// Internal signals
// ========================================================
wire    [31:0]         instruction;
wire    [31:0]         instruction_address;     // instruction virtual address, follows
                                                // the instruction
wire    [1:0]          instruction_sel;
reg     [3:0]          itype;
wire    [3:0]          opcode;
wire    [7:0]          imm8;
wire    [31:0]         offset12;
wire    [31:0]         offset24;
wire    [4:0]          shift_imm;

wire                   opcode_compare;
wire                   mem_op;
wire                   load_op;
wire                   store_op;
wire                   write_pc;
wire                   immediate_shifter_operand;
wire                   rds_use_rs;
wire                   branch;
wire                   mem_op_pre_indexed;
wire                   mem_op_post_indexed;

// Flop inputs
wire    [31:0]         imm32_nxt;
wire    [4:0]          imm_shift_amount_nxt;
wire    [3:0]          condition_nxt;
wire                   shift_extend;

reg     [1:0]          barrel_shift_function_nxt;
wire    [8:0]          alu_function_nxt;
reg                    use_carry_in_nxt;
reg     [1:0]          multiply_function_nxt;

reg     [1:0]          barrel_shift_amount_sel_nxt;
reg     [1:0]          barrel_shift_data_sel_nxt;
reg     [3:0]          address_sel_nxt;
reg     [1:0]          pc_sel_nxt;
reg     [1:0]          byte_enable_sel_nxt;
reg     [2:0]          status_bits_sel_nxt;
reg     [2:0]          reg_write_sel_nxt;

// ALU Function signals
reg                    alu_swap_sel_nxt;
reg                    alu_not_sel_nxt;
reg     [1:0]          alu_cin_sel_nxt;
reg                    alu_cout_sel_nxt;
reg     [3:0]          alu_out_sel_nxt;

reg                    write_data_wen_nxt;
reg                    copro_write_data_wen_nxt;
reg                    pc_wen_nxt;
reg     [3:0]          reg_bank_wsel_nxt;
reg                    status_bits_flags_wen_nxt;

reg                    saved_current_instruction_wen;   // saved load instruction
reg                    pre_fetch_instruction_wen;       // pre-fetch instruction

reg     [4:0]          control_state;
reg     [4:0]          control_state_nxt;


reg     [31:0]         saved_current_instruction;
reg     [31:0]         saved_current_instruction_address;       // virtual address of abort instruction
reg     [31:0]         pre_fetch_instruction;
reg     [31:0]         pre_fetch_instruction_address;           // virtual address of abort instruction

wire                   instruction_valid;

reg     [3:0]          mtrans_reg;              // the current register being accessed as part of STM/LDM
reg     [3:0]          mtrans_reg_d1;     // delayed by 1 period
reg     [3:0]          mtrans_reg_d2;     // delayed by 2 periods
reg     [31:0]         mtrans_instruction_nxt;

wire   [31:0]          mtrans_base_reg_change;
wire   [4:0]           mtrans_num_registers;
wire                   use_saved_current_instruction;
wire                   use_pre_fetch_instruction;
reg                    mtrans_r15;
reg                    mtrans_r15_nxt;

wire                   regop_set_flags;



// ========================================================
// registers for output ports with non-zero initial values
// ========================================================
reg  [3:0]           condition_r;             // 4'he = al
reg  [3:0]           address_sel_r;
reg  [1:0]           pc_sel_r;
reg                  pc_wen_r;

assign o_condition              = condition_r;
assign o_address_sel            = address_sel_r;
assign o_pc_sel                 = pc_sel_r;
assign o_pc_wen                 = pc_wen_r;



// ========================================================
// Instruction Decode
// ========================================================

// for instructions that take more than one cycle
// the instruction is saved in the 'saved_mem_instruction'
// register and then that register is used for the rest of
// the execution of the instruction.
// But if the instruction does not execute because of the
// condition, then need to select the next instruction to
// decode
assign use_saved_current_instruction = ( control_state == MEM_WAIT1     ||
                                         control_state == MEM_WAIT2     ||
                                         control_state == MTRANS_EXEC1  ||
                                         control_state == MTRANS_EXEC2  ||
                                         control_state == MTRANS_EXEC3  ||
                                         control_state == MTRANS_EXEC3B ||
                                         control_state == MTRANS_EXEC4  ||
                                         control_state == MULT_PROC1    ||
                                         control_state == MULT_PROC2    ||
                                         //control_state == MULT_ACCUMU   ||
                                         control_state == MULT_STORE    );

assign use_pre_fetch_instruction = control_state == PRE_FETCH_EXEC;


assign instruction_sel  =         use_saved_current_instruction  ? 2'd1 :  // saved_current_instruction
                                  use_pre_fetch_instruction      ? 2'd2 :  // pre_fetch_instruction
                                                                   2'd0 ;  // o_read_data

assign instruction      =         instruction_sel == 2'd0 ? o_read_data               :
                                  instruction_sel == 2'd1 ? saved_current_instruction :
                                                            pre_fetch_instruction     ;
assign instruction_address =      instruction_sel == 2'd1 ? saved_current_instruction_address :
                                                            pre_fetch_instruction_address     ;

// Instruction Decode - Order is important!
always @*
    casez ({instruction[27:20], instruction[7:4]})
        12'b00010?001001 : itype = SWAP;
        12'b000000??1001 : itype = MULT;
        12'b00?????????? : itype = REGOP;
        12'b01?????????? : itype = TRANS;
        12'b100????????? : itype = MTRANS;
        12'b101????????? : itype = BRANCH;
        12'b110????????? : itype = CODTRANS;
        12'b1110???????0 : itype = COREGOP;
        12'b1110???????1 : itype = CORTRANS;
        default:           itype = SWI;
    endcase


// ========================================================
// Fixed fields within the instruction
// ========================================================

assign opcode        = instruction[24:21];
assign condition_nxt = instruction[31:28];

assign o_rm_sel_nxt    = instruction[3:0];

assign o_rn_sel_nxt    = branch  ? 4'd15              : // Use PC to calculate branch destination
                                   instruction[19:16] ;

assign o_rds_sel_nxt   = itype == MTRANS              ? mtrans_reg         :
                         branch                       ? 4'd15              : // Update the PC
                         rds_use_rs                   ? instruction[11:8]  :
                                                        instruction[15:12] ;


assign shift_imm     = instruction[11:7];

// this is used for RRX
assign shift_extend  = !instruction[25] && !instruction[4] && !(|instruction[11:7]) && instruction[6:5] == 2'b11;

assign offset12      = { 20'h0, instruction[11:0]};
assign offset24      = {{6{instruction[23]}}, instruction[23:0], 2'd0 }; // sign extend
assign imm8          = instruction[7:0];

assign immediate_shifter_operand = instruction[25];
assign rds_use_rs                = (itype == REGOP && !instruction[25] && instruction[4]) ||
                                   (itype == MULT &&
                                    (control_state == MULT_PROC1  ||
                                     control_state == MULT_PROC2  ||
                                     instruction_valid )) ;
assign branch                    = itype == BRANCH;
assign opcode_compare =
            opcode == CMP ||
            opcode == CMN ||
            opcode == TEQ ||
            opcode == TST ;


assign mem_op               = itype == TRANS;
assign load_op              = mem_op && instruction[20];
assign store_op             = mem_op && !instruction[20];
assign write_pc             = pc_wen_nxt && pc_sel_nxt != 2'd0;
assign regop_set_flags      = itype == REGOP && instruction[20];

assign mem_op_pre_indexed   =  instruction[24] && instruction[21];
assign mem_op_post_indexed  = !instruction[24];

assign imm32_nxt            =  // add 0 to Rm
                               itype == MULT               ? {  32'd0                      } :

                               // 4 x number of registers
                               itype == MTRANS             ? {  mtrans_base_reg_change     } :
                               itype == BRANCH             ? {  offset24                   } :
                               itype == TRANS              ? {  offset12                   } :
                               instruction[11:8] == 4'h0  ? {            24'h0, imm8[7:0] } :
                               instruction[11:8] == 4'h1  ? { imm8[1:0], 24'h0, imm8[7:2] } :
                               instruction[11:8] == 4'h2  ? { imm8[3:0], 24'h0, imm8[7:4] } :
                               instruction[11:8] == 4'h3  ? { imm8[5:0], 24'h0, imm8[7:6] } :
                               instruction[11:8] == 4'h4  ? { imm8[7:0], 24'h0            } :
                               instruction[11:8] == 4'h5  ? { 2'h0,  imm8[7:0], 22'h0     } :
                               instruction[11:8] == 4'h6  ? { 4'h0,  imm8[7:0], 20'h0     } :
                               instruction[11:8] == 4'h7  ? { 6'h0,  imm8[7:0], 18'h0     } :
                               instruction[11:8] == 4'h8  ? { 8'h0,  imm8[7:0], 16'h0     } :
                               instruction[11:8] == 4'h9  ? { 10'h0, imm8[7:0], 14'h0     } :
                               instruction[11:8] == 4'ha  ? { 12'h0, imm8[7:0], 12'h0     } :
                               instruction[11:8] == 4'hb  ? { 14'h0, imm8[7:0], 10'h0     } :
                               instruction[11:8] == 4'hc  ? { 16'h0, imm8[7:0], 8'h0      } :
                               instruction[11:8] == 4'hd  ? { 18'h0, imm8[7:0], 6'h0      } :
                               instruction[11:8] == 4'he  ? { 20'h0, imm8[7:0], 4'h0      } :
                                                            { 22'h0, imm8[7:0], 2'h0      } ;


assign imm_shift_amount_nxt = shift_imm ;
assign alu_function_nxt     = { alu_swap_sel_nxt,
                                alu_not_sel_nxt,
                                alu_cin_sel_nxt,
                                alu_cout_sel_nxt,
                                alu_out_sel_nxt  };


// ========================================================
// MTRANS Operations
// ========================================================

   // Bit 15 = r15
   // Bit 0  = R0
   // In LDM and STM instructions R0 is loaded or stored first
always @*
    casez (instruction[15:0])
    16'b???????????????1 : mtrans_reg = 4'h0 ;
    16'b??????????????10 : mtrans_reg = 4'h1 ;
    16'b?????????????100 : mtrans_reg = 4'h2 ;
    16'b????????????1000 : mtrans_reg = 4'h3 ;
    16'b???????????10000 : mtrans_reg = 4'h4 ;
    16'b??????????100000 : mtrans_reg = 4'h5 ;
    16'b?????????1000000 : mtrans_reg = 4'h6 ;
    16'b????????10000000 : mtrans_reg = 4'h7 ;
    16'b???????100000000 : mtrans_reg = 4'h8 ;
    16'b??????1000000000 : mtrans_reg = 4'h9 ;
    16'b?????10000000000 : mtrans_reg = 4'ha ;
    16'b????100000000000 : mtrans_reg = 4'hb ;
    16'b???1000000000000 : mtrans_reg = 4'hc ;
    16'b??10000000000000 : mtrans_reg = 4'hd ;
    16'b?100000000000000 : mtrans_reg = 4'he ;
    default              : mtrans_reg = 4'hf ;
    endcase


always @*
    casez (instruction[15:0])
    16'b???????????????1 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 1],  1'd0};
    16'b??????????????10 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 2],  2'd0};
    16'b?????????????100 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 3],  3'd0};
    16'b????????????1000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 4],  4'd0};
    16'b???????????10000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 5],  5'd0};
    16'b??????????100000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 6],  6'd0};
    16'b?????????1000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 7],  7'd0};
    16'b????????10000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 8],  8'd0};
    16'b???????100000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 9],  9'd0};
    16'b??????1000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:10], 10'd0};
    16'b?????10000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:11], 11'd0};
    16'b????100000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:12], 12'd0};
    16'b???1000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:13], 13'd0};
    16'b??10000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:14], 14'd0};
    16'b?100000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15   ], 15'd0};
    default              : mtrans_instruction_nxt = {instruction[31:16],                     16'd0};
    endcase


// number of registers to be stored
assign mtrans_num_registers =   {4'd0, instruction[15]} +
                                {4'd0, instruction[14]} +
                                {4'd0, instruction[13]} +
                                {4'd0, instruction[12]} +
                                {4'd0, instruction[11]} +
                                {4'd0, instruction[10]} +
                                {4'd0, instruction[ 9]} +
                                {4'd0, instruction[ 8]} +
                                {4'd0, instruction[ 7]} +
                                {4'd0, instruction[ 6]} +
                                {4'd0, instruction[ 5]} +
                                {4'd0, instruction[ 4]} +
                                {4'd0, instruction[ 3]} +
                                {4'd0, instruction[ 2]} +
                                {4'd0, instruction[ 1]} +
                                {4'd0, instruction[ 0]} ;

// 4 x number of registers to be stored
assign mtrans_base_reg_change = {25'd0, mtrans_num_registers, 2'd0};


// ========================================================
// Generate control signals
// ========================================================
always @(*)
    begin

    // Save an instruction to use later
    saved_current_instruction_wen   = 1'd0;
    pre_fetch_instruction_wen       = 1'd0;
    mtrans_r15_nxt                  = mtrans_r15;

    // default Mux Select values
    barrel_shift_amount_sel_nxt     = 'd0;  // don't shift the input
    barrel_shift_data_sel_nxt       = 'd0;  // immediate value
    barrel_shift_function_nxt       = 'd0;
    use_carry_in_nxt                = 'd0;
    multiply_function_nxt           = 'd0;
    address_sel_nxt                 = 'd0;
    pc_sel_nxt                      = 'd0;
    byte_enable_sel_nxt             = 'd0;
    status_bits_sel_nxt             = 'd0;
    reg_write_sel_nxt               = 'd0;

    // ALU Muxes
    alu_swap_sel_nxt                = 'd0;
    alu_not_sel_nxt                 = 'd0;
    alu_cin_sel_nxt                 = 'd0;
    alu_cout_sel_nxt                = 'd0;
    alu_out_sel_nxt                 = 'd0;

    // default Flop Write Enable values
    write_data_wen_nxt              = 'd0;
    pc_wen_nxt                      = 'd1;
    reg_bank_wsel_nxt               = 'hF;  // Don't select any
    status_bits_flags_wen_nxt       = 'd0;

    if ( instruction_valid ) begin
        if ( itype == REGOP ) begin
            if ( !opcode_compare ) begin
                // Check is the load destination is the PC
                if (instruction[15:12]  == 4'd15) begin
                    pc_sel_nxt      = 2'd1; // alu_out
                    address_sel_nxt = 4'd1; // alu_out
                end else
                    reg_bank_wsel_nxt = instruction[15:12];
            end

            if ( !immediate_shifter_operand )
                barrel_shift_function_nxt  = instruction[6:5];

            if ( !immediate_shifter_operand )
                barrel_shift_data_sel_nxt = 2'd2; // Shift value from Rm register

            if ( !immediate_shifter_operand && instruction[4] )
                barrel_shift_amount_sel_nxt = 2'd1; // Shift amount from Rs registter

            if ( !immediate_shifter_operand && !instruction[4] )
                barrel_shift_amount_sel_nxt = 2'd2; // Shift immediate amount

            // regops that do not change the overflow flag
            if ( opcode == AND || opcode == EOR || opcode == TST || opcode == TEQ ||
                 opcode == ORR || opcode == MOV || opcode == BIC || opcode == MVN )
                status_bits_sel_nxt = 3'd5;

            if ( opcode == ADD || opcode == CMN ) begin  // CMN is just like an ADD
                alu_out_sel_nxt  = 4'd1; // Add
                use_carry_in_nxt = shift_extend;
            end

            if ( opcode == ADC ) begin // Add with Carry
                alu_out_sel_nxt  = 4'd1; // Add
                alu_cin_sel_nxt  = 2'd2; // carry in from status_bits
                use_carry_in_nxt = shift_extend;
            end

            if ( opcode == SUB || opcode == CMP ) begin// Subtract
                alu_out_sel_nxt  = 4'd1; // Add
                alu_cin_sel_nxt  = 2'd1; // cin = 1
                alu_not_sel_nxt  = 1'd1; // invert B
            end

            // SBC (Subtract with Carry) subtracts the value of its
            // second operand and the value of NOT(Carry flag) from
            // the value of its first operand.
            //  Rd = Rn - shifter_operand - NOT(C Flag)
            if ( opcode == SBC ) begin// Subtract with Carry
                alu_out_sel_nxt  = 4'd1; // Add
                alu_cin_sel_nxt  = 2'd2; // carry in from status_bits
                alu_not_sel_nxt  = 1'd1; // invert B
                use_carry_in_nxt = 1'd1;
            end

            if ( opcode == RSB ) begin // Reverse Subtract
                alu_out_sel_nxt  = 4'd1; // Add
                alu_cin_sel_nxt  = 2'd1; // cin = 1
                alu_not_sel_nxt  = 1'd1; // invert B
                alu_swap_sel_nxt = 1'd1; // swap A and B
                end

            if ( opcode == RSC ) begin // Reverse Subtract with carry
                alu_out_sel_nxt  = 4'd1; // Add
                alu_cin_sel_nxt  = 2'd2; // carry in from status_bits
                alu_not_sel_nxt  = 1'd1; // invert B
                alu_swap_sel_nxt = 1'd1; // swap A and B
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == AND || opcode == TST ) begin // Logical AND, Test  (using AND operator)
                alu_out_sel_nxt  = 4'd8;  // AND
                alu_cout_sel_nxt = 1'd1;  // i_barrel_shift_carry
                end

            if ( opcode == EOR || opcode == TEQ ) begin // Logical Exclusive OR, Test Equivalence (using EOR operator)
                alu_out_sel_nxt  = 4'd6; // XOR
                alu_cout_sel_nxt = 1'd1; // i_barrel_shift_carry
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == ORR ) begin
                alu_out_sel_nxt  = 4'd7; // OR
                alu_cout_sel_nxt = 1'd1; // i_barrel_shift_carry
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == BIC ) begin // Bit Clear (using AND & NOT operators)
                alu_out_sel_nxt  = 4'd8;  // AND
                alu_not_sel_nxt  = 1'd1;  // invert B
                alu_cout_sel_nxt = 1'd1;  // i_barrel_shift_carry
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == MOV ) begin // Move
                alu_cout_sel_nxt = 1'd1;  // i_barrel_shift_carry
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == MVN ) begin // Move NOT
                alu_not_sel_nxt  = 1'd1; // invert B
                alu_cout_sel_nxt = 1'd1; // i_barrel_shift_carry
                use_carry_in_nxt = 1'd1;
                end
            end

        // Load & Store instructions
        if ( mem_op ) begin
            saved_current_instruction_wen   = 1'd1; // Save the memory access instruction to refer back to later
            pc_wen_nxt                      = 1'd0; // hold current PC value
            alu_out_sel_nxt                 = 4'd1; // Add

            if ( !instruction[23] ) begin // U: Subtract offset
                alu_cin_sel_nxt  = 2'd1; // cin = 1
                alu_not_sel_nxt  = 1'd1; // invert B
            end

            if ( store_op ) begin
                write_data_wen_nxt = 1'd1;
                if ( itype == TRANS && instruction[22] )
                    byte_enable_sel_nxt = 2'd1;         // Save byte
            end

                // need to update the register holding the address ?
                // This is Rn bits [19:16]
            if ( mem_op_pre_indexed || mem_op_post_indexed ) begin
                // Check is the load destination is the PC
                if ( o_rn_sel_nxt  == 4'd15 )
                    pc_sel_nxt = 2'd1;
                else
                    reg_bank_wsel_nxt = o_rn_sel_nxt;
            end

                // if post-indexed, then use Rn rather than ALU output, as address
            if ( mem_op_post_indexed )
               address_sel_nxt = 4'd4; // Rn
            else
               address_sel_nxt = 4'd1; // alu out

            if ( instruction[25] && itype ==  TRANS )
                barrel_shift_data_sel_nxt = 2'd2; // Shift value from Rm register

            if ( itype == TRANS && instruction[25] && shift_imm != 5'd0 ) begin
                barrel_shift_function_nxt   = instruction[6:5];
                barrel_shift_amount_sel_nxt = 2'd2; // imm_shift_amount
            end
        end

        if ( itype == BRANCH ) begin
            pc_sel_nxt      = 2'd3; // branch_pc
            address_sel_nxt = 4'd8; // branch_address
            alu_out_sel_nxt = 4'd1; // Add

            if ( instruction[24] ) begin // Link
                reg_bank_wsel_nxt  = 4'd14;  // Save PC to LR
                reg_write_sel_nxt = 3'd1;            // pc - 32'd4
            end
        end

        if ( itype == MTRANS ) begin
            saved_current_instruction_wen   = 1'd1; // Save the memory access instruction to refer back to later
            pc_wen_nxt                      = 1'd0; // hold current PC value
            alu_out_sel_nxt                 = 4'd1; // Add
            mtrans_r15_nxt                  = instruction[15];  // load or save r15 ?

            // Increment or Decrement
            if ( instruction[23] ) begin// increment
                
                if ( instruction[24] )    // increment before
                    address_sel_nxt = 4'd7; // Rn + 4
                else
                    address_sel_nxt = 4'd4; // Rn
            end else begin// decrement
                alu_cin_sel_nxt  = 2'd1; // cin = 1
                alu_not_sel_nxt  = 1'd1; // invert B
                if ( !instruction[24] )    // decrement after
                    address_sel_nxt  = 4'd6; // alu out + 4
                else
                    address_sel_nxt  = 4'd1; // alu out
            end

            // Load or store ?
            if ( !instruction[20] )  // Store
                write_data_wen_nxt = 1'd1;

            // update the base register ?
            if ( instruction[21] )  // the W bit
                reg_bank_wsel_nxt  = o_rn_sel_nxt;
        end


        if ( itype == MULT ) begin
            multiply_function_nxt[0]        = 1'd1; // set enable
                                                    // some bits can be changed just below
            saved_current_instruction_wen   = 1'd1; // Save the Multiply instruction to
                                                    // refer back to later
            pc_wen_nxt                      = 1'd0; // hold current PC value

            if ( instruction[21] )
                multiply_function_nxt[1]    = 1'd1; // accumulate
        end

        if ( regop_set_flags ) begin
            status_bits_flags_wen_nxt = 1'd1;

            // If <Rd> is r15, the ALU output is copied to the Status Bits.
            // Not allowed to use r15 for mul or lma instructions
            if ( instruction[15:12] == 4'd15 ) begin
                status_bits_sel_nxt       = 3'd1; // alu out
            end
        end

    end


    // previous instruction was either ldr or sdr
    // if it is currently executing in the execute stage do the following
    if ( control_state == MEM_WAIT1 ) begin
        // Save the next instruction to execute later
        // Do this even if this instruction does not execute because of Condition
        pre_fetch_instruction_wen   = 1'd1;
        address_sel_nxt             = 4'd3; // pc  (not pc + 4)
        pc_wen_nxt                  = 1'd0; // hold current PC value
    end


    // completion of load operation
    if ( control_state == MEM_WAIT2 && load_op ) begin
        barrel_shift_data_sel_nxt   = 2'd1;  // load word from memory
        barrel_shift_amount_sel_nxt = 2'd3;  // shift by address[1:0] x 8

        // shift needed
        if ( i_execute_address[1:0] != 2'd0 )
            barrel_shift_function_nxt = ROR;

        // load a byte
        if ( itype == TRANS && instruction[22] )
            alu_out_sel_nxt             = 4'd3;  // zero_extend8
        // Check if the load destination is the PC
        if (instruction[15:12]  == 4'd15) begin
            pc_sel_nxt      = 2'd1; // alu_out
            address_sel_nxt = 4'd1; // alu_out
        end else
            reg_bank_wsel_nxt = instruction[15:12];
    end


    // second cycle of multiple load or store
    if ( control_state == MTRANS_EXEC1 ) begin
        // Save the next instruction to execute later
        // Do this even if this instruction does not execute because of Condition
        pre_fetch_instruction_wen   = 1'd1;

        address_sel_nxt             = 4'd5;  // o_address
        pc_wen_nxt                  = 1'd0;  // hold current PC value
        if ( !instruction[20] ) // Store
            write_data_wen_nxt = 1'd1;
    end


    // third cycle of multiple load or store
    if ( control_state == MTRANS_EXEC2 ) begin
        address_sel_nxt             = 4'd5;  // o_address
        pc_wen_nxt                  = 1'd0;  // hold current PC value
        barrel_shift_data_sel_nxt   = 2'd1;  // load word from memory

        // Load or Store
        if ( instruction[20] ) // Load
                reg_bank_wsel_nxt = mtrans_reg_d2;
        else // Store
            write_data_wen_nxt = 1'd1;
    end

        // second or fourth cycle of multiple load or store
    if ( control_state == MTRANS_EXEC3 ) begin
        address_sel_nxt             = 4'd3; // pc  (not pc + 4)
        pc_wen_nxt                  = 1'd0;  // hold current PC value
        barrel_shift_data_sel_nxt   = 2'd1;  // load word from memory

        // Can never be loading the PC in this state, as the PC is always
        // the last register in the set to be loaded
        if ( instruction[20] ) // Load
            reg_bank_wsel_nxt = mtrans_reg_d2;
    end

    // state is used for LMD/STM of a single register
    if ( control_state == MTRANS_EXEC3B ) begin
        // Save the next instruction to execute later
        // Do this even if this instruction does not execute because of Condition
        pre_fetch_instruction_wen   = 1'd1;

        address_sel_nxt             = 4'd3;  // pc  (not pc + 4)
        pc_wen_nxt                  = 1'd0;  // hold current PC value

    end

    if ( control_state == MTRANS_EXEC4 ) begin
        barrel_shift_data_sel_nxt   = 2'd1;  // load word from memory
        if ( instruction[20] ) begin// Load
            if ( mtrans_reg_d2 == 4'd15 ) begin// load new value into PC
                address_sel_nxt = 4'd1; // alu_out - read instructions using new PC value
                pc_sel_nxt      = 2'd1; // alu_out
                pc_wen_nxt      = 1'd1; // write PC

                // ldm with S bit and pc: the Status bits are updated
                // Node this must be done only at the end
                // so the register set is the set in the mode before it
                // gets changed.
                if ( instruction[22] ) begin
                     status_bits_sel_nxt           = 3'd1; // alu out
                     status_bits_flags_wen_nxt     = 1'd1;
                end
            end else begin
                reg_bank_wsel_nxt = mtrans_reg_d2;
            end
        end
    end


    // Multiply or Multiply-Accumulate
    if ( control_state == MULT_PROC1 ) begin
        // Save the next instruction to execute later
        // Do this even if this instruction does not execute because of Condition
        pre_fetch_instruction_wen   = 1'd1;
        pc_wen_nxt                  = 1'd0;  // hold current PC value
        multiply_function_nxt       = o_multiply_function;
    end


        // Multiply or Multiply-Accumulate
        // Do multiplication
        // Wait for done or accumulate signal
    if ( control_state == MULT_PROC2 ) begin
        // Save the next instruction to execute later
        // Do this even if this instruction does not execute because of Condition
        pc_wen_nxt              = 1'd0;  // hold current PC value
        address_sel_nxt         = 4'd3;  // pc  (not pc + 4)
        multiply_function_nxt   = o_multiply_function;
    end 


    // Save RdLo
    // always last cycle of all multiply or multiply accumulate operations
    if ( control_state == MULT_STORE ) begin
        reg_write_sel_nxt     = 3'd2; // multiply_out
        multiply_function_nxt = o_multiply_function;

        reg_bank_wsel_nxt      = instruction[19:16]; // Rd
     
        if ( instruction[20] ) begin // the 'S' bit
            status_bits_sel_nxt       = 3'd4; // { multiply_flags, status_bits_flags[1:0] }
            status_bits_flags_wen_nxt = 1'd1;
        end
    end
end


// ========================================================
// Next State Logic
// ========================================================

assign instruction_valid = (control_state == EXECUTE || control_state == PRE_FETCH_EXEC);


 always @* begin
    // default is to hold the current state
    control_state_nxt = control_state;

    // Note: The order is important here
    if ( control_state == RST_WAIT1 )          
        control_state_nxt = RST_WAIT2;
    else if ( control_state == RST_WAIT2 )     
        control_state_nxt = EXECUTE;
    else if ( control_state == INT_WAIT1 )     
        control_state_nxt = INT_WAIT2;
    else if ( control_state == INT_WAIT2 )     
        control_state_nxt = EXECUTE;
    else if ( control_state == PC_STALL1 )     
        control_state_nxt = PC_STALL2;
    else if ( control_state == PC_STALL2 )     
        control_state_nxt = EXECUTE;
    else if ( control_state == MULT_STORE )    
        control_state_nxt = PRE_FETCH_EXEC;
    else if ( control_state == MEM_WAIT1 )     
        control_state_nxt = MEM_WAIT2;
    else if ( control_state == MEM_WAIT2) begin
        if ( write_pc ) // writing to the PC!!
            control_state_nxt = PC_STALL1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
    end else if ( control_state == MTRANS_EXEC1 ) begin
        if (mtrans_instruction_nxt[15:0] != 16'd0)
            control_state_nxt = MTRANS_EXEC2;
        else   // if the register list holds a single register
            control_state_nxt = MTRANS_EXEC3;
    end else if ( control_state == MTRANS_EXEC2 && mtrans_num_registers == 5'd1 ) 
        // Stay in State MTRANS_EXEC2 until the full list of registers to
        // load or store has been processed
        control_state_nxt = MTRANS_EXEC3;
    else if ( control_state == MTRANS_EXEC3 )     
        control_state_nxt = MTRANS_EXEC4;
    else if ( control_state == MTRANS_EXEC3B )    
        control_state_nxt = MTRANS_EXEC4;
    else if ( control_state == MTRANS_EXEC4  ) begin
        if (write_pc) // writing to the PC!!
            control_state_nxt = PC_STALL1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
    end else if ( control_state == MULT_PROC1 ) begin
        control_state_nxt = MULT_PROC2;
    end else if ( control_state == MULT_PROC2 ) begin
        if ( i_multiply_done )
            control_state_nxt = MULT_STORE;
    end else if ( instruction_valid ) begin
        control_state_nxt = EXECUTE;

        if ( mem_op )  // load or store word or byte
             control_state_nxt = MEM_WAIT1;
        if ( write_pc )
             control_state_nxt = PC_STALL1;
        if ( itype == MTRANS ) begin
            if ( mtrans_num_registers != 5'd0 ) begin
                // check for LDM/STM of a single register
                if ( mtrans_num_registers == 5'd1 )
                    control_state_nxt = MTRANS_EXEC3B;
                else
                    control_state_nxt = MTRANS_EXEC1;
            end else begin
                control_state_nxt = MTRANS_EXEC3;
            end
        end

        if ( itype == MULT )
            control_state_nxt = MULT_PROC1;
    end
end


// ========================================================
// Register Update
// ========================================================

always @ ( posedge i_clk  or posedge i_rst)
    if(i_rst) begin
        o_read_data                 <= 'b0;
        o_read_data_alignment       <= 'd0;
        o_imm32                     <= 'd0;
        o_imm_shift_amount          <= 'd0;
        condition_r                 <=  4'he;
        o_rm_sel                    <= 'd0;
        o_rds_sel                   <= 'd0;
        o_rn_sel                    <= 'd0;
        o_barrel_shift_amount_sel   <= 'd0;
        o_barrel_shift_data_sel     <= 'd0;
        o_barrel_shift_function     <= 'd0;
        o_alu_function              <= 'd0;
        o_use_carry_in              <= 'd0;
        o_multiply_function         <= 'd0;
        address_sel_r               <= 'd0;
        pc_sel_r                    <= 'd0;
        o_byte_enable_sel           <= 'd0;
        o_status_bits_sel           <= 'd0;
        o_reg_write_sel             <= 'd0;
        o_write_data_wen            <= 'd0;
        pc_wen_r                    <= 1'd1;
        o_reg_bank_wen              <= 'd0;
        o_status_bits_flags_wen     <= 'd0;
        mtrans_r15                  <= 'd0;
        control_state               <= RST_WAIT2;
        mtrans_reg_d1               <= 'd0;
        mtrans_reg_d2               <= 'd0;
    end else begin
        o_read_data                 <= i_read_data;
        o_read_data_alignment       <= {i_execute_address[1:0], 3'd0};
        o_imm32                     <= imm32_nxt;
        o_imm_shift_amount          <= imm_shift_amount_nxt;

        condition_r                 <= instruction_valid ? condition_nxt : condition_r;

        o_rm_sel                    <= o_rm_sel_nxt;
        o_rds_sel                   <= o_rds_sel_nxt;
        o_rn_sel                    <= o_rn_sel_nxt;
        o_barrel_shift_amount_sel   <= barrel_shift_amount_sel_nxt;
        o_barrel_shift_data_sel     <= barrel_shift_data_sel_nxt;
        o_barrel_shift_function     <= barrel_shift_function_nxt;
        o_alu_function              <= alu_function_nxt;
        o_use_carry_in              <= use_carry_in_nxt;
        o_multiply_function         <= multiply_function_nxt;
        address_sel_r               <= address_sel_nxt;
        pc_sel_r                    <= pc_sel_nxt;
        o_byte_enable_sel           <= byte_enable_sel_nxt;
        o_status_bits_sel           <= status_bits_sel_nxt;
        o_reg_write_sel             <= reg_write_sel_nxt;
        o_write_data_wen            <= write_data_wen_nxt;
        pc_wen_r                    <= pc_wen_nxt;
        o_reg_bank_wen              <= decode ( reg_bank_wsel_nxt );
        o_status_bits_flags_wen     <= status_bits_flags_wen_nxt;

        mtrans_r15                  <= mtrans_r15_nxt;
        control_state               <= control_state_nxt;
        mtrans_reg_d1               <= mtrans_reg;
        mtrans_reg_d2               <= mtrans_reg_d1;
    end



always @ ( posedge i_clk or posedge i_rst)
    if(i_rst) begin
      saved_current_instruction              <= 'd0;
      saved_current_instruction_address      <= 'd0;
      pre_fetch_instruction                  <= 'd0;
      pre_fetch_instruction_address          <= 'd0;
    end else begin
        // sometimes this is a pre-fetch instruction
        // e.g. two ldr instructions in a row. The second ldr will be saved
        // to the pre-fetch instruction register
        // then when its decoded, a copy is saved to the saved_current_instruction
        // register
        if      (itype == MTRANS)
            begin
            saved_current_instruction              <= mtrans_instruction_nxt;
            saved_current_instruction_address      <= instruction_address;
            end
        else if (saved_current_instruction_wen)
            begin
            saved_current_instruction              <= instruction;
            saved_current_instruction_address      <= instruction_address;
            end

        if      (pre_fetch_instruction_wen)
        begin
            pre_fetch_instruction                  <= o_read_data;
        end
    end
endmodule


