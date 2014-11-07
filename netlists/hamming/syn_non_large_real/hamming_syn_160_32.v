
module hamming_N160_CC32 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32;
  wire   [7:0] oglobal;

  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  AND U8 ( .A(n8), .B(n9), .Z(n21) );
  NAND U9 ( .A(n23), .B(n24), .Z(n28) );
  NAND U10 ( .A(n32), .B(oglobal[6]), .Z(n1) );
  XNOR U11 ( .A(oglobal[7]), .B(n1), .Z(o[7]) );
  XOR U12 ( .A(x[4]), .B(y[4]), .Z(n11) );
  XNOR U13 ( .A(x[0]), .B(y[0]), .Z(n10) );
  XOR U14 ( .A(oglobal[0]), .B(n10), .Z(n12) );
  XNOR U15 ( .A(n11), .B(n12), .Z(n5) );
  XOR U16 ( .A(x[1]), .B(y[1]), .Z(n9) );
  XOR U17 ( .A(x[3]), .B(y[3]), .Z(n8) );
  XOR U18 ( .A(n9), .B(n8), .Z(n2) );
  XNOR U19 ( .A(x[2]), .B(y[2]), .Z(n3) );
  XNOR U20 ( .A(n2), .B(n3), .Z(n4) );
  XOR U21 ( .A(n5), .B(n4), .Z(o[0]) );
  NANDN U22 ( .A(n3), .B(n2), .Z(n7) );
  NAND U23 ( .A(n5), .B(n4), .Z(n6) );
  NAND U24 ( .A(n7), .B(n6), .Z(n17) );
  XOR U25 ( .A(n21), .B(oglobal[1]), .Z(n16) );
  NANDN U26 ( .A(n10), .B(oglobal[0]), .Z(n14) );
  NANDN U27 ( .A(n12), .B(n11), .Z(n13) );
  NAND U28 ( .A(n14), .B(n13), .Z(n19) );
  XNOR U29 ( .A(n16), .B(n19), .Z(n15) );
  XNOR U30 ( .A(n17), .B(n15), .Z(o[1]) );
  NAND U31 ( .A(n16), .B(n17), .Z(n20) );
  OR U32 ( .A(n17), .B(n16), .Z(n18) );
  AND U33 ( .A(n19), .B(n18), .Z(n24) );
  ANDN U34 ( .B(n20), .A(n24), .Z(n22) );
  AND U35 ( .A(n21), .B(oglobal[1]), .Z(n23) );
  ANDN U36 ( .B(n22), .A(n23), .Z(n26) );
  NANDN U37 ( .A(n26), .B(n28), .Z(n25) );
  XNOR U38 ( .A(oglobal[2]), .B(n25), .Z(o[2]) );
  NANDN U39 ( .A(n26), .B(oglobal[2]), .Z(n27) );
  AND U40 ( .A(n28), .B(n27), .Z(n29) );
  XNOR U41 ( .A(n29), .B(oglobal[3]), .Z(o[3]) );
  ANDN U42 ( .B(oglobal[3]), .A(n29), .Z(n30) );
  XOR U43 ( .A(n30), .B(oglobal[4]), .Z(o[4]) );
  AND U44 ( .A(n30), .B(oglobal[4]), .Z(n31) );
  XOR U45 ( .A(n31), .B(oglobal[5]), .Z(o[5]) );
  AND U46 ( .A(n31), .B(oglobal[5]), .Z(n32) );
  XOR U47 ( .A(oglobal[6]), .B(n32), .Z(o[6]) );
endmodule

