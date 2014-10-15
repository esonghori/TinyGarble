
module test ( clk, rst, x, y, o );
  input x;
  input y;
  output o;
  input clk
  input rst;
  wire   n1, n2, n3;


  DFF U1  ( .D(n2), .CLK(clk), .RST(rst), .Q(n3) );
  AND U7 ( .A(x), .B(n2), .Z(o) );
  AND U1 ( .A(x), .B(y), .Z(n1) );
  XOR U6 ( .A(n3), .B(n1), .Z(n2) );
  

endmodule

