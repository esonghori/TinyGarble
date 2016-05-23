
module hamming_N16_CC16 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [4:0] o;
  input clk, rst;
  wire   n6, n7, n8, n9, n10, n11;
  wire   [4:0] oglobal;

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
  XOR U9 ( .A(n6), .B(n7), .Z(o[4]) );
  XOR U10 ( .A(oglobal[4]), .B(n8), .Z(n7) );
  ANDN U11 ( .A(n6), .B(oglobal[3]), .Z(n8) );
  XOR U12 ( .A(oglobal[3]), .B(n6), .Z(o[3]) );
  ANDN U13 ( .A(oglobal[2]), .B(n9), .Z(n6) );
  XNOR U14 ( .A(oglobal[2]), .B(n9), .Z(o[2]) );
  NANDN U15 ( .B(n10), .A(oglobal[1]), .Z(n9) );
  XNOR U16 ( .A(oglobal[1]), .B(n10), .Z(o[1]) );
  NANDN U17 ( .B(n11), .A(oglobal[0]), .Z(n10) );
  XNOR U18 ( .A(oglobal[0]), .B(n11), .Z(o[0]) );
  XNOR U19 ( .A(g_input[0]), .B(e_input[0]), .Z(n11) );
endmodule

