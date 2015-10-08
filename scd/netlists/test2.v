module test2 ( 
  clk, 
  rst, 
  g_input, 
  e_input, 
  o);

input clk, rst;
input [1:0] g_input;
input [1:0] e_input;
output o;

wire w6, w7, w8, w9;

XOR U1 (.A(g_input[0]),  .B(g_input[1]),  .Z(w8));
XOR U2 (.A(e_input[0]),  .B(e_input[1]),  .Z(w9));
AND  U3 (.A(w6),       .B(w7),  .Z(o));

DFF DU1 ( .D(w8), .CLK(clk), .RST(rst), .I(1'b0),   .Q(w6));
DFF DU2 ( .D(w9), .CLK(clk), .RST(rst), .I(1'b0),   .Q(w7));


endmodule
