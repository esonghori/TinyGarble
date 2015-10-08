/* sum_N32_CC8 */
module test4 ( clk, rst, g_init, g_input, e_input, o );
  input [3:0] g_input;
  input [3:0] e_input;
  output [3:0] o;
  input clk, rst, g_init;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(g_init), .Q(
        carry_on) );
  XOR U3 ( .A(n8), .B(g_input[1]), .Z(n3) );
  MUX U4 ( .IN0(e_input[2]), .IN1(n7), .SEL(n2), .F(n5) );
  MUX U5 ( .IN0(n5), .IN1(e_input[3]), .SEL(n1), .F(carry_on_d) );
  XOR U6 ( .A(e_input[3]), .B(n1), .Z(o[3]) );
  XNOR U7 ( .A(e_input[2]), .B(n2), .Z(o[2]) );
  XNOR U8 ( .A(e_input[1]), .B(n3), .Z(o[1]) );
  XNOR U9 ( .A(e_input[0]), .B(n4), .Z(o[0]) );
  XOR U10 ( .A(n5), .B(g_input[3]), .Z(n1) );
  XNOR U11 ( .A(n7), .B(g_input[2]), .Z(n2) );
  IV U12 ( .A(n6), .Z(n7) );
  XOR U13 ( .A(n8), .B(n9), .Z(n6) );
  ANDN U14 ( .B(n10), .A(n3), .Z(n9) );
  XNOR U15 ( .A(e_input[1]), .B(n8), .Z(n10) );
  XOR U16 ( .A(n11), .B(carry_on), .Z(n8) );
  NANDN U17 ( .A(n4), .B(n12), .Z(n11) );
  XOR U18 ( .A(e_input[0]), .B(carry_on), .Z(n12) );
  XNOR U19 ( .A(carry_on), .B(g_input[0]), .Z(n4) );
endmodule

