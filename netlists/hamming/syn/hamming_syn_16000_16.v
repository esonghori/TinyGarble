
module hamming_N16000_CC16 ( clk, rst, x, y, o );
  input [999:0] x;
  input [999:0] y;
  output [13:0] o;
  input clk, rst;
  wire   n15, n16, n17, n18, n19, n20;
  wire   [13:0] oglobal;
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
  DFF \oglobal_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[11]) );
  DFF \oglobal_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[12]) );
  DFF \oglobal_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[13]) );
  XNOR U28 ( .A(oglobal[9]), .B(n15), .Z(o[9]) );
  XOR U29 ( .A(n16), .B(n17), .Z(o[13]) );
  XOR U30 ( .A(oglobal[13]), .B(n18), .Z(n17) );
  AND U31 ( .A(n16), .B(o[12]), .Z(n18) );
  XOR U32 ( .A(oglobal[12]), .B(n16), .Z(o[12]) );
  ANDN U33 ( .B(n19), .A(o[11]), .Z(n16) );
  XOR U34 ( .A(oglobal[11]), .B(n19), .Z(o[11]) );
  ANDN U35 ( .B(n20), .A(o[10]), .Z(n19) );
  XOR U36 ( .A(oglobal[10]), .B(n20), .Z(o[10]) );
  ANDN U37 ( .B(oglobal[9]), .A(n15), .Z(n20) );
  XNOR U38 ( .A(y[0]), .B(x[0]), .Z(n15) );
endmodule

