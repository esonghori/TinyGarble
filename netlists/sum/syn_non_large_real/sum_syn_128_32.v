
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
  XOR U5 ( .A(a[1]), .B(b[1]), .Z(n5) );
  NAND U6 ( .A(a[0]), .B(b[0]), .Z(n3) );
  NAND U7 ( .A(n1), .B(carry_on), .Z(n2) );
  NAND U8 ( .A(n3), .B(n2), .Z(n4) );
  XOR U9 ( .A(n5), .B(n4), .Z(c[1]) );
  XOR U10 ( .A(a[2]), .B(b[2]), .Z(n9) );
  NAND U11 ( .A(a[1]), .B(b[1]), .Z(n7) );
  NAND U12 ( .A(n5), .B(n4), .Z(n6) );
  NAND U13 ( .A(n7), .B(n6), .Z(n8) );
  XOR U14 ( .A(n9), .B(n8), .Z(c[2]) );
  NAND U15 ( .A(a[2]), .B(b[2]), .Z(n11) );
  NAND U16 ( .A(n9), .B(n8), .Z(n10) );
  AND U17 ( .A(n11), .B(n10), .Z(n13) );
  XOR U18 ( .A(a[3]), .B(b[3]), .Z(n12) );
  XNOR U19 ( .A(n13), .B(n12), .Z(c[3]) );
  NAND U20 ( .A(a[3]), .B(b[3]), .Z(n15) );
  NANDN U21 ( .A(n13), .B(n12), .Z(n14) );
  NAND U22 ( .A(n15), .B(n14), .Z(carry_on_d) );
endmodule

