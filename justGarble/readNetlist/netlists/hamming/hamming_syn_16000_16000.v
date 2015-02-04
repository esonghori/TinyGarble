
module hamming_N16000_CC16000 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
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
  XOR U18 ( .A(n15), .B(n16), .Z(o[13]) );
  XOR U19 ( .A(oglobal[13]), .B(n17), .Z(n16) );
  AND U20 ( .A(n15), .B(o[12]), .Z(n17) );
  XOR U21 ( .A(oglobal[12]), .B(n15), .Z(o[12]) );
  ANDN U22 ( .B(n18), .A(o[11]), .Z(n15) );
  XOR U23 ( .A(oglobal[11]), .B(n18), .Z(o[11]) );
  ANDN U24 ( .B(n19), .A(o[10]), .Z(n18) );
  XOR U25 ( .A(oglobal[10]), .B(n19), .Z(o[10]) );
  ANDN U26 ( .B(n20), .A(o[9]), .Z(n19) );
  XOR U27 ( .A(oglobal[9]), .B(n20), .Z(o[9]) );
  ANDN U28 ( .B(n21), .A(o[8]), .Z(n20) );
  XOR U29 ( .A(oglobal[8]), .B(n21), .Z(o[8]) );
  ANDN U30 ( .B(n22), .A(o[7]), .Z(n21) );
  XOR U31 ( .A(oglobal[7]), .B(n22), .Z(o[7]) );
  ANDN U32 ( .B(n23), .A(o[6]), .Z(n22) );
  XOR U33 ( .A(oglobal[6]), .B(n23), .Z(o[6]) );
  ANDN U34 ( .B(n24), .A(o[5]), .Z(n23) );
  XOR U35 ( .A(oglobal[5]), .B(n24), .Z(o[5]) );
  ANDN U36 ( .B(n25), .A(o[4]), .Z(n24) );
  XOR U37 ( .A(oglobal[4]), .B(n25), .Z(o[4]) );
  ANDN U38 ( .B(n26), .A(o[3]), .Z(n25) );
  XOR U39 ( .A(oglobal[3]), .B(n26), .Z(o[3]) );
  ANDN U40 ( .B(n27), .A(o[2]), .Z(n26) );
  XOR U41 ( .A(oglobal[2]), .B(n27), .Z(o[2]) );
  ANDN U42 ( .B(n28), .A(o[1]), .Z(n27) );
  XOR U43 ( .A(oglobal[1]), .B(n28), .Z(o[1]) );
  ANDN U44 ( .B(oglobal[0]), .A(n29), .Z(n28) );
  XNOR U45 ( .A(oglobal[0]), .B(n29), .Z(o[0]) );
  XNOR U46 ( .A(y[0]), .B(x[0]), .Z(n29) );
endmodule

