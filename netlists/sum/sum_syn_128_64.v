
module sum_N128_CC64 ( clk, rst, a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [1:0] c;
  input clk, rst;
  wire   N6, N7, n13, n14, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [1:0] carry_on;

  DFF \carry_on_reg[0]  ( .D(N6), .CLK(clk), .RST(rst), .Q(carry_on[0]) );
  DFF \carry_on_reg[1]  ( .D(N7), .CLK(clk), .RST(rst), .Q(carry_on[1]) );
  DFF \rc_reg[1]  ( .D(n14), .CLK(clk), .RST(1'b0), .Q(c[1]) );
  DFF \rc_reg[0]  ( .D(n13), .CLK(clk), .RST(1'b0), .Q(c[0]) );
  XOR U26 ( .A(b[0]), .B(carry_on[0]), .Z(n22) );
  NAND U27 ( .A(n22), .B(a[0]), .Z(n23) );
  NAND U28 ( .A(b[0]), .B(carry_on[0]), .Z(n24) );
  AND U29 ( .A(n23), .B(n24), .Z(n36) );
  AND U30 ( .A(a[1]), .B(b[1]), .Z(n25) );
  XOR U31 ( .A(a[1]), .B(b[1]), .Z(n26) );
  XOR U32 ( .A(carry_on[1]), .B(n26), .Z(n35) );
  ANDN U33 ( .B(n35), .A(n36), .Z(n28) );
  AND U34 ( .A(n25), .B(n28), .Z(N7) );
  XNOR U35 ( .A(n25), .B(n28), .Z(n30) );
  AND U36 ( .A(carry_on[1]), .B(n26), .Z(n27) );
  NANDN U37 ( .A(n28), .B(n27), .Z(n29) );
  NAND U38 ( .A(n30), .B(n29), .Z(N6) );
  NAND U40 ( .A(c[0]), .B(rst), .Z(n34) );
  XOR U41 ( .A(a[0]), .B(carry_on[0]), .Z(n31) );
  XOR U42 ( .A(b[0]), .B(n31), .Z(n32) );
  NANDN U43 ( .A(rst), .B(n32), .Z(n33) );
  NAND U44 ( .A(n34), .B(n33), .Z(n13) );
  NAND U45 ( .A(c[1]), .B(rst), .Z(n39) );
  XNOR U46 ( .A(n36), .B(n35), .Z(n37) );
  NANDN U47 ( .A(rst), .B(n37), .Z(n38) );
  NAND U48 ( .A(n39), .B(n38), .Z(n14) );
endmodule

