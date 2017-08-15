`timescale 1ns / 1ps

// Output o = {quotient,remainder}

// Please add +incdir+$SYNOPSYS/dw/sim_ver+ to your verilog simulator
// command line (for simulation).

module div_r(g_input, e_input, o);
  parameter width    = 32;
  parameter tc_mode  = 0;
  parameter rem_mode = 1; // corresponds to "%" in Verilog

  input  [width-1 : 0] g_input;
  input  [width-1 : 0] e_input;
  output [width-1 : 0] o;

  wire   [width-1 : 0] quotient;
  wire   [width-1 : 0] remainder;

  assign o = remainder;
  
  // Instance of DW_fp_div
  // more info: https://www.synopsys.com/dw/ipdir.php?c=DW_fp_div
  DW_div #(width, width, tc_mode, rem_mode)
    U1 (.a(g_input), .b(e_input),
        .quotient(quotient), .remainder(remainder));

endmodule




