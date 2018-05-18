//////////////////////////////////////////////////////////////////
//                                                              //
//  Register Bank for Amber Core                                //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  Contains 37 32-bit registers, 16 of which are visible       //
//  ina any one operating mode. Registers use real flipflops,   //
//  rather than SRAM. This makes sense for an FPGA              //
//  implementation, where flipflops are plentiful.              //
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

module a23_register_bank (

input                       i_clk,
input                       i_rst,
input       [3:0]           i_rm_sel,
input       [3:0]           i_rds_sel,
input       [3:0]           i_rn_sel,

input                       i_pc_wen,
input       [14:0]          i_reg_bank_wen,

input       [23:0]          i_pc,                   // program counter [25:2]
input       [31:0]          i_reg,

input       [3:0]           i_status_bits_flags,

output      [31:0]          o_rm,
output reg  [31:0]          o_rs,
output reg  [31:0]          o_rd,
output      [31:0]          o_rn,
output      [31:0]          o_pc

);

`include "a23_localparams.vh"
`include "a23_functions.vh"


reg  [31:0] r0  ;
reg  [31:0] r1  ;
reg  [31:0] r2  ;
reg  [31:0] r3  ;
reg  [31:0] r4  ;
reg  [31:0] r5  ;
reg  [31:0] r6  ;
reg  [31:0] r7  ;
reg  [31:0] r8  ;
reg  [31:0] r9  ;
reg  [31:0] r10 ;
reg  [31:0] r11 ;
reg  [31:0] r12 ;
reg  [31:0] r13 ;
reg  [31:0] r14 ;
reg  [23:0] r15 ;

wire  [31:0] r0_out;
wire  [31:0] r1_out;
wire  [31:0] r2_out;
wire  [31:0] r3_out;
wire  [31:0] r4_out;
wire  [31:0] r5_out;
wire  [31:0] r6_out;
wire  [31:0] r7_out;
wire  [31:0] r8_out;
wire  [31:0] r9_out;
wire  [31:0] r10_out;
wire  [31:0] r11_out;
wire  [31:0] r12_out;
wire  [31:0] r13_out;
wire  [31:0] r14_out;
wire  [31:0] r15_out_rm;
wire  [31:0] r15_out_rm_nxt;
wire  [31:0] r15_out_rn;

wire  [31:0] r8_rds;
wire  [31:0] r9_rds;
wire  [31:0] r10_rds;
wire  [31:0] r11_rds;
wire  [31:0] r12_rds;
wire  [31:0] r13_rds;
wire  [31:0] r14_rds;


// ========================================================
// Register Update
// ========================================================
always @ ( posedge i_clk or posedge i_rst)
  if (i_rst) begin
      r0       <= 'd0;
      r1       <= 'd0;
      r2       <= 'd0;
      r3       <= 'd0;
      r4       <= 'd0;
      r5       <= 'd0;
      r6       <= 'd0;
      r7       <= 'd0;
      r8       <= 'd0;
      r9       <= 'd0;
      r10      <= 'd0;
      r11      <= 'd0;
      r12      <= 'd0;
      r13      <= 'd0;
      r14      <= 'd0;
      r15      <= 24'h0;
  end else begin
      r0       <=  i_reg_bank_wen[0 ]              ? i_reg : r0;  
      r1       <=  i_reg_bank_wen[1 ]              ? i_reg : r1;  
      r2       <=  i_reg_bank_wen[2 ]              ? i_reg : r2;  
      r3       <=  i_reg_bank_wen[3 ]              ? i_reg : r3;  
      r4       <=  i_reg_bank_wen[4 ]              ? i_reg : r4;  
      r5       <=  i_reg_bank_wen[5 ]              ? i_reg : r5;  
      r6       <=  i_reg_bank_wen[6 ]              ? i_reg : r6;  
      r7       <=  i_reg_bank_wen[7 ]              ? i_reg : r7;  
      r8       <=  i_reg_bank_wen[8 ]              ? i_reg : r8;  
      r9       <=  i_reg_bank_wen[9 ]              ? i_reg : r9;  
      r10      <=  i_reg_bank_wen[10]              ? i_reg : r10; 
      r11      <=  i_reg_bank_wen[11]              ? i_reg : r11; 
      r12      <=  i_reg_bank_wen[12]              ? i_reg : r12; 
      r13      <=  i_reg_bank_wen[13]              ? i_reg : r13;
      r14      <=  i_reg_bank_wen[14]              ? i_reg : r14;
      r15      <=  i_pc_wen                        ?  i_pc : r15;
  end
    
    
// ========================================================
// Register Read based on Mode
// ========================================================
assign r0_out = r0;
assign r1_out = r1;
assign r2_out = r2;
assign r3_out = r3;
assign r4_out = r4;
assign r5_out = r5;
assign r6_out = r6;
assign r7_out = r7;
assign r8_out  = r8;
assign r9_out  = r9;
assign r10_out = r10;
assign r11_out = r11;
assign r12_out = r12;
assign r13_out = r13; 
assign r14_out = r14;


