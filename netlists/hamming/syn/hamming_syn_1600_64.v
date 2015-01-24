
module hamming_N1600_CC64 ( clk, rst, x, y, o );
  input [24:0] x;
  input [24:0] y;
  output [10:0] o;
  input clk, rst;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122;
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
  XNOR U39 ( .A(oglobal[3]), .B(n33), .Z(n14) );
  XNOR U40 ( .A(n73), .B(n70), .Z(n100) );
  XOR U41 ( .A(n42), .B(n44), .Z(n17) );
  XOR U42 ( .A(n56), .B(n58), .Z(n77) );
  XOR U43 ( .A(n113), .B(n112), .Z(n110) );
  XNOR U44 ( .A(oglobal[2]), .B(n48), .Z(n16) );
  XOR U45 ( .A(n12), .B(n13), .Z(o[4]) );
  XNOR U46 ( .A(n14), .B(n15), .Z(o[3]) );
  XNOR U47 ( .A(n16), .B(n17), .Z(o[2]) );
  XOR U48 ( .A(n18), .B(n19), .Z(o[1]) );
  XOR U49 ( .A(n20), .B(n21), .Z(o[10]) );
  XOR U50 ( .A(oglobal[10]), .B(n22), .Z(n21) );
  AND U51 ( .A(n20), .B(o[9]), .Z(n22) );
  XOR U52 ( .A(oglobal[9]), .B(n20), .Z(o[9]) );
  NOR U53 ( .A(o[8]), .B(n23), .Z(n20) );
  XNOR U54 ( .A(oglobal[8]), .B(n23), .Z(o[8]) );
  OR U55 ( .A(o[7]), .B(n24), .Z(n23) );
  XNOR U56 ( .A(oglobal[7]), .B(n24), .Z(o[7]) );
  OR U57 ( .A(o[6]), .B(n25), .Z(n24) );
  XNOR U58 ( .A(oglobal[6]), .B(n25), .Z(o[6]) );
  OR U59 ( .A(o[5]), .B(n26), .Z(n25) );
  XNOR U60 ( .A(oglobal[5]), .B(n26), .Z(o[5]) );
  XNOR U61 ( .A(n27), .B(n28), .Z(n26) );
  ANDN U62 ( .B(n29), .A(n13), .Z(n27) );
  XNOR U63 ( .A(oglobal[4]), .B(n28), .Z(n13) );
  NANDN U64 ( .A(n28), .B(n12), .Z(n29) );
  OR U65 ( .A(n30), .B(n31), .Z(n12) );
  XOR U66 ( .A(n32), .B(n33), .Z(n28) );
  ANDN U67 ( .B(n34), .A(n14), .Z(n32) );
  XOR U68 ( .A(n33), .B(n15), .Z(n34) );
  XOR U69 ( .A(n30), .B(n31), .Z(n15) );
  AND U70 ( .A(n35), .B(n36), .Z(n31) );
  OR U71 ( .A(n37), .B(n38), .Z(n36) );
  XOR U72 ( .A(n39), .B(n40), .Z(n35) );
  AND U73 ( .A(n41), .B(n42), .Z(n39) );
  XOR U74 ( .A(n43), .B(n44), .Z(n41) );
  OR U75 ( .A(n45), .B(n46), .Z(n30) );
  XOR U76 ( .A(n47), .B(n48), .Z(n33) );
  ANDN U77 ( .B(n49), .A(n16), .Z(n47) );
  XOR U78 ( .A(n48), .B(n17), .Z(n49) );
  XOR U79 ( .A(n45), .B(n46), .Z(n44) );
  AND U80 ( .A(n50), .B(n51), .Z(n46) );
  OR U81 ( .A(n52), .B(n53), .Z(n51) );
  XOR U82 ( .A(n54), .B(n55), .Z(n50) );
  NAND U83 ( .A(n56), .B(n57), .Z(n55) );
  XOR U84 ( .A(n54), .B(n58), .Z(n57) );
  OR U85 ( .A(n59), .B(n60), .Z(n45) );
  XOR U86 ( .A(n43), .B(n61), .Z(n42) );
  XOR U87 ( .A(n37), .B(n38), .Z(n61) );
  AND U88 ( .A(n62), .B(n63), .Z(n38) );
  OR U89 ( .A(n64), .B(n65), .Z(n63) );
  XOR U90 ( .A(n66), .B(n67), .Z(n62) );
  NAND U91 ( .A(n68), .B(n69), .Z(n67) );
  XNOR U92 ( .A(n66), .B(n70), .Z(n68) );
  OR U93 ( .A(n71), .B(n72), .Z(n37) );
  IV U94 ( .A(n40), .Z(n43) );
  XOR U95 ( .A(n73), .B(n74), .Z(n40) );
  NAND U96 ( .A(n75), .B(n76), .Z(n74) );
  XOR U97 ( .A(n73), .B(n77), .Z(n75) );
  XNOR U98 ( .A(n78), .B(n79), .Z(n48) );
  NANDN U99 ( .A(n18), .B(n80), .Z(n79) );
  XNOR U100 ( .A(n78), .B(n19), .Z(n80) );
  XNOR U101 ( .A(n76), .B(n77), .Z(n19) );
  XOR U102 ( .A(n59), .B(n60), .Z(n58) );
  AND U103 ( .A(n81), .B(n82), .Z(n60) );
  OR U104 ( .A(n83), .B(n84), .Z(n82) );
  NANDN U105 ( .A(n85), .B(n86), .Z(n81) );
  OR U106 ( .A(n87), .B(n88), .Z(n59) );
  XOR U107 ( .A(n53), .B(n89), .Z(n56) );
  XOR U108 ( .A(n52), .B(n54), .Z(n89) );
  ANDN U109 ( .B(n90), .A(n91), .Z(n54) );
  OR U110 ( .A(n92), .B(n93), .Z(n52) );
  AND U111 ( .A(n94), .B(n95), .Z(n53) );
  OR U112 ( .A(n96), .B(n97), .Z(n95) );
  OR U113 ( .A(n98), .B(n99), .Z(n94) );
  XOR U114 ( .A(n69), .B(n100), .Z(n76) );
  XNOR U115 ( .A(n71), .B(n72), .Z(n70) );
  AND U116 ( .A(n101), .B(n102), .Z(n72) );
  OR U117 ( .A(n103), .B(n104), .Z(n102) );
  OR U118 ( .A(n105), .B(n106), .Z(n101) );
  OR U119 ( .A(n107), .B(n108), .Z(n71) );
  ANDN U120 ( .B(n109), .A(n110), .Z(n73) );
  XOR U121 ( .A(n65), .B(n111), .Z(n69) );
  XOR U122 ( .A(n64), .B(n66), .Z(n111) );
  ANDN U123 ( .B(n112), .A(n113), .Z(n66) );
  OR U124 ( .A(n114), .B(n115), .Z(n64) );
  AND U125 ( .A(n116), .B(n117), .Z(n65) );
  OR U126 ( .A(n118), .B(n119), .Z(n117) );
  OR U127 ( .A(n120), .B(n121), .Z(n116) );
  XNOR U128 ( .A(oglobal[1]), .B(n78), .Z(n18) );
  ANDN U129 ( .B(oglobal[0]), .A(n122), .Z(n78) );
  XNOR U130 ( .A(oglobal[0]), .B(n122), .Z(o[0]) );
  XOR U131 ( .A(n110), .B(n109), .Z(n122) );
  XNOR U132 ( .A(n90), .B(n91), .Z(n109) );
  XOR U133 ( .A(n85), .B(n86), .Z(n91) );
  XOR U134 ( .A(n87), .B(n88), .Z(n86) );
  XNOR U135 ( .A(y[15]), .B(x[15]), .Z(n88) );
  XNOR U136 ( .A(y[14]), .B(x[14]), .Z(n87) );
  XNOR U137 ( .A(n83), .B(n84), .Z(n85) );
  XNOR U138 ( .A(y[13]), .B(x[13]), .Z(n84) );
  XNOR U139 ( .A(y[12]), .B(x[12]), .Z(n83) );
  XOR U140 ( .A(n98), .B(n99), .Z(n90) );
  XNOR U141 ( .A(n93), .B(n92), .Z(n99) );
  XNOR U142 ( .A(y[11]), .B(x[11]), .Z(n92) );
  XNOR U143 ( .A(y[10]), .B(x[10]), .Z(n93) );
  XNOR U144 ( .A(n96), .B(n97), .Z(n98) );
  XNOR U145 ( .A(y[9]), .B(x[9]), .Z(n97) );
  XNOR U146 ( .A(y[8]), .B(x[8]), .Z(n96) );
  XOR U147 ( .A(n105), .B(n106), .Z(n112) );
  XNOR U148 ( .A(n108), .B(n107), .Z(n106) );
  XNOR U149 ( .A(y[7]), .B(x[7]), .Z(n107) );
  XNOR U150 ( .A(y[6]), .B(x[6]), .Z(n108) );
  XNOR U151 ( .A(n103), .B(n104), .Z(n105) );
  XNOR U152 ( .A(y[5]), .B(x[5]), .Z(n104) );
  XNOR U153 ( .A(y[4]), .B(x[4]), .Z(n103) );
  XNOR U154 ( .A(n120), .B(n121), .Z(n113) );
  XNOR U155 ( .A(n115), .B(n114), .Z(n121) );
  XNOR U156 ( .A(y[3]), .B(x[3]), .Z(n114) );
  XNOR U157 ( .A(y[2]), .B(x[2]), .Z(n115) );
  XNOR U158 ( .A(n118), .B(n119), .Z(n120) );
  XNOR U159 ( .A(y[1]), .B(x[1]), .Z(n119) );
  XNOR U160 ( .A(y[0]), .B(x[0]), .Z(n118) );
endmodule

