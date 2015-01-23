
module compare_N16384_CC2048 ( clk, rst, x, y, g, e );
  input [7:0] x;
  input [7:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n4, n5, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48;

  DFF ebreg_reg ( .D(n5), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n4), .CLK(clk), .RST(rst), .Q(g) );
  AND U10 ( .A(e), .B(n48), .Z(n8) );
  AND U11 ( .A(n42), .B(n43), .Z(n9) );
  NAND U12 ( .A(x[1]), .B(n40), .Z(n10) );
  AND U13 ( .A(n9), .B(n10), .Z(n11) );
  NANDN U14 ( .A(n11), .B(n44), .Z(n12) );
  NANDN U15 ( .A(y[3]), .B(x[3]), .Z(n13) );
  AND U16 ( .A(n12), .B(n13), .Z(n14) );
  NAND U17 ( .A(n45), .B(n14), .Z(n15) );
  NAND U18 ( .A(n46), .B(n15), .Z(n16) );
  AND U19 ( .A(n39), .B(n16), .Z(n17) );
  NANDN U20 ( .A(y[5]), .B(x[5]), .Z(n18) );
  AND U21 ( .A(n17), .B(n18), .Z(n19) );
  NANDN U22 ( .A(y[7]), .B(x[7]), .Z(n20) );
  NANDN U23 ( .A(n19), .B(n47), .Z(n21) );
  NAND U24 ( .A(n20), .B(n21), .Z(n22) );
  NAND U25 ( .A(n22), .B(n8), .Z(n23) );
  NANDN U26 ( .A(n8), .B(g), .Z(n24) );
  NAND U27 ( .A(n23), .B(n24), .Z(n4) );
  IV U28 ( .A(ebreg), .Z(e) );
  XNOR U29 ( .A(x[5]), .B(y[5]), .Z(n26) );
  NANDN U30 ( .A(x[4]), .B(y[4]), .Z(n25) );
  AND U31 ( .A(n26), .B(n25), .Z(n46) );
  XNOR U32 ( .A(x[7]), .B(y[7]), .Z(n28) );
  NANDN U33 ( .A(x[6]), .B(y[6]), .Z(n27) );
  AND U34 ( .A(n28), .B(n27), .Z(n47) );
  XNOR U35 ( .A(y[3]), .B(x[3]), .Z(n30) );
  NANDN U36 ( .A(x[2]), .B(y[2]), .Z(n29) );
  AND U37 ( .A(n30), .B(n29), .Z(n44) );
  XNOR U38 ( .A(y[1]), .B(x[1]), .Z(n31) );
  AND U39 ( .A(n44), .B(n31), .Z(n34) );
  NANDN U40 ( .A(y[2]), .B(x[2]), .Z(n43) );
  NANDN U41 ( .A(y[6]), .B(x[6]), .Z(n39) );
  AND U42 ( .A(n43), .B(n39), .Z(n32) );
  NANDN U43 ( .A(y[4]), .B(x[4]), .Z(n45) );
  AND U44 ( .A(n32), .B(n45), .Z(n33) );
  AND U45 ( .A(n34), .B(n33), .Z(n36) );
  XNOR U46 ( .A(y[0]), .B(x[0]), .Z(n35) );
  AND U47 ( .A(n36), .B(n35), .Z(n37) );
  AND U48 ( .A(n47), .B(n37), .Z(n38) );
  NAND U49 ( .A(n46), .B(n38), .Z(n48) );
  NANDN U50 ( .A(n48), .B(e), .Z(n5) );
  ANDN U51 ( .B(x[0]), .A(y[0]), .Z(n40) );
  XOR U52 ( .A(x[1]), .B(n40), .Z(n41) );
  NANDN U53 ( .A(y[1]), .B(n41), .Z(n42) );
endmodule

