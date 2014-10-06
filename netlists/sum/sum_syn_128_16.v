
module sum_N128_CC16 ( clk, rst, a, b, c );
  input [7:0] a;
  input [7:0] b;
  output [7:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(b[0]), .B(a[0]), .Z(n1) );
  XOR U4 ( .A(n1), .B(carry_on), .Z(c[0]) );
  XOR U5 ( .A(b[1]), .B(a[1]), .Z(n5) );
  NAND U6 ( .A(b[0]), .B(a[0]), .Z(n3) );
  NAND U7 ( .A(n1), .B(carry_on), .Z(n2) );
  NAND U8 ( .A(n3), .B(n2), .Z(n4) );
  XOR U9 ( .A(n5), .B(n4), .Z(c[1]) );
  XOR U10 ( .A(b[2]), .B(a[2]), .Z(n9) );
  NAND U11 ( .A(b[1]), .B(a[1]), .Z(n7) );
  NAND U12 ( .A(n5), .B(n4), .Z(n6) );
  NAND U13 ( .A(n7), .B(n6), .Z(n8) );
  XOR U14 ( .A(n9), .B(n8), .Z(c[2]) );
  XOR U15 ( .A(b[3]), .B(a[3]), .Z(n13) );
  NAND U16 ( .A(b[2]), .B(a[2]), .Z(n11) );
  NAND U17 ( .A(n9), .B(n8), .Z(n10) );
  NAND U18 ( .A(n11), .B(n10), .Z(n12) );
  XOR U19 ( .A(n13), .B(n12), .Z(c[3]) );
  XOR U20 ( .A(b[4]), .B(a[4]), .Z(n17) );
  NAND U21 ( .A(b[3]), .B(a[3]), .Z(n15) );
  NAND U22 ( .A(n13), .B(n12), .Z(n14) );
  NAND U23 ( .A(n15), .B(n14), .Z(n16) );
  XOR U24 ( .A(n17), .B(n16), .Z(c[4]) );
  XOR U25 ( .A(b[5]), .B(a[5]), .Z(n21) );
  NAND U26 ( .A(b[4]), .B(a[4]), .Z(n19) );
  NAND U27 ( .A(n17), .B(n16), .Z(n18) );
  NAND U28 ( .A(n19), .B(n18), .Z(n20) );
  XOR U29 ( .A(n21), .B(n20), .Z(c[5]) );
  XOR U30 ( .A(b[6]), .B(a[6]), .Z(n25) );
  NAND U31 ( .A(b[5]), .B(a[5]), .Z(n23) );
  NAND U32 ( .A(n21), .B(n20), .Z(n22) );
  NAND U33 ( .A(n23), .B(n22), .Z(n24) );
  XOR U34 ( .A(n25), .B(n24), .Z(c[6]) );
  NAND U35 ( .A(b[6]), .B(a[6]), .Z(n27) );
  NAND U36 ( .A(n25), .B(n24), .Z(n26) );
  AND U37 ( .A(n27), .B(n26), .Z(n29) );
  XOR U38 ( .A(b[7]), .B(a[7]), .Z(n28) );
  XNOR U39 ( .A(n29), .B(n28), .Z(c[7]) );
  NAND U40 ( .A(b[7]), .B(a[7]), .Z(n31) );
  NANDN U41 ( .A(n29), .B(n28), .Z(n30) );
  NAND U42 ( .A(n31), .B(n30), .Z(carry_on_d) );
endmodule

