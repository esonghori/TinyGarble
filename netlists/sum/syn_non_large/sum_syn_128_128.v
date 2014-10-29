
module sum_N128_CC128 ( clk, rst, a, b, c );
  input [0:0] a;
  input [0:0] b;
  output [0:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n4, n5, n6;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U8 ( .A(a[0]), .B(b[0]), .Z(n4) );
  XOR U9 ( .A(carry_on), .B(n4), .Z(c[0]) );
  NAND U10 ( .A(b[0]), .B(a[0]), .Z(n6) );
  NAND U11 ( .A(n4), .B(carry_on), .Z(n5) );
  NAND U12 ( .A(n6), .B(n5), .Z(carry_on_d) );
endmodule

