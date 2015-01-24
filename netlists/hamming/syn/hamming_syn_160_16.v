
module hamming_N160_CC16 ( clk, rst, x, y, o );
  input [9:0] x;
  input [9:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;
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
  NANDN U22 ( .A(n51), .B(n52), .Z(n41) );
  NANDN U23 ( .A(n21), .B(oglobal[2]), .Z(n20) );
  XOR U24 ( .A(oglobal[7]), .B(n10), .Z(o[7]) );
  ANDN U25 ( .B(oglobal[6]), .A(n11), .Z(n10) );
  XNOR U26 ( .A(oglobal[6]), .B(n11), .Z(o[6]) );
  NANDN U27 ( .A(n12), .B(oglobal[5]), .Z(n11) );
  XNOR U28 ( .A(oglobal[5]), .B(n12), .Z(o[5]) );
  NANDN U29 ( .A(n13), .B(oglobal[4]), .Z(n12) );
  XNOR U30 ( .A(oglobal[4]), .B(n13), .Z(o[4]) );
  AND U31 ( .A(n14), .B(n15), .Z(n13) );
  NANDN U32 ( .A(n16), .B(oglobal[3]), .Z(n15) );
  NANDN U33 ( .A(n17), .B(oglobal[3]), .Z(n14) );
  XNOR U34 ( .A(n17), .B(n18), .Z(o[3]) );
  XNOR U35 ( .A(oglobal[3]), .B(n16), .Z(n18) );
  AND U36 ( .A(n19), .B(n20), .Z(n16) );
  NAND U37 ( .A(n22), .B(n23), .Z(n19) );
  NANDN U38 ( .A(oglobal[2]), .B(n21), .Z(n22) );
  OR U39 ( .A(n24), .B(n25), .Z(n17) );
  XNOR U40 ( .A(n23), .B(n26), .Z(o[2]) );
  XOR U41 ( .A(oglobal[2]), .B(n21), .Z(n26) );
  AND U42 ( .A(n27), .B(n28), .Z(n21) );
  NANDN U43 ( .A(n29), .B(oglobal[1]), .Z(n28) );
  NAND U44 ( .A(n30), .B(n31), .Z(n27) );
  NANDN U45 ( .A(oglobal[1]), .B(n29), .Z(n30) );
  XOR U46 ( .A(n24), .B(n25), .Z(n23) );
  AND U47 ( .A(n32), .B(n33), .Z(n25) );
  OR U48 ( .A(n34), .B(n35), .Z(n33) );
  XOR U49 ( .A(n36), .B(n37), .Z(n32) );
  NAND U50 ( .A(n38), .B(n39), .Z(n37) );
  XOR U51 ( .A(n36), .B(n40), .Z(n38) );
  OR U52 ( .A(n41), .B(n42), .Z(n24) );
  XOR U53 ( .A(n31), .B(n43), .Z(o[1]) );
  XNOR U54 ( .A(oglobal[1]), .B(n29), .Z(n43) );
  NANDN U55 ( .A(n44), .B(oglobal[0]), .Z(n29) );
  XOR U56 ( .A(n39), .B(n40), .Z(n31) );
  XOR U57 ( .A(n41), .B(n42), .Z(n40) );
  AND U58 ( .A(n45), .B(n46), .Z(n42) );
  OR U59 ( .A(n47), .B(n48), .Z(n46) );
  NANDN U60 ( .A(n49), .B(n50), .Z(n45) );
  XOR U61 ( .A(n35), .B(n53), .Z(n39) );
  XOR U62 ( .A(n34), .B(n36), .Z(n53) );
  ANDN U63 ( .B(n54), .A(n55), .Z(n36) );
  OR U64 ( .A(n56), .B(n57), .Z(n34) );
  AND U65 ( .A(n58), .B(n59), .Z(n35) );
  OR U66 ( .A(n60), .B(n61), .Z(n59) );
  OR U67 ( .A(n62), .B(n63), .Z(n58) );
  XNOR U68 ( .A(oglobal[0]), .B(n44), .Z(o[0]) );
  XOR U69 ( .A(n54), .B(n55), .Z(n44) );
  XOR U70 ( .A(n49), .B(n50), .Z(n55) );
  XNOR U71 ( .A(n51), .B(n52), .Z(n50) );
  XOR U72 ( .A(y[7]), .B(x[7]), .Z(n52) );
  XNOR U73 ( .A(y[6]), .B(x[6]), .Z(n51) );
  XNOR U74 ( .A(n47), .B(n48), .Z(n49) );
  XNOR U75 ( .A(y[5]), .B(x[5]), .Z(n48) );
  XNOR U76 ( .A(y[4]), .B(x[4]), .Z(n47) );
  XOR U77 ( .A(n62), .B(n63), .Z(n54) );
  XNOR U78 ( .A(n57), .B(n56), .Z(n63) );
  XNOR U79 ( .A(y[3]), .B(x[3]), .Z(n56) );
  XNOR U80 ( .A(y[2]), .B(x[2]), .Z(n57) );
  XNOR U81 ( .A(n60), .B(n61), .Z(n62) );
  XNOR U82 ( .A(y[1]), .B(x[1]), .Z(n61) );
  XNOR U83 ( .A(y[0]), .B(x[0]), .Z(n60) );
endmodule

