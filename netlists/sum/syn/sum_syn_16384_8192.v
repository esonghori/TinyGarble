
module sum_N16384_CC8192 ( clk, rst, a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [1:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n2, n3, n4, n5, n6, n7, n8;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XOR U4 ( .A(n2), .B(n3), .Z(carry_on_d) );
  ANDN U5 ( .B(n4), .A(n5), .Z(n2) );
  XOR U6 ( .A(b[1]), .B(n3), .Z(n4) );
  XNOR U7 ( .A(b[1]), .B(n5), .Z(c[1]) );
  XNOR U8 ( .A(a[1]), .B(n3), .Z(n5) );
  XNOR U9 ( .A(carry_on), .B(n6), .Z(n3) );
  NANDN U10 ( .A(n7), .B(n8), .Z(n6) );
  XOR U11 ( .A(carry_on), .B(b[0]), .Z(n8) );
  XNOR U12 ( .A(b[0]), .B(n7), .Z(c[0]) );
  XNOR U13 ( .A(a[0]), .B(carry_on), .Z(n7) );
endmodule

