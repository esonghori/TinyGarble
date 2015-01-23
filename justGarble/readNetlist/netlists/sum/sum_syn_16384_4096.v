
module sum_N16384_CC4096 ( clk, rst, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [3:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XOR U4 ( .A(n2), .B(n3), .Z(carry_on_d) );
  ANDN U5 ( .B(n4), .A(n5), .Z(n2) );
  XOR U6 ( .A(b[3]), .B(n3), .Z(n4) );
  XNOR U7 ( .A(b[3]), .B(n5), .Z(c[3]) );
  XNOR U8 ( .A(a[3]), .B(n3), .Z(n5) );
  XNOR U9 ( .A(n6), .B(n7), .Z(n3) );
  ANDN U10 ( .B(n8), .A(n9), .Z(n6) );
  XNOR U11 ( .A(b[2]), .B(n7), .Z(n8) );
  XNOR U12 ( .A(b[2]), .B(n9), .Z(c[2]) );
  XNOR U13 ( .A(a[2]), .B(n10), .Z(n9) );
  IV U14 ( .A(n7), .Z(n10) );
  XOR U15 ( .A(n11), .B(n12), .Z(n7) );
  ANDN U16 ( .B(n13), .A(n14), .Z(n11) );
  XNOR U17 ( .A(b[1]), .B(n12), .Z(n13) );
  XNOR U18 ( .A(b[1]), .B(n14), .Z(c[1]) );
  XNOR U19 ( .A(a[1]), .B(n15), .Z(n14) );
  IV U20 ( .A(n12), .Z(n15) );
  XOR U21 ( .A(carry_on), .B(n16), .Z(n12) );
  NANDN U22 ( .A(n17), .B(n18), .Z(n16) );
  XOR U23 ( .A(carry_on), .B(b[0]), .Z(n18) );
  XNOR U24 ( .A(b[0]), .B(n17), .Z(c[0]) );
  XNOR U25 ( .A(a[0]), .B(carry_on), .Z(n17) );
endmodule

