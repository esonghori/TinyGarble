
module hamming_N160_CC160 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17;
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
  XOR U12 ( .A(n9), .B(n10), .Z(o[7]) );
  XOR U13 ( .A(oglobal[7]), .B(n11), .Z(n10) );
  AND U14 ( .A(n9), .B(o[6]), .Z(n11) );
  XOR U15 ( .A(n9), .B(oglobal[6]), .Z(o[6]) );
  ANDN U16 ( .B(n12), .A(o[5]), .Z(n9) );
  XOR U17 ( .A(n12), .B(oglobal[5]), .Z(o[5]) );
  ANDN U18 ( .B(n13), .A(o[4]), .Z(n12) );
  XOR U19 ( .A(n13), .B(oglobal[4]), .Z(o[4]) );
  ANDN U20 ( .B(n14), .A(o[3]), .Z(n13) );
  XOR U21 ( .A(n14), .B(oglobal[3]), .Z(o[3]) );
  ANDN U22 ( .B(n15), .A(o[2]), .Z(n14) );
  XOR U23 ( .A(n15), .B(oglobal[2]), .Z(o[2]) );
  ANDN U24 ( .B(n16), .A(o[1]), .Z(n15) );
  XOR U25 ( .A(n16), .B(oglobal[1]), .Z(o[1]) );
  ANDN U26 ( .B(oglobal[0]), .A(n17), .Z(n16) );
  XNOR U27 ( .A(oglobal[0]), .B(n17), .Z(o[0]) );
  XNOR U28 ( .A(y[0]), .B(x[0]), .Z(n17) );
endmodule

