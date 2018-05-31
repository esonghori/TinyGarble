//////////////////////////////////////////////////////////////////
//                                                              //
//  Amber 2 Core top-Level module                               //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  Instantiates the core consisting of fetch, instruction      //
//  decode, execute, and co-processor.                          //
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


module a23_core
(
input                       i_clk,
input                       i_rst,

output   [31:0]             o_m_address, //data memory
output   [31:0]             o_m_write,
output                      o_m_write_en,
output   [3:0]              o_m_byte_enable,
input    [31:0]             i_m_read,        

output                      terminate
);

wire      [31:0]          execute_address;
wire      [31:0]          execute_address_nxt;  // un-registered version of execute_address to the cache rams
wire      [31:0]          write_data;
wire                      write_enable;
wire      [31:0]          read_data;
wire      [3:0]           byte_enable;
wire                      status_bits_flags_wen;
                 
wire     [31:0]           imm32;                   
wire     [4:0]            imm_shift_amount;   
wire     [3:0]            condition;               
wire     [31:0]           read_data_s2;            
wire     [4:0]            read_data_alignment;     

wire     [3:0]            rm_sel;                  
wire     [3:0]            rds_sel;                 
wire     [3:0]            rn_sel;                  
wire     [3:0]            rm_sel_nxt;
wire     [3:0]            rds_sel_nxt;
wire     [3:0]            rn_sel_nxt;
wire     [1:0]            barrel_shift_amount_sel; 
wire     [1:0]            barrel_shift_data_sel;   
wire     [1:0]            barrel_shift_function; 
wire                      use_carry_in;  
wire     [8:0]            alu_function;            
wire     [1:0]            multiply_function;
wire     [3:0]            address_sel;             
wire     [1:0]            pc_sel;                  
wire     [1:0]            byte_enable_sel;         
wire     [2:0]            status_bits_sel;                
wire     [2:0]            reg_write_sel;
wire                      write_data_wen;
wire                      pc_wen;                  
wire     [14:0]           reg_bank_wen;

wire                      multiply_done;


assign terminate = ({execute_address[31:2], 2'd0} == 32'h00000018) && (execute_address_nxt == 32'h0000001c);

a23_fetch u_fetch (
    .i_clk                              ( i_clk                             ),
    .i_rst                              ( i_rst                             ),

    .i_address                          ( {execute_address[31:2], 2'd0}     ),
    .i_address_nxt                      ( execute_address_nxt               ),
    .i_write_data                       ( write_data                        ),
    .i_write_enable                     ( write_enable                      ),
    .o_read_data                        ( read_data                         ),
    .i_byte_enable                      ( byte_enable                       ),     
    .i_cache_enable                     ( 1'b0                              ),     
    .i_cache_flush                      ( 1'b0                              ), 
    .i_cacheable_area                   ( 32'b0                             ),
    
    .o_m_address                        ( o_m_address                       ),
    .o_m_write                          ( o_m_write                         ),
    .o_m_write_en                       ( o_m_write_en                      ),
    .o_m_byte_enable                    ( o_m_byte_enable                   ),
    .i_m_read                           ( i_m_read                          )
);


a23_decode u_decode (
    .i_clk                              ( i_clk                             ),
    .i_rst                              ( i_rst                             ),
    
    // Instruction fetch or data read signals
    .i_read_data                        ( read_data                         ),                                          
    .i_execute_address                  ( execute_address                   ),                                          
    
    .o_read_data                        ( read_data_s2                      ),                                          
    .o_read_data_alignment              ( read_data_alignment               ),                                          
    .i_multiply_done                    ( multiply_done                     ),  
    .o_imm32                            ( imm32                             ),
    .o_imm_shift_amount                 ( imm_shift_amount                  ),
    .o_condition                        ( condition                         ),
    .o_rm_sel                           ( rm_sel                            ),
    .o_rds_sel                          ( rds_sel                           ),
    .o_rn_sel                           ( rn_sel                            ),
    .o_rm_sel_nxt                       ( rm_sel_nxt                        ),
    .o_rds_sel_nxt                      ( rds_sel_nxt                       ),
    .o_rn_sel_nxt                       ( rn_sel_nxt                        ),
    .o_barrel_shift_amount_sel          ( barrel_shift_amount_sel           ),
    .o_barrel_shift_data_sel            ( barrel_shift_data_sel             ),
    .o_barrel_shift_function            ( barrel_shift_function             ),
    .o_use_carry_in                     ( use_carry_in                      ),
    .o_alu_function                     ( alu_function                      ),
    .o_multiply_function                ( multiply_function                 ),
    .o_address_sel                      ( address_sel                       ),
    .o_pc_sel                           ( pc_sel                            ),
    .o_byte_enable_sel                  ( byte_enable_sel                   ),
    .o_status_bits_sel                  ( status_bits_sel                   ),
    .o_reg_write_sel                    ( reg_write_sel                     ),
    .o_write_data_wen                   ( write_data_wen                    ),
    .o_pc_wen                           ( pc_wen                            ),
    .o_reg_bank_wen                     ( reg_bank_wen                      ),
    .o_status_bits_flags_wen            ( status_bits_flags_wen             )
);


a23_execute u_execute (
    .i_clk                              ( i_clk                             ),
    .i_rst                              ( i_rst                             ),

    .i_read_data                        ( read_data_s2                      ),
    .i_read_data_alignment              ( read_data_alignment               ), 
    
    .o_write_data                       ( write_data                        ),
    .o_address                          ( execute_address                   ),
    .o_address_nxt                      ( execute_address_nxt               ),

    .o_byte_enable                      ( byte_enable                       ),
    .o_write_enable                     ( write_enable                      ),
    .o_multiply_done                    ( multiply_done                     ),   
    .i_imm32                            ( imm32                             ),   
    .i_imm_shift_amount                 ( imm_shift_amount                  ),

    .i_condition                        ( condition                         ),
  
    .i_rm_sel                           ( rm_sel                            ),   
    .i_rds_sel                          ( rds_sel                           ),   
    .i_rn_sel                           ( rn_sel                            ),   
    .i_rm_sel_nxt                       ( rm_sel_nxt                        ),
    .i_rds_sel_nxt                      ( rds_sel_nxt                       ),
    .i_rn_sel_nxt                       ( rn_sel_nxt                        ),
    .i_barrel_shift_amount_sel          ( barrel_shift_amount_sel           ),   
    .i_barrel_shift_data_sel            ( barrel_shift_data_sel             ),   
    .i_barrel_shift_function            ( barrel_shift_function             ),   
    .i_use_carry_in                     ( use_carry_in                      ),
    .i_alu_function                     ( alu_function                      ),   
    .i_multiply_function                ( multiply_function                 ),   
    .i_address_sel                      ( address_sel                       ),   
    .i_pc_sel                           ( pc_sel                            ),   
    .i_byte_enable_sel                  ( byte_enable_sel                   ),   
    .i_status_bits_sel                  ( status_bits_sel                   ),   
    .i_reg_write_sel                    ( reg_write_sel                     ),

    .i_write_data_wen                   ( write_data_wen                    ),      
    .i_pc_wen                           ( pc_wen                            ),   
    .i_reg_bank_wen                     ( reg_bank_wen                      ),
    .i_status_bits_flags_wen            ( status_bits_flags_wen             )
);


endmodule

