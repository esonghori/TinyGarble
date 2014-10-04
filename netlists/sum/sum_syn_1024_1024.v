
module sum_N1024_CC1024 ( clk, rst, a, b, c );
  input [0:0] a;
  input [0:0] b;
  output [0:0] c;
  input clk, rst;
  wire   \carry_on[0] , N4, n5, n13, n14, n15, n16, n17, n18;

  DFF \carry_on_reg[0]  ( .D(N4), .CLK(clk), .RST(rst), .Q(\carry_on[0] ) );
  DFF \rc_reg[0]  ( .D(n5), .CLK(clk), .RST(1'b0), .Q(c[0]) );
  NAND U17 ( .A(a[0]), .B(b[0]), .Z(n14) );
  XOR U18 ( .A(a[0]), .B(b[0]), .Z(n15) );
  NAND U19 ( .A(n15), .B(\carry_on[0] ), .Z(n13) );
  NAND U20 ( .A(n14), .B(n13), .Z(N4) );
  NAND U22 ( .A(c[0]), .B(rst), .Z(n18) );
  XOR U23 ( .A(n15), .B(\carry_on[0] ), .Z(n16) );
  NANDN U24 ( .A(rst), .B(n16), .Z(n17) );
  NAND U25 ( .A(n18), .B(n17), .Z(n5) );
endmodule

