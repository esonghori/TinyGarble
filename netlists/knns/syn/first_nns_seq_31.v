
module first_nns_seq_W31 ( clk, rst, q, DB, min_val_out );
  input [30:0] q;
  input [30:0] DB;
  output [30:0] min_val_out;
  input clk, rst;
  wire   n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283;
  wire   [4:0] min_dist_reg;
  wire   [30:0] min_val_reg;
  wire   [4:0] min_dist;

  DFF \min_dist_reg_reg[0]  ( .D(min_dist[0]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[0]) );
  DFF \min_dist_reg_reg[1]  ( .D(min_dist[1]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[1]) );
  DFF \min_dist_reg_reg[2]  ( .D(min_dist[2]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[2]) );
  DFF \min_dist_reg_reg[3]  ( .D(min_dist[3]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[3]) );
  DFF \min_dist_reg_reg[4]  ( .D(min_dist[4]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[4]) );
  DFF \min_val_reg_reg[0]  ( .D(min_val_out[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[0]) );
  DFF \min_val_reg_reg[1]  ( .D(min_val_out[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[1]) );
  DFF \min_val_reg_reg[2]  ( .D(min_val_out[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[2]) );
  DFF \min_val_reg_reg[3]  ( .D(min_val_out[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[3]) );
  DFF \min_val_reg_reg[4]  ( .D(min_val_out[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[4]) );
  DFF \min_val_reg_reg[5]  ( .D(min_val_out[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[5]) );
  DFF \min_val_reg_reg[6]  ( .D(min_val_out[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[6]) );
  DFF \min_val_reg_reg[7]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[7]) );
  DFF \min_val_reg_reg[8]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[8]) );
  DFF \min_val_reg_reg[9]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[9]) );
  DFF \min_val_reg_reg[10]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[10]) );
  DFF \min_val_reg_reg[11]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[11]) );
  DFF \min_val_reg_reg[12]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[12]) );
  DFF \min_val_reg_reg[13]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[13]) );
  DFF \min_val_reg_reg[14]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[14]) );
  DFF \min_val_reg_reg[15]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[15]) );
  DFF \min_val_reg_reg[16]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[16]) );
  DFF \min_val_reg_reg[17]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[17]) );
  DFF \min_val_reg_reg[18]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[18]) );
  DFF \min_val_reg_reg[19]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[19]) );
  DFF \min_val_reg_reg[20]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[20]) );
  DFF \min_val_reg_reg[21]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[21]) );
  DFF \min_val_reg_reg[22]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[22]) );
  DFF \min_val_reg_reg[23]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[23]) );
  DFF \min_val_reg_reg[24]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[24]) );
  DFF \min_val_reg_reg[25]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[25]) );
  DFF \min_val_reg_reg[26]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[26]) );
  DFF \min_val_reg_reg[27]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[27]) );
  DFF \min_val_reg_reg[28]  ( .D(min_val_out[28]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[28]) );
  DFF \min_val_reg_reg[29]  ( .D(min_val_out[29]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[29]) );
  DFF \min_val_reg_reg[30]  ( .D(min_val_out[30]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[30]) );
  XOR U39 ( .A(DB[9]), .B(n37), .Z(min_val_out[9]) );
  AND U40 ( .A(n38), .B(n39), .Z(n37) );
  XOR U41 ( .A(min_val_reg[9]), .B(DB[9]), .Z(n39) );
  XOR U42 ( .A(DB[8]), .B(n40), .Z(min_val_out[8]) );
  AND U43 ( .A(n38), .B(n41), .Z(n40) );
  XOR U44 ( .A(min_val_reg[8]), .B(DB[8]), .Z(n41) );
  XOR U45 ( .A(DB[7]), .B(n42), .Z(min_val_out[7]) );
  AND U46 ( .A(n38), .B(n43), .Z(n42) );
  XOR U47 ( .A(min_val_reg[7]), .B(DB[7]), .Z(n43) );
  XOR U48 ( .A(DB[6]), .B(n44), .Z(min_val_out[6]) );
  AND U49 ( .A(n38), .B(n45), .Z(n44) );
  XOR U50 ( .A(min_val_reg[6]), .B(DB[6]), .Z(n45) );
  XOR U51 ( .A(DB[5]), .B(n46), .Z(min_val_out[5]) );
  AND U52 ( .A(n38), .B(n47), .Z(n46) );
  XOR U53 ( .A(min_val_reg[5]), .B(DB[5]), .Z(n47) );
  XOR U54 ( .A(DB[4]), .B(n48), .Z(min_val_out[4]) );
  AND U55 ( .A(n38), .B(n49), .Z(n48) );
  XOR U56 ( .A(min_val_reg[4]), .B(DB[4]), .Z(n49) );
  XOR U57 ( .A(DB[3]), .B(n50), .Z(min_val_out[3]) );
  AND U58 ( .A(n38), .B(n51), .Z(n50) );
  XOR U59 ( .A(min_val_reg[3]), .B(DB[3]), .Z(n51) );
  XOR U60 ( .A(DB[30]), .B(n52), .Z(min_val_out[30]) );
  AND U61 ( .A(n38), .B(n53), .Z(n52) );
  XOR U62 ( .A(min_val_reg[30]), .B(DB[30]), .Z(n53) );
  XOR U63 ( .A(DB[2]), .B(n54), .Z(min_val_out[2]) );
  AND U64 ( .A(n38), .B(n55), .Z(n54) );
  XOR U65 ( .A(min_val_reg[2]), .B(DB[2]), .Z(n55) );
  XOR U66 ( .A(DB[29]), .B(n56), .Z(min_val_out[29]) );
  AND U67 ( .A(n38), .B(n57), .Z(n56) );
  XOR U68 ( .A(min_val_reg[29]), .B(DB[29]), .Z(n57) );
  XOR U69 ( .A(DB[28]), .B(n58), .Z(min_val_out[28]) );
  AND U70 ( .A(n38), .B(n59), .Z(n58) );
  XOR U71 ( .A(min_val_reg[28]), .B(DB[28]), .Z(n59) );
  XOR U72 ( .A(DB[27]), .B(n60), .Z(min_val_out[27]) );
  AND U73 ( .A(n38), .B(n61), .Z(n60) );
  XOR U74 ( .A(min_val_reg[27]), .B(DB[27]), .Z(n61) );
  XOR U75 ( .A(DB[26]), .B(n62), .Z(min_val_out[26]) );
  AND U76 ( .A(n38), .B(n63), .Z(n62) );
  XOR U77 ( .A(min_val_reg[26]), .B(DB[26]), .Z(n63) );
  XOR U78 ( .A(DB[25]), .B(n64), .Z(min_val_out[25]) );
  AND U79 ( .A(n38), .B(n65), .Z(n64) );
  XOR U80 ( .A(min_val_reg[25]), .B(DB[25]), .Z(n65) );
  XOR U81 ( .A(DB[24]), .B(n66), .Z(min_val_out[24]) );
  AND U82 ( .A(n38), .B(n67), .Z(n66) );
  XOR U83 ( .A(min_val_reg[24]), .B(DB[24]), .Z(n67) );
  XOR U84 ( .A(DB[23]), .B(n68), .Z(min_val_out[23]) );
  AND U85 ( .A(n38), .B(n69), .Z(n68) );
  XOR U86 ( .A(min_val_reg[23]), .B(DB[23]), .Z(n69) );
  XOR U87 ( .A(DB[22]), .B(n70), .Z(min_val_out[22]) );
  AND U88 ( .A(n38), .B(n71), .Z(n70) );
  XOR U89 ( .A(min_val_reg[22]), .B(DB[22]), .Z(n71) );
  XOR U90 ( .A(DB[21]), .B(n72), .Z(min_val_out[21]) );
  AND U91 ( .A(n38), .B(n73), .Z(n72) );
  XOR U92 ( .A(min_val_reg[21]), .B(DB[21]), .Z(n73) );
  XOR U93 ( .A(DB[20]), .B(n74), .Z(min_val_out[20]) );
  AND U94 ( .A(n38), .B(n75), .Z(n74) );
  XOR U95 ( .A(min_val_reg[20]), .B(DB[20]), .Z(n75) );
  XOR U96 ( .A(DB[1]), .B(n76), .Z(min_val_out[1]) );
  AND U97 ( .A(n38), .B(n77), .Z(n76) );
  XOR U98 ( .A(min_val_reg[1]), .B(DB[1]), .Z(n77) );
  XOR U99 ( .A(DB[19]), .B(n78), .Z(min_val_out[19]) );
  AND U100 ( .A(n38), .B(n79), .Z(n78) );
  XOR U101 ( .A(min_val_reg[19]), .B(DB[19]), .Z(n79) );
  XOR U102 ( .A(DB[18]), .B(n80), .Z(min_val_out[18]) );
  AND U103 ( .A(n38), .B(n81), .Z(n80) );
  XOR U104 ( .A(min_val_reg[18]), .B(DB[18]), .Z(n81) );
  XOR U105 ( .A(DB[17]), .B(n82), .Z(min_val_out[17]) );
  AND U106 ( .A(n38), .B(n83), .Z(n82) );
  XOR U107 ( .A(min_val_reg[17]), .B(DB[17]), .Z(n83) );
  XOR U108 ( .A(DB[16]), .B(n84), .Z(min_val_out[16]) );
  AND U109 ( .A(n38), .B(n85), .Z(n84) );
  XOR U110 ( .A(min_val_reg[16]), .B(DB[16]), .Z(n85) );
  XOR U111 ( .A(DB[15]), .B(n86), .Z(min_val_out[15]) );
  AND U112 ( .A(n38), .B(n87), .Z(n86) );
  XOR U113 ( .A(min_val_reg[15]), .B(DB[15]), .Z(n87) );
  XOR U114 ( .A(DB[14]), .B(n88), .Z(min_val_out[14]) );
  AND U115 ( .A(n38), .B(n89), .Z(n88) );
  XOR U116 ( .A(min_val_reg[14]), .B(DB[14]), .Z(n89) );
  XOR U117 ( .A(DB[13]), .B(n90), .Z(min_val_out[13]) );
  AND U118 ( .A(n38), .B(n91), .Z(n90) );
  XOR U119 ( .A(min_val_reg[13]), .B(DB[13]), .Z(n91) );
  XOR U120 ( .A(DB[12]), .B(n92), .Z(min_val_out[12]) );
  AND U121 ( .A(n38), .B(n93), .Z(n92) );
  XOR U122 ( .A(min_val_reg[12]), .B(DB[12]), .Z(n93) );
  XOR U123 ( .A(DB[11]), .B(n94), .Z(min_val_out[11]) );
  AND U124 ( .A(n38), .B(n95), .Z(n94) );
  XOR U125 ( .A(min_val_reg[11]), .B(DB[11]), .Z(n95) );
  XOR U126 ( .A(DB[10]), .B(n96), .Z(min_val_out[10]) );
  AND U127 ( .A(n38), .B(n97), .Z(n96) );
  XOR U128 ( .A(min_val_reg[10]), .B(DB[10]), .Z(n97) );
  XOR U129 ( .A(DB[0]), .B(n98), .Z(min_val_out[0]) );
  AND U130 ( .A(n38), .B(n99), .Z(n98) );
  XOR U131 ( .A(min_val_reg[0]), .B(DB[0]), .Z(n99) );
  XOR U132 ( .A(n100), .B(n101), .Z(min_dist[4]) );
  AND U133 ( .A(n38), .B(n102), .Z(n100) );
  XOR U134 ( .A(min_dist_reg[4]), .B(n101), .Z(n102) );
  XOR U135 ( .A(n103), .B(n104), .Z(min_dist[3]) );
  AND U136 ( .A(n38), .B(n105), .Z(n103) );
  XOR U137 ( .A(min_dist_reg[3]), .B(n104), .Z(n105) );
  XNOR U138 ( .A(n106), .B(n107), .Z(min_dist[2]) );
  AND U139 ( .A(n38), .B(n108), .Z(n106) );
  XNOR U140 ( .A(min_dist_reg[2]), .B(n107), .Z(n108) );
  XNOR U141 ( .A(n109), .B(n110), .Z(min_dist[1]) );
  AND U142 ( .A(n38), .B(n111), .Z(n109) );
  XNOR U143 ( .A(min_dist_reg[1]), .B(n110), .Z(n111) );
  XNOR U144 ( .A(n112), .B(n113), .Z(min_dist[0]) );
  AND U145 ( .A(n38), .B(n114), .Z(n112) );
  XNOR U146 ( .A(min_dist_reg[0]), .B(n113), .Z(n114) );
  XNOR U147 ( .A(n115), .B(n116), .Z(n38) );
  AND U148 ( .A(n117), .B(n118), .Z(n115) );
  XNOR U149 ( .A(n119), .B(n101), .Z(n118) );
  XNOR U150 ( .A(n120), .B(n121), .Z(n101) );
  ANDN U151 ( .B(n122), .A(n123), .Z(n120) );
  XOR U152 ( .A(n121), .B(n124), .Z(n122) );
  XNOR U153 ( .A(min_dist_reg[4]), .B(n116), .Z(n117) );
  IV U154 ( .A(n119), .Z(n116) );
  XOR U155 ( .A(n125), .B(n126), .Z(n119) );
  AND U156 ( .A(n127), .B(n128), .Z(n125) );
  XNOR U157 ( .A(n126), .B(n104), .Z(n128) );
  XNOR U158 ( .A(n129), .B(n124), .Z(n104) );
  XNOR U159 ( .A(n130), .B(n131), .Z(n124) );
  ANDN U160 ( .B(n132), .A(n133), .Z(n130) );
  XOR U161 ( .A(n134), .B(n135), .Z(n132) );
  IV U162 ( .A(n123), .Z(n129) );
  XOR U163 ( .A(n136), .B(n137), .Z(n123) );
  XNOR U164 ( .A(n138), .B(n139), .Z(n137) );
  ANDN U165 ( .B(n140), .A(n141), .Z(n138) );
  XNOR U166 ( .A(n142), .B(n143), .Z(n140) );
  IV U167 ( .A(n121), .Z(n136) );
  XOR U168 ( .A(n144), .B(n145), .Z(n121) );
  ANDN U169 ( .B(n146), .A(n147), .Z(n144) );
  XOR U170 ( .A(n145), .B(n148), .Z(n146) );
  XNOR U171 ( .A(min_dist_reg[3]), .B(n149), .Z(n127) );
  IV U172 ( .A(n126), .Z(n149) );
  XOR U173 ( .A(n150), .B(n151), .Z(n126) );
  AND U174 ( .A(n152), .B(n153), .Z(n150) );
  XOR U175 ( .A(n151), .B(n107), .Z(n153) );
  XOR U176 ( .A(n154), .B(n148), .Z(n107) );
  XOR U177 ( .A(n155), .B(n135), .Z(n148) );
  XOR U178 ( .A(n156), .B(n157), .Z(n135) );
  ANDN U179 ( .B(n158), .A(n159), .Z(n156) );
  XOR U180 ( .A(n157), .B(n160), .Z(n158) );
  IV U181 ( .A(n133), .Z(n155) );
  XOR U182 ( .A(n131), .B(n161), .Z(n133) );
  XOR U183 ( .A(n162), .B(n163), .Z(n161) );
  ANDN U184 ( .B(n164), .A(n165), .Z(n162) );
  XOR U185 ( .A(n166), .B(n163), .Z(n164) );
  IV U186 ( .A(n134), .Z(n131) );
  XOR U187 ( .A(n167), .B(n168), .Z(n134) );
  ANDN U188 ( .B(n169), .A(n170), .Z(n167) );
  XOR U189 ( .A(n168), .B(n171), .Z(n169) );
  IV U190 ( .A(n147), .Z(n154) );
  XOR U191 ( .A(n172), .B(n173), .Z(n147) );
  XNOR U192 ( .A(n142), .B(n174), .Z(n173) );
  IV U193 ( .A(n145), .Z(n174) );
  XOR U194 ( .A(n175), .B(n176), .Z(n145) );
  ANDN U195 ( .B(n177), .A(n178), .Z(n175) );
  XOR U196 ( .A(n176), .B(n179), .Z(n177) );
  XNOR U197 ( .A(n180), .B(n181), .Z(n142) );
  ANDN U198 ( .B(n182), .A(n183), .Z(n180) );
  XOR U199 ( .A(n181), .B(n184), .Z(n182) );
  IV U200 ( .A(n141), .Z(n172) );
  XOR U201 ( .A(n139), .B(n185), .Z(n141) );
  XOR U202 ( .A(n186), .B(n187), .Z(n185) );
  ANDN U203 ( .B(n188), .A(n189), .Z(n186) );
  XOR U204 ( .A(n190), .B(n187), .Z(n188) );
  IV U205 ( .A(n143), .Z(n139) );
  XOR U206 ( .A(n191), .B(n192), .Z(n143) );
  ANDN U207 ( .B(n193), .A(n194), .Z(n191) );
  XOR U208 ( .A(n195), .B(n192), .Z(n193) );
  XOR U209 ( .A(min_dist_reg[2]), .B(n151), .Z(n152) );
  XOR U210 ( .A(n196), .B(n197), .Z(n151) );
  NAND U211 ( .A(n198), .B(n199), .Z(n197) );
  XNOR U212 ( .A(n196), .B(n110), .Z(n199) );
  XOR U213 ( .A(n200), .B(n179), .Z(n110) );
  XOR U214 ( .A(n201), .B(n171), .Z(n179) );
  XOR U215 ( .A(n202), .B(n160), .Z(n171) );
  XOR U216 ( .A(q[28]), .B(n203), .Z(n160) );
  NAND U217 ( .A(n204), .B(n205), .Z(n203) );
  XOR U218 ( .A(q[30]), .B(q[28]), .Z(n204) );
  IV U219 ( .A(n159), .Z(n202) );
  XNOR U220 ( .A(n157), .B(n206), .Z(n159) );
  XOR U221 ( .A(q[25]), .B(n207), .Z(n206) );
  NAND U222 ( .A(n208), .B(n209), .Z(n207) );
  XNOR U223 ( .A(q[27]), .B(n210), .Z(n208) );
  IV U224 ( .A(q[25]), .Z(n210) );
  XOR U225 ( .A(q[24]), .B(n211), .Z(n157) );
  NANDN U226 ( .A(n212), .B(n213), .Z(n211) );
  XNOR U227 ( .A(q[24]), .B(n214), .Z(n213) );
  IV U228 ( .A(n170), .Z(n201) );
  XOR U229 ( .A(n215), .B(n216), .Z(n170) );
  XNOR U230 ( .A(n166), .B(n168), .Z(n216) );
  XOR U231 ( .A(q[16]), .B(n217), .Z(n168) );
  NANDN U232 ( .A(n218), .B(n219), .Z(n217) );
  XNOR U233 ( .A(q[16]), .B(n220), .Z(n219) );
  XOR U234 ( .A(q[21]), .B(n221), .Z(n166) );
  NAND U235 ( .A(n222), .B(n223), .Z(n221) );
  XOR U236 ( .A(q[23]), .B(q[21]), .Z(n222) );
  IV U237 ( .A(n165), .Z(n215) );
  XNOR U238 ( .A(n163), .B(n224), .Z(n165) );
  XOR U239 ( .A(q[18]), .B(n225), .Z(n224) );
  NAND U240 ( .A(n226), .B(n227), .Z(n225) );
  XNOR U241 ( .A(q[20]), .B(n228), .Z(n226) );
  IV U242 ( .A(q[18]), .Z(n228) );
  XOR U243 ( .A(q[17]), .B(n229), .Z(n163) );
  NANDN U244 ( .A(n230), .B(n231), .Z(n229) );
  XNOR U245 ( .A(q[17]), .B(n232), .Z(n231) );
  IV U246 ( .A(n178), .Z(n200) );
  XOR U247 ( .A(n233), .B(n234), .Z(n178) );
  XNOR U248 ( .A(n195), .B(n176), .Z(n234) );
  XOR U249 ( .A(q[0]), .B(n235), .Z(n176) );
  NANDN U250 ( .A(n236), .B(n237), .Z(n235) );
  XNOR U251 ( .A(q[0]), .B(n238), .Z(n237) );
  XOR U252 ( .A(n239), .B(n184), .Z(n195) );
  XOR U253 ( .A(q[13]), .B(n240), .Z(n184) );
  NAND U254 ( .A(n241), .B(n242), .Z(n240) );
  XOR U255 ( .A(q[15]), .B(q[13]), .Z(n241) );
  IV U256 ( .A(n183), .Z(n239) );
  XNOR U257 ( .A(n181), .B(n243), .Z(n183) );
  XOR U258 ( .A(q[10]), .B(n244), .Z(n243) );
  NAND U259 ( .A(n245), .B(n246), .Z(n244) );
  XNOR U260 ( .A(q[12]), .B(n247), .Z(n245) );
  IV U261 ( .A(q[10]), .Z(n247) );
  XOR U262 ( .A(q[9]), .B(n248), .Z(n181) );
  NANDN U263 ( .A(n249), .B(n250), .Z(n248) );
  XNOR U264 ( .A(q[9]), .B(n251), .Z(n250) );
  IV U265 ( .A(n194), .Z(n233) );
  XOR U266 ( .A(n252), .B(n253), .Z(n194) );
  XNOR U267 ( .A(n190), .B(n192), .Z(n253) );
  XOR U268 ( .A(q[1]), .B(n254), .Z(n192) );
  NANDN U269 ( .A(n255), .B(n256), .Z(n254) );
  XNOR U270 ( .A(q[1]), .B(n257), .Z(n256) );
  XOR U271 ( .A(q[6]), .B(n258), .Z(n190) );
  NAND U272 ( .A(n259), .B(n260), .Z(n258) );
  XOR U273 ( .A(q[8]), .B(q[6]), .Z(n259) );
  IV U274 ( .A(n189), .Z(n252) );
  XNOR U275 ( .A(n187), .B(n261), .Z(n189) );
  XOR U276 ( .A(q[3]), .B(n262), .Z(n261) );
  NAND U277 ( .A(n263), .B(n264), .Z(n262) );
  XNOR U278 ( .A(q[5]), .B(n265), .Z(n263) );
  IV U279 ( .A(q[3]), .Z(n265) );
  XOR U280 ( .A(q[2]), .B(n266), .Z(n187) );
  NANDN U281 ( .A(n267), .B(n268), .Z(n266) );
  XNOR U282 ( .A(q[2]), .B(n269), .Z(n268) );
  XNOR U283 ( .A(min_dist_reg[1]), .B(n196), .Z(n198) );
  NOR U284 ( .A(n113), .B(min_dist_reg[0]), .Z(n196) );
  XOR U285 ( .A(n270), .B(n238), .Z(n113) );
  XOR U286 ( .A(n271), .B(n220), .Z(n238) );
  XOR U287 ( .A(n272), .B(n214), .Z(n220) );
  XNOR U288 ( .A(n205), .B(q[30]), .Z(n214) );
  XOR U289 ( .A(q[29]), .B(q[28]), .Z(n205) );
  IV U290 ( .A(n212), .Z(n272) );
  XOR U291 ( .A(n209), .B(n273), .Z(n212) );
  XNOR U292 ( .A(q[27]), .B(q[24]), .Z(n273) );
  XOR U293 ( .A(q[26]), .B(q[25]), .Z(n209) );
  IV U294 ( .A(n218), .Z(n271) );
  XOR U295 ( .A(n274), .B(n275), .Z(n218) );
  XOR U296 ( .A(q[16]), .B(n232), .Z(n275) );
  XNOR U297 ( .A(n223), .B(q[23]), .Z(n232) );
  XOR U298 ( .A(q[22]), .B(q[21]), .Z(n223) );
  IV U299 ( .A(n230), .Z(n274) );
  XOR U300 ( .A(n227), .B(n276), .Z(n230) );
  XNOR U301 ( .A(q[20]), .B(q[17]), .Z(n276) );
  XOR U302 ( .A(q[19]), .B(q[18]), .Z(n227) );
  IV U303 ( .A(n236), .Z(n270) );
  XOR U304 ( .A(n277), .B(n278), .Z(n236) );
  XOR U305 ( .A(q[0]), .B(n257), .Z(n278) );
  XOR U306 ( .A(n279), .B(n251), .Z(n257) );
  XNOR U307 ( .A(n242), .B(q[15]), .Z(n251) );
  XOR U308 ( .A(q[14]), .B(q[13]), .Z(n242) );
  IV U309 ( .A(n249), .Z(n279) );
  XOR U310 ( .A(n246), .B(n280), .Z(n249) );
  XNOR U311 ( .A(q[9]), .B(q[12]), .Z(n280) );
  XOR U312 ( .A(q[11]), .B(q[10]), .Z(n246) );
  IV U313 ( .A(n255), .Z(n277) );
  XOR U314 ( .A(n281), .B(n282), .Z(n255) );
  XOR U315 ( .A(q[1]), .B(n269), .Z(n282) );
  XNOR U316 ( .A(n260), .B(q[8]), .Z(n269) );
  XOR U317 ( .A(q[7]), .B(q[6]), .Z(n260) );
  IV U318 ( .A(n267), .Z(n281) );
  XOR U319 ( .A(n264), .B(n283), .Z(n267) );
  XNOR U320 ( .A(q[5]), .B(q[2]), .Z(n283) );
  XOR U321 ( .A(q[4]), .B(q[3]), .Z(n264) );
endmodule

