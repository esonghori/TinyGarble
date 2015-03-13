module sum ( clk, rst, a, b, c );
input  [3:0] a;
input  [3:0] b;
output [3:0] c;
input clk, rst;

wire n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, 
	n10, n11;

wire c0, c1, c2, c3;

XOR U0 ( .A(c0), .B(n0), .Z(c1) );
ANDN U1 ( .B(n1), .A(n2), .Z(n0) );
XOR U2 ( .A(c0), .B(b[0]), .Z(n1) );
XNOR U3 ( .A(b[0]), .B(n2), .Z(c[0]) );
XNOR U4 ( .A(a[0]), .B(c0), .Z(n2) );
XOR U5 ( .A(c1), .B(n3), .Z(c2) );
ANDN U6 ( .B(n4), .A(n5), .Z(n3) );
XOR U7 ( .A(c1), .B(b[1]), .Z(n4) );
XNOR U8 ( .A(b[1]), .B(n5), .Z(c[1]) );
XNOR U9 ( .A(a[1]), .B(c1), .Z(n5) );
XOR U10 ( .A(c2), .B(n6), .Z(c3) );
ANDN U11 ( .B(n7), .A(n8), .Z(n6) );
XOR U12 ( .A(c2), .B(b[2]), .Z(n7) );
XNOR U13 ( .A(b[2]), .B(n8), .Z(c[2]) );
XNOR U14 ( .A(a[2]), .B(c2), .Z(n8) );
XOR U15 ( .A(c3), .B(n9), .Z(c4) );
ANDN U16 ( .B(n10), .A(n11), .Z(n9) );
XOR U17 ( .A(c3), .B(b[3]), .Z(n10) );
XNOR U18 ( .A(b[3]), .B(n11), .Z(c[3]) );
XNOR U19 ( .A(a[3]), .B(c3), .Z(n11) );


endmodule
