
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
  IV U10 ( .A(ebreg), .Z(e) );
  XNOR U11 ( .A(y[5]), .B(x[5]), .Z(n9) );
  NANDN U12 ( .A(x[4]), .B(y[4]), .Z(n8) );
  NAND U13 ( .A(n9), .B(n8), .Z(n36) );
  XNOR U14 ( .A(y[1]), .B(x[1]), .Z(n12) );
  XNOR U15 ( .A(x[3]), .B(y[3]), .Z(n11) );
  NANDN U16 ( .A(x[2]), .B(y[2]), .Z(n10) );
  NAND U17 ( .A(n11), .B(n10), .Z(n30) );
  ANDN U18 ( .B(n12), .A(n30), .Z(n15) );
  ANDN U19 ( .B(x[2]), .A(y[2]), .Z(n28) );
  ANDN U20 ( .B(x[6]), .A(y[6]), .Z(n38) );
  NOR U21 ( .A(n28), .B(n38), .Z(n13) );
  ANDN U22 ( .B(x[4]), .A(y[4]), .Z(n34) );
  ANDN U23 ( .B(n13), .A(n34), .Z(n14) );
  AND U24 ( .A(n15), .B(n14), .Z(n17) );
  XNOR U25 ( .A(y[0]), .B(x[0]), .Z(n16) );
  AND U26 ( .A(n17), .B(n16), .Z(n20) );
  XNOR U27 ( .A(y[7]), .B(x[7]), .Z(n19) );
  NANDN U28 ( .A(x[6]), .B(y[6]), .Z(n18) );
  NAND U29 ( .A(n19), .B(n18), .Z(n42) );
  ANDN U30 ( .B(n20), .A(n42), .Z(n21) );
  NANDN U31 ( .A(n36), .B(n21), .Z(n22) );
  NANDN U32 ( .A(n22), .B(e), .Z(n5) );
  NAND U33 ( .A(e), .B(n22), .Z(n46) );
  ANDN U34 ( .B(x[7]), .A(y[7]), .Z(n44) );
  ANDN U35 ( .B(x[3]), .A(y[3]), .Z(n32) );
  ANDN U36 ( .B(x[0]), .A(y[0]), .Z(n24) );
  XNOR U37 ( .A(y[1]), .B(n24), .Z(n23) );
  NANDN U38 ( .A(x[1]), .B(n23), .Z(n26) );
  NANDN U39 ( .A(n24), .B(y[1]), .Z(n25) );
  AND U40 ( .A(n26), .B(n25), .Z(n27) );
  OR U41 ( .A(n28), .B(n27), .Z(n29) );
  NANDN U42 ( .A(n30), .B(n29), .Z(n31) );
  NANDN U43 ( .A(n32), .B(n31), .Z(n33) );
  OR U44 ( .A(n34), .B(n33), .Z(n35) );
  NANDN U45 ( .A(n36), .B(n35), .Z(n37) );
  NANDN U46 ( .A(n38), .B(n37), .Z(n40) );
  ANDN U47 ( .B(x[5]), .A(y[5]), .Z(n39) );
  OR U48 ( .A(n40), .B(n39), .Z(n41) );
  NANDN U49 ( .A(n42), .B(n41), .Z(n43) );
  NANDN U50 ( .A(n44), .B(n43), .Z(n45) );
  NANDN U51 ( .A(n46), .B(n45), .Z(n48) );
  NAND U52 ( .A(n46), .B(g), .Z(n47) );
  NAND U53 ( .A(n48), .B(n47), .Z(n4) );
endmodule

