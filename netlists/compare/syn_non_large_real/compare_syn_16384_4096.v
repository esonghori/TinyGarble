
module compare_N16384_CC4096 ( clk, rst, x, y, g, e );
  input [3:0] x;
  input [3:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n15, n16, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  DFF ebreg_reg ( .D(n16), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n15), .CLK(clk), .RST(rst), .Q(g) );
  NANDN U30 ( .A(n49), .B(n47), .Z(n28) );
  NAND U31 ( .A(e), .B(n28), .Z(n29) );
  NAND U32 ( .A(g), .B(n29), .Z(n30) );
  NANDN U33 ( .A(y[0]), .B(x[0]), .Z(n31) );
  NANDN U34 ( .A(x[1]), .B(n31), .Z(n32) );
  XNOR U35 ( .A(n31), .B(x[1]), .Z(n33) );
  NAND U36 ( .A(n33), .B(y[1]), .Z(n34) );
  NAND U37 ( .A(n32), .B(n34), .Z(n35) );
  AND U38 ( .A(n45), .B(n35), .Z(n36) );
  ANDN U39 ( .B(n47), .A(n36), .Z(n37) );
  NANDN U40 ( .A(x[2]), .B(y[2]), .Z(n38) );
  NAND U41 ( .A(n37), .B(n38), .Z(n39) );
  NANDN U42 ( .A(y[3]), .B(x[3]), .Z(n40) );
  NAND U43 ( .A(n39), .B(n40), .Z(n41) );
  NANDN U44 ( .A(ebreg), .B(n41), .Z(n42) );
  NAND U45 ( .A(n30), .B(n42), .Z(n15) );
  IV U46 ( .A(ebreg), .Z(e) );
  XNOR U47 ( .A(x[2]), .B(y[2]), .Z(n45) );
  XNOR U48 ( .A(y[3]), .B(x[3]), .Z(n47) );
  XNOR U49 ( .A(x[0]), .B(y[0]), .Z(n44) );
  XNOR U50 ( .A(x[1]), .B(y[1]), .Z(n43) );
  NAND U51 ( .A(n44), .B(n43), .Z(n46) );
  NANDN U52 ( .A(n46), .B(n45), .Z(n49) );
  AND U53 ( .A(n47), .B(e), .Z(n48) );
  NANDN U54 ( .A(n49), .B(n48), .Z(n16) );
endmodule

