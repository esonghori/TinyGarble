//////////////////////////////////////////////////////////////////
//                                                              //
//  Execute stage of Amber 2 Core                               //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  Executes instructions. Instantiates the register file, ALU  //
//  multiplication unit and barrel shifter. This stage is       //
//  relitively simple. All the complex stuff is done in the     //
//  decode stage.                                               //
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

`include "a23_config_defines.vh"

module a23_execute (

input                       i_clk,
input                       i_rst,
input       [31:0]          i_read_data,
input       [4:0]           i_read_data_alignment,  // 2 LSBs of address in [4:3], appended 
                                                    // with 3 zeros
output reg  [31:0]          o_write_data,
output wire [31:0]          o_address,
                                                    // wishbone access
output      [31:0]          o_address_nxt,          // un-registered version of address to the 
                                                    // cache rams address ports
output reg                  o_write_enable,
output reg  [3:0]           o_byte_enable,
                                                    // low = instruction fetch
output                      o_multiply_done,


// --------------------------------------------------
// Control signals from Instruction Decode stage
// --------------------------------------------------
input      [31:0]           i_imm32,
input      [4:0]            i_imm_shift_amount,
input      [3:0]            i_condition,
input                       i_use_carry_in,         // e.g. add with carry instruction

input      [3:0]            i_rm_sel,
input      [3:0]            i_rds_sel,
input      [3:0]            i_rn_sel,
input      [3:0]            i_rm_sel_nxt,
input      [3:0]            i_rds_sel_nxt,
input      [3:0]            i_rn_sel_nxt,
input      [1:0]            i_barrel_shift_amount_sel,
input      [1:0]            i_barrel_shift_data_sel,
input      [1:0]            i_barrel_shift_function,
input      [8:0]            i_alu_function,
input      [1:0]            i_multiply_function,
input      [3:0]            i_address_sel,
input      [1:0]            i_pc_sel,
input      [1:0]            i_byte_enable_sel,
input      [2:0]            i_status_bits_sel,
input      [2:0]            i_reg_write_sel,
input                       i_write_data_wen,
                                                    // in case of data abort
input                       i_pc_wen,
input      [14:0]           i_reg_bank_wen,
input                       i_status_bits_flags_wen
);

`include "a23_localparams.vh"
`include "a23_functions.vh"

// ========================================================
// Internal signals
// ========================================================
wire [31:0]         write_data_nxt;
wire [3:0]          byte_enable_nxt;
wire [31:0]         pc_plus4;
wire [31:0]         pc_minus4;
wire [31:0]         address_plus4;
wire [31:0]         alu_plus4;
wire [31:0]         rn_plus4;
wire [31:0]         alu_out;
wire [3:0]          alu_flags;
wire [31:0]         rm;
wire [31:0]         rs;
wire [31:0]         rd;
wire [31:0]         rn;
wire [31:0]         pc;
wire [31:0]         pc_nxt;
wire [31:0]         branch_pc_nxt;
wire                write_enable_nxt;
wire [7:0]          shift_amount;
wire [31:0]         barrel_shift_in;
wire [31:0]         barrel_shift_out;
wire                barrel_shift_carry;
wire                barrel_shift_carry_alu;

wire [3:0]          status_bits_flags_nxt;
reg  [3:0]          status_bits_flags;

wire                execute;           // high when condition execution is true
wire [31:0]         reg_write_nxt;
wire                pc_wen;
wire [14:0]         reg_bank_wen;
wire [3:0]          reg_bank_wsel;
wire [31:0]         multiply_out;
wire [1:0]          multiply_flags;

wire                address_update;
wire                write_data_update;
wire                byte_enable_update;
wire                write_enable_update;
wire                status_bits_flags_update;

wire [31:0]         alu_out_pc_filtered;
wire [31:0]         branch_address_nxt;

wire                carry_in;

reg  [31:0]         address_r;


// ========================================================
// Status Bits Select
// ========================================================
assign status_bits_flags_nxt     = i_status_bits_sel == 3'd0 ? alu_flags                           :
                                   i_status_bits_sel == 3'd1 ? alu_out          [31:28]            :
                                   //i_status_bits_sel == 3'd3 ? i_copro_read_data[31:28]            :
                                   //  update flags after a multiply operation
                                   i_status_bits_sel == 3'd4 ? { multiply_flags, status_bits_flags[1:0] } :
                                   // regops that do not change the overflow flag
                                   i_status_bits_sel == 3'd5 ? { alu_flags[3:1], status_bits_flags[0] } :
                                                               4'b1111 ;

// ========================================================
// Adders
// ========================================================
assign pc_plus4      = pc        + 32'd4;
assign pc_minus4     = pc        - 32'd4;
assign address_plus4 = address_r + 32'd4;
assign alu_plus4     = alu_out   + 32'd4;
assign rn_plus4      = rn        + 32'd4;


// ========================================================
// Barrel Shift Amount Select
// ========================================================
// An immediate shift value of 0 is translated into 32
assign shift_amount = i_barrel_shift_amount_sel == 2'd0 ? 8'd0                           :
                      i_barrel_shift_amount_sel == 2'd1 ? rs[7:0]                        :
                      i_barrel_shift_amount_sel == 2'd2 ? {3'd0, i_imm_shift_amount    } :
                                                          {3'd0, i_read_data_alignment } ;

// ========================================================
// Barrel Shift Data Select
// ========================================================
assign barrel_shift_in = i_barrel_shift_data_sel == 2'd0 ? i_imm32       :
                         i_barrel_shift_data_sel == 2'd1 ? i_read_data   :
                                                           rm            ;
                            
// ========================================================
// Address Select
// ========================================================

// If rd is the pc, then seperate the address bits from the status bits for
// generating the next address to fetch
assign alu_out_pc_filtered = pc_wen && i_pc_sel == 2'd1 ? pcf(alu_out) : alu_out;


assign branch_address_nxt = (!execute) ? pc_minus4 : alu_out_pc_filtered;

// if current instruction does not execute because it does not meet the condition
// then address advances to next instruction
assign o_address_nxt = (i_address_sel == 4'd0) ? pc_plus4              :
                       (i_address_sel == 4'd1) ? alu_out_pc_filtered   :
                       (i_address_sel == 4'd3) ? pc                    :
                       (i_address_sel == 4'd4) ? rn                    :
                       (i_address_sel == 4'd5) ? address_plus4         :  // MTRANS address incrementer
                       (i_address_sel == 4'd6) ? alu_plus4             :  // MTRANS decrement after
                       (i_address_sel == 4'd7) ? rn_plus4              :  // MTRANS increment before
                                                 branch_address_nxt    ;

// ========================================================
// Program Counter Select
// ========================================================

assign branch_pc_nxt = (!execute) ? pc_minus4 : alu_out;

// If current instruction does not execute because it does not meet the condition
// then PC advances to next instruction
assign pc_nxt = i_pc_sel == 2'd0 ? pc_plus4              :
                i_pc_sel == 2'd1 ? alu_out               :
                                   branch_pc_nxt         ;


// ========================================================
// Register Write Select
// ========================================================
wire [31:0] save_int_pc_m4;

assign save_int_pc_m4 = { status_bits_flags, 
                          1'b1, 
                          1'b1, 
                          pc_minus4[25:2], 
                          2'b0      };

assign reg_write_nxt = i_reg_write_sel == 3'd0 ? alu_out               :
                       // save pc to lr on an interrupt                    
                       i_reg_write_sel == 3'd1 ? save_int_pc_m4        :
                                                 multiply_out          ;  


// ========================================================
// Byte Enable Select
// ========================================================
assign byte_enable_nxt = i_byte_enable_sel == 2'd0  ? 4'b1111 :  // word write
                         i_byte_enable_sel == 2'd2  ?            // halfword write, never happen
                         ( o_address_nxt[1] == 1'd0 ? 4'b0011 : 
                                                      4'b1100  ) :
                           
                         o_address_nxt[1:0] == 2'd0 ? 4'b0001 :  // byte write
                         o_address_nxt[1:0] == 2'd1 ? 4'b0010 :
                         o_address_nxt[1:0] == 2'd2 ? 4'b0100 :
                                                      4'b1000 ;


// ========================================================
// Write Data Select
// ========================================================
assign write_data_nxt = i_byte_enable_sel == 2'd0 ? rd            :
                                                    {4{rd[ 7:0]}} ;


// ========================================================
// Conditional Execution
// ========================================================
assign execute = conditional_execute ( i_condition, status_bits_flags );
            
// allow the PC to increment to the next instruction when current
// instruction does not execute
assign pc_wen       = i_pc_wen ;//|| !execute;

// only update register bank if current instruction executes
assign reg_bank_wen = {{15{execute}} & i_reg_bank_wen};

// ========================================================
// Write Enable
// ========================================================
// This must be de-asserted when execute is fault
assign write_enable_nxt = execute && i_write_data_wen;


// ========================================================
// Register Update
// ========================================================

assign status_bits_flags_update        = execute && i_status_bits_flags_wen;

always @( posedge i_clk or posedge i_rst)
    if(i_rst) begin
      o_write_enable          <= 'd0;
      o_write_data            <= 'd0;
      address_r               <= 'd0;
      o_byte_enable           <= 'd0;
      status_bits_flags       <= 'd0;
    end else begin
      o_write_enable          <= write_enable_nxt;
      o_write_data            <= write_data_nxt; 
      address_r               <= o_address_nxt;
      o_byte_enable           <= byte_enable_nxt;
      status_bits_flags       <= status_bits_flags_update       ? status_bits_flags_nxt        : status_bits_flags;
    end

assign o_address = address_r;


// ========================================================
// Instantiate Barrel Shift
// ========================================================

assign carry_in = i_use_carry_in ? status_bits_flags[1] : 1'd0;

a23_barrel_shift u_barrel_shift  (
    .i_in             ( barrel_shift_in           ),
    .i_carry_in       ( carry_in                  ),
    .i_shift_amount   ( shift_amount              ),
    .i_function       ( i_barrel_shift_function   ),
    .o_out            ( barrel_shift_out          ),
    .o_carry_out      ( barrel_shift_carry        )
    );



// ========================================================
// Instantiate ALU
// ========================================================
assign barrel_shift_carry_alu =  i_barrel_shift_data_sel == 2'd0 ? 
                                  (i_imm_shift_amount[4:1] == 0 ? status_bits_flags[1] : i_imm32[31]) : 
                                   barrel_shift_carry;

a23_alu u_alu (
    .i_a_in                  ( rn                      ),
    .i_b_in                  ( barrel_shift_out        ),
    .i_barrel_shift_carry    ( barrel_shift_carry_alu  ),
    .i_status_bits_carry     ( status_bits_flags[1]    ),
    .i_function              ( i_alu_function          ),
    .o_out                   ( alu_out                 ),
    .o_flags                 ( alu_flags               )
    );

// ========================================================
// Instantiate Booth 64-bit Multiplier-Accumulator
// ========================================================
a23_multiply u_multiply (
    .i_clk          ( i_clk                 ),
    .i_rst          ( i_rst                 ),
    .i_a_in         ( rs                    ),
    .i_b_in         ( rm                    ),
    .i_function     ( i_multiply_function   ),
    .i_execute      ( execute               ),
    .o_out          ( multiply_out          ),
    .o_flags        ( multiply_flags        ),  // [1] = N, [0] = Z
    .o_done         ( o_multiply_done       )
    );


// ========================================================
// Instantiate Register Bank
// ========================================================
a23_register_bank u_register_bank(
    .i_clk                   ( i_clk                     ),
    .i_rst                   ( i_rst                     ),
    .i_rm_sel                ( i_rm_sel                  ),
    .i_rds_sel               ( i_rds_sel                 ),
    .i_rn_sel                ( i_rn_sel                  ),
    .i_pc_wen                ( pc_wen                    ),
    .i_reg_bank_wen          ( reg_bank_wen              ),
    .i_pc                    ( pc_nxt[25:2]              ),
    .i_reg                   ( reg_write_nxt             ),
    .i_status_bits_flags     ( status_bits_flags         ),
    .o_rm                    ( rm                        ),
    .o_rs                    ( rs                        ),
    .o_rd                    ( rd                        ),
    .o_rn                    ( rn                        ),
    .o_pc                    ( pc                        )
    );

endmodule


