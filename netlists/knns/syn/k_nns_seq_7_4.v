
module k_nns_seq_W7_K4 ( clk, rst, q, DB, min_val_out );
  input [6:0] q;
  input [6:0] DB;
  output [27:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[3][2] , \min_dist_reg[3][1] , \min_dist_reg[3][0] ,
         \min_dist_reg[2][2] , \min_dist_reg[2][1] , \min_dist_reg[2][0] ,
         \min_dist_reg[1][2] , \min_dist_reg[1][1] , \min_dist_reg[1][0] ,
         \min_dist_reg[0][2] , \min_dist_reg[0][1] , \min_dist_reg[0][0] ,
         \local_min_dist[0][2] , \local_min_dist[0][1] ,
         \local_min_dist[0][0] , \min_dist[3][2] , \min_dist[3][1] ,
         \min_dist[3][0] , \min_dist[2][2] , \min_dist[2][1] ,
         \min_dist[2][0] , \min_dist[1][2] , \min_dist[1][1] ,
         \min_dist[1][0] , \min_val_reg[3][6] , \min_val_reg[3][5] ,
         \min_val_reg[3][4] , \min_val_reg[3][3] , \min_val_reg[3][2] ,
         \min_val_reg[3][1] , \min_val_reg[3][0] , \min_val_reg[2][6] ,
         \min_val_reg[2][5] , \min_val_reg[2][4] , \min_val_reg[2][3] ,
         \min_val_reg[2][2] , \min_val_reg[2][1] , \min_val_reg[2][0] ,
         \min_val_reg[1][6] , \min_val_reg[1][5] , \min_val_reg[1][4] ,
         \min_val_reg[1][3] , \min_val_reg[1][2] , \min_val_reg[1][1] ,
         \min_val_reg[1][0] , \min_val_reg[0][6] , \min_val_reg[0][5] ,
         \min_val_reg[0][4] , \min_val_reg[0][3] , \min_val_reg[0][2] ,
         \min_val_reg[0][1] , \min_val_reg[0][0] , n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270;

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
  DFF \min_dist_reg_reg[2][0]  ( .D(\min_dist[2][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][0] ) );
  DFF \min_dist_reg_reg[2][1]  ( .D(\min_dist[2][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][1] ) );
  DFF \min_dist_reg_reg[2][2]  ( .D(\min_dist[2][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][2] ) );
  DFF \min_dist_reg_reg[3][0]  ( .D(\min_dist[3][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][0] ) );
  DFF \min_dist_reg_reg[3][1]  ( .D(\min_dist[3][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][1] ) );
  DFF \min_dist_reg_reg[3][2]  ( .D(\min_dist[3][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][2] ) );
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
  DFF \min_val_reg_reg[2][0]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][0] ) );
  DFF \min_val_reg_reg[2][1]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][1] ) );
  DFF \min_val_reg_reg[2][2]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][2] ) );
  DFF \min_val_reg_reg[2][3]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][3] ) );
  DFF \min_val_reg_reg[2][4]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][4] ) );
  DFF \min_val_reg_reg[2][5]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][5] ) );
  DFF \min_val_reg_reg[2][6]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][6] ) );
  DFF \min_val_reg_reg[3][0]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][0] ) );
  DFF \min_val_reg_reg[3][1]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][1] ) );
  DFF \min_val_reg_reg[3][2]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][2] ) );
  DFF \min_val_reg_reg[3][3]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][3] ) );
  DFF \min_val_reg_reg[3][4]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][4] ) );
  DFF \min_val_reg_reg[3][5]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][5] ) );
  DFF \min_val_reg_reg[3][6]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][6] ) );
  XOR U50 ( .A(n41), .B(n42), .Z(min_val_out[9]) );
  AND U51 ( .A(n43), .B(n44), .Z(n41) );
  XOR U52 ( .A(n45), .B(n46), .Z(min_val_out[8]) );
  AND U53 ( .A(n43), .B(n47), .Z(n45) );
  XOR U54 ( .A(n48), .B(n49), .Z(min_val_out[7]) );
  AND U55 ( .A(n43), .B(n50), .Z(n48) );
  XOR U56 ( .A(\min_val_reg[0][6] ), .B(n51), .Z(min_val_out[6]) );
  AND U57 ( .A(n52), .B(n53), .Z(n51) );
  XOR U58 ( .A(\min_val_reg[0][5] ), .B(n54), .Z(min_val_out[5]) );
  AND U59 ( .A(n52), .B(n55), .Z(n54) );
  XOR U60 ( .A(\min_val_reg[0][4] ), .B(n56), .Z(min_val_out[4]) );
  AND U61 ( .A(n52), .B(n57), .Z(n56) );
  XOR U62 ( .A(\min_val_reg[0][3] ), .B(n58), .Z(min_val_out[3]) );
  AND U63 ( .A(n52), .B(n59), .Z(n58) );
  XOR U64 ( .A(\min_val_reg[0][2] ), .B(n60), .Z(min_val_out[2]) );
  AND U65 ( .A(n52), .B(n44), .Z(n60) );
  XOR U66 ( .A(\min_val_reg[0][2] ), .B(n42), .Z(n44) );
  XNOR U67 ( .A(\min_val_reg[1][2] ), .B(n61), .Z(n42) );
  NAND U68 ( .A(n62), .B(n63), .Z(n61) );
  XNOR U69 ( .A(n64), .B(n65), .Z(min_val_out[27]) );
  AND U70 ( .A(n66), .B(n67), .Z(n64) );
  XNOR U71 ( .A(n68), .B(n69), .Z(min_val_out[26]) );
  AND U72 ( .A(n66), .B(n70), .Z(n68) );
  XNOR U73 ( .A(n71), .B(n72), .Z(min_val_out[25]) );
  AND U74 ( .A(n66), .B(n73), .Z(n71) );
  XNOR U75 ( .A(n74), .B(n75), .Z(min_val_out[24]) );
  AND U76 ( .A(n66), .B(n76), .Z(n74) );
  XNOR U77 ( .A(n77), .B(n78), .Z(min_val_out[23]) );
  AND U78 ( .A(n66), .B(n79), .Z(n77) );
  XNOR U79 ( .A(n80), .B(n81), .Z(min_val_out[22]) );
  AND U80 ( .A(n66), .B(n82), .Z(n80) );
  XNOR U81 ( .A(n83), .B(n84), .Z(min_val_out[21]) );
  AND U82 ( .A(n66), .B(n85), .Z(n83) );
  XOR U83 ( .A(n86), .B(n87), .Z(min_val_out[20]) );
  AND U84 ( .A(n63), .B(n88), .Z(n86) );
  XOR U85 ( .A(\min_val_reg[0][1] ), .B(n89), .Z(min_val_out[1]) );
  AND U86 ( .A(n52), .B(n47), .Z(n89) );
  XOR U87 ( .A(\min_val_reg[0][1] ), .B(n46), .Z(n47) );
  XNOR U88 ( .A(\min_val_reg[1][1] ), .B(n90), .Z(n46) );
  NAND U89 ( .A(n91), .B(n63), .Z(n90) );
  XOR U90 ( .A(n92), .B(n93), .Z(min_val_out[19]) );
  AND U91 ( .A(n63), .B(n94), .Z(n92) );
  XOR U92 ( .A(n95), .B(n96), .Z(min_val_out[18]) );
  AND U93 ( .A(n63), .B(n97), .Z(n95) );
  XOR U94 ( .A(n98), .B(n99), .Z(min_val_out[17]) );
  AND U95 ( .A(n63), .B(n100), .Z(n98) );
  XOR U96 ( .A(n101), .B(n102), .Z(min_val_out[16]) );
  AND U97 ( .A(n63), .B(n62), .Z(n101) );
  XOR U98 ( .A(\min_val_reg[1][2] ), .B(n102), .Z(n62) );
  XNOR U99 ( .A(\min_val_reg[2][2] ), .B(n103), .Z(n102) );
  NAND U100 ( .A(n79), .B(n66), .Z(n103) );
  XNOR U101 ( .A(\min_val_reg[2][2] ), .B(n78), .Z(n79) );
  XOR U102 ( .A(\min_val_reg[3][2] ), .B(n104), .Z(n78) );
  NAND U103 ( .A(n105), .B(n106), .Z(n104) );
  XOR U104 ( .A(\min_val_reg[3][2] ), .B(DB[2]), .Z(n105) );
  XOR U105 ( .A(n107), .B(n108), .Z(min_val_out[15]) );
  AND U106 ( .A(n63), .B(n91), .Z(n107) );
  XOR U107 ( .A(\min_val_reg[1][1] ), .B(n108), .Z(n91) );
  XNOR U108 ( .A(\min_val_reg[2][1] ), .B(n109), .Z(n108) );
  NAND U109 ( .A(n82), .B(n66), .Z(n109) );
  XNOR U110 ( .A(\min_val_reg[2][1] ), .B(n81), .Z(n82) );
  XOR U111 ( .A(\min_val_reg[3][1] ), .B(n110), .Z(n81) );
  NAND U112 ( .A(n111), .B(n106), .Z(n110) );
  XOR U113 ( .A(\min_val_reg[3][1] ), .B(DB[1]), .Z(n111) );
  XOR U114 ( .A(n112), .B(n113), .Z(min_val_out[14]) );
  AND U115 ( .A(n63), .B(n114), .Z(n112) );
  XOR U116 ( .A(n115), .B(n116), .Z(min_val_out[13]) );
  AND U117 ( .A(n43), .B(n53), .Z(n115) );
  XOR U118 ( .A(\min_val_reg[0][6] ), .B(n116), .Z(n53) );
  XNOR U119 ( .A(\min_val_reg[1][6] ), .B(n117), .Z(n116) );
  NAND U120 ( .A(n88), .B(n63), .Z(n117) );
  XOR U121 ( .A(\min_val_reg[1][6] ), .B(n87), .Z(n88) );
  XNOR U122 ( .A(\min_val_reg[2][6] ), .B(n118), .Z(n87) );
  NAND U123 ( .A(n67), .B(n66), .Z(n118) );
  XNOR U124 ( .A(\min_val_reg[2][6] ), .B(n65), .Z(n67) );
  XOR U125 ( .A(\min_val_reg[3][6] ), .B(n119), .Z(n65) );
  NAND U126 ( .A(n120), .B(n106), .Z(n119) );
  XOR U127 ( .A(\min_val_reg[3][6] ), .B(DB[6]), .Z(n120) );
  XOR U128 ( .A(n121), .B(n122), .Z(min_val_out[12]) );
  AND U129 ( .A(n43), .B(n55), .Z(n121) );
  XOR U130 ( .A(\min_val_reg[0][5] ), .B(n122), .Z(n55) );
  XNOR U131 ( .A(\min_val_reg[1][5] ), .B(n123), .Z(n122) );
  NAND U132 ( .A(n94), .B(n63), .Z(n123) );
  XOR U133 ( .A(\min_val_reg[1][5] ), .B(n93), .Z(n94) );
  XNOR U134 ( .A(\min_val_reg[2][5] ), .B(n124), .Z(n93) );
  NAND U135 ( .A(n70), .B(n66), .Z(n124) );
  XNOR U136 ( .A(\min_val_reg[2][5] ), .B(n69), .Z(n70) );
  XOR U137 ( .A(\min_val_reg[3][5] ), .B(n125), .Z(n69) );
  NAND U138 ( .A(n126), .B(n106), .Z(n125) );
  XOR U139 ( .A(\min_val_reg[3][5] ), .B(DB[5]), .Z(n126) );
  XOR U140 ( .A(n127), .B(n128), .Z(min_val_out[11]) );
  AND U141 ( .A(n43), .B(n57), .Z(n127) );
  XOR U142 ( .A(\min_val_reg[0][4] ), .B(n128), .Z(n57) );
  XNOR U143 ( .A(\min_val_reg[1][4] ), .B(n129), .Z(n128) );
  NAND U144 ( .A(n97), .B(n63), .Z(n129) );
  XOR U145 ( .A(\min_val_reg[1][4] ), .B(n96), .Z(n97) );
  XNOR U146 ( .A(\min_val_reg[2][4] ), .B(n130), .Z(n96) );
  NAND U147 ( .A(n73), .B(n66), .Z(n130) );
  XNOR U148 ( .A(\min_val_reg[2][4] ), .B(n72), .Z(n73) );
  XOR U149 ( .A(\min_val_reg[3][4] ), .B(n131), .Z(n72) );
  NAND U150 ( .A(n132), .B(n106), .Z(n131) );
  XOR U151 ( .A(\min_val_reg[3][4] ), .B(DB[4]), .Z(n132) );
  XOR U152 ( .A(n133), .B(n134), .Z(min_val_out[10]) );
  AND U153 ( .A(n43), .B(n59), .Z(n133) );
  XOR U154 ( .A(\min_val_reg[0][3] ), .B(n134), .Z(n59) );
  XNOR U155 ( .A(\min_val_reg[1][3] ), .B(n135), .Z(n134) );
  NAND U156 ( .A(n100), .B(n63), .Z(n135) );
  XOR U157 ( .A(\min_val_reg[1][3] ), .B(n99), .Z(n100) );
  XNOR U158 ( .A(\min_val_reg[2][3] ), .B(n136), .Z(n99) );
  NAND U159 ( .A(n76), .B(n66), .Z(n136) );
  XNOR U160 ( .A(\min_val_reg[2][3] ), .B(n75), .Z(n76) );
  XOR U161 ( .A(\min_val_reg[3][3] ), .B(n137), .Z(n75) );
  NAND U162 ( .A(n138), .B(n106), .Z(n137) );
  XOR U163 ( .A(\min_val_reg[3][3] ), .B(DB[3]), .Z(n138) );
  XOR U164 ( .A(\min_val_reg[0][0] ), .B(n139), .Z(min_val_out[0]) );
  AND U165 ( .A(n52), .B(n50), .Z(n139) );
  XOR U166 ( .A(\min_val_reg[0][0] ), .B(n49), .Z(n50) );
  XNOR U167 ( .A(\min_val_reg[1][0] ), .B(n140), .Z(n49) );
  NAND U168 ( .A(n114), .B(n63), .Z(n140) );
  XOR U169 ( .A(\min_val_reg[1][0] ), .B(n113), .Z(n114) );
  XNOR U170 ( .A(\min_val_reg[2][0] ), .B(n141), .Z(n113) );
  NAND U171 ( .A(n85), .B(n66), .Z(n141) );
  XNOR U172 ( .A(\min_val_reg[2][0] ), .B(n84), .Z(n85) );
  XOR U173 ( .A(\min_val_reg[3][0] ), .B(n142), .Z(n84) );
  NAND U174 ( .A(n143), .B(n106), .Z(n142) );
  XOR U175 ( .A(\min_val_reg[3][0] ), .B(DB[0]), .Z(n143) );
  XNOR U176 ( .A(n144), .B(n145), .Z(\min_dist[3][2] ) );
  AND U177 ( .A(n66), .B(n146), .Z(n144) );
  XOR U178 ( .A(\min_dist_reg[2][2] ), .B(n147), .Z(n146) );
  XOR U179 ( .A(n148), .B(n149), .Z(\min_dist[3][1] ) );
  AND U180 ( .A(n66), .B(n150), .Z(n148) );
  XNOR U181 ( .A(\min_dist_reg[2][1] ), .B(n151), .Z(n150) );
  XOR U182 ( .A(n152), .B(n153), .Z(\min_dist[3][0] ) );
  AND U183 ( .A(n66), .B(n154), .Z(n152) );
  XOR U184 ( .A(n155), .B(n156), .Z(\min_dist[2][2] ) );
  AND U185 ( .A(n63), .B(n157), .Z(n155) );
  XOR U186 ( .A(\min_dist_reg[1][2] ), .B(n156), .Z(n157) );
  XOR U187 ( .A(n158), .B(n159), .Z(\min_dist[2][1] ) );
  AND U188 ( .A(n63), .B(n160), .Z(n158) );
  XOR U189 ( .A(\min_dist_reg[1][1] ), .B(n159), .Z(n160) );
  XOR U190 ( .A(n161), .B(n162), .Z(\min_dist[2][0] ) );
  AND U191 ( .A(n63), .B(n163), .Z(n161) );
  XOR U192 ( .A(n164), .B(n165), .Z(\min_dist[1][2] ) );
  AND U193 ( .A(n43), .B(n166), .Z(n164) );
  XOR U194 ( .A(\min_dist_reg[0][2] ), .B(n165), .Z(n166) );
  XOR U195 ( .A(n167), .B(n168), .Z(\min_dist[1][1] ) );
  AND U196 ( .A(n43), .B(n169), .Z(n167) );
  XNOR U197 ( .A(n170), .B(n171), .Z(\min_dist[1][0] ) );
  AND U198 ( .A(n43), .B(n172), .Z(n170) );
  XNOR U199 ( .A(\min_dist_reg[0][0] ), .B(n171), .Z(n172) );
  XOR U200 ( .A(n173), .B(n174), .Z(n43) );
  AND U201 ( .A(n175), .B(n176), .Z(n173) );
  XNOR U202 ( .A(n165), .B(n174), .Z(n176) );
  XOR U203 ( .A(\min_dist_reg[0][2] ), .B(n174), .Z(n175) );
  XOR U204 ( .A(n177), .B(n178), .Z(n174) );
  NAND U205 ( .A(n179), .B(n180), .Z(n178) );
  XOR U206 ( .A(n177), .B(n168), .Z(n180) );
  XNOR U207 ( .A(\min_dist_reg[0][1] ), .B(n177), .Z(n179) );
  ANDN U208 ( .B(n181), .A(\min_dist_reg[0][0] ), .Z(n177) );
  AND U209 ( .A(\min_dist_reg[0][2] ), .B(n182), .Z(\local_min_dist[0][2] ) );
  NANDN U210 ( .A(n165), .B(n52), .Z(n182) );
  XOR U211 ( .A(\min_dist_reg[0][1] ), .B(n183), .Z(\local_min_dist[0][1] ) );
  AND U212 ( .A(n52), .B(n169), .Z(n183) );
  XOR U213 ( .A(\min_dist_reg[0][1] ), .B(n168), .Z(n169) );
  XOR U214 ( .A(\min_dist_reg[0][0] ), .B(n184), .Z(\local_min_dist[0][0] ) );
  AND U215 ( .A(n52), .B(n185), .Z(n184) );
  XOR U216 ( .A(\min_dist_reg[0][0] ), .B(n181), .Z(n185) );
  IV U217 ( .A(n171), .Z(n181) );
  XOR U218 ( .A(n186), .B(n187), .Z(n52) );
  AND U219 ( .A(n188), .B(n189), .Z(n186) );
  XNOR U220 ( .A(n165), .B(n187), .Z(n189) );
  AND U221 ( .A(n190), .B(\min_dist_reg[1][2] ), .Z(n165) );
  NANDN U222 ( .A(n156), .B(n63), .Z(n190) );
  XOR U223 ( .A(\min_dist_reg[0][2] ), .B(n187), .Z(n188) );
  XOR U224 ( .A(n191), .B(n192), .Z(n187) );
  NAND U225 ( .A(n193), .B(n194), .Z(n192) );
  XOR U226 ( .A(n191), .B(n168), .Z(n194) );
  XNOR U227 ( .A(\min_dist_reg[1][1] ), .B(n195), .Z(n168) );
  NAND U228 ( .A(n196), .B(n63), .Z(n195) );
  XNOR U229 ( .A(n197), .B(n159), .Z(n196) );
  XNOR U230 ( .A(\min_dist_reg[0][1] ), .B(n191), .Z(n193) );
  NOR U231 ( .A(n171), .B(\min_dist_reg[0][0] ), .Z(n191) );
  XOR U232 ( .A(\min_dist_reg[1][0] ), .B(n198), .Z(n171) );
  NAND U233 ( .A(n163), .B(n63), .Z(n198) );
  XOR U234 ( .A(n199), .B(n200), .Z(n63) );
  AND U235 ( .A(n201), .B(n202), .Z(n199) );
  XNOR U236 ( .A(n156), .B(n200), .Z(n202) );
  AND U237 ( .A(n203), .B(\min_dist_reg[2][2] ), .Z(n156) );
  NANDN U238 ( .A(n147), .B(n66), .Z(n203) );
  XNOR U239 ( .A(n204), .B(n200), .Z(n201) );
  XOR U240 ( .A(n205), .B(n206), .Z(n200) );
  NAND U241 ( .A(n207), .B(n208), .Z(n206) );
  XOR U242 ( .A(n205), .B(n159), .Z(n208) );
  XNOR U243 ( .A(\min_dist_reg[2][1] ), .B(n209), .Z(n159) );
  NAND U244 ( .A(n210), .B(n66), .Z(n209) );
  XNOR U245 ( .A(n211), .B(n149), .Z(n210) );
  XOR U246 ( .A(n197), .B(n205), .Z(n207) );
  IV U247 ( .A(\min_dist_reg[1][1] ), .Z(n197) );
  AND U248 ( .A(n162), .B(n212), .Z(n205) );
  IV U249 ( .A(\min_dist_reg[1][2] ), .Z(n204) );
  XNOR U250 ( .A(n212), .B(n162), .Z(n163) );
  XNOR U251 ( .A(\min_dist_reg[2][0] ), .B(n213), .Z(n162) );
  NAND U252 ( .A(n154), .B(n66), .Z(n213) );
  XOR U253 ( .A(n214), .B(n215), .Z(n66) );
  AND U254 ( .A(n216), .B(n217), .Z(n214) );
  XOR U255 ( .A(n145), .B(n215), .Z(n217) );
  IV U256 ( .A(n147), .Z(n145) );
  XNOR U257 ( .A(\min_dist_reg[3][2] ), .B(n218), .Z(n147) );
  NAND U258 ( .A(n219), .B(n106), .Z(n218) );
  XOR U259 ( .A(\min_dist_reg[3][2] ), .B(n220), .Z(n219) );
  XNOR U260 ( .A(n221), .B(n215), .Z(n216) );
  XOR U261 ( .A(n222), .B(n223), .Z(n215) );
  NAND U262 ( .A(n224), .B(n225), .Z(n223) );
  XNOR U263 ( .A(n222), .B(n151), .Z(n225) );
  IV U264 ( .A(n149), .Z(n151) );
  XNOR U265 ( .A(\min_dist_reg[3][1] ), .B(n226), .Z(n149) );
  NAND U266 ( .A(n227), .B(n106), .Z(n226) );
  XNOR U267 ( .A(\min_dist_reg[3][1] ), .B(n228), .Z(n227) );
  XOR U268 ( .A(n211), .B(n222), .Z(n224) );
  IV U269 ( .A(\min_dist_reg[2][1] ), .Z(n211) );
  ANDN U270 ( .B(n153), .A(\min_dist_reg[2][0] ), .Z(n222) );
  IV U271 ( .A(\min_dist_reg[2][2] ), .Z(n221) );
  XOR U272 ( .A(\min_dist_reg[2][0] ), .B(n153), .Z(n154) );
  XOR U273 ( .A(n229), .B(n230), .Z(n153) );
  NAND U274 ( .A(n231), .B(n106), .Z(n230) );
  XOR U275 ( .A(n232), .B(n233), .Z(n106) );
  AND U276 ( .A(n234), .B(n235), .Z(n232) );
  XNOR U277 ( .A(n233), .B(n220), .Z(n235) );
  XNOR U278 ( .A(n236), .B(n237), .Z(n220) );
  ANDN U279 ( .B(n238), .A(n239), .Z(n236) );
  XOR U280 ( .A(n237), .B(n240), .Z(n238) );
  XOR U281 ( .A(\min_dist_reg[3][2] ), .B(n233), .Z(n234) );
  XOR U282 ( .A(n241), .B(n242), .Z(n233) );
  NAND U283 ( .A(n243), .B(n244), .Z(n242) );
  XNOR U284 ( .A(n241), .B(n228), .Z(n244) );
  XOR U285 ( .A(n245), .B(n240), .Z(n228) );
  XNOR U286 ( .A(n246), .B(n247), .Z(n240) );
  ANDN U287 ( .B(n248), .A(n249), .Z(n246) );
  XNOR U288 ( .A(n247), .B(n250), .Z(n248) );
  IV U289 ( .A(n239), .Z(n245) );
  XOR U290 ( .A(n251), .B(n252), .Z(n239) );
  XNOR U291 ( .A(n253), .B(n254), .Z(n252) );
  ANDN U292 ( .B(n255), .A(n256), .Z(n253) );
  XNOR U293 ( .A(n257), .B(n258), .Z(n255) );
  IV U294 ( .A(n254), .Z(n258) );
  IV U295 ( .A(n237), .Z(n251) );
  XNOR U296 ( .A(n259), .B(n260), .Z(n237) );
  ANDN U297 ( .B(n261), .A(n262), .Z(n259) );
  XNOR U298 ( .A(n260), .B(n263), .Z(n261) );
  XNOR U299 ( .A(\min_dist_reg[3][1] ), .B(n241), .Z(n243) );
  NOR U300 ( .A(\min_dist_reg[3][0] ), .B(n264), .Z(n241) );
  XOR U301 ( .A(n229), .B(n264), .Z(n231) );
  XOR U302 ( .A(n265), .B(n263), .Z(n264) );
  XOR U303 ( .A(n266), .B(n250), .Z(n263) );
  XNOR U304 ( .A(q[6]), .B(DB[6]), .Z(n250) );
  IV U305 ( .A(n249), .Z(n266) );
  XOR U306 ( .A(n247), .B(n267), .Z(n249) );
  XNOR U307 ( .A(q[5]), .B(DB[5]), .Z(n267) );
  XOR U308 ( .A(q[4]), .B(DB[4]), .Z(n247) );
  IV U309 ( .A(n262), .Z(n265) );
  XOR U310 ( .A(n268), .B(n269), .Z(n262) );
  XNOR U311 ( .A(n257), .B(n260), .Z(n269) );
  XOR U312 ( .A(q[0]), .B(DB[0]), .Z(n260) );
  XOR U313 ( .A(q[3]), .B(DB[3]), .Z(n257) );
  IV U314 ( .A(n256), .Z(n268) );
  XOR U315 ( .A(n254), .B(n270), .Z(n256) );
  XNOR U316 ( .A(q[2]), .B(DB[2]), .Z(n270) );
  XOR U317 ( .A(q[1]), .B(DB[1]), .Z(n254) );
  IV U318 ( .A(\min_dist_reg[3][0] ), .Z(n229) );
  IV U319 ( .A(\min_dist_reg[1][0] ), .Z(n212) );
endmodule

