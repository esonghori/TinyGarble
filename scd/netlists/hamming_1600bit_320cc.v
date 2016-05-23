
module hamming_N1600_CC320 ( clk, rst, g_input, e_input, o );
  input [4:0] g_input;
  input [4:0] e_input;
  output [10:0] o;
  input clk, rst;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41;
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
  MUX U19 ( .IN0(n31), .IN1(n12), .SEL(n24), .F(n27) );
  IV U20 ( .A(oglobal[1]), .Z(n12) );
  MUX U21 ( .IN0(n35), .IN1(n33), .SEL(n34), .F(n13) );
  IV U22 ( .A(n13), .Z(n29) );
  MUX U23 ( .IN0(n14), .IN1(n36), .SEL(n37), .F(n30) );
  IV U24 ( .A(n38), .Z(n14) );
  MUX U25 ( .IN0(n15), .IN1(oglobal[2]), .SEL(n23), .F(n22) );
  IV U26 ( .A(n27), .Z(n15) );
  XNOR U27 ( .A(n32), .B(n29), .Z(n24) );
  XOR U28 ( .A(oglobal[9]), .B(n16), .Z(o[9]) );
  XNOR U29 ( .A(oglobal[8]), .B(n17), .Z(o[8]) );
  XNOR U30 ( .A(oglobal[7]), .B(n18), .Z(o[7]) );
  XNOR U31 ( .A(oglobal[6]), .B(n19), .Z(o[6]) );
  XNOR U32 ( .A(oglobal[5]), .B(n20), .Z(o[5]) );
  XNOR U33 ( .A(oglobal[4]), .B(n21), .Z(o[4]) );
  XOR U34 ( .A(oglobal[3]), .B(n22), .Z(o[3]) );
  XOR U35 ( .A(oglobal[2]), .B(n23), .Z(o[2]) );
  XOR U36 ( .A(oglobal[1]), .B(n24), .Z(o[1]) );
  XOR U37 ( .A(n16), .B(n25), .Z(o[10]) );
  XOR U38 ( .A(oglobal[10]), .B(n26), .Z(n25) );
  ANDN U39 ( .A(n16), .B(oglobal[9]), .Z(n26) );
  ANDN U40 ( .A(oglobal[8]), .B(n17), .Z(n16) );
  NANDN U41 ( .B(n18), .A(oglobal[7]), .Z(n17) );
  NANDN U42 ( .B(n19), .A(oglobal[6]), .Z(n18) );
  NANDN U43 ( .B(n20), .A(oglobal[5]), .Z(n19) );
  NANDN U44 ( .B(n21), .A(oglobal[4]), .Z(n20) );
  NAND U45 ( .A(n22), .B(oglobal[3]), .Z(n21) );
  XNOR U46 ( .A(n27), .B(n28), .Z(n23) );
  ANDN U47 ( .A(n29), .B(n30), .Z(n28) );
  XNOR U48 ( .A(n30), .B(n31), .Z(n32) );
  NAND U49 ( .A(oglobal[0]), .B(n39), .Z(n31) );
  XOR U50 ( .A(oglobal[0]), .B(n39), .Z(o[0]) );
  XOR U51 ( .A(n35), .B(n34), .Z(n39) );
  XNOR U52 ( .A(n40), .B(n33), .Z(n34) );
  XNOR U53 ( .A(g_input[0]), .B(e_input[0]), .Z(n33) );
  XNOR U54 ( .A(g_input[1]), .B(e_input[1]), .Z(n40) );
  XOR U55 ( .A(n38), .B(n37), .Z(n35) );
  XNOR U56 ( .A(n41), .B(n36), .Z(n37) );
  XNOR U57 ( .A(g_input[2]), .B(e_input[2]), .Z(n36) );
  XNOR U58 ( .A(g_input[4]), .B(e_input[4]), .Z(n41) );
  XOR U59 ( .A(g_input[3]), .B(e_input[3]), .Z(n38) );
endmodule

