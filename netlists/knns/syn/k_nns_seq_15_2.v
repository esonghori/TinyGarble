
module k_nns_seq_W15_K2 ( clk, rst, q, DB, min_val_out );
  input [14:0] q;
  input [14:0] DB;
  output [29:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[1][3] , \min_dist_reg[1][2] , \min_dist_reg[1][1] ,
         \min_dist_reg[1][0] , \min_dist_reg[0][3] , \min_dist_reg[0][2] ,
         \min_dist_reg[0][1] , \min_dist_reg[0][0] , \local_min_dist[0][3] ,
         \local_min_dist[0][2] , \local_min_dist[0][1] ,
         \local_min_dist[0][0] , \min_dist[1][3] , \min_dist[1][2] ,
         \min_dist[1][1] , \min_dist[1][0] , \min_val_reg[1][14] ,
         \min_val_reg[1][13] , \min_val_reg[1][12] , \min_val_reg[1][11] ,
         \min_val_reg[1][10] , \min_val_reg[1][9] , \min_val_reg[1][8] ,
         \min_val_reg[1][7] , \min_val_reg[1][6] , \min_val_reg[1][5] ,
         \min_val_reg[1][4] , \min_val_reg[1][3] , \min_val_reg[1][2] ,
         \min_val_reg[1][1] , \min_val_reg[1][0] , \min_val_reg[0][14] ,
         \min_val_reg[0][13] , \min_val_reg[0][12] , \min_val_reg[0][11] ,
         \min_val_reg[0][10] , \min_val_reg[0][9] , \min_val_reg[0][8] ,
         \min_val_reg[0][7] , \min_val_reg[0][6] , \min_val_reg[0][5] ,
         \min_val_reg[0][4] , \min_val_reg[0][3] , \min_val_reg[0][2] ,
         \min_val_reg[0][1] , \min_val_reg[0][0] , n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288;

  DFF \min_dist_reg_reg[0][0]  ( .D(\local_min_dist[0][0] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][0] ) );
  DFF \min_dist_reg_reg[0][1]  ( .D(\local_min_dist[0][1] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][1] ) );
  DFF \min_dist_reg_reg[0][2]  ( .D(\local_min_dist[0][2] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][2] ) );
  DFF \min_dist_reg_reg[0][3]  ( .D(\local_min_dist[0][3] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][3] ) );
  DFF \min_dist_reg_reg[1][0]  ( .D(\min_dist[1][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][0] ) );
  DFF \min_dist_reg_reg[1][1]  ( .D(\min_dist[1][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][1] ) );
  DFF \min_dist_reg_reg[1][2]  ( .D(\min_dist[1][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][2] ) );
  DFF \min_dist_reg_reg[1][3]  ( .D(\min_dist[1][3] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][3] ) );
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
  DFF \min_val_reg_reg[0][7]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][7] ) );
  DFF \min_val_reg_reg[0][8]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][8] ) );
  DFF \min_val_reg_reg[0][9]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][9] ) );
  DFF \min_val_reg_reg[0][10]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][10] ) );
  DFF \min_val_reg_reg[0][11]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][11] ) );
  DFF \min_val_reg_reg[0][12]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][12] ) );
  DFF \min_val_reg_reg[0][13]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][13] ) );
  DFF \min_val_reg_reg[0][14]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][14] ) );
  DFF \min_val_reg_reg[1][0]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][0] ) );
  DFF \min_val_reg_reg[1][1]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][1] ) );
  DFF \min_val_reg_reg[1][2]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][2] ) );
  DFF \min_val_reg_reg[1][3]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][3] ) );
  DFF \min_val_reg_reg[1][4]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][4] ) );
  DFF \min_val_reg_reg[1][5]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][5] ) );
  DFF \min_val_reg_reg[1][6]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][6] ) );
  DFF \min_val_reg_reg[1][7]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][7] ) );
  DFF \min_val_reg_reg[1][8]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][8] ) );
  DFF \min_val_reg_reg[1][9]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][9] ) );
  DFF \min_val_reg_reg[1][10]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][10] ) );
  DFF \min_val_reg_reg[1][11]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][11] ) );
  DFF \min_val_reg_reg[1][12]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][12] ) );
  DFF \min_val_reg_reg[1][13]  ( .D(min_val_out[28]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][13] ) );
  DFF \min_val_reg_reg[1][14]  ( .D(min_val_out[29]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][14] ) );
  XOR U56 ( .A(\min_val_reg[0][9] ), .B(n39), .Z(min_val_out[9]) );
  AND U57 ( .A(n40), .B(n41), .Z(n39) );
  XOR U58 ( .A(\min_val_reg[0][8] ), .B(n42), .Z(min_val_out[8]) );
  AND U59 ( .A(n40), .B(n43), .Z(n42) );
  XOR U60 ( .A(\min_val_reg[0][7] ), .B(n44), .Z(min_val_out[7]) );
  AND U61 ( .A(n40), .B(n45), .Z(n44) );
  XOR U62 ( .A(\min_val_reg[0][6] ), .B(n46), .Z(min_val_out[6]) );
  AND U63 ( .A(n40), .B(n47), .Z(n46) );
  XOR U64 ( .A(\min_val_reg[0][5] ), .B(n48), .Z(min_val_out[5]) );
  AND U65 ( .A(n40), .B(n49), .Z(n48) );
  XOR U66 ( .A(\min_val_reg[0][4] ), .B(n50), .Z(min_val_out[4]) );
  AND U67 ( .A(n40), .B(n51), .Z(n50) );
  XOR U68 ( .A(\min_val_reg[0][3] ), .B(n52), .Z(min_val_out[3]) );
  AND U69 ( .A(n40), .B(n53), .Z(n52) );
  XOR U70 ( .A(\min_val_reg[0][2] ), .B(n54), .Z(min_val_out[2]) );
  AND U71 ( .A(n40), .B(n55), .Z(n54) );
  XNOR U72 ( .A(n56), .B(n57), .Z(min_val_out[29]) );
  AND U73 ( .A(n58), .B(n59), .Z(n56) );
  XNOR U74 ( .A(n60), .B(n61), .Z(min_val_out[28]) );
  AND U75 ( .A(n58), .B(n62), .Z(n60) );
  XNOR U76 ( .A(n63), .B(n64), .Z(min_val_out[27]) );
  AND U77 ( .A(n58), .B(n65), .Z(n63) );
  XNOR U78 ( .A(n66), .B(n67), .Z(min_val_out[26]) );
  AND U79 ( .A(n58), .B(n68), .Z(n66) );
  XNOR U80 ( .A(n69), .B(n70), .Z(min_val_out[25]) );
  AND U81 ( .A(n58), .B(n71), .Z(n69) );
  XNOR U82 ( .A(n72), .B(n73), .Z(min_val_out[24]) );
  AND U83 ( .A(n58), .B(n41), .Z(n72) );
  XNOR U84 ( .A(\min_val_reg[0][9] ), .B(n73), .Z(n41) );
  XOR U85 ( .A(\min_val_reg[1][9] ), .B(n74), .Z(n73) );
  NAND U86 ( .A(n75), .B(n76), .Z(n74) );
  XOR U87 ( .A(\min_val_reg[1][9] ), .B(DB[9]), .Z(n75) );
  XNOR U88 ( .A(n77), .B(n78), .Z(min_val_out[23]) );
  AND U89 ( .A(n58), .B(n43), .Z(n77) );
  XNOR U90 ( .A(\min_val_reg[0][8] ), .B(n78), .Z(n43) );
  XOR U91 ( .A(\min_val_reg[1][8] ), .B(n79), .Z(n78) );
  NAND U92 ( .A(n80), .B(n76), .Z(n79) );
  XOR U93 ( .A(\min_val_reg[1][8] ), .B(DB[8]), .Z(n80) );
  XNOR U94 ( .A(n81), .B(n82), .Z(min_val_out[22]) );
  AND U95 ( .A(n58), .B(n45), .Z(n81) );
  XNOR U96 ( .A(\min_val_reg[0][7] ), .B(n82), .Z(n45) );
  XOR U97 ( .A(\min_val_reg[1][7] ), .B(n83), .Z(n82) );
  NAND U98 ( .A(n84), .B(n76), .Z(n83) );
  XOR U99 ( .A(\min_val_reg[1][7] ), .B(DB[7]), .Z(n84) );
  XNOR U100 ( .A(n85), .B(n86), .Z(min_val_out[21]) );
  AND U101 ( .A(n58), .B(n47), .Z(n85) );
  XNOR U102 ( .A(\min_val_reg[0][6] ), .B(n86), .Z(n47) );
  XOR U103 ( .A(\min_val_reg[1][6] ), .B(n87), .Z(n86) );
  NAND U104 ( .A(n88), .B(n76), .Z(n87) );
  XOR U105 ( .A(\min_val_reg[1][6] ), .B(DB[6]), .Z(n88) );
  XNOR U106 ( .A(n89), .B(n90), .Z(min_val_out[20]) );
  AND U107 ( .A(n58), .B(n49), .Z(n89) );
  XNOR U108 ( .A(\min_val_reg[0][5] ), .B(n90), .Z(n49) );
  XOR U109 ( .A(\min_val_reg[1][5] ), .B(n91), .Z(n90) );
  NAND U110 ( .A(n92), .B(n76), .Z(n91) );
  XOR U111 ( .A(\min_val_reg[1][5] ), .B(DB[5]), .Z(n92) );
  XOR U112 ( .A(\min_val_reg[0][1] ), .B(n93), .Z(min_val_out[1]) );
  AND U113 ( .A(n40), .B(n94), .Z(n93) );
  XNOR U114 ( .A(n95), .B(n96), .Z(min_val_out[19]) );
  AND U115 ( .A(n58), .B(n51), .Z(n95) );
  XNOR U116 ( .A(\min_val_reg[0][4] ), .B(n96), .Z(n51) );
  XOR U117 ( .A(\min_val_reg[1][4] ), .B(n97), .Z(n96) );
  NAND U118 ( .A(n98), .B(n76), .Z(n97) );
  XOR U119 ( .A(\min_val_reg[1][4] ), .B(DB[4]), .Z(n98) );
  XNOR U120 ( .A(n99), .B(n100), .Z(min_val_out[18]) );
  AND U121 ( .A(n58), .B(n53), .Z(n99) );
  XNOR U122 ( .A(\min_val_reg[0][3] ), .B(n100), .Z(n53) );
  XOR U123 ( .A(\min_val_reg[1][3] ), .B(n101), .Z(n100) );
  NAND U124 ( .A(n102), .B(n76), .Z(n101) );
  XOR U125 ( .A(\min_val_reg[1][3] ), .B(DB[3]), .Z(n102) );
  XNOR U126 ( .A(n103), .B(n104), .Z(min_val_out[17]) );
  AND U127 ( .A(n58), .B(n55), .Z(n103) );
  XNOR U128 ( .A(\min_val_reg[0][2] ), .B(n104), .Z(n55) );
  XOR U129 ( .A(\min_val_reg[1][2] ), .B(n105), .Z(n104) );
  NAND U130 ( .A(n106), .B(n76), .Z(n105) );
  XOR U131 ( .A(\min_val_reg[1][2] ), .B(DB[2]), .Z(n106) );
  XNOR U132 ( .A(n107), .B(n108), .Z(min_val_out[16]) );
  AND U133 ( .A(n58), .B(n94), .Z(n107) );
  XNOR U134 ( .A(\min_val_reg[0][1] ), .B(n108), .Z(n94) );
  XOR U135 ( .A(\min_val_reg[1][1] ), .B(n109), .Z(n108) );
  NAND U136 ( .A(n110), .B(n76), .Z(n109) );
  XOR U137 ( .A(\min_val_reg[1][1] ), .B(DB[1]), .Z(n110) );
  XNOR U138 ( .A(n111), .B(n112), .Z(min_val_out[15]) );
  AND U139 ( .A(n58), .B(n113), .Z(n111) );
  XOR U140 ( .A(\min_val_reg[0][14] ), .B(n114), .Z(min_val_out[14]) );
  AND U141 ( .A(n40), .B(n59), .Z(n114) );
  XNOR U142 ( .A(\min_val_reg[0][14] ), .B(n57), .Z(n59) );
  XOR U143 ( .A(\min_val_reg[1][14] ), .B(n115), .Z(n57) );
  NAND U144 ( .A(n116), .B(n76), .Z(n115) );
  XOR U145 ( .A(\min_val_reg[1][14] ), .B(DB[14]), .Z(n116) );
  XOR U146 ( .A(\min_val_reg[0][13] ), .B(n117), .Z(min_val_out[13]) );
  AND U147 ( .A(n40), .B(n62), .Z(n117) );
  XNOR U148 ( .A(\min_val_reg[0][13] ), .B(n61), .Z(n62) );
  XOR U149 ( .A(\min_val_reg[1][13] ), .B(n118), .Z(n61) );
  NAND U150 ( .A(n119), .B(n76), .Z(n118) );
  XOR U151 ( .A(\min_val_reg[1][13] ), .B(DB[13]), .Z(n119) );
  XOR U152 ( .A(\min_val_reg[0][12] ), .B(n120), .Z(min_val_out[12]) );
  AND U153 ( .A(n40), .B(n65), .Z(n120) );
  XNOR U154 ( .A(\min_val_reg[0][12] ), .B(n64), .Z(n65) );
  XOR U155 ( .A(\min_val_reg[1][12] ), .B(n121), .Z(n64) );
  NAND U156 ( .A(n122), .B(n76), .Z(n121) );
  XOR U157 ( .A(\min_val_reg[1][12] ), .B(DB[12]), .Z(n122) );
  XOR U158 ( .A(\min_val_reg[0][11] ), .B(n123), .Z(min_val_out[11]) );
  AND U159 ( .A(n40), .B(n68), .Z(n123) );
  XNOR U160 ( .A(\min_val_reg[0][11] ), .B(n67), .Z(n68) );
  XOR U161 ( .A(\min_val_reg[1][11] ), .B(n124), .Z(n67) );
  NAND U162 ( .A(n125), .B(n76), .Z(n124) );
  XOR U163 ( .A(\min_val_reg[1][11] ), .B(DB[11]), .Z(n125) );
  XOR U164 ( .A(\min_val_reg[0][10] ), .B(n126), .Z(min_val_out[10]) );
  AND U165 ( .A(n40), .B(n71), .Z(n126) );
  XNOR U166 ( .A(\min_val_reg[0][10] ), .B(n70), .Z(n71) );
  XOR U167 ( .A(\min_val_reg[1][10] ), .B(n127), .Z(n70) );
  NAND U168 ( .A(n128), .B(n76), .Z(n127) );
  XOR U169 ( .A(\min_val_reg[1][10] ), .B(DB[10]), .Z(n128) );
  XOR U170 ( .A(\min_val_reg[0][0] ), .B(n129), .Z(min_val_out[0]) );
  AND U171 ( .A(n40), .B(n113), .Z(n129) );
  XNOR U172 ( .A(\min_val_reg[0][0] ), .B(n112), .Z(n113) );
  XOR U173 ( .A(\min_val_reg[1][0] ), .B(n130), .Z(n112) );
  NAND U174 ( .A(n131), .B(n76), .Z(n130) );
  XOR U175 ( .A(\min_val_reg[1][0] ), .B(DB[0]), .Z(n131) );
  XNOR U176 ( .A(n132), .B(n133), .Z(\min_dist[1][3] ) );
  AND U177 ( .A(n58), .B(n134), .Z(n132) );
  XNOR U178 ( .A(\min_dist_reg[0][3] ), .B(n133), .Z(n134) );
  XOR U179 ( .A(n135), .B(n136), .Z(\min_dist[1][2] ) );
  AND U180 ( .A(n58), .B(n137), .Z(n135) );
  XNOR U181 ( .A(\min_dist_reg[0][2] ), .B(n138), .Z(n137) );
  XOR U182 ( .A(n139), .B(n140), .Z(\min_dist[1][1] ) );
  AND U183 ( .A(n58), .B(n141), .Z(n139) );
  XNOR U184 ( .A(\min_dist_reg[0][1] ), .B(n142), .Z(n141) );
  XNOR U185 ( .A(n143), .B(n144), .Z(\min_dist[1][0] ) );
  AND U186 ( .A(n58), .B(n145), .Z(n143) );
  XNOR U187 ( .A(\min_dist_reg[0][0] ), .B(n144), .Z(n145) );
  XNOR U188 ( .A(n146), .B(n147), .Z(n58) );
  AND U189 ( .A(n148), .B(n149), .Z(n146) );
  XNOR U190 ( .A(n133), .B(n147), .Z(n149) );
  IV U191 ( .A(n150), .Z(n133) );
  XNOR U192 ( .A(\min_dist_reg[0][3] ), .B(n147), .Z(n148) );
  XNOR U193 ( .A(n151), .B(n152), .Z(n147) );
  AND U194 ( .A(n153), .B(n154), .Z(n151) );
  XOR U195 ( .A(n138), .B(n152), .Z(n154) );
  XOR U196 ( .A(\min_dist_reg[0][2] ), .B(n152), .Z(n153) );
  XOR U197 ( .A(n155), .B(n156), .Z(n152) );
  NAND U198 ( .A(n157), .B(n158), .Z(n156) );
  XNOR U199 ( .A(n155), .B(n142), .Z(n158) );
  XNOR U200 ( .A(\min_dist_reg[0][1] ), .B(n155), .Z(n157) );
  NOR U201 ( .A(n144), .B(\min_dist_reg[0][0] ), .Z(n155) );
  IV U202 ( .A(n159), .Z(n144) );
  AND U203 ( .A(\min_dist_reg[0][3] ), .B(n160), .Z(\local_min_dist[0][3] ) );
  NANDN U204 ( .A(n150), .B(n40), .Z(n160) );
  XOR U205 ( .A(\min_dist_reg[0][2] ), .B(n161), .Z(\local_min_dist[0][2] ) );
  AND U206 ( .A(n40), .B(n162), .Z(n161) );
  XOR U207 ( .A(\min_dist_reg[0][2] ), .B(n136), .Z(n162) );
  XOR U208 ( .A(\min_dist_reg[0][1] ), .B(n163), .Z(\local_min_dist[0][1] ) );
  AND U209 ( .A(n40), .B(n164), .Z(n163) );
  XOR U210 ( .A(\min_dist_reg[0][1] ), .B(n140), .Z(n164) );
  XOR U211 ( .A(\min_dist_reg[0][0] ), .B(n165), .Z(\local_min_dist[0][0] ) );
  AND U212 ( .A(n40), .B(n166), .Z(n165) );
  XOR U213 ( .A(\min_dist_reg[0][0] ), .B(n159), .Z(n166) );
  XNOR U214 ( .A(n167), .B(n168), .Z(n40) );
  AND U215 ( .A(n169), .B(n170), .Z(n167) );
  XNOR U216 ( .A(n171), .B(n150), .Z(n170) );
  XNOR U217 ( .A(\min_dist_reg[1][3] ), .B(n172), .Z(n150) );
  NAND U218 ( .A(n173), .B(n76), .Z(n172) );
  XOR U219 ( .A(\min_dist_reg[1][3] ), .B(n174), .Z(n173) );
  XNOR U220 ( .A(\min_dist_reg[0][3] ), .B(n168), .Z(n169) );
  IV U221 ( .A(n171), .Z(n168) );
  XOR U222 ( .A(n175), .B(n176), .Z(n171) );
  AND U223 ( .A(n177), .B(n178), .Z(n175) );
  XOR U224 ( .A(n176), .B(n138), .Z(n178) );
  IV U225 ( .A(n136), .Z(n138) );
  XNOR U226 ( .A(\min_dist_reg[1][2] ), .B(n179), .Z(n136) );
  NAND U227 ( .A(n180), .B(n76), .Z(n179) );
  XNOR U228 ( .A(\min_dist_reg[1][2] ), .B(n181), .Z(n180) );
  XOR U229 ( .A(\min_dist_reg[0][2] ), .B(n176), .Z(n177) );
  XOR U230 ( .A(n182), .B(n183), .Z(n176) );
  NAND U231 ( .A(n184), .B(n185), .Z(n183) );
  XNOR U232 ( .A(n182), .B(n142), .Z(n185) );
  IV U233 ( .A(n140), .Z(n142) );
  XNOR U234 ( .A(\min_dist_reg[1][1] ), .B(n186), .Z(n140) );
  NAND U235 ( .A(n187), .B(n76), .Z(n186) );
  XNOR U236 ( .A(\min_dist_reg[1][1] ), .B(n188), .Z(n187) );
  XNOR U237 ( .A(\min_dist_reg[0][1] ), .B(n182), .Z(n184) );
  ANDN U238 ( .B(n159), .A(\min_dist_reg[0][0] ), .Z(n182) );
  XOR U239 ( .A(n189), .B(n190), .Z(n159) );
  NAND U240 ( .A(n191), .B(n76), .Z(n190) );
  XNOR U241 ( .A(n192), .B(n193), .Z(n76) );
  AND U242 ( .A(n194), .B(n195), .Z(n192) );
  XNOR U243 ( .A(n196), .B(n174), .Z(n195) );
  XNOR U244 ( .A(n197), .B(n198), .Z(n174) );
  ANDN U245 ( .B(n199), .A(n200), .Z(n197) );
  XOR U246 ( .A(n198), .B(n201), .Z(n199) );
  XNOR U247 ( .A(\min_dist_reg[1][3] ), .B(n193), .Z(n194) );
  IV U248 ( .A(n196), .Z(n193) );
  XOR U249 ( .A(n202), .B(n203), .Z(n196) );
  AND U250 ( .A(n204), .B(n205), .Z(n202) );
  XOR U251 ( .A(n203), .B(n181), .Z(n205) );
  XOR U252 ( .A(n206), .B(n201), .Z(n181) );
  XNOR U253 ( .A(n207), .B(n208), .Z(n201) );
  ANDN U254 ( .B(n209), .A(n210), .Z(n207) );
  XOR U255 ( .A(n211), .B(n212), .Z(n209) );
  IV U256 ( .A(n200), .Z(n206) );
  XOR U257 ( .A(n213), .B(n214), .Z(n200) );
  XNOR U258 ( .A(n215), .B(n216), .Z(n214) );
  ANDN U259 ( .B(n217), .A(n218), .Z(n215) );
  XNOR U260 ( .A(n219), .B(n220), .Z(n217) );
  IV U261 ( .A(n198), .Z(n213) );
  XOR U262 ( .A(n221), .B(n222), .Z(n198) );
  ANDN U263 ( .B(n223), .A(n224), .Z(n221) );
  XOR U264 ( .A(n222), .B(n225), .Z(n223) );
  XOR U265 ( .A(\min_dist_reg[1][2] ), .B(n203), .Z(n204) );
  XOR U266 ( .A(n226), .B(n227), .Z(n203) );
  NAND U267 ( .A(n228), .B(n229), .Z(n227) );
  XNOR U268 ( .A(n226), .B(n188), .Z(n229) );
  XOR U269 ( .A(n230), .B(n225), .Z(n188) );
  XOR U270 ( .A(n231), .B(n212), .Z(n225) );
  XNOR U271 ( .A(n232), .B(n233), .Z(n212) );
  ANDN U272 ( .B(n234), .A(n235), .Z(n232) );
  XNOR U273 ( .A(n233), .B(n236), .Z(n234) );
  IV U274 ( .A(n210), .Z(n231) );
  XOR U275 ( .A(n208), .B(n237), .Z(n210) );
  XNOR U276 ( .A(n238), .B(n239), .Z(n237) );
  ANDN U277 ( .B(n240), .A(n241), .Z(n238) );
  XNOR U278 ( .A(n242), .B(n243), .Z(n240) );
  IV U279 ( .A(n239), .Z(n243) );
  IV U280 ( .A(n211), .Z(n208) );
  XNOR U281 ( .A(n244), .B(n245), .Z(n211) );
  ANDN U282 ( .B(n246), .A(n247), .Z(n244) );
  XNOR U283 ( .A(n245), .B(n248), .Z(n246) );
  IV U284 ( .A(n224), .Z(n230) );
  XOR U285 ( .A(n249), .B(n250), .Z(n224) );
  XNOR U286 ( .A(n219), .B(n251), .Z(n250) );
  IV U287 ( .A(n222), .Z(n251) );
  XNOR U288 ( .A(n252), .B(n253), .Z(n222) );
  ANDN U289 ( .B(n254), .A(n255), .Z(n252) );
  XNOR U290 ( .A(n253), .B(n256), .Z(n254) );
  XOR U291 ( .A(n257), .B(n258), .Z(n219) );
  ANDN U292 ( .B(n259), .A(n260), .Z(n257) );
  XNOR U293 ( .A(n258), .B(n261), .Z(n259) );
  IV U294 ( .A(n218), .Z(n249) );
  XOR U295 ( .A(n216), .B(n262), .Z(n218) );
  XNOR U296 ( .A(n263), .B(n264), .Z(n262) );
  ANDN U297 ( .B(n265), .A(n266), .Z(n263) );
  XNOR U298 ( .A(n267), .B(n268), .Z(n265) );
  IV U299 ( .A(n264), .Z(n268) );
  IV U300 ( .A(n220), .Z(n216) );
  XNOR U301 ( .A(n269), .B(n270), .Z(n220) );
  ANDN U302 ( .B(n271), .A(n272), .Z(n269) );
  XNOR U303 ( .A(n273), .B(n270), .Z(n271) );
  XNOR U304 ( .A(\min_dist_reg[1][1] ), .B(n226), .Z(n228) );
  NOR U305 ( .A(\min_dist_reg[1][0] ), .B(n274), .Z(n226) );
  XOR U306 ( .A(n189), .B(n274), .Z(n191) );
  XOR U307 ( .A(n275), .B(n256), .Z(n274) );
  XOR U308 ( .A(n276), .B(n248), .Z(n256) );
  XOR U309 ( .A(n277), .B(n236), .Z(n248) );
  XNOR U310 ( .A(q[14]), .B(DB[14]), .Z(n236) );
  IV U311 ( .A(n235), .Z(n277) );
  XOR U312 ( .A(n233), .B(n278), .Z(n235) );
  XNOR U313 ( .A(q[13]), .B(DB[13]), .Z(n278) );
  XOR U314 ( .A(q[12]), .B(DB[12]), .Z(n233) );
  IV U315 ( .A(n247), .Z(n276) );
  XOR U316 ( .A(n279), .B(n280), .Z(n247) );
  XNOR U317 ( .A(n242), .B(n245), .Z(n280) );
  XOR U318 ( .A(q[8]), .B(DB[8]), .Z(n245) );
  XOR U319 ( .A(q[11]), .B(DB[11]), .Z(n242) );
  IV U320 ( .A(n241), .Z(n279) );
  XOR U321 ( .A(n239), .B(n281), .Z(n241) );
  XNOR U322 ( .A(q[10]), .B(DB[10]), .Z(n281) );
  XOR U323 ( .A(q[9]), .B(DB[9]), .Z(n239) );
  IV U324 ( .A(n255), .Z(n275) );
  XOR U325 ( .A(n282), .B(n283), .Z(n255) );
  XOR U326 ( .A(n273), .B(n253), .Z(n283) );
  XOR U327 ( .A(q[0]), .B(DB[0]), .Z(n253) );
  XOR U328 ( .A(n284), .B(n261), .Z(n273) );
  XNOR U329 ( .A(q[7]), .B(DB[7]), .Z(n261) );
  IV U330 ( .A(n260), .Z(n284) );
  XOR U331 ( .A(n258), .B(n285), .Z(n260) );
  XNOR U332 ( .A(q[6]), .B(DB[6]), .Z(n285) );
  XOR U333 ( .A(q[5]), .B(DB[5]), .Z(n258) );
  IV U334 ( .A(n272), .Z(n282) );
  XOR U335 ( .A(n286), .B(n287), .Z(n272) );
  XNOR U336 ( .A(n267), .B(n270), .Z(n287) );
  XOR U337 ( .A(q[1]), .B(DB[1]), .Z(n270) );
  XOR U338 ( .A(q[4]), .B(DB[4]), .Z(n267) );
  IV U339 ( .A(n266), .Z(n286) );
  XOR U340 ( .A(n264), .B(n288), .Z(n266) );
  XNOR U341 ( .A(q[3]), .B(DB[3]), .Z(n288) );
  XOR U342 ( .A(q[2]), .B(DB[2]), .Z(n264) );
  IV U343 ( .A(\min_dist_reg[1][0] ), .Z(n189) );
endmodule

