
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23;
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
  XOR U15 ( .A(n12), .B(n13), .Z(o[10]) );
  XOR U16 ( .A(oglobal[10]), .B(n14), .Z(n13) );
  AND U17 ( .A(n12), .B(o[9]), .Z(n14) );
  XOR U18 ( .A(n12), .B(oglobal[9]), .Z(o[9]) );
  ANDN U19 ( .B(n15), .A(o[8]), .Z(n12) );
  XOR U20 ( .A(n15), .B(oglobal[8]), .Z(o[8]) );
  ANDN U21 ( .B(n16), .A(o[7]), .Z(n15) );
  XOR U22 ( .A(n16), .B(oglobal[7]), .Z(o[7]) );
  ANDN U23 ( .B(n17), .A(o[6]), .Z(n16) );
  XOR U24 ( .A(n17), .B(oglobal[6]), .Z(o[6]) );
  ANDN U25 ( .B(n18), .A(o[5]), .Z(n17) );
  XOR U26 ( .A(n18), .B(oglobal[5]), .Z(o[5]) );
  ANDN U27 ( .B(n19), .A(o[4]), .Z(n18) );
  XOR U28 ( .A(n19), .B(oglobal[4]), .Z(o[4]) );
  ANDN U29 ( .B(n20), .A(o[3]), .Z(n19) );
  XOR U30 ( .A(n20), .B(oglobal[3]), .Z(o[3]) );
  ANDN U31 ( .B(n21), .A(o[2]), .Z(n20) );
  XOR U32 ( .A(n21), .B(oglobal[2]), .Z(o[2]) );
  ANDN U33 ( .B(n22), .A(o[1]), .Z(n21) );
  XOR U34 ( .A(n22), .B(oglobal[1]), .Z(o[1]) );
  ANDN U35 ( .B(oglobal[0]), .A(n23), .Z(n22) );
  XNOR U36 ( .A(oglobal[0]), .B(n23), .Z(o[0]) );
  XNOR U37 ( .A(y[0]), .B(x[0]), .Z(n23) );
endmodule

