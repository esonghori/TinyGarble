module test1 ( 
  clk, 
  rst, 
  g_init, 
  e_init, 
  g_input, 
  e_input, 
  o);

input clk, rst;
input  g_init;
input  e_init;
input [1:0] g_input;
input [1:0] e_input;
output o;

wire w6, w7, w8, w9;

XOR U1 (.A(g_input[0]),  .B(g_input[1]),  .Z(w8));
XOR U2 (.A(e_input[0]),  .B(e_input[1]),  .Z(w9));
AND  U3 (.A(w6),       .B(w7),  .Z(o));

DFF DU1 ( .D(w8), .CLK(clk), .RST(rst), .I(g_init),   .Q(w6));
DFF DU2 ( .D(w9), .CLK(clk), .RST(rst), .I(e_init),   .Q(w7));


endmodule
