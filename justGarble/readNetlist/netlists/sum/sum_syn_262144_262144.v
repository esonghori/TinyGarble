
module sum_N262144_CC262144 ( clk, rst, a, b, c );
  input [0:0] a;
  input [0:0] b;
  output [0:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n2, n3, n4;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        carry_on) );
  XOR U4 ( .A(carry_on), .B(n2), .Z(carry_on_d) );
  ANDN U5 ( .B(n3), .A(n4), .Z(n2) );
  XOR U6 ( .A(carry_on), .B(b[0]), .Z(n3) );
  XNOR U7 ( .A(b[0]), .B(n4), .Z(c[0]) );
  XNOR U8 ( .A(a[0]), .B(carry_on), .Z(n4) );
endmodule

