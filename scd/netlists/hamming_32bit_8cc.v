
module hamming_N32_CC8 ( clk, rst, g_input, e_input, o );
  input [3:0] g_input;
  input [3:0] e_input;
  output [5:0] o;
  input clk, rst;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29;
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
  MUX U13 ( .IN0(n18), .IN1(n16), .SEL(n17), .F(n11) );
  XOR U14 ( .A(n7), .B(n8), .Z(o[5]) );
  XOR U15 ( .A(oglobal[5]), .B(n9), .Z(n8) );
  AND U16 ( .A(n7), .B(o[4]), .Z(n9) );
  XOR U17 ( .A(n7), .B(oglobal[4]), .Z(o[4]) );
  NOR U18 ( .A(o[3]), .B(n10), .Z(n7) );
  XNOR U19 ( .A(n10), .B(oglobal[3]), .Z(o[3]) );
  XNOR U20 ( .A(n11), .B(n12), .Z(n10) );
  ANDN U21 ( .A(n13), .B(n14), .Z(n12) );
  NANDN U22 ( .B(n11), .A(n15), .Z(n13) );
  XOR U23 ( .A(n15), .B(n14), .Z(o[2]) );
  XNOR U24 ( .A(n11), .B(oglobal[2]), .Z(n14) );
  OR U25 ( .A(n18), .B(n19), .Z(n15) );
  XNOR U26 ( .A(n17), .B(n18), .Z(o[1]) );
  XOR U27 ( .A(n20), .B(n21), .Z(n18) );
  XOR U28 ( .A(n19), .B(n22), .Z(n20) );
  AND U29 ( .A(n23), .B(n24), .Z(n22) );
  XOR U30 ( .A(n21), .B(n25), .Z(n24) );
  OR U31 ( .A(n26), .B(n27), .Z(n19) );
  XNOR U32 ( .A(n16), .B(oglobal[1]), .Z(n17) );
  AND U33 ( .A(n27), .B(oglobal[0]), .Z(n16) );
  XOR U34 ( .A(oglobal[0]), .B(n27), .Z(o[0]) );
  XOR U35 ( .A(n28), .B(n25), .Z(n27) );
  XNOR U36 ( .A(g_input[3]), .B(e_input[3]), .Z(n25) );
  XOR U37 ( .A(n23), .B(n26), .Z(n28) );
  XNOR U38 ( .A(g_input[0]), .B(e_input[0]), .Z(n26) );
  XOR U39 ( .A(n29), .B(n21), .Z(n23) );
  XNOR U40 ( .A(g_input[1]), .B(e_input[1]), .Z(n21) );
  XNOR U41 ( .A(g_input[2]), .B(e_input[2]), .Z(n29) );
endmodule

