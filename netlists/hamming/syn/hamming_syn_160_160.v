
module hamming_N160_CC160 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [7:0] oglobal;

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
  XOR U13 ( .A(oglobal[7]), .B(n10), .Z(o[7]) );
  AND U14 ( .A(n11), .B(n12), .Z(n10) );
  AND U15 ( .A(oglobal[3]), .B(n13), .Z(n12) );
  AND U16 ( .A(oglobal[6]), .B(n14), .Z(n11) );
  AND U17 ( .A(oglobal[4]), .B(oglobal[5]), .Z(n14) );
  XOR U18 ( .A(oglobal[6]), .B(n15), .Z(o[6]) );
  ANDN U19 ( .B(oglobal[5]), .A(n16), .Z(n15) );
  XNOR U20 ( .A(oglobal[5]), .B(n16), .Z(o[5]) );
  NANDN U21 ( .A(n17), .B(oglobal[4]), .Z(n16) );
  XNOR U22 ( .A(oglobal[4]), .B(n17), .Z(o[4]) );
  NAND U23 ( .A(n13), .B(oglobal[3]), .Z(n17) );
  XOR U24 ( .A(oglobal[3]), .B(n13), .Z(o[3]) );
  ANDN U25 ( .B(oglobal[2]), .A(n18), .Z(n13) );
  XNOR U26 ( .A(oglobal[2]), .B(n18), .Z(o[2]) );
  NANDN U27 ( .A(n19), .B(oglobal[1]), .Z(n18) );
  XNOR U28 ( .A(oglobal[1]), .B(n19), .Z(o[1]) );
  NANDN U29 ( .A(n20), .B(oglobal[0]), .Z(n19) );
  XNOR U30 ( .A(oglobal[0]), .B(n20), .Z(o[0]) );
  XNOR U31 ( .A(y[0]), .B(x[0]), .Z(n20) );
endmodule

