
module hamming_N16000_CC16000 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [13:0] o;
  input clk, rst;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29;
  wire   [13:0] oglobal;

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
  DFF \oglobal_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[11]) );
  DFF \oglobal_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[12]) );
  DFF \oglobal_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[13]) );
  XNOR U18 ( .A(oglobal[9]), .B(n15), .Z(o[9]) );
  XNOR U19 ( .A(oglobal[8]), .B(n16), .Z(o[8]) );
  XNOR U20 ( .A(oglobal[7]), .B(n17), .Z(o[7]) );
  XNOR U21 ( .A(oglobal[6]), .B(n18), .Z(o[6]) );
  XNOR U22 ( .A(oglobal[5]), .B(n19), .Z(o[5]) );
  XNOR U23 ( .A(oglobal[4]), .B(n20), .Z(o[4]) );
  XNOR U24 ( .A(oglobal[3]), .B(n21), .Z(o[3]) );
  XNOR U25 ( .A(oglobal[2]), .B(n22), .Z(o[2]) );
  XNOR U26 ( .A(oglobal[1]), .B(n23), .Z(o[1]) );
  XOR U27 ( .A(n24), .B(n25), .Z(o[13]) );
  XOR U28 ( .A(oglobal[13]), .B(n26), .Z(n25) );
  ANDN U29 ( .A(n24), .B(oglobal[12]), .Z(n26) );
  XOR U30 ( .A(oglobal[12]), .B(n24), .Z(o[12]) );
  ANDN U31 ( .A(oglobal[11]), .B(n27), .Z(n24) );
  XNOR U32 ( .A(oglobal[11]), .B(n27), .Z(o[11]) );
  NANDN U33 ( .B(n28), .A(oglobal[10]), .Z(n27) );
  XNOR U34 ( .A(oglobal[10]), .B(n28), .Z(o[10]) );
  NANDN U35 ( .B(n15), .A(oglobal[9]), .Z(n28) );
  NANDN U36 ( .B(n16), .A(oglobal[8]), .Z(n15) );
  NANDN U37 ( .B(n17), .A(oglobal[7]), .Z(n16) );
  NANDN U38 ( .B(n18), .A(oglobal[6]), .Z(n17) );
  NANDN U39 ( .B(n19), .A(oglobal[5]), .Z(n18) );
  NANDN U40 ( .B(n20), .A(oglobal[4]), .Z(n19) );
  NANDN U41 ( .B(n21), .A(oglobal[3]), .Z(n20) );
  NANDN U42 ( .B(n22), .A(oglobal[2]), .Z(n21) );
  NANDN U43 ( .B(n23), .A(oglobal[1]), .Z(n22) );
  NANDN U44 ( .B(n29), .A(oglobal[0]), .Z(n23) );
  XNOR U45 ( .A(oglobal[0]), .B(n29), .Z(o[0]) );
  XNOR U46 ( .A(g_input[0]), .B(e_input[0]), .Z(n29) );
endmodule

