
module hamming_N1600_CC320 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
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
  MUX U19 ( .IN0(n17), .IN1(n29), .SEL(n16), .F(n27) );
  MUX U20 ( .IN0(n12), .IN1(n27), .SEL(n15), .F(n26) );
  IV U21 ( .A(n14), .Z(n12) );
  MUX U22 ( .IN0(n33), .IN1(n31), .SEL(n32), .F(n13) );
  IV U23 ( .A(n13), .Z(n28) );
  XNOR U24 ( .A(n27), .B(oglobal[2]), .Z(n15) );
  MUX U25 ( .IN0(n36), .IN1(n34), .SEL(n35), .F(n30) );
  XOR U26 ( .A(n14), .B(n15), .Z(o[2]) );
  XNOR U27 ( .A(n16), .B(n17), .Z(o[1]) );
  XOR U28 ( .A(n18), .B(n19), .Z(o[10]) );
  XOR U29 ( .A(oglobal[10]), .B(n20), .Z(n19) );
  AND U30 ( .A(n18), .B(o[9]), .Z(n20) );
  XOR U31 ( .A(n18), .B(oglobal[9]), .Z(o[9]) );
  ANDN U32 ( .B(n21), .A(o[8]), .Z(n18) );
  XOR U33 ( .A(n21), .B(oglobal[8]), .Z(o[8]) );
  ANDN U34 ( .B(n22), .A(o[7]), .Z(n21) );
  XOR U35 ( .A(n22), .B(oglobal[7]), .Z(o[7]) );
  ANDN U36 ( .B(n23), .A(o[6]), .Z(n22) );
  XOR U37 ( .A(n23), .B(oglobal[6]), .Z(o[6]) );
  ANDN U38 ( .B(n24), .A(o[5]), .Z(n23) );
  XOR U39 ( .A(n24), .B(oglobal[5]), .Z(o[5]) );
  ANDN U40 ( .B(n25), .A(o[4]), .Z(n24) );
  XOR U41 ( .A(n25), .B(oglobal[4]), .Z(o[4]) );
  ANDN U42 ( .B(n26), .A(o[3]), .Z(n25) );
  XOR U43 ( .A(n26), .B(oglobal[3]), .Z(o[3]) );
  NANDN U44 ( .A(n17), .B(n28), .Z(n14) );
  XNOR U45 ( .A(n30), .B(n28), .Z(n17) );
  XNOR U46 ( .A(n29), .B(oglobal[1]), .Z(n16) );
  ANDN U47 ( .B(oglobal[0]), .A(n37), .Z(n29) );
  XNOR U48 ( .A(oglobal[0]), .B(n37), .Z(o[0]) );
  XNOR U49 ( .A(n33), .B(n32), .Z(n37) );
  XNOR U50 ( .A(n38), .B(n36), .Z(n32) );
  XNOR U51 ( .A(y[4]), .B(x[4]), .Z(n36) );
  XNOR U52 ( .A(n35), .B(n31), .Z(n38) );
  XNOR U53 ( .A(y[0]), .B(x[0]), .Z(n31) );
  XNOR U54 ( .A(n39), .B(n34), .Z(n35) );
  XNOR U55 ( .A(y[2]), .B(x[2]), .Z(n34) );
  XNOR U56 ( .A(y[3]), .B(x[3]), .Z(n39) );
  XNOR U57 ( .A(y[1]), .B(x[1]), .Z(n33) );
endmodule

