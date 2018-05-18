module fp_sqrt(g_input, e_input, o); 
// first three bits of g_input and e_input are for inst_rnd


parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;


input [inst_sig_width+inst_exp_width + 3: 0] g_input;
input [inst_sig_width+inst_exp_width + 3: 0] e_input;

output [inst_sig_width+inst_exp_width : 0] o;

wire [inst_sig_width+inst_exp_width : 0] inst_a;
wire [2 : 0] inst_rnd;

assign inst_rnd = g_input[inst_sig_width+inst_exp_width + 3:inst_sig_width+inst_exp_width+1] ^ e_input[inst_sig_width+inst_exp_width + 3:inst_sig_width+inst_exp_width+1];
assign inst_a = g_input[inst_sig_width+inst_exp_width:0] ^ e_input[inst_sig_width+inst_exp_width:0];
  // Instance of DW_fp_sqrt
  DW_fp_sqrt #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (
                      .a(inst_a),
                      .rnd(inst_rnd),
                      .z(o),
                      .status() );

endmodule
