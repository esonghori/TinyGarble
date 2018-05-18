module fp_exp (g_input, e_input, o);

parameter sig_width = 23;
parameter exp_width = 8;
parameter ieee_compliance = 0;
parameter extra_prec = 0;
parameter arch = 2;

input  [sig_width+exp_width : 0] g_input;
input  [sig_width+exp_width : 0] e_input;
wire   [sig_width+exp_width : 0] num;
output [sig_width+exp_width : 0] o;

assign num = g_input ^ e_input;

    // Instance of DW_fp_log2
    DW_fp_exp #(sig_width, exp_width, ieee_compliance, extra_prec, arch)
	  U1 ( .a(num), .z(o), .status() );

endmodule
