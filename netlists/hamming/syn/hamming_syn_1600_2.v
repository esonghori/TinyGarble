
module hamming_N1600_CC2 ( clk, rst, x, y, o );
  input [799:0] x;
  input [799:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n12, n13;
  wire   [10:0] oglobal;
  assign o[8] = 1'b0;
  assign o[7] = 1'b0;
  assign o[6] = 1'b0;
  assign o[5] = 1'b0;
  assign o[4] = 1'b0;
  assign o[3] = 1'b0;
  assign o[2] = 1'b0;
  assign o[1] = 1'b0;
  assign o[0] = 1'b0;

  DFF \oglobal_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[9]) );
  DFF \oglobal_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[10]) );
  XNOR U25 ( .A(oglobal[9]), .B(n12), .Z(o[9]) );
  XOR U26 ( .A(oglobal[10]), .B(n13), .Z(o[10]) );
  ANDN U27 ( .B(oglobal[9]), .A(n12), .Z(n13) );
  XNOR U28 ( .A(y[0]), .B(x[0]), .Z(n12) );
endmodule

