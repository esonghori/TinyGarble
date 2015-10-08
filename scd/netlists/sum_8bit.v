
module sum_8bit ( clk, rst, g_init, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst, g_init;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;

  MUX U2 ( .IN0(e_input[4]), .IN1(n7), .SEL(n8), .F(n5) );
  XNOR U3 ( .A(n7), .B(g_input[4]), .Z(n8) );
  MUX U4 ( .IN0(e_input[1]), .IN1(n17), .SEL(n18), .F(n13) );
  XNOR U5 ( .A(n5), .B(g_input[5]), .Z(n6) );
  XNOR U6 ( .A(n13), .B(g_input[2]), .Z(n16) );
  MUX U7 ( .IN0(e_input[5]), .IN1(n5), .SEL(n6), .F(n3) );
  XNOR U8 ( .A(n9), .B(g_input[3]), .Z(n12) );
  MUX U9 ( .IN0(e_input[6]), .IN1(n3), .SEL(n4), .F(n2) );
  XOR U10 ( .A(n1), .B(n2), .Z(o[7]) );
  XOR U11 ( .A(g_input[7]), .B(e_input[7]), .Z(n1) );
  XNOR U12 ( .A(e_input[6]), .B(n4), .Z(o[6]) );
  XNOR U13 ( .A(n3), .B(g_input[6]), .Z(n4) );
  XNOR U14 ( .A(e_input[5]), .B(n6), .Z(o[5]) );
  XNOR U15 ( .A(e_input[4]), .B(n8), .Z(o[4]) );
  XOR U16 ( .A(n9), .B(n10), .Z(n7) );
  ANDN U17 ( .B(n11), .A(n12), .Z(n10) );
  XOR U18 ( .A(e_input[3]), .B(n9), .Z(n11) );
  XNOR U19 ( .A(e_input[3]), .B(n12), .Z(o[3]) );
  XOR U20 ( .A(n13), .B(n14), .Z(n9) );
  ANDN U21 ( .B(n15), .A(n16), .Z(n14) );
  XOR U22 ( .A(e_input[2]), .B(n13), .Z(n15) );
  XNOR U23 ( .A(e_input[2]), .B(n16), .Z(o[2]) );
  XNOR U24 ( .A(e_input[1]), .B(n18), .Z(o[1]) );
  XNOR U25 ( .A(n17), .B(g_input[1]), .Z(n18) );
  AND U26 ( .A(g_input[0]), .B(e_input[0]), .Z(n17) );
  XOR U27 ( .A(g_input[0]), .B(e_input[0]), .Z(o[0]) );
endmodule


