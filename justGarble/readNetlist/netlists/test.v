module sum ( clk, rst, g, e, o );
input  g;
input  e;
output o;
input clk, rst;

wire w1, w2, w3, CO, CI;


XOR U1 (.A(g),  .B(CI), .Z(w1));
XOR U2 (.A(e),  .B(CI), .Z(w2));
AND	U3 (.A(w1), .B(w2), .Z(w3));
XOR U4 (.A(w1), .B(e),  .Z(o) );
XOR U4 (.A(w3), .B(CI), .Z(CO));


DFF U7 ( .D(CO), .CLK(clk), .RST(rst), .I(1'b0), .Q(CI));


endmodule
