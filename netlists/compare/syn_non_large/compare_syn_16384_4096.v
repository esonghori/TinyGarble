
module compare_N16384_CC4096 ( clk, rst, x, y, g, e );
  input [3:0] x;
  input [3:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n14, n15, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  DFF ebreg_reg ( .D(n15), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n14), .CLK(clk), .RST(rst), .Q(g) );
  NANDN U30 ( .A(y[0]), .B(x[0]), .Z(n28) );
  NANDN U31 ( .A(x[1]), .B(y[1]), .Z(n29) );
  XNOR U32 ( .A(x[1]), .B(y[1]), .Z(n30) );
  NAND U33 ( .A(n30), .B(n28), .Z(n31) );
  AND U34 ( .A(n29), .B(n31), .Z(n32) );
  OR U35 ( .A(x[2]), .B(n32), .Z(n33) );
  ANDN U36 ( .B(n33), .A(n45), .Z(n34) );
  XOR U37 ( .A(n32), .B(x[2]), .Z(n35) );
  NAND U38 ( .A(n35), .B(y[2]), .Z(n36) );
  AND U39 ( .A(n34), .B(n36), .Z(n37) );
  NANDN U40 ( .A(y[3]), .B(x[3]), .Z(n38) );
  NANDN U41 ( .A(n37), .B(n38), .Z(n39) );
  AND U42 ( .A(e), .B(n39), .Z(n40) );
  OR U43 ( .A(ebreg), .B(n49), .Z(n41) );
  NAND U44 ( .A(n41), .B(g), .Z(n42) );
  NANDN U45 ( .A(n40), .B(n42), .Z(n14) );
  IV U46 ( .A(ebreg), .Z(e) );
  XOR U47 ( .A(y[3]), .B(x[3]), .Z(n45) );
  XNOR U48 ( .A(y[0]), .B(x[0]), .Z(n44) );
  XNOR U49 ( .A(y[1]), .B(x[1]), .Z(n43) );
  AND U50 ( .A(n44), .B(n43), .Z(n46) );
  ANDN U51 ( .B(n46), .A(n45), .Z(n48) );
  XNOR U52 ( .A(x[2]), .B(y[2]), .Z(n47) );
  AND U53 ( .A(n48), .B(n47), .Z(n49) );
  NAND U54 ( .A(e), .B(n49), .Z(n15) );
endmodule

