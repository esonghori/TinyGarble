
module compare_N16384_CC8192 ( clk, rst, x, y, g );
  input [1:0] x;
  input [1:0] y;
  input clk, rst;
  output g;
  wire   ci, n4, n5, n6, n7, n8, n9, n10, n11;

  DFF ci_reg ( .D(g), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  XOR U6 ( .A(n4), .B(n5), .Z(g) );
  AND U7 ( .A(n6), .B(n7), .Z(n4) );
  XNOR U8 ( .A(x[1]), .B(n8), .Z(n7) );
  XOR U9 ( .A(y[1]), .B(n8), .Z(n6) );
  IV U10 ( .A(n5), .Z(n8) );
  XNOR U11 ( .A(ci), .B(n9), .Z(n5) );
  NANDN U12 ( .A(n10), .B(n11), .Z(n9) );
  XOR U13 ( .A(x[0]), .B(ci), .Z(n11) );
  XOR U14 ( .A(y[0]), .B(ci), .Z(n10) );
endmodule

