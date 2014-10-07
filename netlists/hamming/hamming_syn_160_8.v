
module hamming_N160_CC8 ( clk, rst, x, y, o );
  input [19:0] x;
  input [19:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127;
  wire   [7:0] oglobal;

  DFF \oglobal_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(oglobal[7]) );
  DFF \oglobal_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(oglobal[6]) );
  DFF \oglobal_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(oglobal[5]) );
  DFF \oglobal_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(oglobal[4]) );
  DFF \oglobal_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(oglobal[3]) );
  DFF \oglobal_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(oglobal[2]) );
  DFF \oglobal_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(oglobal[1]) );
  DFF \oglobal_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(oglobal[0]) );
  NAND U23 ( .A(n90), .B(n91), .Z(n1) );
  XOR U24 ( .A(n90), .B(n91), .Z(n2) );
  NANDN U25 ( .A(n89), .B(n2), .Z(n3) );
  NAND U26 ( .A(n1), .B(n3), .Z(n107) );
  NAND U27 ( .A(n87), .B(n88), .Z(n4) );
  XOR U28 ( .A(n87), .B(n88), .Z(n5) );
  NANDN U29 ( .A(n86), .B(n5), .Z(n6) );
  NAND U30 ( .A(n4), .B(n6), .Z(n108) );
  NAND U31 ( .A(n107), .B(n109), .Z(n7) );
  XOR U32 ( .A(n107), .B(n109), .Z(n8) );
  NAND U33 ( .A(n8), .B(n108), .Z(n9) );
  NAND U34 ( .A(n7), .B(n9), .Z(n114) );
  NAND U35 ( .A(n104), .B(n106), .Z(n10) );
  XOR U36 ( .A(n104), .B(n106), .Z(n11) );
  NAND U37 ( .A(n11), .B(n105), .Z(n12) );
  NAND U38 ( .A(n10), .B(n12), .Z(n112) );
  NAND U39 ( .A(n79), .B(n76), .Z(n13) );
  NANDN U40 ( .A(n79), .B(n78), .Z(n14) );
  NANDN U41 ( .A(n77), .B(n14), .Z(n15) );
  NAND U42 ( .A(n13), .B(n15), .Z(n98) );
  XOR U43 ( .A(n95), .B(n93), .Z(n16) );
  NANDN U44 ( .A(n94), .B(n16), .Z(n17) );
  NAND U45 ( .A(n95), .B(n93), .Z(n18) );
  AND U46 ( .A(n17), .B(n18), .Z(n105) );
  NAND U47 ( .A(n119), .B(n120), .Z(n124) );
  XOR U48 ( .A(x[17]), .B(y[17]), .Z(n35) );
  XOR U49 ( .A(x[15]), .B(y[15]), .Z(n32) );
  XNOR U50 ( .A(x[19]), .B(y[19]), .Z(n33) );
  XNOR U51 ( .A(n32), .B(n33), .Z(n34) );
  XOR U52 ( .A(n35), .B(n34), .Z(n23) );
  XOR U53 ( .A(x[10]), .B(y[10]), .Z(n72) );
  XNOR U54 ( .A(x[12]), .B(y[12]), .Z(n70) );
  XNOR U55 ( .A(oglobal[0]), .B(n70), .Z(n71) );
  XOR U56 ( .A(n72), .B(n71), .Z(n21) );
  XOR U57 ( .A(x[4]), .B(y[4]), .Z(n41) );
  XOR U58 ( .A(x[6]), .B(y[6]), .Z(n38) );
  XNOR U59 ( .A(x[8]), .B(y[8]), .Z(n39) );
  XNOR U60 ( .A(n38), .B(n39), .Z(n40) );
  XNOR U61 ( .A(n41), .B(n40), .Z(n20) );
  XNOR U62 ( .A(n21), .B(n20), .Z(n22) );
  XOR U63 ( .A(n23), .B(n22), .Z(n77) );
  XOR U64 ( .A(x[7]), .B(y[7]), .Z(n61) );
  XOR U65 ( .A(x[3]), .B(y[3]), .Z(n58) );
  XNOR U66 ( .A(x[5]), .B(y[5]), .Z(n59) );
  XNOR U67 ( .A(n58), .B(n59), .Z(n60) );
  XOR U68 ( .A(n61), .B(n60), .Z(n29) );
  XOR U69 ( .A(x[1]), .B(y[1]), .Z(n47) );
  XOR U70 ( .A(x[0]), .B(y[0]), .Z(n44) );
  XNOR U71 ( .A(x[2]), .B(y[2]), .Z(n45) );
  XNOR U72 ( .A(n44), .B(n45), .Z(n46) );
  XOR U73 ( .A(n47), .B(n46), .Z(n27) );
  XOR U74 ( .A(x[13]), .B(y[13]), .Z(n55) );
  XOR U75 ( .A(x[9]), .B(y[9]), .Z(n52) );
  XNOR U76 ( .A(x[11]), .B(y[11]), .Z(n53) );
  XNOR U77 ( .A(n52), .B(n53), .Z(n54) );
  XNOR U78 ( .A(n55), .B(n54), .Z(n26) );
  XNOR U79 ( .A(n27), .B(n26), .Z(n28) );
  XNOR U80 ( .A(n29), .B(n28), .Z(n79) );
  XOR U81 ( .A(x[14]), .B(y[14]), .Z(n67) );
  XOR U82 ( .A(x[16]), .B(y[16]), .Z(n64) );
  XNOR U83 ( .A(x[18]), .B(y[18]), .Z(n65) );
  XNOR U84 ( .A(n64), .B(n65), .Z(n66) );
  XOR U85 ( .A(n67), .B(n66), .Z(n78) );
  IV U86 ( .A(n78), .Z(n76) );
  XOR U87 ( .A(n79), .B(n76), .Z(n19) );
  XOR U88 ( .A(n77), .B(n19), .Z(o[0]) );
  NANDN U89 ( .A(n21), .B(n20), .Z(n25) );
  NANDN U90 ( .A(n23), .B(n22), .Z(n24) );
  AND U91 ( .A(n25), .B(n24), .Z(n95) );
  NANDN U92 ( .A(n27), .B(n26), .Z(n31) );
  NANDN U93 ( .A(n29), .B(n28), .Z(n30) );
  AND U94 ( .A(n31), .B(n30), .Z(n93) );
  NANDN U95 ( .A(n33), .B(n32), .Z(n37) );
  NAND U96 ( .A(n35), .B(n34), .Z(n36) );
  NAND U97 ( .A(n37), .B(n36), .Z(n86) );
  NANDN U98 ( .A(n39), .B(n38), .Z(n43) );
  NAND U99 ( .A(n41), .B(n40), .Z(n42) );
  AND U100 ( .A(n43), .B(n42), .Z(n88) );
  NANDN U101 ( .A(n45), .B(n44), .Z(n49) );
  NAND U102 ( .A(n47), .B(n46), .Z(n48) );
  AND U103 ( .A(n49), .B(n48), .Z(n87) );
  XNOR U104 ( .A(n88), .B(n87), .Z(n50) );
  XOR U105 ( .A(n86), .B(n50), .Z(n94) );
  XNOR U106 ( .A(n93), .B(n94), .Z(n51) );
  XNOR U107 ( .A(n95), .B(n51), .Z(n99) );
  NANDN U108 ( .A(n53), .B(n52), .Z(n57) );
  NAND U109 ( .A(n55), .B(n54), .Z(n56) );
  NAND U110 ( .A(n57), .B(n56), .Z(n82) );
  NANDN U111 ( .A(n59), .B(n58), .Z(n63) );
  NAND U112 ( .A(n61), .B(n60), .Z(n62) );
  NAND U113 ( .A(n63), .B(n62), .Z(n81) );
  XNOR U114 ( .A(oglobal[1]), .B(n81), .Z(n83) );
  XOR U115 ( .A(n82), .B(n83), .Z(n91) );
  NANDN U116 ( .A(n65), .B(n64), .Z(n69) );
  NAND U117 ( .A(n67), .B(n66), .Z(n68) );
  AND U118 ( .A(n69), .B(n68), .Z(n90) );
  NANDN U119 ( .A(n70), .B(oglobal[0]), .Z(n74) );
  NAND U120 ( .A(n72), .B(n71), .Z(n73) );
  NAND U121 ( .A(n74), .B(n73), .Z(n89) );
  XOR U122 ( .A(n90), .B(n89), .Z(n75) );
  XOR U123 ( .A(n91), .B(n75), .Z(n97) );
  IV U124 ( .A(n97), .Z(n96) );
  XOR U125 ( .A(n96), .B(n98), .Z(n80) );
  XNOR U126 ( .A(n99), .B(n80), .Z(o[1]) );
  NAND U127 ( .A(oglobal[1]), .B(n81), .Z(n85) );
  NANDN U128 ( .A(n83), .B(n82), .Z(n84) );
  NAND U129 ( .A(n85), .B(n84), .Z(n110) );
  XNOR U130 ( .A(oglobal[2]), .B(n110), .Z(n109) );
  XNOR U131 ( .A(n108), .B(n107), .Z(n92) );
  XNOR U132 ( .A(n109), .B(n92), .Z(n106) );
  OR U133 ( .A(n98), .B(n96), .Z(n102) );
  ANDN U134 ( .B(n98), .A(n97), .Z(n100) );
  OR U135 ( .A(n100), .B(n99), .Z(n101) );
  AND U136 ( .A(n102), .B(n101), .Z(n104) );
  XOR U137 ( .A(n105), .B(n104), .Z(n103) );
  XNOR U138 ( .A(n106), .B(n103), .Z(o[2]) );
  AND U139 ( .A(oglobal[2]), .B(n110), .Z(n117) );
  XOR U140 ( .A(n117), .B(oglobal[3]), .Z(n113) );
  XNOR U141 ( .A(n114), .B(n113), .Z(n111) );
  XNOR U142 ( .A(n112), .B(n111), .Z(o[3]) );
  NANDN U143 ( .A(n112), .B(n113), .Z(n116) );
  NANDN U144 ( .A(n113), .B(n112), .Z(n115) );
  ANDN U145 ( .B(n115), .A(n114), .Z(n120) );
  ANDN U146 ( .B(n116), .A(n120), .Z(n118) );
  AND U147 ( .A(n117), .B(oglobal[3]), .Z(n119) );
  ANDN U148 ( .B(n118), .A(n119), .Z(n122) );
  NANDN U149 ( .A(n122), .B(n124), .Z(n121) );
  XNOR U150 ( .A(oglobal[4]), .B(n121), .Z(o[4]) );
  NANDN U151 ( .A(n122), .B(oglobal[4]), .Z(n123) );
  AND U152 ( .A(n124), .B(n123), .Z(n125) );
  XNOR U153 ( .A(n125), .B(oglobal[5]), .Z(o[5]) );
  NANDN U154 ( .A(n125), .B(oglobal[5]), .Z(n126) );
  XNOR U155 ( .A(oglobal[6]), .B(n126), .Z(o[6]) );
  NANDN U156 ( .A(n126), .B(oglobal[6]), .Z(n127) );
  XNOR U157 ( .A(oglobal[7]), .B(n127), .Z(o[7]) );
endmodule
