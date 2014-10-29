
module hamming_N16000_CC3200_DW01_add_0 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  XOR U1 ( .A(A[9]), .B(n1), .Z(SUM[9]) );
  XOR U2 ( .A(A[8]), .B(n2), .Z(SUM[8]) );
  XNOR U3 ( .A(A[7]), .B(n3), .Z(SUM[7]) );
  XOR U4 ( .A(A[6]), .B(n4), .Z(SUM[6]) );
  XNOR U5 ( .A(A[5]), .B(n5), .Z(SUM[5]) );
  XOR U6 ( .A(A[4]), .B(n6), .Z(SUM[4]) );
  XNOR U7 ( .A(A[3]), .B(n7), .Z(SUM[3]) );
  XOR U8 ( .A(n8), .B(n9), .Z(SUM[2]) );
  XNOR U9 ( .A(B[2]), .B(A[2]), .Z(n9) );
  XOR U10 ( .A(n10), .B(n11), .Z(SUM[1]) );
  XOR U11 ( .A(B[1]), .B(A[1]), .Z(n11) );
  XOR U12 ( .A(A[13]), .B(n12), .Z(SUM[13]) );
  ANDN U13 ( .B(A[12]), .A(n13), .Z(n12) );
  XNOR U14 ( .A(A[12]), .B(n13), .Z(SUM[12]) );
  NANDN U15 ( .A(n14), .B(A[11]), .Z(n13) );
  XNOR U16 ( .A(A[11]), .B(n14), .Z(SUM[11]) );
  NAND U17 ( .A(n15), .B(A[10]), .Z(n14) );
  XOR U18 ( .A(A[10]), .B(n15), .Z(SUM[10]) );
  AND U19 ( .A(A[9]), .B(n1), .Z(n15) );
  AND U20 ( .A(n2), .B(A[8]), .Z(n1) );
  ANDN U21 ( .B(A[7]), .A(n3), .Z(n2) );
  NAND U22 ( .A(n4), .B(A[6]), .Z(n3) );
  ANDN U23 ( .B(A[5]), .A(n5), .Z(n4) );
  NAND U24 ( .A(n6), .B(A[4]), .Z(n5) );
  ANDN U25 ( .B(A[3]), .A(n7), .Z(n6) );
  AND U26 ( .A(n16), .B(n17), .Z(n7) );
  NAND U27 ( .A(n18), .B(B[2]), .Z(n17) );
  NANDN U28 ( .A(A[2]), .B(n8), .Z(n18) );
  NANDN U29 ( .A(n8), .B(A[2]), .Z(n16) );
  AND U30 ( .A(n19), .B(n20), .Z(n8) );
  NAND U31 ( .A(n21), .B(B[1]), .Z(n20) );
  OR U32 ( .A(n10), .B(A[1]), .Z(n21) );
  NAND U33 ( .A(n10), .B(A[1]), .Z(n19) );
  AND U34 ( .A(B[0]), .B(A[0]), .Z(n10) );
  XOR U35 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module hamming_N16000_CC3200 ( clk, rst, x, y, o );
  input [4:0] x;
  input [4:0] y;
  output [13:0] o;
  input clk, rst;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35;
  wire   [2:0] olocal;
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
  hamming_N16000_CC3200_DW01_add_0 add_97 ( .A(oglobal), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, olocal}), .CI(1'b0), 
        .SUM(o) );
  AND U23 ( .A(n18), .B(n19), .Z(olocal[2]) );
  XOR U24 ( .A(n19), .B(n18), .Z(olocal[1]) );
  NAND U25 ( .A(n20), .B(n21), .Z(n18) );
  NANDN U26 ( .A(n22), .B(n23), .Z(n21) );
  NANDN U27 ( .A(n24), .B(n25), .Z(n20) );
  IV U28 ( .A(n26), .Z(n25) );
  NANDN U29 ( .A(n27), .B(n28), .Z(n19) );
  OR U30 ( .A(n29), .B(n30), .Z(n28) );
  XNOR U31 ( .A(n31), .B(n29), .Z(olocal[0]) );
  XNOR U32 ( .A(y[3]), .B(x[3]), .Z(n29) );
  NOR U33 ( .A(n30), .B(n27), .Z(n31) );
  AND U34 ( .A(n32), .B(n33), .Z(n27) );
  XNOR U35 ( .A(n22), .B(n23), .Z(n33) );
  XOR U36 ( .A(y[4]), .B(x[4]), .Z(n32) );
  AND U37 ( .A(n34), .B(n35), .Z(n30) );
  XOR U38 ( .A(n22), .B(n23), .Z(n35) );
  XOR U39 ( .A(n24), .B(n26), .Z(n23) );
  XNOR U40 ( .A(y[1]), .B(x[1]), .Z(n26) );
  XNOR U41 ( .A(y[2]), .B(x[2]), .Z(n24) );
  XNOR U42 ( .A(y[0]), .B(x[0]), .Z(n22) );
  XNOR U43 ( .A(y[4]), .B(x[4]), .Z(n34) );
endmodule

