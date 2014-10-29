
module sum_N128_CC32 ( clk, rst, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [3:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(a[0]), .B(b[0]), .Z(n1) );
  XOR U4 ( .A(n1), .B(carry_on), .Z(c[0]) );
  XOR U5 ( .A(a[1]), .B(b[1]), .Z(n4) );
  NAND U6 ( .A(b[0]), .B(a[0]), .Z(n3) );
  NAND U7 ( .A(carry_on), .B(n1), .Z(n2) );
  AND U8 ( .A(n3), .B(n2), .Z(n5) );
  XNOR U9 ( .A(n4), .B(n5), .Z(c[1]) );
  XOR U10 ( .A(a[2]), .B(b[2]), .Z(n8) );
  NAND U11 ( .A(b[1]), .B(a[1]), .Z(n7) );
  NANDN U12 ( .A(n5), .B(n4), .Z(n6) );
  AND U13 ( .A(n7), .B(n6), .Z(n9) );
  XNOR U14 ( .A(n8), .B(n9), .Z(c[2]) );
  NAND U15 ( .A(b[2]), .B(a[2]), .Z(n11) );
  NANDN U16 ( .A(n9), .B(n8), .Z(n10) );
  NAND U17 ( .A(n11), .B(n10), .Z(n12) );
  XOR U18 ( .A(a[3]), .B(b[3]), .Z(n13) );
  XOR U19 ( .A(n12), .B(n13), .Z(c[3]) );
  NAND U20 ( .A(b[3]), .B(a[3]), .Z(n15) );
  NAND U21 ( .A(n13), .B(n12), .Z(n14) );
  NAND U22 ( .A(n15), .B(n14), .Z(carry_on_d) );
endmodule

