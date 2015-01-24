
module compare_N16384_CC16384 ( clk, rst, x, y, g );
  input [0:0] x;
  input [0:0] y;
  input clk, rst;
  output g;
  wire   ci, n3, n4, n5;

  DFF ci_reg ( .D(g), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  XOR U5 ( .A(ci), .B(n3), .Z(g) );
  ANDN U6 ( .B(n4), .A(n5), .Z(n3) );
  XOR U7 ( .A(y[0]), .B(ci), .Z(n5) );
  XOR U8 ( .A(x[0]), .B(ci), .Z(n4) );
endmodule

