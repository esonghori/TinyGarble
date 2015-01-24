
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;
  wire   [10:0] oglobal;

  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[0]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[1]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[2]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[3]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[4]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[5]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[6]) );
  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[7]) );
  DFF \oglobal_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[8]) );
  DFF \oglobal_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[9]) );
  DFF \oglobal_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[10]) );
  XNOR U38 ( .A(oglobal[9]), .B(n35), .Z(o[9]) );
  XNOR U39 ( .A(oglobal[8]), .B(n36), .Z(o[8]) );
  XNOR U40 ( .A(oglobal[7]), .B(n37), .Z(o[7]) );
  XNOR U41 ( .A(oglobal[6]), .B(n38), .Z(o[6]) );
  XNOR U42 ( .A(oglobal[5]), .B(n39), .Z(o[5]) );
  XNOR U43 ( .A(oglobal[4]), .B(n40), .Z(o[4]) );
  XNOR U44 ( .A(oglobal[3]), .B(n41), .Z(o[3]) );
  XNOR U45 ( .A(oglobal[2]), .B(n42), .Z(o[2]) );
  XNOR U46 ( .A(oglobal[1]), .B(n43), .Z(o[1]) );
  XOR U47 ( .A(oglobal[10]), .B(n44), .Z(o[10]) );
  ANDN U48 ( .B(oglobal[9]), .A(n35), .Z(n44) );
  NANDN U49 ( .A(n36), .B(oglobal[8]), .Z(n35) );
  NANDN U50 ( .A(n37), .B(oglobal[7]), .Z(n36) );
  NANDN U51 ( .A(n38), .B(oglobal[6]), .Z(n37) );
  NANDN U52 ( .A(n39), .B(oglobal[5]), .Z(n38) );
  NANDN U53 ( .A(n40), .B(oglobal[4]), .Z(n39) );
  NANDN U54 ( .A(n41), .B(oglobal[3]), .Z(n40) );
  NANDN U55 ( .A(n42), .B(oglobal[2]), .Z(n41) );
  NANDN U56 ( .A(n43), .B(oglobal[1]), .Z(n42) );
  NANDN U57 ( .A(n45), .B(oglobal[0]), .Z(n43) );
  XNOR U58 ( .A(oglobal[0]), .B(n45), .Z(o[0]) );
  XNOR U59 ( .A(y[0]), .B(x[0]), .Z(n45) );
endmodule

