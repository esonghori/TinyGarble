
module hamming_N16000_CC640 ( clk, rst, x, y, o );
  input [24:0] x;
  input [24:0] y;
  output [13:0] o;
  input clk, rst;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128;
  wire   [13:0] oglobal;

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
  DFF \oglobal_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[11]) );
  DFF \oglobal_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[12]) );
  DFF \oglobal_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        oglobal[13]) );
  XNOR U42 ( .A(oglobal[3]), .B(n39), .Z(n17) );
  XNOR U43 ( .A(n79), .B(n76), .Z(n106) );
  XOR U44 ( .A(n48), .B(n50), .Z(n20) );
  XOR U45 ( .A(n62), .B(n64), .Z(n83) );
  XOR U46 ( .A(n119), .B(n118), .Z(n116) );
  XNOR U47 ( .A(oglobal[2]), .B(n54), .Z(n19) );
  XOR U48 ( .A(n15), .B(n16), .Z(o[4]) );
  XNOR U49 ( .A(n17), .B(n18), .Z(o[3]) );
  XNOR U50 ( .A(n19), .B(n20), .Z(o[2]) );
  XOR U51 ( .A(n21), .B(n22), .Z(o[1]) );
  XOR U52 ( .A(n23), .B(n24), .Z(o[13]) );
  XOR U53 ( .A(oglobal[13]), .B(n25), .Z(n24) );
  AND U54 ( .A(n23), .B(o[12]), .Z(n25) );
  XOR U55 ( .A(oglobal[12]), .B(n23), .Z(o[12]) );
  NOR U56 ( .A(o[11]), .B(n26), .Z(n23) );
  XNOR U57 ( .A(oglobal[11]), .B(n26), .Z(o[11]) );
  OR U58 ( .A(o[10]), .B(n27), .Z(n26) );
  XNOR U59 ( .A(oglobal[10]), .B(n27), .Z(o[10]) );
  OR U60 ( .A(o[9]), .B(n28), .Z(n27) );
  XNOR U61 ( .A(oglobal[9]), .B(n28), .Z(o[9]) );
  OR U62 ( .A(o[8]), .B(n29), .Z(n28) );
  XNOR U63 ( .A(oglobal[8]), .B(n29), .Z(o[8]) );
  OR U64 ( .A(o[7]), .B(n30), .Z(n29) );
  XNOR U65 ( .A(oglobal[7]), .B(n30), .Z(o[7]) );
  OR U66 ( .A(o[6]), .B(n31), .Z(n30) );
  XNOR U67 ( .A(oglobal[6]), .B(n31), .Z(o[6]) );
  OR U68 ( .A(o[5]), .B(n32), .Z(n31) );
  XNOR U69 ( .A(oglobal[5]), .B(n32), .Z(o[5]) );
  XNOR U70 ( .A(n33), .B(n34), .Z(n32) );
  ANDN U71 ( .B(n35), .A(n16), .Z(n33) );
  XNOR U72 ( .A(oglobal[4]), .B(n34), .Z(n16) );
  NANDN U73 ( .A(n34), .B(n15), .Z(n35) );
  OR U74 ( .A(n36), .B(n37), .Z(n15) );
  XOR U75 ( .A(n38), .B(n39), .Z(n34) );
  ANDN U76 ( .B(n40), .A(n17), .Z(n38) );
  XOR U77 ( .A(n39), .B(n18), .Z(n40) );
  XOR U78 ( .A(n36), .B(n37), .Z(n18) );
  AND U79 ( .A(n41), .B(n42), .Z(n37) );
  OR U80 ( .A(n43), .B(n44), .Z(n42) );
  XOR U81 ( .A(n45), .B(n46), .Z(n41) );
  AND U82 ( .A(n47), .B(n48), .Z(n45) );
  XOR U83 ( .A(n49), .B(n50), .Z(n47) );
  OR U84 ( .A(n51), .B(n52), .Z(n36) );
  XOR U85 ( .A(n53), .B(n54), .Z(n39) );
  ANDN U86 ( .B(n55), .A(n19), .Z(n53) );
  XOR U87 ( .A(n54), .B(n20), .Z(n55) );
  XOR U88 ( .A(n51), .B(n52), .Z(n50) );
  AND U89 ( .A(n56), .B(n57), .Z(n52) );
  OR U90 ( .A(n58), .B(n59), .Z(n57) );
  XOR U91 ( .A(n60), .B(n61), .Z(n56) );
  NAND U92 ( .A(n62), .B(n63), .Z(n61) );
  XOR U93 ( .A(n60), .B(n64), .Z(n63) );
  OR U94 ( .A(n65), .B(n66), .Z(n51) );
  XOR U95 ( .A(n49), .B(n67), .Z(n48) );
  XOR U96 ( .A(n43), .B(n44), .Z(n67) );
  AND U97 ( .A(n68), .B(n69), .Z(n44) );
  OR U98 ( .A(n70), .B(n71), .Z(n69) );
  XOR U99 ( .A(n72), .B(n73), .Z(n68) );
  NAND U100 ( .A(n74), .B(n75), .Z(n73) );
  XNOR U101 ( .A(n72), .B(n76), .Z(n74) );
  OR U102 ( .A(n77), .B(n78), .Z(n43) );
  IV U103 ( .A(n46), .Z(n49) );
  XOR U104 ( .A(n79), .B(n80), .Z(n46) );
  NAND U105 ( .A(n81), .B(n82), .Z(n80) );
  XOR U106 ( .A(n79), .B(n83), .Z(n81) );
  XNOR U107 ( .A(n84), .B(n85), .Z(n54) );
  NANDN U108 ( .A(n21), .B(n86), .Z(n85) );
  XNOR U109 ( .A(n84), .B(n22), .Z(n86) );
  XNOR U110 ( .A(n82), .B(n83), .Z(n22) );
  XOR U111 ( .A(n65), .B(n66), .Z(n64) );
  AND U112 ( .A(n87), .B(n88), .Z(n66) );
  OR U113 ( .A(n89), .B(n90), .Z(n88) );
  NANDN U114 ( .A(n91), .B(n92), .Z(n87) );
  OR U115 ( .A(n93), .B(n94), .Z(n65) );
  XOR U116 ( .A(n59), .B(n95), .Z(n62) );
  XOR U117 ( .A(n58), .B(n60), .Z(n95) );
  ANDN U118 ( .B(n96), .A(n97), .Z(n60) );
  OR U119 ( .A(n98), .B(n99), .Z(n58) );
  AND U120 ( .A(n100), .B(n101), .Z(n59) );
  OR U121 ( .A(n102), .B(n103), .Z(n101) );
  OR U122 ( .A(n104), .B(n105), .Z(n100) );
  XOR U123 ( .A(n75), .B(n106), .Z(n82) );
  XNOR U124 ( .A(n77), .B(n78), .Z(n76) );
  AND U125 ( .A(n107), .B(n108), .Z(n78) );
  OR U126 ( .A(n109), .B(n110), .Z(n108) );
  OR U127 ( .A(n111), .B(n112), .Z(n107) );
  OR U128 ( .A(n113), .B(n114), .Z(n77) );
  ANDN U129 ( .B(n115), .A(n116), .Z(n79) );
  XOR U130 ( .A(n71), .B(n117), .Z(n75) );
  XOR U131 ( .A(n70), .B(n72), .Z(n117) );
  ANDN U132 ( .B(n118), .A(n119), .Z(n72) );
  OR U133 ( .A(n120), .B(n121), .Z(n70) );
  AND U134 ( .A(n122), .B(n123), .Z(n71) );
  OR U135 ( .A(n124), .B(n125), .Z(n123) );
  OR U136 ( .A(n126), .B(n127), .Z(n122) );
  XNOR U137 ( .A(oglobal[1]), .B(n84), .Z(n21) );
  ANDN U138 ( .B(oglobal[0]), .A(n128), .Z(n84) );
  XNOR U139 ( .A(oglobal[0]), .B(n128), .Z(o[0]) );
  XOR U140 ( .A(n116), .B(n115), .Z(n128) );
  XNOR U141 ( .A(n96), .B(n97), .Z(n115) );
  XOR U142 ( .A(n91), .B(n92), .Z(n97) );
  XOR U143 ( .A(n93), .B(n94), .Z(n92) );
  XNOR U144 ( .A(y[15]), .B(x[15]), .Z(n94) );
  XNOR U145 ( .A(y[14]), .B(x[14]), .Z(n93) );
  XNOR U146 ( .A(n89), .B(n90), .Z(n91) );
  XNOR U147 ( .A(y[13]), .B(x[13]), .Z(n90) );
  XNOR U148 ( .A(y[12]), .B(x[12]), .Z(n89) );
  XOR U149 ( .A(n104), .B(n105), .Z(n96) );
  XNOR U150 ( .A(n99), .B(n98), .Z(n105) );
  XNOR U151 ( .A(y[11]), .B(x[11]), .Z(n98) );
  XNOR U152 ( .A(y[10]), .B(x[10]), .Z(n99) );
  XNOR U153 ( .A(n102), .B(n103), .Z(n104) );
  XNOR U154 ( .A(y[9]), .B(x[9]), .Z(n103) );
  XNOR U155 ( .A(y[8]), .B(x[8]), .Z(n102) );
  XOR U156 ( .A(n111), .B(n112), .Z(n118) );
  XNOR U157 ( .A(n114), .B(n113), .Z(n112) );
  XNOR U158 ( .A(y[7]), .B(x[7]), .Z(n113) );
  XNOR U159 ( .A(y[6]), .B(x[6]), .Z(n114) );
  XNOR U160 ( .A(n109), .B(n110), .Z(n111) );
  XNOR U161 ( .A(y[5]), .B(x[5]), .Z(n110) );
  XNOR U162 ( .A(y[4]), .B(x[4]), .Z(n109) );
  XNOR U163 ( .A(n126), .B(n127), .Z(n119) );
  XNOR U164 ( .A(n121), .B(n120), .Z(n127) );
  XNOR U165 ( .A(y[3]), .B(x[3]), .Z(n120) );
  XNOR U166 ( .A(y[2]), .B(x[2]), .Z(n121) );
  XNOR U167 ( .A(n124), .B(n125), .Z(n126) );
  XNOR U168 ( .A(y[1]), .B(x[1]), .Z(n125) );
  XNOR U169 ( .A(y[0]), .B(x[0]), .Z(n124) );
endmodule

