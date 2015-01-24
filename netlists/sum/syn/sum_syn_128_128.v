
module sum_N128_CC128 ( clk, rst, a, b, c );
  input [0:0] a;
  input [0:0] b;
  output [0:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(carry_on), .B(n1), .Z(carry_on_d) );
  ANDN U4 ( .B(n2), .A(n3), .Z(n1) );
  XOR U5 ( .A(carry_on), .B(b[0]), .Z(n2) );
  XNOR U6 ( .A(b[0]), .B(n3), .Z(c[0]) );
  XNOR U7 ( .A(a[0]), .B(carry_on), .Z(n3) );
endmodule

