
module sum_N262144_CC32768 ( clk, rst, a, b, c );
  input [7:0] a;
  input [7:0] b;
  output [7:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XOR U4 ( .A(a[1]), .B(n27), .Z(n29) );
  XOR U5 ( .A(a[4]), .B(n15), .Z(n17) );
  XOR U6 ( .A(a[2]), .B(n23), .Z(n25) );
  XOR U7 ( .A(a[5]), .B(n11), .Z(n13) );
  XOR U8 ( .A(a[3]), .B(n19), .Z(n21) );
  XOR U9 ( .A(a[6]), .B(n7), .Z(n9) );
  XOR U10 ( .A(n2), .B(n3), .Z(carry_on_d) );
  ANDN U11 ( .B(n4), .A(n5), .Z(n2) );
  XOR U12 ( .A(b[7]), .B(n3), .Z(n4) );
  XNOR U13 ( .A(b[7]), .B(n5), .Z(c[7]) );
  XNOR U14 ( .A(a[7]), .B(n3), .Z(n5) );
  XNOR U15 ( .A(n6), .B(n7), .Z(n3) );
  ANDN U16 ( .B(n8), .A(n9), .Z(n6) );
  XNOR U17 ( .A(b[6]), .B(n7), .Z(n8) );
  XNOR U18 ( .A(b[6]), .B(n9), .Z(c[6]) );
  XOR U19 ( .A(n10), .B(n11), .Z(n7) );
  ANDN U20 ( .B(n12), .A(n13), .Z(n10) );
  XNOR U21 ( .A(b[5]), .B(n11), .Z(n12) );
  XNOR U22 ( .A(b[5]), .B(n13), .Z(c[5]) );
  XOR U23 ( .A(n14), .B(n15), .Z(n11) );
  ANDN U24 ( .B(n16), .A(n17), .Z(n14) );
  XNOR U25 ( .A(b[4]), .B(n15), .Z(n16) );
  XNOR U26 ( .A(b[4]), .B(n17), .Z(c[4]) );
  XOR U27 ( .A(n18), .B(n19), .Z(n15) );
  ANDN U28 ( .B(n20), .A(n21), .Z(n18) );
  XNOR U29 ( .A(b[3]), .B(n19), .Z(n20) );
  XNOR U30 ( .A(b[3]), .B(n21), .Z(c[3]) );
  XOR U31 ( .A(n22), .B(n23), .Z(n19) );
  ANDN U32 ( .B(n24), .A(n25), .Z(n22) );
  XNOR U33 ( .A(b[2]), .B(n23), .Z(n24) );
  XNOR U34 ( .A(b[2]), .B(n25), .Z(c[2]) );
  XOR U35 ( .A(n26), .B(n27), .Z(n23) );
  ANDN U36 ( .B(n28), .A(n29), .Z(n26) );
  XNOR U37 ( .A(b[1]), .B(n27), .Z(n28) );
  XNOR U38 ( .A(b[1]), .B(n29), .Z(c[1]) );
  XOR U39 ( .A(carry_on), .B(n30), .Z(n27) );
  NANDN U40 ( .A(n31), .B(n32), .Z(n30) );
  XOR U41 ( .A(carry_on), .B(b[0]), .Z(n32) );
  XNOR U42 ( .A(b[0]), .B(n31), .Z(c[0]) );
  XNOR U43 ( .A(a[0]), .B(carry_on), .Z(n31) );
endmodule

