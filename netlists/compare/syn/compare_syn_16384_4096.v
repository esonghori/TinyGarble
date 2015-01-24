
module compare_N16384_CC4096 ( clk, rst, x, y, g );
  input [3:0] x;
  input [3:0] y;
  input clk, rst;
  output g;
  wire   ci, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20;

  DFF ci_reg ( .D(g), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  XOR U8 ( .A(y[2]), .B(n11), .Z(n12) );
  XOR U9 ( .A(n6), .B(n7), .Z(g) );
  AND U10 ( .A(n8), .B(n9), .Z(n6) );
  XOR U11 ( .A(x[3]), .B(n7), .Z(n9) );
  XNOR U12 ( .A(y[3]), .B(n7), .Z(n8) );
  XNOR U13 ( .A(n10), .B(n11), .Z(n7) );
  AND U14 ( .A(n12), .B(n13), .Z(n10) );
  XNOR U15 ( .A(x[2]), .B(n11), .Z(n13) );
  XOR U16 ( .A(n14), .B(n15), .Z(n11) );
  AND U17 ( .A(n16), .B(n17), .Z(n14) );
  XNOR U18 ( .A(x[1]), .B(n15), .Z(n17) );
  XOR U19 ( .A(y[1]), .B(n15), .Z(n16) );
  XOR U20 ( .A(ci), .B(n18), .Z(n15) );
  NANDN U21 ( .A(n19), .B(n20), .Z(n18) );
  XOR U22 ( .A(x[0]), .B(ci), .Z(n20) );
  XOR U23 ( .A(y[0]), .B(ci), .Z(n19) );
endmodule

