
module hamming_N16000_CC3200 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [13:0] o;
  input clk, rst;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45;
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
  MUX U22 ( .IN0(n20), .IN1(n35), .SEL(n19), .F(n33) );
  MUX U23 ( .IN0(n15), .IN1(n33), .SEL(n18), .F(n32) );
  IV U24 ( .A(n17), .Z(n15) );
  MUX U25 ( .IN0(n39), .IN1(n37), .SEL(n38), .F(n16) );
  IV U26 ( .A(n16), .Z(n34) );
  XNOR U27 ( .A(n33), .B(oglobal[2]), .Z(n18) );
  MUX U28 ( .IN0(n42), .IN1(n40), .SEL(n41), .F(n36) );
  XOR U29 ( .A(n17), .B(n18), .Z(o[2]) );
  XNOR U30 ( .A(n19), .B(n20), .Z(o[1]) );
  XOR U31 ( .A(n21), .B(n22), .Z(o[13]) );
  XOR U32 ( .A(oglobal[13]), .B(n23), .Z(n22) );
  AND U33 ( .A(n21), .B(o[12]), .Z(n23) );
  XOR U34 ( .A(n21), .B(oglobal[12]), .Z(o[12]) );
  ANDN U35 ( .B(n24), .A(o[11]), .Z(n21) );
  XOR U36 ( .A(n24), .B(oglobal[11]), .Z(o[11]) );
  ANDN U37 ( .B(n25), .A(o[10]), .Z(n24) );
  XOR U38 ( .A(n25), .B(oglobal[10]), .Z(o[10]) );
  ANDN U39 ( .B(n26), .A(o[9]), .Z(n25) );
  XOR U40 ( .A(n26), .B(oglobal[9]), .Z(o[9]) );
  ANDN U41 ( .B(n27), .A(o[8]), .Z(n26) );
  XOR U42 ( .A(n27), .B(oglobal[8]), .Z(o[8]) );
  ANDN U43 ( .B(n28), .A(o[7]), .Z(n27) );
  XOR U44 ( .A(n28), .B(oglobal[7]), .Z(o[7]) );
  ANDN U45 ( .B(n29), .A(o[6]), .Z(n28) );
  XOR U46 ( .A(n29), .B(oglobal[6]), .Z(o[6]) );
  ANDN U47 ( .B(n30), .A(o[5]), .Z(n29) );
  XOR U48 ( .A(n30), .B(oglobal[5]), .Z(o[5]) );
  ANDN U49 ( .B(n31), .A(o[4]), .Z(n30) );
  XOR U50 ( .A(n31), .B(oglobal[4]), .Z(o[4]) );
  ANDN U51 ( .B(n32), .A(o[3]), .Z(n31) );
  XOR U52 ( .A(n32), .B(oglobal[3]), .Z(o[3]) );
  NANDN U53 ( .A(n20), .B(n34), .Z(n17) );
  XNOR U54 ( .A(n36), .B(n34), .Z(n20) );
  XNOR U55 ( .A(n35), .B(oglobal[1]), .Z(n19) );
  ANDN U56 ( .B(oglobal[0]), .A(n43), .Z(n35) );
  XNOR U57 ( .A(oglobal[0]), .B(n43), .Z(o[0]) );
  XNOR U58 ( .A(n39), .B(n38), .Z(n43) );
  XNOR U59 ( .A(n44), .B(n42), .Z(n38) );
  XNOR U60 ( .A(y[4]), .B(x[4]), .Z(n42) );
  XNOR U61 ( .A(n41), .B(n37), .Z(n44) );
  XNOR U62 ( .A(y[0]), .B(x[0]), .Z(n37) );
  XNOR U63 ( .A(n45), .B(n40), .Z(n41) );
  XNOR U64 ( .A(y[2]), .B(x[2]), .Z(n40) );
  XNOR U65 ( .A(y[3]), .B(x[3]), .Z(n45) );
  XNOR U66 ( .A(y[1]), .B(x[1]), .Z(n39) );
endmodule

