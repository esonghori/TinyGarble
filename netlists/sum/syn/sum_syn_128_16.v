
module sum_N128_CC16 ( clk, rst, a, b, c );
  input [7:0] a;
  input [7:0] b;
  output [7:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(a[1]), .B(n26), .Z(n28) );
  XOR U4 ( .A(a[4]), .B(n14), .Z(n16) );
  XOR U5 ( .A(a[2]), .B(n22), .Z(n24) );
  XOR U6 ( .A(a[5]), .B(n10), .Z(n12) );
  XOR U7 ( .A(a[3]), .B(n18), .Z(n20) );
  XOR U8 ( .A(a[6]), .B(n6), .Z(n8) );
  XOR U9 ( .A(n1), .B(n2), .Z(carry_on_d) );
  ANDN U10 ( .B(n3), .A(n4), .Z(n1) );
  XOR U11 ( .A(b[7]), .B(n2), .Z(n3) );
  XNOR U12 ( .A(b[7]), .B(n4), .Z(c[7]) );
  XNOR U13 ( .A(a[7]), .B(n2), .Z(n4) );
  XNOR U14 ( .A(n5), .B(n6), .Z(n2) );
  ANDN U15 ( .B(n7), .A(n8), .Z(n5) );
  XNOR U16 ( .A(b[6]), .B(n6), .Z(n7) );
  XNOR U17 ( .A(b[6]), .B(n8), .Z(c[6]) );
  XOR U18 ( .A(n9), .B(n10), .Z(n6) );
  ANDN U19 ( .B(n11), .A(n12), .Z(n9) );
  XNOR U20 ( .A(b[5]), .B(n10), .Z(n11) );
  XNOR U21 ( .A(b[5]), .B(n12), .Z(c[5]) );
  XOR U22 ( .A(n13), .B(n14), .Z(n10) );
  ANDN U23 ( .B(n15), .A(n16), .Z(n13) );
  XNOR U24 ( .A(b[4]), .B(n14), .Z(n15) );
  XNOR U25 ( .A(b[4]), .B(n16), .Z(c[4]) );
  XOR U26 ( .A(n17), .B(n18), .Z(n14) );
  ANDN U27 ( .B(n19), .A(n20), .Z(n17) );
  XNOR U28 ( .A(b[3]), .B(n18), .Z(n19) );
  XNOR U29 ( .A(b[3]), .B(n20), .Z(c[3]) );
  XOR U30 ( .A(n21), .B(n22), .Z(n18) );
  ANDN U31 ( .B(n23), .A(n24), .Z(n21) );
  XNOR U32 ( .A(b[2]), .B(n22), .Z(n23) );
  XNOR U33 ( .A(b[2]), .B(n24), .Z(c[2]) );
  XOR U34 ( .A(n25), .B(n26), .Z(n22) );
  ANDN U35 ( .B(n27), .A(n28), .Z(n25) );
  XNOR U36 ( .A(b[1]), .B(n26), .Z(n27) );
  XNOR U37 ( .A(b[1]), .B(n28), .Z(c[1]) );
  XOR U38 ( .A(carry_on), .B(n29), .Z(n26) );
  NANDN U39 ( .A(n30), .B(n31), .Z(n29) );
  XOR U40 ( .A(carry_on), .B(b[0]), .Z(n31) );
  XNOR U41 ( .A(b[0]), .B(n30), .Z(c[0]) );
  XNOR U42 ( .A(a[0]), .B(carry_on), .Z(n30) );
endmodule

