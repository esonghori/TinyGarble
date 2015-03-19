module sum ( clk, rst, g, e, o );
input  [3:0] g;
input  [3:0] e;
output [3:0] o;
input clk, rst;

wire w1, w2, w3;


AND 	U1 ( .A(g[0]), .B(e[0]) .Z(o[0]));
ANDN 	U2 ( .A(g[1]), .B(e[1]) .Z(o[1]));
NAND 	U3 ( .A(g[2]), .B(e[2]) .Z(o[2]));
OR 		U4 ( .A(g[3]), .B(e[3]) .Z(w1) 	);
ORN 	U5 ( .A(w1),   .B(w2),  .Z(w3) 	);
NOR 	U6 ( .A(w3),   .B(e[3]),.Z(o[3]));

DFF U7 ( .D(w3), .CLK(clk), .RST(rst), .I(1'b0), .Q(w2));


endmodule
