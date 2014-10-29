
module sum_N256_CC128 ( clk, rst, a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [1:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n11, n12, n13, n14, n15, n16, n17;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U16 ( .A(b[0]), .B(a[0]), .Z(n11) );
  XOR U17 ( .A(n11), .B(carry_on), .Z(c[0]) );
  NAND U18 ( .A(a[0]), .B(b[0]), .Z(n13) );
  NAND U19 ( .A(carry_on), .B(n11), .Z(n12) );
  NAND U20 ( .A(n13), .B(n12), .Z(n14) );
  XOR U21 ( .A(b[1]), .B(a[1]), .Z(n15) );
  XOR U22 ( .A(n14), .B(n15), .Z(c[1]) );
  NAND U23 ( .A(a[1]), .B(b[1]), .Z(n17) );
  NAND U24 ( .A(n15), .B(n14), .Z(n16) );
  NAND U25 ( .A(n17), .B(n16), .Z(carry_on_d) );
endmodule

