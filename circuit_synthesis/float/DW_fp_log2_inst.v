module DW_fp_log2_inst( inst_a, z_inst, status_inst );

parameter sig_width = 10;
parameter exp_width = 5;
parameter ieee_compliance = 0;
parameter extra_prec = 0;
parameter arch = 2;

input [sig_width+exp_width : 0] inst_a;
output [sig_width+exp_width : 0] z_inst;
output [7 : 0] status_inst;

    // Instance of DW_fp_log2
    DW_fp_log2 #(sig_width, exp_width, ieee_compliance, extra_prec, arch)
	  U1 ( .a(inst_a), .z(z_inst), .status(status_inst) );

endmodule
