
module sum_N1024_CC512 ( clk, rst, a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [1:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n10, n11, n12, n13, n14, n15, n16;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  NAND U15 ( .A(b[1]), .B(a[1]), .Z(n10) );
  NANDN U16 ( .A(n15), .B(n16), .Z(n11) );
  NAND U17 ( .A(n10), .B(n11), .Z(carry_on_d) );
  XOR U18 ( .A(b[0]), .B(a[0]), .Z(n12) );
  XOR U19 ( .A(n12), .B(carry_on), .Z(c[0]) );
  NAND U20 ( .A(b[0]), .B(a[0]), .Z(n14) );
  NAND U21 ( .A(n12), .B(carry_on), .Z(n13) );
  AND U22 ( .A(n14), .B(n13), .Z(n15) );
  XOR U23 ( .A(b[1]), .B(a[1]), .Z(n16) );
  XNOR U24 ( .A(n15), .B(n16), .Z(c[1]) );
endmodule

