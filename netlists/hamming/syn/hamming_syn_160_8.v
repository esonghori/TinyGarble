
module hamming_N160_CC8 ( clk, rst, x, y, o );
  input [19:0] x;
  input [19:0] y;
  output [7:0] o;
  input clk, rst;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121;
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
  XNOR U32 ( .A(n74), .B(n71), .Z(n100) );
  OR U33 ( .A(n87), .B(n88), .Z(n60) );
  ANDN U34 ( .B(n91), .A(n90), .Z(n55) );
  XOR U35 ( .A(n113), .B(n112), .Z(n110) );
  XOR U36 ( .A(oglobal[7]), .B(n10), .Z(o[7]) );
  ANDN U37 ( .B(oglobal[6]), .A(n11), .Z(n10) );
  XNOR U38 ( .A(oglobal[6]), .B(n11), .Z(o[6]) );
  NANDN U39 ( .A(n12), .B(oglobal[5]), .Z(n11) );
  XNOR U40 ( .A(oglobal[5]), .B(n12), .Z(o[5]) );
  AND U41 ( .A(n13), .B(n14), .Z(n12) );
  NANDN U42 ( .A(n15), .B(oglobal[4]), .Z(n14) );
  NANDN U43 ( .A(n16), .B(oglobal[4]), .Z(n13) );
  XNOR U44 ( .A(n16), .B(n17), .Z(o[4]) );
  XNOR U45 ( .A(oglobal[4]), .B(n15), .Z(n17) );
  AND U46 ( .A(n18), .B(n19), .Z(n15) );
  NANDN U47 ( .A(n20), .B(oglobal[3]), .Z(n19) );
  NAND U48 ( .A(n21), .B(n22), .Z(n18) );
  NAND U49 ( .A(n23), .B(n20), .Z(n21) );
  OR U50 ( .A(n24), .B(n25), .Z(n16) );
  XNOR U51 ( .A(n22), .B(n26), .Z(o[3]) );
  XNOR U52 ( .A(n23), .B(n20), .Z(n26) );
  AND U53 ( .A(n27), .B(n28), .Z(n20) );
  NANDN U54 ( .A(n29), .B(oglobal[2]), .Z(n28) );
  NAND U55 ( .A(n30), .B(n31), .Z(n27) );
  NANDN U56 ( .A(oglobal[2]), .B(n29), .Z(n30) );
  IV U57 ( .A(oglobal[3]), .Z(n23) );
  XOR U58 ( .A(n24), .B(n25), .Z(n22) );
  AND U59 ( .A(n32), .B(n33), .Z(n25) );
  OR U60 ( .A(n34), .B(n35), .Z(n33) );
  XOR U61 ( .A(n36), .B(n37), .Z(n32) );
  AND U62 ( .A(n38), .B(n39), .Z(n36) );
  XOR U63 ( .A(n40), .B(n41), .Z(n39) );
  OR U64 ( .A(n42), .B(n43), .Z(n24) );
  XOR U65 ( .A(n31), .B(n44), .Z(o[2]) );
  XNOR U66 ( .A(oglobal[2]), .B(n29), .Z(n44) );
  AND U67 ( .A(n45), .B(n46), .Z(n29) );
  NAND U68 ( .A(n47), .B(oglobal[1]), .Z(n46) );
  NANDN U69 ( .A(n48), .B(n49), .Z(n45) );
  OR U70 ( .A(oglobal[1]), .B(n47), .Z(n49) );
  IV U71 ( .A(n50), .Z(n47) );
  XOR U72 ( .A(n38), .B(n41), .Z(n31) );
  XOR U73 ( .A(n42), .B(n43), .Z(n41) );
  AND U74 ( .A(n51), .B(n52), .Z(n43) );
  OR U75 ( .A(n53), .B(n54), .Z(n52) );
  XOR U76 ( .A(n55), .B(n56), .Z(n51) );
  NAND U77 ( .A(n57), .B(n58), .Z(n56) );
  XOR U78 ( .A(n55), .B(n59), .Z(n57) );
  OR U79 ( .A(n60), .B(n61), .Z(n42) );
  XOR U80 ( .A(n40), .B(n62), .Z(n38) );
  XOR U81 ( .A(n34), .B(n35), .Z(n62) );
  AND U82 ( .A(n63), .B(n64), .Z(n35) );
  OR U83 ( .A(n65), .B(n66), .Z(n64) );
  XOR U84 ( .A(n67), .B(n68), .Z(n63) );
  NAND U85 ( .A(n69), .B(n70), .Z(n68) );
  XNOR U86 ( .A(n67), .B(n71), .Z(n69) );
  OR U87 ( .A(n72), .B(n73), .Z(n34) );
  IV U88 ( .A(n37), .Z(n40) );
  XOR U89 ( .A(n74), .B(n75), .Z(n37) );
  NAND U90 ( .A(n76), .B(n77), .Z(n75) );
  XOR U91 ( .A(n74), .B(n78), .Z(n76) );
  XNOR U92 ( .A(n48), .B(n79), .Z(o[1]) );
  XNOR U93 ( .A(oglobal[1]), .B(n50), .Z(n79) );
  NANDN U94 ( .A(n80), .B(oglobal[0]), .Z(n50) );
  XNOR U95 ( .A(n77), .B(n78), .Z(n48) );
  XOR U96 ( .A(n58), .B(n59), .Z(n78) );
  XOR U97 ( .A(n60), .B(n61), .Z(n59) );
  AND U98 ( .A(n81), .B(n82), .Z(n61) );
  OR U99 ( .A(n83), .B(n84), .Z(n82) );
  NANDN U100 ( .A(n85), .B(n86), .Z(n81) );
  XOR U101 ( .A(n54), .B(n89), .Z(n58) );
  XOR U102 ( .A(n53), .B(n55), .Z(n89) );
  OR U103 ( .A(n92), .B(n93), .Z(n53) );
  AND U104 ( .A(n94), .B(n95), .Z(n54) );
  OR U105 ( .A(n96), .B(n97), .Z(n95) );
  OR U106 ( .A(n98), .B(n99), .Z(n94) );
  XOR U107 ( .A(n70), .B(n100), .Z(n77) );
  XNOR U108 ( .A(n72), .B(n73), .Z(n71) );
  AND U109 ( .A(n101), .B(n102), .Z(n73) );
  OR U110 ( .A(n103), .B(n104), .Z(n102) );
  OR U111 ( .A(n105), .B(n106), .Z(n101) );
  OR U112 ( .A(n107), .B(n108), .Z(n72) );
  ANDN U113 ( .B(n109), .A(n110), .Z(n74) );
  XOR U114 ( .A(n66), .B(n111), .Z(n70) );
  XOR U115 ( .A(n65), .B(n67), .Z(n111) );
  ANDN U116 ( .B(n112), .A(n113), .Z(n67) );
  OR U117 ( .A(n114), .B(n115), .Z(n65) );
  AND U118 ( .A(n116), .B(n117), .Z(n66) );
  OR U119 ( .A(n118), .B(n119), .Z(n117) );
  OR U120 ( .A(n120), .B(n121), .Z(n116) );
  XNOR U121 ( .A(oglobal[0]), .B(n80), .Z(o[0]) );
  XOR U122 ( .A(n110), .B(n109), .Z(n80) );
  XNOR U123 ( .A(n91), .B(n90), .Z(n109) );
  XOR U124 ( .A(n85), .B(n86), .Z(n90) );
  XOR U125 ( .A(n87), .B(n88), .Z(n86) );
  XNOR U126 ( .A(y[15]), .B(x[15]), .Z(n88) );
  XNOR U127 ( .A(y[14]), .B(x[14]), .Z(n87) );
  XNOR U128 ( .A(n83), .B(n84), .Z(n85) );
  XNOR U129 ( .A(y[13]), .B(x[13]), .Z(n84) );
  XNOR U130 ( .A(y[12]), .B(x[12]), .Z(n83) );
  XOR U131 ( .A(n98), .B(n99), .Z(n91) );
  XNOR U132 ( .A(n93), .B(n92), .Z(n99) );
  XNOR U133 ( .A(y[11]), .B(x[11]), .Z(n92) );
  XNOR U134 ( .A(y[10]), .B(x[10]), .Z(n93) );
  XNOR U135 ( .A(n96), .B(n97), .Z(n98) );
  XNOR U136 ( .A(y[9]), .B(x[9]), .Z(n97) );
  XNOR U137 ( .A(y[8]), .B(x[8]), .Z(n96) );
  XOR U138 ( .A(n105), .B(n106), .Z(n112) );
  XNOR U139 ( .A(n108), .B(n107), .Z(n106) );
  XNOR U140 ( .A(y[7]), .B(x[7]), .Z(n107) );
  XNOR U141 ( .A(y[6]), .B(x[6]), .Z(n108) );
  XNOR U142 ( .A(n103), .B(n104), .Z(n105) );
  XNOR U143 ( .A(y[5]), .B(x[5]), .Z(n104) );
  XNOR U144 ( .A(y[4]), .B(x[4]), .Z(n103) );
  XNOR U145 ( .A(n120), .B(n121), .Z(n113) );
  XNOR U146 ( .A(n115), .B(n114), .Z(n121) );
  XNOR U147 ( .A(y[3]), .B(x[3]), .Z(n114) );
  XNOR U148 ( .A(y[2]), .B(x[2]), .Z(n115) );
  XNOR U149 ( .A(n118), .B(n119), .Z(n120) );
  XNOR U150 ( .A(y[1]), .B(x[1]), .Z(n119) );
  XNOR U151 ( .A(y[0]), .B(x[0]), .Z(n118) );
endmodule

