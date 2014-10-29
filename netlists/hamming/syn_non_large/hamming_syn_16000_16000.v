
module hamming_N16000_CC16000_DW01_add_0 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  XOR U1 ( .A(A[9]), .B(n1), .Z(SUM[9]) );
  XOR U2 ( .A(A[8]), .B(n2), .Z(SUM[8]) );
  XOR U3 ( .A(A[7]), .B(n3), .Z(SUM[7]) );
  XNOR U4 ( .A(A[6]), .B(n4), .Z(SUM[6]) );
  XOR U5 ( .A(A[5]), .B(n5), .Z(SUM[5]) );
  XNOR U6 ( .A(A[4]), .B(n6), .Z(SUM[4]) );
  XOR U7 ( .A(A[3]), .B(n7), .Z(SUM[3]) );
  XNOR U8 ( .A(A[2]), .B(n8), .Z(SUM[2]) );
  XOR U9 ( .A(A[1]), .B(n9), .Z(SUM[1]) );
  AND U10 ( .A(A[0]), .B(B[0]), .Z(n9) );
  XOR U11 ( .A(A[13]), .B(n10), .Z(SUM[13]) );
  ANDN U12 ( .B(A[12]), .A(n11), .Z(n10) );
  XNOR U13 ( .A(A[12]), .B(n11), .Z(SUM[12]) );
  NAND U14 ( .A(n12), .B(A[11]), .Z(n11) );
  XOR U15 ( .A(A[11]), .B(n12), .Z(SUM[11]) );
  ANDN U16 ( .B(A[10]), .A(n13), .Z(n12) );
  XNOR U17 ( .A(A[10]), .B(n13), .Z(SUM[10]) );
  NAND U18 ( .A(n1), .B(A[9]), .Z(n13) );
  AND U19 ( .A(A[8]), .B(n2), .Z(n1) );
  AND U20 ( .A(n3), .B(A[7]), .Z(n2) );
  ANDN U21 ( .B(A[6]), .A(n4), .Z(n3) );
  NAND U22 ( .A(n5), .B(A[5]), .Z(n4) );
  ANDN U23 ( .B(A[4]), .A(n6), .Z(n5) );
  NAND U24 ( .A(n7), .B(A[3]), .Z(n6) );
  ANDN U25 ( .B(A[2]), .A(n8), .Z(n7) );
  NAND U26 ( .A(n14), .B(B[0]), .Z(n8) );
  AND U27 ( .A(A[0]), .B(A[1]), .Z(n14) );
  XOR U28 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module hamming_N16000_CC16000 ( clk, rst, x, y, o );
  input [0:0] x;
  input [0:0] y;
  output [13:0] o;
  input clk, rst;
  wire   \xy[0] ;
  wire   [13:0] oglobal;

  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .Q(oglobal[8]) );
  DFF \oglobal_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .Q(oglobal[9]) );
  DFF \oglobal_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .Q(oglobal[10]) );
  DFF \oglobal_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .Q(oglobal[11]) );
  DFF \oglobal_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .Q(oglobal[12]) );
  DFF \oglobal_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .Q(oglobal[13]) );
  hamming_N16000_CC16000_DW01_add_0 add_97 ( .A(oglobal), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, \xy[0] }), 
        .CI(1'b0), .SUM(o) );
  XOR U5 ( .A(y[0]), .B(x[0]), .Z(\xy[0] ) );
endmodule