assign r15_out_rm     = { i_status_bits_flags, 
                          1'b1, 
                          1'b1, 
                          r15, 
                          2'b0};

assign r15_out_rm_nxt = { i_status_bits_flags, 
                          1'b1, 
                          1'b1, 
                          i_pc, 
                          2'b0};
                      
assign r15_out_rn     = {6'd0, r15, 2'd0};


// rds outputs
assign r8_rds  = r8;
assign r9_rds  = r9;
assign r10_rds = r10;
assign r11_rds = r11;
assign r12_rds = r12;
assign r13_rds = r13;
assign r14_rds = r14;

// ========================================================
// Program Counter out
// ========================================================
assign o_pc = r15_out_rn;

// ========================================================
// Rm Selector
// ========================================================
assign o_rm = i_rm_sel == 4'd0  ? r0_out  :
              i_rm_sel == 4'd1  ? r1_out  : 
              i_rm_sel == 4'd2  ? r2_out  : 
              i_rm_sel == 4'd3  ? r3_out  : 
              i_rm_sel == 4'd4  ? r4_out  : 
              i_rm_sel == 4'd5  ? r5_out  : 
              i_rm_sel == 4'd6  ? r6_out  : 
              i_rm_sel == 4'd7  ? r7_out  : 
              i_rm_sel == 4'd8  ? r8_out  : 
              i_rm_sel == 4'd9  ? r9_out  : 
              i_rm_sel == 4'd10 ? r10_out : 
              i_rm_sel == 4'd11 ? r11_out : 
              i_rm_sel == 4'd12 ? r12_out : 
              i_rm_sel == 4'd13 ? r13_out : 
              i_rm_sel == 4'd14 ? r14_out : 
                                  r15_out_rm ; 




// ========================================================
// Rds Selector
// ========================================================
always @*
    case (i_rds_sel)
       4'd0  :  o_rs = r0_out  ;
       4'd1  :  o_rs = r1_out  ; 
       4'd2  :  o_rs = r2_out  ; 
       4'd3  :  o_rs = r3_out  ; 
       4'd4  :  o_rs = r4_out  ; 
       4'd5  :  o_rs = r5_out  ; 
       4'd6  :  o_rs = r6_out  ; 
       4'd7  :  o_rs = r7_out  ; 
       4'd8  :  o_rs = r8_rds  ; 
       4'd9  :  o_rs = r9_rds  ; 
       4'd10 :  o_rs = r10_rds ; 
       4'd11 :  o_rs = r11_rds ; 
       4'd12 :  o_rs = r12_rds ; 
       4'd13 :  o_rs = r13_rds ; 
       4'd14 :  o_rs = r14_rds ; 
       default: o_rs = r15_out_rn ; 
    endcase

                                    

// ========================================================
// Rd Selector
// ========================================================
always @*
    case (i_rds_sel)
       4'd0  :  o_rd = r0_out  ;
       4'd1  :  o_rd = r1_out  ; 
       4'd2  :  o_rd = r2_out  ; 
       4'd3  :  o_rd = r3_out  ; 
       4'd4  :  o_rd = r4_out  ; 
       4'd5  :  o_rd = r5_out  ; 
       4'd6  :  o_rd = r6_out  ; 
       4'd7  :  o_rd = r7_out  ; 
       4'd8  :  o_rd = r8_rds  ; 
       4'd9  :  o_rd = r9_rds  ; 
       4'd10 :  o_rd = r10_rds ; 
       4'd11 :  o_rd = r11_rds ; 
       4'd12 :  o_rd = r12_rds ; 
       4'd13 :  o_rd = r13_rds ; 
       4'd14 :  o_rd = r14_rds ; 
       default: o_rd = r15_out_rm_nxt ; 
    endcase

                                    
// ========================================================
// Rn Selector
// ========================================================
assign o_rn = i_rn_sel == 4'd0  ? r0_out  :
              i_rn_sel == 4'd1  ? r1_out  : 
              i_rn_sel == 4'd2  ? r2_out  : 
              i_rn_sel == 4'd3  ? r3_out  : 
              i_rn_sel == 4'd4  ? r4_out  : 
              i_rn_sel == 4'd5  ? r5_out  : 
              i_rn_sel == 4'd6  ? r6_out  : 
              i_rn_sel == 4'd7  ? r7_out  : 
              i_rn_sel == 4'd8  ? r8_out  : 
              i_rn_sel == 4'd9  ? r9_out  : 
              i_rn_sel == 4'd10 ? r10_out : 
              i_rn_sel == 4'd11 ? r11_out : 
              i_rn_sel == 4'd12 ? r12_out : 
              i_rn_sel == 4'd13 ? r13_out : 
              i_rn_sel == 4'd14 ? r14_out : 
                                  r15_out_rn ; 


endmodule


