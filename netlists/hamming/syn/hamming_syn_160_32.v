
module hamming_N160_CC32 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [7:0] oglobal;

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
  MUX U16 ( .IN0(n22), .IN1(n20), .SEL(n21), .F(n17) );
  MUX U17 ( .IN0(n9), .IN1(n17), .SEL(n18), .F(n16) );
  IV U18 ( .A(n19), .Z(n9) );
  MUX U19 ( .IN0(n27), .IN1(n25), .SEL(n26), .F(n10) );
  IV U20 ( .A(n10), .Z(n23) );
  XNOR U21 ( .A(n17), .B(oglobal[2]), .Z(n18) );
  MUX U22 ( .IN0(n30), .IN1(n28), .SEL(n29), .F(n24) );
  XOR U23 ( .A(n11), .B(n12), .Z(o[7]) );
  XOR U24 ( .A(oglobal[7]), .B(n13), .Z(n12) );
  AND U25 ( .A(n11), .B(o[6]), .Z(n13) );
  XOR U26 ( .A(n11), .B(oglobal[6]), .Z(o[6]) );
  ANDN U27 ( .B(n14), .A(o[5]), .Z(n11) );
  XOR U28 ( .A(n14), .B(oglobal[5]), .Z(o[5]) );
  ANDN U29 ( .B(n15), .A(o[4]), .Z(n14) );
  XOR U30 ( .A(n15), .B(oglobal[4]), .Z(o[4]) );
  ANDN U31 ( .B(n16), .A(o[3]), .Z(n15) );
  XOR U32 ( .A(n16), .B(oglobal[3]), .Z(o[3]) );
  XOR U33 ( .A(n19), .B(n18), .Z(o[2]) );
  NANDN U34 ( .A(n22), .B(n23), .Z(n19) );
  XNOR U35 ( .A(n21), .B(n22), .Z(o[1]) );
  XNOR U36 ( .A(n24), .B(n23), .Z(n22) );
  XNOR U37 ( .A(n20), .B(oglobal[1]), .Z(n21) );
  ANDN U38 ( .B(oglobal[0]), .A(n31), .Z(n20) );
  XNOR U39 ( .A(oglobal[0]), .B(n31), .Z(o[0]) );
  XNOR U40 ( .A(n27), .B(n26), .Z(n31) );
  XNOR U41 ( .A(n32), .B(n30), .Z(n26) );
  XNOR U42 ( .A(y[4]), .B(x[4]), .Z(n30) );
  XNOR U43 ( .A(n29), .B(n25), .Z(n32) );
  XNOR U44 ( .A(y[0]), .B(x[0]), .Z(n25) );
  XNOR U45 ( .A(n33), .B(n28), .Z(n29) );
  XNOR U46 ( .A(y[2]), .B(x[2]), .Z(n28) );
  XNOR U47 ( .A(y[3]), .B(x[3]), .Z(n33) );
  XNOR U48 ( .A(y[1]), .B(x[1]), .Z(n27) );
endmodule

