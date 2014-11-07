
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [10:0] oglobal;

  DFF \oglobal_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .Q(oglobal[10]) );
  DFF \oglobal_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .Q(oglobal[9]) );
  DFF \oglobal_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .Q(oglobal[8]) );
  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  XNOR U5 ( .A(x[0]), .B(y[0]), .Z(n2) );
  XNOR U6 ( .A(n2), .B(oglobal[0]), .Z(o[0]) );
  NANDN U7 ( .A(n2), .B(oglobal[0]), .Z(n4) );
  NANDN U8 ( .A(n4), .B(oglobal[1]), .Z(n5) );
  NANDN U9 ( .A(n5), .B(oglobal[2]), .Z(n6) );
  NANDN U10 ( .A(n6), .B(oglobal[3]), .Z(n7) );
  NANDN U11 ( .A(n7), .B(oglobal[4]), .Z(n8) );
  NANDN U12 ( .A(n8), .B(oglobal[5]), .Z(n9) );
  NANDN U13 ( .A(n9), .B(oglobal[6]), .Z(n10) );
  NANDN U14 ( .A(n10), .B(oglobal[7]), .Z(n11) );
  NANDN U15 ( .A(n11), .B(oglobal[8]), .Z(n12) );
  NANDN U16 ( .A(n12), .B(oglobal[9]), .Z(n3) );
  XNOR U17 ( .A(oglobal[10]), .B(n3), .Z(o[10]) );
  XNOR U18 ( .A(n4), .B(oglobal[1]), .Z(o[1]) );
  XNOR U19 ( .A(n5), .B(oglobal[2]), .Z(o[2]) );
  XNOR U20 ( .A(n6), .B(oglobal[3]), .Z(o[3]) );
  XNOR U21 ( .A(n7), .B(oglobal[4]), .Z(o[4]) );
  XNOR U22 ( .A(n8), .B(oglobal[5]), .Z(o[5]) );
  XNOR U23 ( .A(n9), .B(oglobal[6]), .Z(o[6]) );
  XNOR U24 ( .A(n10), .B(oglobal[7]), .Z(o[7]) );
  XNOR U25 ( .A(n11), .B(oglobal[8]), .Z(o[8]) );
  XNOR U26 ( .A(n12), .B(oglobal[9]), .Z(o[9]) );
endmodule

