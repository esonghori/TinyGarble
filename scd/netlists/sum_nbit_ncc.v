
module sum_N32_CC32 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [0:0] o;
  input clk, rst;
  wire   carry_on, carry_on_d, n5, n6, n7;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XNOR U9 ( .A(g_input[0]), .B(n5), .Z(o[0]) );
  NAND U10 ( .A(n6), .B(n7), .Z(carry_on_d) );
  NANDN U11 ( .B(n5), .A(g_input[0]), .Z(n7) );
  XNOR U12 ( .A(carry_on), .B(e_input[0]), .Z(n5) );
  NAND U13 ( .A(carry_on), .B(e_input[0]), .Z(n6) );
endmodule

