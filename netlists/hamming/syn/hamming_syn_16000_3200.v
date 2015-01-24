
module hamming_N16000_CC3200 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
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
  XOR U22 ( .A(n15), .B(n16), .Z(o[2]) );
  XNOR U23 ( .A(n17), .B(n18), .Z(o[1]) );
  XOR U24 ( .A(n19), .B(n20), .Z(o[13]) );
  XOR U25 ( .A(oglobal[13]), .B(n21), .Z(n20) );
  AND U26 ( .A(n19), .B(o[12]), .Z(n21) );
  XOR U27 ( .A(oglobal[12]), .B(n19), .Z(o[12]) );
  NOR U28 ( .A(o[11]), .B(n22), .Z(n19) );
  XNOR U29 ( .A(oglobal[11]), .B(n22), .Z(o[11]) );
  OR U30 ( .A(o[10]), .B(n23), .Z(n22) );
  XNOR U31 ( .A(oglobal[10]), .B(n23), .Z(o[10]) );
  OR U32 ( .A(o[9]), .B(n24), .Z(n23) );
  XNOR U33 ( .A(oglobal[9]), .B(n24), .Z(o[9]) );
  OR U34 ( .A(o[8]), .B(n25), .Z(n24) );
  XNOR U35 ( .A(oglobal[8]), .B(n25), .Z(o[8]) );
  OR U36 ( .A(o[7]), .B(n26), .Z(n25) );
  XNOR U37 ( .A(oglobal[7]), .B(n26), .Z(o[7]) );
  OR U38 ( .A(o[6]), .B(n27), .Z(n26) );
  XNOR U39 ( .A(oglobal[6]), .B(n27), .Z(o[6]) );
  OR U40 ( .A(o[5]), .B(n28), .Z(n27) );
  XNOR U41 ( .A(oglobal[5]), .B(n28), .Z(o[5]) );
  OR U42 ( .A(o[4]), .B(n29), .Z(n28) );
  XNOR U43 ( .A(oglobal[4]), .B(n29), .Z(o[4]) );
  OR U44 ( .A(o[3]), .B(n30), .Z(n29) );
  XNOR U45 ( .A(oglobal[3]), .B(n30), .Z(o[3]) );
  XNOR U46 ( .A(n31), .B(n32), .Z(n30) );
  ANDN U47 ( .B(n33), .A(n16), .Z(n31) );
  XNOR U48 ( .A(oglobal[2]), .B(n32), .Z(n16) );
  NANDN U49 ( .A(n32), .B(n15), .Z(n33) );
  OR U50 ( .A(n34), .B(n35), .Z(n15) );
  XNOR U51 ( .A(n36), .B(n37), .Z(n32) );
  NANDN U52 ( .A(n17), .B(n38), .Z(n37) );
  XOR U53 ( .A(n36), .B(n18), .Z(n38) );
  XOR U54 ( .A(n34), .B(n35), .Z(n18) );
  AND U55 ( .A(n39), .B(n40), .Z(n35) );
  OR U56 ( .A(n41), .B(n42), .Z(n40) );
  NANDN U57 ( .A(n43), .B(n44), .Z(n39) );
  OR U58 ( .A(n45), .B(n46), .Z(n34) );
  XNOR U59 ( .A(oglobal[1]), .B(n36), .Z(n17) );
  ANDN U60 ( .B(oglobal[0]), .A(n47), .Z(n36) );
  XNOR U61 ( .A(oglobal[0]), .B(n47), .Z(o[0]) );
  XOR U62 ( .A(n43), .B(n44), .Z(n47) );
  XOR U63 ( .A(n45), .B(n46), .Z(n44) );
  XNOR U64 ( .A(y[3]), .B(x[3]), .Z(n46) );
  XNOR U65 ( .A(y[2]), .B(x[2]), .Z(n45) );
  XNOR U66 ( .A(n41), .B(n42), .Z(n43) );
  XNOR U67 ( .A(y[1]), .B(x[1]), .Z(n42) );
  XNOR U68 ( .A(y[0]), .B(x[0]), .Z(n41) );
endmodule

