`timescale 1ns / 1ps
// synopsys_ template

module float_cmp(g_input, e_input, o);
  parameter sig_width = 23;
  parameter exp_width = 8;
  parameter ieee_compliance = 0;

  input  [sig_width+exp_width:0] g_input;
  input  [sig_width+exp_width:0] e_input;
  output [3:0] o; // {aeqb_inst, altb_inst, agtb_inst, unordered_inst}


  wire aeqb_inst;
  wire altb_inst;
  wire agtb_inst;
  wire unordered_inst;

  assign o = {aeqb_inst, altb_inst, agtb_inst, unordered_inst};

  // Instance of DW_fp_cmp
  // more info: https://www.synopsys.com/dw/ipdir.php?c=DW_fp_cmp
  DW_fp_cmp
  #(
    sig_width,
    exp_width,
    ieee_compliance
  )
  U1
  (
    .a(g_input),
    .b(e_input),
    .zctr(1'b0),
    .aeqb(aeqb_inst),
    .altb(altb_inst),
    .agtb(agtb_inst),
    .unordered(unordered_inst),
    .z0(),
    .z1(),
    .status0(),
	  .status1()
  );

endmodule
