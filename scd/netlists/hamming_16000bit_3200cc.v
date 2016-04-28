
module hamming_N16000_CC3200 ( clk, rst, g_input, e_input, o );
  input [4:0] g_input;
  input [4:0] e_input;
  output [13:0] o;
  input clk, rst;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47;
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
  MUX U22 ( .IN0(n37), .IN1(n15), .SEL(n27), .F(n33) );
  IV U23 ( .A(oglobal[1]), .Z(n15) );
  MUX U24 ( .IN0(n41), .IN1(n39), .SEL(n40), .F(n16) );
  IV U25 ( .A(n16), .Z(n35) );
  MUX U26 ( .IN0(n17), .IN1(n42), .SEL(n43), .F(n36) );
  IV U27 ( .A(n44), .Z(n17) );
  MUX U28 ( .IN0(n18), .IN1(oglobal[2]), .SEL(n26), .F(n25) );
  IV U29 ( .A(n33), .Z(n18) );
  XNOR U30 ( .A(n38), .B(n35), .Z(n27) );
  XNOR U31 ( .A(oglobal[9]), .B(n19), .Z(o[9]) );
  XNOR U32 ( .A(oglobal[8]), .B(n20), .Z(o[8]) );
  XNOR U33 ( .A(oglobal[7]), .B(n21), .Z(o[7]) );
  XNOR U34 ( .A(oglobal[6]), .B(n22), .Z(o[6]) );
  XNOR U35 ( .A(oglobal[5]), .B(n23), .Z(o[5]) );
  XNOR U36 ( .A(oglobal[4]), .B(n24), .Z(o[4]) );
  XOR U37 ( .A(oglobal[3]), .B(n25), .Z(o[3]) );
  XOR U38 ( .A(oglobal[2]), .B(n26), .Z(o[2]) );
  XOR U39 ( .A(oglobal[1]), .B(n27), .Z(o[1]) );
  XOR U40 ( .A(n28), .B(n29), .Z(o[13]) );
  XOR U41 ( .A(oglobal[13]), .B(n30), .Z(n29) );
  ANDN U42 ( .A(n28), .B(oglobal[12]), .Z(n30) );
  XOR U43 ( .A(oglobal[12]), .B(n28), .Z(o[12]) );
  ANDN U44 ( .A(oglobal[11]), .B(n31), .Z(n28) );
  XNOR U45 ( .A(oglobal[11]), .B(n31), .Z(o[11]) );
  NANDN U46 ( .B(n32), .A(oglobal[10]), .Z(n31) );
  XNOR U47 ( .A(oglobal[10]), .B(n32), .Z(o[10]) );
  NANDN U48 ( .B(n19), .A(oglobal[9]), .Z(n32) );
  NANDN U49 ( .B(n20), .A(oglobal[8]), .Z(n19) );
  NANDN U50 ( .B(n21), .A(oglobal[7]), .Z(n20) );
  NANDN U51 ( .B(n22), .A(oglobal[6]), .Z(n21) );
  NANDN U52 ( .B(n23), .A(oglobal[5]), .Z(n22) );
  NANDN U53 ( .B(n24), .A(oglobal[4]), .Z(n23) );
  NAND U54 ( .A(n25), .B(oglobal[3]), .Z(n24) );
  XNOR U55 ( .A(n33), .B(n34), .Z(n26) );
  ANDN U56 ( .A(n35), .B(n36), .Z(n34) );
  XNOR U57 ( .A(n36), .B(n37), .Z(n38) );
  NAND U58 ( .A(oglobal[0]), .B(n45), .Z(n37) );
  XOR U59 ( .A(oglobal[0]), .B(n45), .Z(o[0]) );
  XOR U60 ( .A(n41), .B(n40), .Z(n45) );
  XNOR U61 ( .A(n46), .B(n39), .Z(n40) );
  XNOR U62 ( .A(g_input[0]), .B(e_input[0]), .Z(n39) );
  XNOR U63 ( .A(g_input[1]), .B(e_input[1]), .Z(n46) );
  XOR U64 ( .A(n44), .B(n43), .Z(n41) );
  XNOR U65 ( .A(n47), .B(n42), .Z(n43) );
  XNOR U66 ( .A(g_input[2]), .B(e_input[2]), .Z(n42) );
  XNOR U67 ( .A(g_input[4]), .B(e_input[4]), .Z(n47) );
  XOR U68 ( .A(g_input[3]), .B(e_input[3]), .Z(n44) );
endmodule

