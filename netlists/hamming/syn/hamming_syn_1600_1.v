
module hamming_N160_CC160 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [7:0] oglobal;

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
  XOR U32 ( .A(oglobal[7]), .B(n32), .Z(o[7]) );
  AND U33 ( .A(n33), .B(n34), .Z(n32) );
  AND U34 ( .A(oglobal[4]), .B(n35), .Z(n34) );
  ANDN U35 ( .B(oglobal[3]), .A(n36), .Z(n35) );
  AND U36 ( .A(oglobal[5]), .B(oglobal[6]), .Z(n33) );
  XOR U37 ( .A(oglobal[6]), .B(n37), .Z(o[6]) );
  ANDN U38 ( .B(oglobal[5]), .A(n38), .Z(n37) );
  XNOR U39 ( .A(oglobal[5]), .B(n38), .Z(o[5]) );
  NANDN U40 ( .A(n39), .B(oglobal[4]), .Z(n38) );
  XNOR U41 ( .A(oglobal[4]), .B(n39), .Z(o[4]) );
  NANDN U42 ( .A(n36), .B(oglobal[3]), .Z(n39) );
  XNOR U43 ( .A(oglobal[3]), .B(n36), .Z(o[3]) );
  NANDN U44 ( .A(n40), .B(oglobal[2]), .Z(n36) );
  XNOR U45 ( .A(oglobal[2]), .B(n40), .Z(o[2]) );
  NANDN U46 ( .A(n41), .B(oglobal[1]), .Z(n40) );
  XNOR U47 ( .A(oglobal[1]), .B(n41), .Z(o[1]) );
  NANDN U48 ( .A(n42), .B(oglobal[0]), .Z(n41) );
  XNOR U49 ( .A(oglobal[0]), .B(n42), .Z(o[0]) );
  XNOR U50 ( .A(y[0]), .B(x[0]), .Z(n42) );
endmodule

