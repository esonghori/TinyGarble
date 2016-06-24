
module hamming_N1600_CC1600 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
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
  XOR U15 ( .A(oglobal[9]), .B(n12), .Z(o[9]) );
  XNOR U16 ( .A(oglobal[8]), .B(n13), .Z(o[8]) );
  XNOR U17 ( .A(oglobal[7]), .B(n14), .Z(o[7]) );
  XNOR U18 ( .A(oglobal[6]), .B(n15), .Z(o[6]) );
  XNOR U19 ( .A(oglobal[5]), .B(n16), .Z(o[5]) );
  XNOR U20 ( .A(oglobal[4]), .B(n17), .Z(o[4]) );
  XNOR U21 ( .A(oglobal[3]), .B(n18), .Z(o[3]) );
  XNOR U22 ( .A(oglobal[2]), .B(n19), .Z(o[2]) );
  XNOR U23 ( .A(oglobal[1]), .B(n20), .Z(o[1]) );
  XOR U24 ( .A(n12), .B(n21), .Z(o[10]) );
  XOR U25 ( .A(oglobal[10]), .B(n22), .Z(n21) );
  ANDN U26 ( .A(n12), .B(oglobal[9]), .Z(n22) );
  ANDN U27 ( .A(oglobal[8]), .B(n13), .Z(n12) );
  NANDN U28 ( .B(n14), .A(oglobal[7]), .Z(n13) );
  NANDN U29 ( .B(n15), .A(oglobal[6]), .Z(n14) );
  NANDN U30 ( .B(n16), .A(oglobal[5]), .Z(n15) );
  NANDN U31 ( .B(n17), .A(oglobal[4]), .Z(n16) );
  NANDN U32 ( .B(n18), .A(oglobal[3]), .Z(n17) );
  NANDN U33 ( .B(n19), .A(oglobal[2]), .Z(n18) );
  NANDN U34 ( .B(n20), .A(oglobal[1]), .Z(n19) );
  NANDN U35 ( .B(n23), .A(oglobal[0]), .Z(n20) );
  XNOR U36 ( .A(oglobal[0]), .B(n23), .Z(o[0]) );
  XNOR U37 ( .A(g_input[0]), .B(e_input[0]), .Z(n23) );
endmodule

