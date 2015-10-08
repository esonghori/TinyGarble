module test0 ( 
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
input  g_input;
input  e_input;
output o;

wire w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;


AND U1 (.A(g_input),  .B(w4),  .Z(w8));
AND U2 (.A(e_input),  .B(w5),  .Z(w9));
OR  U3 (.A(w8),       .B(w9),  .Z(w10));
IV  U4 (.A(w10),               .Z(w11));
AND U5 (.A(w10),      .B(w6),  .Z(w12));
AND U6 (.A(w11),      .B(w7),  .Z(w13));
OR  U7 (.A(w12),      .B(w13), .Z(o));

DFF DU0 ( .D(w10), .CLK(clk), .RST(rst), .I(1'b0),   .Q(w4));
DFF DU1 ( .D(w11), .CLK(clk), .RST(rst), .I(1'b1),   .Q(w5));
DFF DU2 ( .D(w12), .CLK(clk), .RST(rst), .I(g_init), .Q(w6));
DFF DU3 ( .D(w13), .CLK(clk), .RST(rst), .I(e_init), .Q(w7));


endmodule
