
module hamming_N160_CC32 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;
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
  OR U17 ( .A(n35), .B(n36), .Z(n25) );
  XOR U18 ( .A(oglobal[7]), .B(n10), .Z(o[7]) );
  ANDN U19 ( .B(oglobal[6]), .A(n11), .Z(n10) );
  XNOR U20 ( .A(oglobal[6]), .B(n11), .Z(o[6]) );
  NANDN U21 ( .A(n12), .B(oglobal[5]), .Z(n11) );
  XNOR U22 ( .A(oglobal[5]), .B(n12), .Z(o[5]) );
  NANDN U23 ( .A(n13), .B(oglobal[4]), .Z(n12) );
  XNOR U24 ( .A(oglobal[4]), .B(n13), .Z(o[4]) );
  NANDN U25 ( .A(n14), .B(oglobal[3]), .Z(n13) );
  XNOR U26 ( .A(oglobal[3]), .B(n14), .Z(o[3]) );
  AND U27 ( .A(n15), .B(n16), .Z(n14) );
  NANDN U28 ( .A(n17), .B(oglobal[2]), .Z(n16) );
  NANDN U29 ( .A(n18), .B(oglobal[2]), .Z(n15) );
  XNOR U30 ( .A(n18), .B(n19), .Z(o[2]) );
  XNOR U31 ( .A(oglobal[2]), .B(n17), .Z(n19) );
  AND U32 ( .A(n20), .B(n21), .Z(n17) );
  NANDN U33 ( .A(n22), .B(oglobal[1]), .Z(n21) );
  NAND U34 ( .A(n23), .B(n24), .Z(n20) );
  NANDN U35 ( .A(oglobal[1]), .B(n22), .Z(n23) );
  OR U36 ( .A(n25), .B(n26), .Z(n18) );
  XNOR U37 ( .A(n24), .B(n27), .Z(o[1]) );
  XOR U38 ( .A(oglobal[1]), .B(n22), .Z(n27) );
  NANDN U39 ( .A(n28), .B(oglobal[0]), .Z(n22) );
  XOR U40 ( .A(n25), .B(n26), .Z(n24) );
  AND U41 ( .A(n29), .B(n30), .Z(n26) );
  OR U42 ( .A(n31), .B(n32), .Z(n30) );
  NANDN U43 ( .A(n33), .B(n34), .Z(n29) );
  XNOR U44 ( .A(oglobal[0]), .B(n28), .Z(o[0]) );
  XOR U45 ( .A(n33), .B(n34), .Z(n28) );
  XOR U46 ( .A(n35), .B(n36), .Z(n34) );
  XNOR U47 ( .A(y[3]), .B(x[3]), .Z(n36) );
  XNOR U48 ( .A(y[2]), .B(x[2]), .Z(n35) );
  XNOR U49 ( .A(n31), .B(n32), .Z(n33) );
  XNOR U50 ( .A(y[1]), .B(x[1]), .Z(n32) );
  XNOR U51 ( .A(y[0]), .B(x[0]), .Z(n31) );
endmodule

