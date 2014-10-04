
module sum_N128_CC32 ( clk, rst, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [3:0] c;
  input clk, rst;
  wire   N10, N11, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [1:0] carry_on;

  DFF \carry_on_reg[1]  ( .D(N11), .CLK(clk), .RST(rst), .Q(carry_on[1]) );
  DFF \carry_on_reg[0]  ( .D(N10), .CLK(clk), .RST(rst), .Q(carry_on[0]) );
  DFF \rc_reg[3]  ( .D(n16), .CLK(clk), .RST(1'b0), .Q(c[3]) );
  DFF \rc_reg[2]  ( .D(n15), .CLK(clk), .RST(1'b0), .Q(c[2]) );
  DFF \rc_reg[1]  ( .D(n14), .CLK(clk), .RST(1'b0), .Q(c[1]) );
  DFF \rc_reg[0]  ( .D(n13), .CLK(clk), .RST(1'b0), .Q(c[0]) );
  AND U19 ( .A(b[3]), .B(a[3]), .Z(n33) );
  XNOR U20 ( .A(a[1]), .B(b[1]), .Z(n19) );
  XNOR U21 ( .A(carry_on[1]), .B(n19), .Z(n39) );
  NAND U22 ( .A(a[0]), .B(b[0]), .Z(n18) );
  XOR U23 ( .A(a[0]), .B(b[0]), .Z(n34) );
  NAND U24 ( .A(n34), .B(carry_on[0]), .Z(n17) );
  NAND U25 ( .A(n18), .B(n17), .Z(n38) );
  NAND U26 ( .A(n39), .B(n38), .Z(n21) );
  ANDN U27 ( .B(carry_on[1]), .A(n19), .Z(n22) );
  ANDN U28 ( .B(n21), .A(n22), .Z(n20) );
  NAND U29 ( .A(a[1]), .B(b[1]), .Z(n23) );
  NAND U30 ( .A(n20), .B(n23), .Z(n27) );
  XNOR U31 ( .A(n23), .B(n21), .Z(n25) );
  NAND U32 ( .A(n23), .B(n22), .Z(n24) );
  NAND U33 ( .A(n25), .B(n24), .Z(n44) );
  XNOR U34 ( .A(a[2]), .B(b[2]), .Z(n43) );
  NAND U35 ( .A(n44), .B(n43), .Z(n26) );
  AND U36 ( .A(n27), .B(n26), .Z(n28) );
  NAND U37 ( .A(a[2]), .B(b[2]), .Z(n29) );
  ANDN U38 ( .B(n28), .A(n29), .Z(n32) );
  XNOR U39 ( .A(n33), .B(n32), .Z(n31) );
  XNOR U40 ( .A(n29), .B(n28), .Z(n48) );
  XOR U41 ( .A(b[3]), .B(a[3]), .Z(n49) );
  NAND U42 ( .A(n48), .B(n49), .Z(n30) );
  NAND U43 ( .A(n31), .B(n30), .Z(N10) );
  AND U44 ( .A(n33), .B(n32), .Z(N11) );
  NAND U46 ( .A(c[0]), .B(rst), .Z(n37) );
  XOR U47 ( .A(n34), .B(carry_on[0]), .Z(n35) );
  NANDN U48 ( .A(rst), .B(n35), .Z(n36) );
  NAND U49 ( .A(n37), .B(n36), .Z(n13) );
  NAND U50 ( .A(c[1]), .B(rst), .Z(n42) );
  XOR U51 ( .A(n39), .B(n38), .Z(n40) );
  NANDN U52 ( .A(rst), .B(n40), .Z(n41) );
  NAND U53 ( .A(n42), .B(n41), .Z(n14) );
  NAND U54 ( .A(c[2]), .B(rst), .Z(n47) );
  XNOR U55 ( .A(n44), .B(n43), .Z(n45) );
  NANDN U56 ( .A(rst), .B(n45), .Z(n46) );
  NAND U57 ( .A(n47), .B(n46), .Z(n15) );
  NAND U58 ( .A(c[3]), .B(rst), .Z(n52) );
  XOR U59 ( .A(n49), .B(n48), .Z(n50) );
  NANDN U60 ( .A(rst), .B(n50), .Z(n51) );
  NAND U61 ( .A(n52), .B(n51), .Z(n16) );
endmodule

