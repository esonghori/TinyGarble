
module k_nns_seq_W7_K2 ( clk, rst, q, DB, min_val_out );
  input [6:0] q;
  input [6:0] DB;
  output [13:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[1][2] , \min_dist_reg[1][1] , \min_dist_reg[1][0] ,
         \min_dist_reg[0][2] , \min_dist_reg[0][1] , \min_dist_reg[0][0] ,
         \local_min_dist[0][2] , \local_min_dist[0][1] ,
         \local_min_dist[0][0] , \min_dist[1][2] , \min_dist[1][1] ,
         \min_dist[1][0] , \min_val_reg[1][6] , \min_val_reg[1][5] ,
         \min_val_reg[1][4] , \min_val_reg[1][3] , \min_val_reg[1][2] ,
         \min_val_reg[1][1] , \min_val_reg[1][0] , \min_val_reg[0][6] ,
         \min_val_reg[0][5] , \min_val_reg[0][4] , \min_val_reg[0][3] ,
         \min_val_reg[0][2] , \min_val_reg[0][1] , \min_val_reg[0][0] , n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146;

  DFF \min_dist_reg_reg[0][0]  ( .D(\local_min_dist[0][0] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][0] ) );
  DFF \min_dist_reg_reg[0][1]  ( .D(\local_min_dist[0][1] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][1] ) );
  DFF \min_dist_reg_reg[0][2]  ( .D(\local_min_dist[0][2] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][2] ) );
  DFF \min_dist_reg_reg[1][0]  ( .D(\min_dist[1][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][0] ) );
  DFF \min_dist_reg_reg[1][1]  ( .D(\min_dist[1][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][1] ) );
  DFF \min_dist_reg_reg[1][2]  ( .D(\min_dist[1][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][2] ) );
  DFF \min_val_reg_reg[0][0]  ( .D(min_val_out[0]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][0] ) );
  DFF \min_val_reg_reg[0][1]  ( .D(min_val_out[1]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][1] ) );
  DFF \min_val_reg_reg[0][2]  ( .D(min_val_out[2]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][2] ) );
  DFF \min_val_reg_reg[0][3]  ( .D(min_val_out[3]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][3] ) );
  DFF \min_val_reg_reg[0][4]  ( .D(min_val_out[4]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][4] ) );
  DFF \min_val_reg_reg[0][5]  ( .D(min_val_out[5]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][5] ) );
  DFF \min_val_reg_reg[0][6]  ( .D(min_val_out[6]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][6] ) );
  DFF \min_val_reg_reg[1][0]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][0] ) );
  DFF \min_val_reg_reg[1][1]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][1] ) );
  DFF \min_val_reg_reg[1][2]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][2] ) );
  DFF \min_val_reg_reg[1][3]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][3] ) );
  DFF \min_val_reg_reg[1][4]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][4] ) );
  DFF \min_val_reg_reg[1][5]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][5] ) );
  DFF \min_val_reg_reg[1][6]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][6] ) );
  XNOR U30 ( .A(n21), .B(n22), .Z(min_val_out[9]) );
  AND U31 ( .A(n23), .B(n24), .Z(n21) );
  XNOR U32 ( .A(n25), .B(n26), .Z(min_val_out[8]) );
  AND U33 ( .A(n23), .B(n27), .Z(n25) );
  XNOR U34 ( .A(n28), .B(n29), .Z(min_val_out[7]) );
  AND U35 ( .A(n23), .B(n30), .Z(n28) );
  XOR U36 ( .A(\min_val_reg[0][6] ), .B(n31), .Z(min_val_out[6]) );
  AND U37 ( .A(n32), .B(n33), .Z(n31) );
  XOR U38 ( .A(\min_val_reg[0][5] ), .B(n34), .Z(min_val_out[5]) );
  AND U39 ( .A(n32), .B(n35), .Z(n34) );
  XOR U40 ( .A(\min_val_reg[0][4] ), .B(n36), .Z(min_val_out[4]) );
  AND U41 ( .A(n32), .B(n37), .Z(n36) );
  XOR U42 ( .A(\min_val_reg[0][3] ), .B(n38), .Z(min_val_out[3]) );
  AND U43 ( .A(n32), .B(n39), .Z(n38) );
  XOR U44 ( .A(\min_val_reg[0][2] ), .B(n40), .Z(min_val_out[2]) );
  AND U45 ( .A(n32), .B(n24), .Z(n40) );
  XNOR U46 ( .A(\min_val_reg[0][2] ), .B(n22), .Z(n24) );
  XOR U47 ( .A(\min_val_reg[1][2] ), .B(n41), .Z(n22) );
  NAND U48 ( .A(n42), .B(n43), .Z(n41) );
  XOR U49 ( .A(\min_val_reg[1][2] ), .B(DB[2]), .Z(n42) );
  XOR U50 ( .A(\min_val_reg[0][1] ), .B(n44), .Z(min_val_out[1]) );
  AND U51 ( .A(n32), .B(n27), .Z(n44) );
  XNOR U52 ( .A(\min_val_reg[0][1] ), .B(n26), .Z(n27) );
  XOR U53 ( .A(\min_val_reg[1][1] ), .B(n45), .Z(n26) );
  NAND U54 ( .A(n46), .B(n43), .Z(n45) );
  XOR U55 ( .A(\min_val_reg[1][1] ), .B(DB[1]), .Z(n46) );
  XNOR U56 ( .A(n47), .B(n48), .Z(min_val_out[13]) );
  AND U57 ( .A(n23), .B(n33), .Z(n47) );
  XNOR U58 ( .A(\min_val_reg[0][6] ), .B(n48), .Z(n33) );
  XOR U59 ( .A(\min_val_reg[1][6] ), .B(n49), .Z(n48) );
  NAND U60 ( .A(n50), .B(n43), .Z(n49) );
  XOR U61 ( .A(\min_val_reg[1][6] ), .B(DB[6]), .Z(n50) );
  XNOR U62 ( .A(n51), .B(n52), .Z(min_val_out[12]) );
  AND U63 ( .A(n23), .B(n35), .Z(n51) );
  XNOR U64 ( .A(\min_val_reg[0][5] ), .B(n52), .Z(n35) );
  XOR U65 ( .A(\min_val_reg[1][5] ), .B(n53), .Z(n52) );
  NAND U66 ( .A(n54), .B(n43), .Z(n53) );
  XOR U67 ( .A(\min_val_reg[1][5] ), .B(DB[5]), .Z(n54) );
  XNOR U68 ( .A(n55), .B(n56), .Z(min_val_out[11]) );
  AND U69 ( .A(n23), .B(n37), .Z(n55) );
  XNOR U70 ( .A(\min_val_reg[0][4] ), .B(n56), .Z(n37) );
  XOR U71 ( .A(\min_val_reg[1][4] ), .B(n57), .Z(n56) );
  NAND U72 ( .A(n58), .B(n43), .Z(n57) );
  XOR U73 ( .A(\min_val_reg[1][4] ), .B(DB[4]), .Z(n58) );
  XNOR U74 ( .A(n59), .B(n60), .Z(min_val_out[10]) );
  AND U75 ( .A(n23), .B(n39), .Z(n59) );
  XNOR U76 ( .A(\min_val_reg[0][3] ), .B(n60), .Z(n39) );
  XOR U77 ( .A(\min_val_reg[1][3] ), .B(n61), .Z(n60) );
  NAND U78 ( .A(n62), .B(n43), .Z(n61) );
  XOR U79 ( .A(\min_val_reg[1][3] ), .B(DB[3]), .Z(n62) );
  XOR U80 ( .A(\min_val_reg[0][0] ), .B(n63), .Z(min_val_out[0]) );
  AND U81 ( .A(n32), .B(n30), .Z(n63) );
  XNOR U82 ( .A(\min_val_reg[0][0] ), .B(n29), .Z(n30) );
  XOR U83 ( .A(\min_val_reg[1][0] ), .B(n64), .Z(n29) );
  NAND U84 ( .A(n65), .B(n43), .Z(n64) );
  XOR U85 ( .A(\min_val_reg[1][0] ), .B(DB[0]), .Z(n65) );
  XNOR U86 ( .A(n66), .B(n67), .Z(\min_dist[1][2] ) );
  AND U87 ( .A(n23), .B(n68), .Z(n66) );
  XNOR U88 ( .A(\min_dist_reg[0][2] ), .B(n67), .Z(n68) );
  XOR U89 ( .A(n69), .B(n70), .Z(\min_dist[1][1] ) );
  AND U90 ( .A(n23), .B(n71), .Z(n69) );
  XNOR U91 ( .A(\min_dist_reg[0][1] ), .B(n72), .Z(n71) );
  XNOR U92 ( .A(n73), .B(n74), .Z(\min_dist[1][0] ) );
  AND U93 ( .A(n23), .B(n75), .Z(n73) );
  XNOR U94 ( .A(\min_dist_reg[0][0] ), .B(n74), .Z(n75) );
  XOR U95 ( .A(n76), .B(n77), .Z(n23) );
  AND U96 ( .A(n78), .B(n79), .Z(n76) );
  XOR U97 ( .A(n77), .B(n67), .Z(n79) );
  XOR U98 ( .A(\min_dist_reg[0][2] ), .B(n77), .Z(n78) );
  XOR U99 ( .A(n80), .B(n81), .Z(n77) );
  NAND U100 ( .A(n82), .B(n83), .Z(n81) );
  XNOR U101 ( .A(n80), .B(n72), .Z(n83) );
  XNOR U102 ( .A(\min_dist_reg[0][1] ), .B(n80), .Z(n82) );
  ANDN U103 ( .B(n84), .A(\min_dist_reg[0][0] ), .Z(n80) );
  AND U104 ( .A(\min_dist_reg[0][2] ), .B(n85), .Z(\local_min_dist[0][2] ) );
  NANDN U105 ( .A(n86), .B(n32), .Z(n85) );
  XOR U106 ( .A(\min_dist_reg[0][1] ), .B(n87), .Z(\local_min_dist[0][1] ) );
  AND U107 ( .A(n32), .B(n88), .Z(n87) );
  XOR U108 ( .A(\min_dist_reg[0][1] ), .B(n70), .Z(n88) );
  XOR U109 ( .A(\min_dist_reg[0][0] ), .B(n89), .Z(\local_min_dist[0][0] ) );
  AND U110 ( .A(n32), .B(n90), .Z(n89) );
  XOR U111 ( .A(\min_dist_reg[0][0] ), .B(n84), .Z(n90) );
  XOR U112 ( .A(n91), .B(n92), .Z(n32) );
  AND U113 ( .A(n93), .B(n94), .Z(n91) );
  XOR U114 ( .A(n67), .B(n92), .Z(n94) );
  IV U115 ( .A(n86), .Z(n67) );
  XNOR U116 ( .A(\min_dist_reg[1][2] ), .B(n95), .Z(n86) );
  NAND U117 ( .A(n96), .B(n43), .Z(n95) );
  XOR U118 ( .A(\min_dist_reg[1][2] ), .B(n97), .Z(n96) );
  XOR U119 ( .A(\min_dist_reg[0][2] ), .B(n92), .Z(n93) );
  XOR U120 ( .A(n98), .B(n99), .Z(n92) );
  NAND U121 ( .A(n100), .B(n101), .Z(n99) );
  XNOR U122 ( .A(n98), .B(n72), .Z(n101) );
  IV U123 ( .A(n70), .Z(n72) );
  XNOR U124 ( .A(\min_dist_reg[1][1] ), .B(n102), .Z(n70) );
  NAND U125 ( .A(n103), .B(n43), .Z(n102) );
  XNOR U126 ( .A(\min_dist_reg[1][1] ), .B(n104), .Z(n103) );
  XNOR U127 ( .A(\min_dist_reg[0][1] ), .B(n98), .Z(n100) );
  NOR U128 ( .A(n74), .B(\min_dist_reg[0][0] ), .Z(n98) );
  IV U129 ( .A(n84), .Z(n74) );
  XOR U130 ( .A(n105), .B(n106), .Z(n84) );
  NAND U131 ( .A(n107), .B(n43), .Z(n106) );
  XOR U132 ( .A(n108), .B(n109), .Z(n43) );
  AND U133 ( .A(n110), .B(n111), .Z(n108) );
  XNOR U134 ( .A(n109), .B(n97), .Z(n111) );
  XNOR U135 ( .A(n112), .B(n113), .Z(n97) );
  ANDN U136 ( .B(n114), .A(n115), .Z(n112) );
  XOR U137 ( .A(n113), .B(n116), .Z(n114) );
  XOR U138 ( .A(\min_dist_reg[1][2] ), .B(n109), .Z(n110) );
  XOR U139 ( .A(n117), .B(n118), .Z(n109) );
  NAND U140 ( .A(n119), .B(n120), .Z(n118) );
  XNOR U141 ( .A(n117), .B(n104), .Z(n120) );
  XOR U142 ( .A(n121), .B(n116), .Z(n104) );
  XNOR U143 ( .A(n122), .B(n123), .Z(n116) );
  ANDN U144 ( .B(n124), .A(n125), .Z(n122) );
  XNOR U145 ( .A(n123), .B(n126), .Z(n124) );
  IV U146 ( .A(n115), .Z(n121) );
  XOR U147 ( .A(n127), .B(n128), .Z(n115) );
  XNOR U148 ( .A(n129), .B(n130), .Z(n128) );
  ANDN U149 ( .B(n131), .A(n132), .Z(n129) );
  XNOR U150 ( .A(n133), .B(n134), .Z(n131) );
  IV U151 ( .A(n130), .Z(n134) );
  IV U152 ( .A(n113), .Z(n127) );
  XNOR U153 ( .A(n135), .B(n136), .Z(n113) );
  ANDN U154 ( .B(n137), .A(n138), .Z(n135) );
  XNOR U155 ( .A(n136), .B(n139), .Z(n137) );
  XNOR U156 ( .A(\min_dist_reg[1][1] ), .B(n117), .Z(n119) );
  NOR U157 ( .A(\min_dist_reg[1][0] ), .B(n140), .Z(n117) );
  XOR U158 ( .A(n105), .B(n140), .Z(n107) );
  XOR U159 ( .A(n141), .B(n139), .Z(n140) );
  XOR U160 ( .A(n142), .B(n126), .Z(n139) );
  XNOR U161 ( .A(q[6]), .B(DB[6]), .Z(n126) );
  IV U162 ( .A(n125), .Z(n142) );
  XOR U163 ( .A(n123), .B(n143), .Z(n125) );
  XNOR U164 ( .A(q[5]), .B(DB[5]), .Z(n143) );
  XOR U165 ( .A(q[4]), .B(DB[4]), .Z(n123) );
  IV U166 ( .A(n138), .Z(n141) );
  XOR U167 ( .A(n144), .B(n145), .Z(n138) );
  XNOR U168 ( .A(n133), .B(n136), .Z(n145) );
  XOR U169 ( .A(q[0]), .B(DB[0]), .Z(n136) );
  XOR U170 ( .A(q[3]), .B(DB[3]), .Z(n133) );
  IV U171 ( .A(n132), .Z(n144) );
  XOR U172 ( .A(n130), .B(n146), .Z(n132) );
  XNOR U173 ( .A(q[2]), .B(DB[2]), .Z(n146) );
  XOR U174 ( .A(q[1]), .B(DB[1]), .Z(n130) );
  IV U175 ( .A(\min_dist_reg[1][0] ), .Z(n105) );
endmodule

