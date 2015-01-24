
module sum_N256_CC64 ( clk, rst, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [3:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(a[1]), .B(n10), .Z(n12) );
  XOR U4 ( .A(a[2]), .B(n6), .Z(n8) );
  XOR U5 ( .A(n1), .B(n2), .Z(carry_on_d) );
  ANDN U6 ( .B(n3), .A(n4), .Z(n1) );
  XOR U7 ( .A(b[3]), .B(n2), .Z(n3) );
  XNOR U8 ( .A(b[3]), .B(n4), .Z(c[3]) );
  XNOR U9 ( .A(a[3]), .B(n2), .Z(n4) );
  XNOR U10 ( .A(n5), .B(n6), .Z(n2) );
  ANDN U11 ( .B(n7), .A(n8), .Z(n5) );
  XNOR U12 ( .A(b[2]), .B(n6), .Z(n7) );
  XNOR U13 ( .A(b[2]), .B(n8), .Z(c[2]) );
  XOR U14 ( .A(n9), .B(n10), .Z(n6) );
  ANDN U15 ( .B(n11), .A(n12), .Z(n9) );
  XNOR U16 ( .A(b[1]), .B(n10), .Z(n11) );
  XNOR U17 ( .A(b[1]), .B(n12), .Z(c[1]) );
  XOR U18 ( .A(carry_on), .B(n13), .Z(n10) );
  NANDN U19 ( .A(n14), .B(n15), .Z(n13) );
  XOR U20 ( .A(carry_on), .B(b[0]), .Z(n15) );
  XNOR U21 ( .A(b[0]), .B(n14), .Z(c[0]) );
  XNOR U22 ( .A(a[0]), .B(carry_on), .Z(n14) );
endmodule

