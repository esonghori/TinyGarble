
module compare_N16384_CC16384 ( clk, rst, x, y, g, e );
  input [0:0] x;
  input [0:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n8, n9, n11, n12, n13, n14, n15, n16;

  DFF ebreg_reg ( .D(n9), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n8), .CLK(clk), .RST(rst), .Q(g) );
  ANDN U13 ( .B(x[0]), .A(y[0]), .Z(n11) );
  NANDN U14 ( .A(ebreg), .B(n11), .Z(n15) );
  NANDN U15 ( .A(x[0]), .B(y[0]), .Z(n12) );
  OR U16 ( .A(n12), .B(ebreg), .Z(n13) );
  NAND U17 ( .A(n13), .B(g), .Z(n14) );
  NAND U18 ( .A(n15), .B(n14), .Z(n8) );
  IV U19 ( .A(ebreg), .Z(e) );
  XNOR U20 ( .A(x[0]), .B(y[0]), .Z(n16) );
  NANDN U21 ( .A(ebreg), .B(n16), .Z(n9) );
endmodule

