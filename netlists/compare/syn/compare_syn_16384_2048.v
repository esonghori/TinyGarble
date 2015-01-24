
module compare_N16384_CC2048 ( clk, rst, x, y, g );
  input [7:0] x;
  input [7:0] y;
  input clk, rst;
  output g;
  wire   ci, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40;

  DFF ci_reg ( .D(g), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  XOR U12 ( .A(y[3]), .B(n27), .Z(n28) );
  XOR U13 ( .A(y[4]), .B(n23), .Z(n24) );
  XOR U14 ( .A(y[5]), .B(n19), .Z(n20) );
  XOR U15 ( .A(y[2]), .B(n31), .Z(n32) );
  XOR U16 ( .A(y[6]), .B(n15), .Z(n16) );
  XOR U17 ( .A(n10), .B(n11), .Z(g) );
  AND U18 ( .A(n12), .B(n13), .Z(n10) );
  XOR U19 ( .A(x[7]), .B(n11), .Z(n13) );
  XNOR U20 ( .A(y[7]), .B(n11), .Z(n12) );
  XNOR U21 ( .A(n14), .B(n15), .Z(n11) );
  AND U22 ( .A(n16), .B(n17), .Z(n14) );
  XNOR U23 ( .A(x[6]), .B(n15), .Z(n17) );
  XOR U24 ( .A(n18), .B(n19), .Z(n15) );
  AND U25 ( .A(n20), .B(n21), .Z(n18) );
  XNOR U26 ( .A(x[5]), .B(n19), .Z(n21) );
  XOR U27 ( .A(n22), .B(n23), .Z(n19) );
  AND U28 ( .A(n24), .B(n25), .Z(n22) );
  XNOR U29 ( .A(x[4]), .B(n23), .Z(n25) );
  XOR U30 ( .A(n26), .B(n27), .Z(n23) );
  AND U31 ( .A(n28), .B(n29), .Z(n26) );
  XNOR U32 ( .A(x[3]), .B(n27), .Z(n29) );
  XOR U33 ( .A(n30), .B(n31), .Z(n27) );
  AND U34 ( .A(n32), .B(n33), .Z(n30) );
  XNOR U35 ( .A(x[2]), .B(n31), .Z(n33) );
  XOR U36 ( .A(n34), .B(n35), .Z(n31) );
  AND U37 ( .A(n36), .B(n37), .Z(n34) );
  XNOR U38 ( .A(x[1]), .B(n35), .Z(n37) );
  XOR U39 ( .A(y[1]), .B(n35), .Z(n36) );
  XOR U40 ( .A(ci), .B(n38), .Z(n35) );
  NANDN U41 ( .A(n39), .B(n40), .Z(n38) );
  XOR U42 ( .A(x[0]), .B(ci), .Z(n40) );
  XOR U43 ( .A(y[0]), .B(ci), .Z(n39) );
endmodule

