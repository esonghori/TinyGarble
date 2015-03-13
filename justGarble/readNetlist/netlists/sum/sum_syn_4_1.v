module sum ( clk, rst, a, b, c );
input  [3:0] a;
input  [3:0] b;
output [3:0] c;
input clk, rst;

AND U1 ( .A(a[0]), .B(b[0]) .Z(c[0]) );
AND U2 ( .A(a[1]), .B(b[1]) .Z(c[1]) );
AND U3 ( .A(a[2]), .B(b[2]) .Z(c[2]) );
AND U4 ( .A(a[3]), .B(b[3]) .Z(c[3]) );


endmodule
