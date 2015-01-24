
module hamming_N1600_CC320 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
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
  XOR U19 ( .A(n12), .B(n13), .Z(o[2]) );
  XNOR U20 ( .A(n14), .B(n15), .Z(o[1]) );
  XOR U21 ( .A(n16), .B(n17), .Z(o[10]) );
  XOR U22 ( .A(oglobal[10]), .B(n18), .Z(n17) );
  AND U23 ( .A(n16), .B(o[9]), .Z(n18) );
  XOR U24 ( .A(oglobal[9]), .B(n16), .Z(o[9]) );
  NOR U25 ( .A(o[8]), .B(n19), .Z(n16) );
  XNOR U26 ( .A(oglobal[8]), .B(n19), .Z(o[8]) );
  OR U27 ( .A(o[7]), .B(n20), .Z(n19) );
  XNOR U28 ( .A(oglobal[7]), .B(n20), .Z(o[7]) );
  OR U29 ( .A(o[6]), .B(n21), .Z(n20) );
  XNOR U30 ( .A(oglobal[6]), .B(n21), .Z(o[6]) );
  OR U31 ( .A(o[5]), .B(n22), .Z(n21) );
  XNOR U32 ( .A(oglobal[5]), .B(n22), .Z(o[5]) );
  OR U33 ( .A(o[4]), .B(n23), .Z(n22) );
  XNOR U34 ( .A(oglobal[4]), .B(n23), .Z(o[4]) );
  OR U35 ( .A(o[3]), .B(n24), .Z(n23) );
  XNOR U36 ( .A(oglobal[3]), .B(n24), .Z(o[3]) );
  XNOR U37 ( .A(n25), .B(n26), .Z(n24) );
  ANDN U38 ( .B(n27), .A(n13), .Z(n25) );
  XNOR U39 ( .A(oglobal[2]), .B(n26), .Z(n13) );
  NANDN U40 ( .A(n26), .B(n12), .Z(n27) );
  OR U41 ( .A(n28), .B(n29), .Z(n12) );
  XNOR U42 ( .A(n30), .B(n31), .Z(n26) );
  NANDN U43 ( .A(n14), .B(n32), .Z(n31) );
  XOR U44 ( .A(n30), .B(n15), .Z(n32) );
  XOR U45 ( .A(n28), .B(n29), .Z(n15) );
  AND U46 ( .A(n33), .B(n34), .Z(n29) );
  OR U47 ( .A(n35), .B(n36), .Z(n34) );
  NANDN U48 ( .A(n37), .B(n38), .Z(n33) );
  OR U49 ( .A(n39), .B(n40), .Z(n28) );
  XNOR U50 ( .A(oglobal[1]), .B(n30), .Z(n14) );
  ANDN U51 ( .B(oglobal[0]), .A(n41), .Z(n30) );
  XNOR U52 ( .A(oglobal[0]), .B(n41), .Z(o[0]) );
  XOR U53 ( .A(n37), .B(n38), .Z(n41) );
  XOR U54 ( .A(n39), .B(n40), .Z(n38) );
  XNOR U55 ( .A(y[3]), .B(x[3]), .Z(n40) );
  XNOR U56 ( .A(y[2]), .B(x[2]), .Z(n39) );
  XNOR U57 ( .A(n35), .B(n36), .Z(n37) );
  XNOR U58 ( .A(y[1]), .B(x[1]), .Z(n36) );
  XNOR U59 ( .A(y[0]), .B(x[0]), .Z(n35) );
endmodule

