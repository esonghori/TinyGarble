
module hamming_N1600_CC1600 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111;
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
  XNOR U104 ( .A(oglobal[9]), .B(n101), .Z(o[9]) );
  XNOR U105 ( .A(oglobal[8]), .B(n102), .Z(o[8]) );
  XNOR U106 ( .A(oglobal[7]), .B(n103), .Z(o[7]) );
  XNOR U107 ( .A(oglobal[6]), .B(n104), .Z(o[6]) );
  XNOR U108 ( .A(oglobal[5]), .B(n105), .Z(o[5]) );
  XNOR U109 ( .A(oglobal[4]), .B(n106), .Z(o[4]) );
  XNOR U110 ( .A(oglobal[3]), .B(n107), .Z(o[3]) );
  XNOR U111 ( .A(oglobal[2]), .B(n108), .Z(o[2]) );
  XNOR U112 ( .A(oglobal[1]), .B(n109), .Z(o[1]) );
  XOR U113 ( .A(oglobal[10]), .B(n110), .Z(o[10]) );
  ANDN U114 ( .B(oglobal[9]), .A(n101), .Z(n110) );
  NANDN U115 ( .A(n102), .B(oglobal[8]), .Z(n101) );
  NANDN U116 ( .A(n103), .B(oglobal[7]), .Z(n102) );
  NANDN U117 ( .A(n104), .B(oglobal[6]), .Z(n103) );
  NANDN U118 ( .A(n105), .B(oglobal[5]), .Z(n104) );
  NANDN U119 ( .A(n106), .B(oglobal[4]), .Z(n105) );
  NANDN U120 ( .A(n107), .B(oglobal[3]), .Z(n106) );
  NANDN U121 ( .A(n108), .B(oglobal[2]), .Z(n107) );
  NANDN U122 ( .A(n109), .B(oglobal[1]), .Z(n108) );
  NANDN U123 ( .A(n111), .B(oglobal[0]), .Z(n109) );
  XNOR U124 ( .A(oglobal[0]), .B(n111), .Z(o[0]) );
  XNOR U125 ( .A(y[0]), .B(x[0]), .Z(n111) );
endmodule

