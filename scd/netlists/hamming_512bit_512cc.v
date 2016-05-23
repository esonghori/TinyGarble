
module hamming_N512_CC512 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [9:0] o;
  input clk, rst;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;
  wire   [9:0] oglobal;

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
  XOR U14 ( .A(n11), .B(n12), .Z(o[9]) );
  XOR U15 ( .A(oglobal[9]), .B(n13), .Z(n12) );
  ANDN U16 ( .A(n11), .B(oglobal[8]), .Z(n13) );
  XOR U17 ( .A(oglobal[8]), .B(n11), .Z(o[8]) );
  ANDN U18 ( .A(oglobal[7]), .B(n14), .Z(n11) );
  XNOR U19 ( .A(oglobal[7]), .B(n14), .Z(o[7]) );
  NANDN U20 ( .B(n15), .A(oglobal[6]), .Z(n14) );
  XNOR U21 ( .A(oglobal[6]), .B(n15), .Z(o[6]) );
  NANDN U22 ( .B(n16), .A(oglobal[5]), .Z(n15) );
  XNOR U23 ( .A(oglobal[5]), .B(n16), .Z(o[5]) );
  NANDN U24 ( .B(n17), .A(oglobal[4]), .Z(n16) );
  XNOR U25 ( .A(oglobal[4]), .B(n17), .Z(o[4]) );
  NANDN U26 ( .B(n18), .A(oglobal[3]), .Z(n17) );
  XNOR U27 ( .A(oglobal[3]), .B(n18), .Z(o[3]) );
  NANDN U28 ( .B(n19), .A(oglobal[2]), .Z(n18) );
  XNOR U29 ( .A(oglobal[2]), .B(n19), .Z(o[2]) );
  NANDN U30 ( .B(n20), .A(oglobal[1]), .Z(n19) );
  XNOR U31 ( .A(oglobal[1]), .B(n20), .Z(o[1]) );
  NANDN U32 ( .B(n21), .A(oglobal[0]), .Z(n20) );
  XNOR U33 ( .A(oglobal[0]), .B(n21), .Z(o[0]) );
  XNOR U34 ( .A(g_input[0]), .B(e_input[0]), .Z(n21) );
endmodule

