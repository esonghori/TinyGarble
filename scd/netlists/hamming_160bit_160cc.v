
module hamming_N160_CC160 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
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
  ANDN U14 ( .A(n9), .B(oglobal[6]), .Z(n11) );
  XOR U15 ( .A(oglobal[6]), .B(n9), .Z(o[6]) );
  ANDN U16 ( .A(oglobal[5]), .B(n12), .Z(n9) );
  XNOR U17 ( .A(oglobal[5]), .B(n12), .Z(o[5]) );
  NANDN U18 ( .B(n13), .A(oglobal[4]), .Z(n12) );
  XNOR U19 ( .A(oglobal[4]), .B(n13), .Z(o[4]) );
  NANDN U20 ( .B(n14), .A(oglobal[3]), .Z(n13) );
  XNOR U21 ( .A(oglobal[3]), .B(n14), .Z(o[3]) );
  NANDN U22 ( .B(n15), .A(oglobal[2]), .Z(n14) );
  XNOR U23 ( .A(oglobal[2]), .B(n15), .Z(o[2]) );
  NANDN U24 ( .B(n16), .A(oglobal[1]), .Z(n15) );
  XNOR U25 ( .A(oglobal[1]), .B(n16), .Z(o[1]) );
  NANDN U26 ( .B(n17), .A(oglobal[0]), .Z(n16) );
  XNOR U27 ( .A(oglobal[0]), .B(n17), .Z(o[0]) );
  XNOR U28 ( .A(g_input[0]), .B(e_input[0]), .Z(n17) );
endmodule

