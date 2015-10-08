module test2 ( 
  clk, 
  rst, 
  g_init, 
  e_init, 
  o);

input clk, rst;
input [1:0] g_init;
input e_init;
output o;

wire w3, w4, w5, w6, w7, w8;

AND U1 (.A(w3),  .B(w4),  .Z(w6));
OR U2 (.A(w4),   .B(w5),  .Z(w7));
XOR  U3 (.A(w5), .B(w3),  .Z(w8));
IV  U3 (.A(w7), .B(w3),  .Z(o));

DFF DU1 ( .D(w6), .CLK(clk), .RST(rst), .I(g_init[0]),   .Q(w3));
DFF DU2 ( .D(w7), .CLK(clk), .RST(rst), .I(g_init[1]),   .Q(w4));
DFF DU3 ( .D(w8), .CLK(clk), .RST(rst), .I(e_init),   .Q(w5));


endmodule
