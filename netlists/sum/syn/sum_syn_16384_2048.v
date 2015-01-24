
module sum_N16384_CC2048 ( clk, rst, a, b, c );
  input [7:0] a;
  input [7:0] b;
  output [7:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XOR U4 ( .A(n2), .B(n3), .Z(carry_on_d) );
  ANDN U5 ( .B(n4), .A(n5), .Z(n2) );
  XOR U6 ( .A(b[7]), .B(n3), .Z(n4) );
  XNOR U7 ( .A(b[7]), .B(n5), .Z(c[7]) );
  XNOR U8 ( .A(a[7]), .B(n3), .Z(n5) );
  XNOR U9 ( .A(n6), .B(n7), .Z(n3) );
  ANDN U10 ( .B(n8), .A(n9), .Z(n6) );
  XNOR U11 ( .A(b[6]), .B(n7), .Z(n8) );
  XNOR U12 ( .A(b[6]), .B(n9), .Z(c[6]) );
  XNOR U13 ( .A(a[6]), .B(n10), .Z(n9) );
  IV U14 ( .A(n7), .Z(n10) );
  XOR U15 ( .A(n11), .B(n12), .Z(n7) );
  ANDN U16 ( .B(n13), .A(n14), .Z(n11) );
  XNOR U17 ( .A(b[5]), .B(n12), .Z(n13) );
  XNOR U18 ( .A(b[5]), .B(n14), .Z(c[5]) );
  XNOR U19 ( .A(a[5]), .B(n15), .Z(n14) );
  IV U20 ( .A(n12), .Z(n15) );
  XOR U21 ( .A(n16), .B(n17), .Z(n12) );
  ANDN U22 ( .B(n18), .A(n19), .Z(n16) );
  XNOR U23 ( .A(b[4]), .B(n17), .Z(n18) );
  XNOR U24 ( .A(b[4]), .B(n19), .Z(c[4]) );
  XNOR U25 ( .A(a[4]), .B(n20), .Z(n19) );
  IV U26 ( .A(n17), .Z(n20) );
  XOR U27 ( .A(n21), .B(n22), .Z(n17) );
  ANDN U28 ( .B(n23), .A(n24), .Z(n21) );
  XNOR U29 ( .A(b[3]), .B(n22), .Z(n23) );
  XNOR U30 ( .A(b[3]), .B(n24), .Z(c[3]) );
  XNOR U31 ( .A(a[3]), .B(n25), .Z(n24) );
  IV U32 ( .A(n22), .Z(n25) );
  XOR U33 ( .A(n26), .B(n27), .Z(n22) );
  ANDN U34 ( .B(n28), .A(n29), .Z(n26) );
  XNOR U35 ( .A(b[2]), .B(n27), .Z(n28) );
  XNOR U36 ( .A(b[2]), .B(n29), .Z(c[2]) );
  XNOR U37 ( .A(a[2]), .B(n30), .Z(n29) );
  IV U38 ( .A(n27), .Z(n30) );
  XOR U39 ( .A(n31), .B(n32), .Z(n27) );
  ANDN U40 ( .B(n33), .A(n34), .Z(n31) );
  XNOR U41 ( .A(b[1]), .B(n32), .Z(n33) );
  XNOR U42 ( .A(b[1]), .B(n34), .Z(c[1]) );
  XNOR U43 ( .A(a[1]), .B(n35), .Z(n34) );
  IV U44 ( .A(n32), .Z(n35) );
  XOR U45 ( .A(carry_on), .B(n36), .Z(n32) );
  NANDN U46 ( .A(n37), .B(n38), .Z(n36) );
  XOR U47 ( .A(carry_on), .B(b[0]), .Z(n38) );
  XNOR U48 ( .A(b[0]), .B(n37), .Z(c[0]) );
  XNOR U49 ( .A(a[0]), .B(carry_on), .Z(n37) );
endmodule

