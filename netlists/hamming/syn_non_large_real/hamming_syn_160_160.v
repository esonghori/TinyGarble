
module hamming_N160_CC160 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:0] oglobal;

  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  NANDN U5 ( .A(n9), .B(oglobal[6]), .Z(n2) );
  XNOR U6 ( .A(oglobal[7]), .B(n2), .Z(o[7]) );
  XOR U7 ( .A(x[0]), .B(y[0]), .Z(n3) );
  XOR U8 ( .A(n3), .B(oglobal[0]), .Z(o[0]) );
  AND U9 ( .A(n3), .B(oglobal[0]), .Z(n4) );
  XOR U10 ( .A(n4), .B(oglobal[1]), .Z(o[1]) );
  AND U11 ( .A(n4), .B(oglobal[1]), .Z(n5) );
  XOR U12 ( .A(n5), .B(oglobal[2]), .Z(o[2]) );
  AND U13 ( .A(n5), .B(oglobal[2]), .Z(n6) );
  XOR U14 ( .A(n6), .B(oglobal[3]), .Z(o[3]) );
  AND U15 ( .A(n6), .B(oglobal[3]), .Z(n7) );
  XOR U16 ( .A(n7), .B(oglobal[4]), .Z(o[4]) );
  AND U17 ( .A(n7), .B(oglobal[4]), .Z(n8) );
  XOR U18 ( .A(n8), .B(oglobal[5]), .Z(o[5]) );
  NAND U19 ( .A(n8), .B(oglobal[5]), .Z(n9) );
  XNOR U20 ( .A(oglobal[6]), .B(n9), .Z(o[6]) );
endmodule

