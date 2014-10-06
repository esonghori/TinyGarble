
module sum_N1024_CC1024 ( clk, rst, a, b, c );
  input [0:0] a;
  input [0:0] b;
  output [0:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n4, n5, n6;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  NAND U8 ( .A(a[0]), .B(b[0]), .Z(n4) );
  NANDN U9 ( .A(n6), .B(carry_on), .Z(n5) );
  NAND U10 ( .A(n4), .B(n5), .Z(carry_on_d) );
  XNOR U11 ( .A(a[0]), .B(b[0]), .Z(n6) );
  XNOR U12 ( .A(carry_on), .B(n6), .Z(c[0]) );
endmodule

