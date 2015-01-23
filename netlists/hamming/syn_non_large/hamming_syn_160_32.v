
module hamming_N160_CC32 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [7:0] oglobal;

  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  OR U8 ( .A(n1), .B(n2), .Z(n14) );
  XNOR U9 ( .A(x[4]), .B(y[4]), .Z(n5) );
  XOR U10 ( .A(x[0]), .B(y[0]), .Z(n3) );
  XNOR U11 ( .A(oglobal[0]), .B(n3), .Z(n4) );
  XOR U12 ( .A(n5), .B(n4), .Z(n10) );
  XNOR U13 ( .A(x[2]), .B(y[2]), .Z(n9) );
  XNOR U14 ( .A(x[1]), .B(y[1]), .Z(n2) );
  XNOR U15 ( .A(x[3]), .B(y[3]), .Z(n1) );
  XOR U16 ( .A(n2), .B(n1), .Z(n8) );
  XOR U17 ( .A(n9), .B(n8), .Z(n11) );
  XNOR U18 ( .A(n10), .B(n11), .Z(o[0]) );
  XOR U19 ( .A(oglobal[1]), .B(n14), .Z(n16) );
  NAND U20 ( .A(n3), .B(oglobal[0]), .Z(n7) );
  OR U21 ( .A(n5), .B(n4), .Z(n6) );
  NAND U22 ( .A(n7), .B(n6), .Z(n15) );
  XNOR U23 ( .A(n16), .B(n15), .Z(n17) );
  NANDN U24 ( .A(n9), .B(n8), .Z(n13) );
  NANDN U25 ( .A(n11), .B(n10), .Z(n12) );
  AND U26 ( .A(n13), .B(n12), .Z(n18) );
  XNOR U27 ( .A(n17), .B(n18), .Z(o[1]) );
  NANDN U28 ( .A(n14), .B(oglobal[1]), .Z(n21) );
  XOR U29 ( .A(oglobal[2]), .B(n21), .Z(n22) );
  NANDN U30 ( .A(n16), .B(n15), .Z(n20) );
  NANDN U31 ( .A(n18), .B(n17), .Z(n19) );
  AND U32 ( .A(n20), .B(n19), .Z(n23) );
  XOR U33 ( .A(n22), .B(n23), .Z(o[2]) );
  NANDN U34 ( .A(n21), .B(oglobal[2]), .Z(n25) );
  NOR U35 ( .A(n23), .B(n22), .Z(n24) );
  ANDN U36 ( .B(n25), .A(n24), .Z(n26) );
  XNOR U37 ( .A(oglobal[3]), .B(n26), .Z(o[3]) );
  NANDN U38 ( .A(n26), .B(oglobal[3]), .Z(n27) );
  XNOR U39 ( .A(n27), .B(oglobal[4]), .Z(o[4]) );
  NANDN U40 ( .A(n27), .B(oglobal[4]), .Z(n28) );
  XNOR U41 ( .A(n28), .B(oglobal[5]), .Z(o[5]) );
  NANDN U42 ( .A(n28), .B(oglobal[5]), .Z(n29) );
  XNOR U43 ( .A(oglobal[6]), .B(n29), .Z(o[6]) );
  NANDN U44 ( .A(n29), .B(oglobal[6]), .Z(n30) );
  XNOR U45 ( .A(oglobal[7]), .B(n30), .Z(o[7]) );
endmodule

