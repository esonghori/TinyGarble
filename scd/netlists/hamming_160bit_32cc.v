
module hamming_N160_CC32 ( clk, rst, g_input, e_input, o );
  input [4:0] g_input;
  input [4:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
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
  MUX U16 ( .IN0(n24), .IN1(n9), .SEL(n25), .F(n19) );
  IV U17 ( .A(oglobal[1]), .Z(n9) );
  MUX U18 ( .IN0(n29), .IN1(n27), .SEL(n28), .F(n10) );
  IV U19 ( .A(n10), .Z(n22) );
  MUX U20 ( .IN0(n11), .IN1(n31), .SEL(n32), .F(n23) );
  IV U21 ( .A(n33), .Z(n11) );
  MUX U22 ( .IN0(n12), .IN1(oglobal[2]), .SEL(n20), .F(n18) );
  IV U23 ( .A(n19), .Z(n12) );
  XNOR U24 ( .A(n26), .B(n22), .Z(n25) );
  XOR U25 ( .A(n13), .B(n14), .Z(o[7]) );
  XOR U26 ( .A(oglobal[7]), .B(n15), .Z(n14) );
  ANDN U27 ( .A(n13), .B(oglobal[6]), .Z(n15) );
  XOR U28 ( .A(oglobal[6]), .B(n13), .Z(o[6]) );
  ANDN U29 ( .A(oglobal[5]), .B(n16), .Z(n13) );
  XNOR U30 ( .A(oglobal[5]), .B(n16), .Z(o[5]) );
  NANDN U31 ( .B(n17), .A(oglobal[4]), .Z(n16) );
  XNOR U32 ( .A(oglobal[4]), .B(n17), .Z(o[4]) );
  NAND U33 ( .A(n18), .B(oglobal[3]), .Z(n17) );
  XOR U34 ( .A(oglobal[3]), .B(n18), .Z(o[3]) );
  XOR U35 ( .A(oglobal[2]), .B(n20), .Z(o[2]) );
  XNOR U36 ( .A(n19), .B(n21), .Z(n20) );
  ANDN U37 ( .A(n22), .B(n23), .Z(n21) );
  XOR U38 ( .A(oglobal[1]), .B(n25), .Z(o[1]) );
  XNOR U39 ( .A(n23), .B(n24), .Z(n26) );
  NAND U40 ( .A(oglobal[0]), .B(n30), .Z(n24) );
  XOR U41 ( .A(oglobal[0]), .B(n30), .Z(o[0]) );
  XOR U42 ( .A(n29), .B(n28), .Z(n30) );
  XNOR U43 ( .A(n34), .B(n27), .Z(n28) );
  XNOR U44 ( .A(g_input[0]), .B(e_input[0]), .Z(n27) );
  XNOR U45 ( .A(g_input[1]), .B(e_input[1]), .Z(n34) );
  XOR U46 ( .A(n33), .B(n32), .Z(n29) );
  XNOR U47 ( .A(n35), .B(n31), .Z(n32) );
  XNOR U48 ( .A(g_input[2]), .B(e_input[2]), .Z(n31) );
  XNOR U49 ( .A(g_input[4]), .B(e_input[4]), .Z(n35) );
  XOR U50 ( .A(g_input[3]), .B(e_input[3]), .Z(n33) );
endmodule

