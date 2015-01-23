
module sum_N1024_CC512 ( clk, rst, a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [1:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(n1), .B(n2), .Z(carry_on_d) );
  ANDN U4 ( .B(n3), .A(n4), .Z(n1) );
  XOR U5 ( .A(b[1]), .B(n2), .Z(n3) );
  XNOR U6 ( .A(b[1]), .B(n4), .Z(c[1]) );
  XNOR U7 ( .A(a[1]), .B(n2), .Z(n4) );
  XNOR U8 ( .A(carry_on), .B(n5), .Z(n2) );
  NANDN U9 ( .A(n6), .B(n7), .Z(n5) );
  XOR U10 ( .A(carry_on), .B(b[0]), .Z(n7) );
  XNOR U11 ( .A(b[0]), .B(n6), .Z(c[0]) );
  XNOR U12 ( .A(a[0]), .B(carry_on), .Z(n6) );
endmodule

