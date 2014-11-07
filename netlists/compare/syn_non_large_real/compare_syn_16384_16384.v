
module compare_N16384_CC16384 ( clk, rst, x, y, g, e );
  input [0:0] x;
  input [0:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n7, n8, n10, n11, n12, n13, n14, n15;

  DFF ebreg_reg ( .D(n8), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n7), .CLK(clk), .RST(rst), .Q(g) );
  IV U12 ( .A(ebreg), .Z(e) );
  ANDN U13 ( .B(x[0]), .A(y[0]), .Z(n10) );
  NAND U14 ( .A(e), .B(n10), .Z(n14) );
  NANDN U15 ( .A(x[0]), .B(y[0]), .Z(n11) );
  NANDN U16 ( .A(n11), .B(e), .Z(n12) );
  NAND U17 ( .A(g), .B(n12), .Z(n13) );
  NAND U18 ( .A(n14), .B(n13), .Z(n7) );
  XNOR U19 ( .A(x[0]), .B(y[0]), .Z(n15) );
  NANDN U20 ( .A(ebreg), .B(n15), .Z(n8) );
endmodule

