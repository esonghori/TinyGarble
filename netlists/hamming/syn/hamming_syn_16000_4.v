
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89;
  wire   [10:0] oglobal;

  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[0]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[1]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[2]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[3]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[4]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[5]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[6]) );
  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[7]) );
  DFF \oglobal_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[8]) );
  DFF \oglobal_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[9]) );
  DFF \oglobal_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[10]) );
  XNOR U82 ( .A(oglobal[9]), .B(n79), .Z(o[9]) );
  XNOR U83 ( .A(oglobal[8]), .B(n80), .Z(o[8]) );
  XNOR U84 ( .A(oglobal[7]), .B(n81), .Z(o[7]) );
  XNOR U85 ( .A(oglobal[6]), .B(n82), .Z(o[6]) );
  XNOR U86 ( .A(oglobal[5]), .B(n83), .Z(o[5]) );
  XNOR U87 ( .A(oglobal[4]), .B(n84), .Z(o[4]) );
  XNOR U88 ( .A(oglobal[3]), .B(n85), .Z(o[3]) );
  XNOR U89 ( .A(oglobal[2]), .B(n86), .Z(o[2]) );
  XNOR U90 ( .A(oglobal[1]), .B(n87), .Z(o[1]) );
  XOR U91 ( .A(oglobal[10]), .B(n88), .Z(o[10]) );
  ANDN U92 ( .B(oglobal[9]), .A(n79), .Z(n88) );
  NANDN U93 ( .A(n80), .B(oglobal[8]), .Z(n79) );
  NANDN U94 ( .A(n81), .B(oglobal[7]), .Z(n80) );
  NANDN U95 ( .A(n82), .B(oglobal[6]), .Z(n81) );
  NANDN U96 ( .A(n83), .B(oglobal[5]), .Z(n82) );
  NANDN U97 ( .A(n84), .B(oglobal[4]), .Z(n83) );
  NANDN U98 ( .A(n85), .B(oglobal[3]), .Z(n84) );
  NANDN U99 ( .A(n86), .B(oglobal[2]), .Z(n85) );
  NANDN U100 ( .A(n87), .B(oglobal[1]), .Z(n86) );
  NANDN U101 ( .A(n89), .B(oglobal[0]), .Z(n87) );
  XNOR U102 ( .A(oglobal[0]), .B(n89), .Z(o[0]) );
  XNOR U103 ( .A(y[0]), .B(x[0]), .Z(n89) );
endmodule

