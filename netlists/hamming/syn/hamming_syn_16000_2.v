
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67;
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
  XNOR U60 ( .A(oglobal[9]), .B(n57), .Z(o[9]) );
  XNOR U61 ( .A(oglobal[8]), .B(n58), .Z(o[8]) );
  XNOR U62 ( .A(oglobal[7]), .B(n59), .Z(o[7]) );
  XNOR U63 ( .A(oglobal[6]), .B(n60), .Z(o[6]) );
  XNOR U64 ( .A(oglobal[5]), .B(n61), .Z(o[5]) );
  XNOR U65 ( .A(oglobal[4]), .B(n62), .Z(o[4]) );
  XNOR U66 ( .A(oglobal[3]), .B(n63), .Z(o[3]) );
  XNOR U67 ( .A(oglobal[2]), .B(n64), .Z(o[2]) );
  XNOR U68 ( .A(oglobal[1]), .B(n65), .Z(o[1]) );
  XOR U69 ( .A(oglobal[10]), .B(n66), .Z(o[10]) );
  ANDN U70 ( .B(oglobal[9]), .A(n57), .Z(n66) );
  NANDN U71 ( .A(n58), .B(oglobal[8]), .Z(n57) );
  NANDN U72 ( .A(n59), .B(oglobal[7]), .Z(n58) );
  NANDN U73 ( .A(n60), .B(oglobal[6]), .Z(n59) );
  NANDN U74 ( .A(n61), .B(oglobal[5]), .Z(n60) );
  NANDN U75 ( .A(n62), .B(oglobal[4]), .Z(n61) );
  NANDN U76 ( .A(n63), .B(oglobal[3]), .Z(n62) );
  NANDN U77 ( .A(n64), .B(oglobal[2]), .Z(n63) );
  NANDN U78 ( .A(n65), .B(oglobal[1]), .Z(n64) );
  NANDN U79 ( .A(n67), .B(oglobal[0]), .Z(n65) );
  XNOR U80 ( .A(oglobal[0]), .B(n67), .Z(o[0]) );
  XNOR U81 ( .A(y[0]), .B(x[0]), .Z(n67) );
endmodule

