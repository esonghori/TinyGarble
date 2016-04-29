
module hamming_N32_CC32 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [5:0] o;
  input clk, rst;
  wire   n7, n8, n9, n10, n11, n12, n13;
  wire   [5:0] oglobal;

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
  XOR U10 ( .A(n7), .B(n8), .Z(o[5]) );
  XOR U11 ( .A(oglobal[5]), .B(n9), .Z(n8) );
  ANDN U12 ( .A(n7), .B(oglobal[4]), .Z(n9) );
  XOR U13 ( .A(oglobal[4]), .B(n7), .Z(o[4]) );
  ANDN U14 ( .A(oglobal[3]), .B(n10), .Z(n7) );
  XNOR U15 ( .A(oglobal[3]), .B(n10), .Z(o[3]) );
  NANDN U16 ( .B(n11), .A(oglobal[2]), .Z(n10) );
  XNOR U17 ( .A(oglobal[2]), .B(n11), .Z(o[2]) );
  NANDN U18 ( .B(n12), .A(oglobal[1]), .Z(n11) );
  XNOR U19 ( .A(oglobal[1]), .B(n12), .Z(o[1]) );
  NANDN U20 ( .B(n13), .A(oglobal[0]), .Z(n12) );
  XNOR U21 ( .A(oglobal[0]), .B(n13), .Z(o[0]) );
  XNOR U22 ( .A(g_input[0]), .B(e_input[0]), .Z(n13) );
endmodule

