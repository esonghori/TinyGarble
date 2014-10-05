
module sum_N256_CC4 ( clk, rst, a, b, c );
  input [63:0] a;
  input [63:0] b;
  output [63:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR U3 ( .A(a[0]), .B(b[0]), .Z(n1) );
  XOR U4 ( .A(n1), .B(carry_on), .Z(c[0]) );
  XOR U5 ( .A(a[1]), .B(b[1]), .Z(n5) );
  NAND U6 ( .A(a[0]), .B(b[0]), .Z(n3) );
  NAND U7 ( .A(n1), .B(carry_on), .Z(n2) );
  NAND U8 ( .A(n3), .B(n2), .Z(n4) );
  XOR U9 ( .A(n5), .B(n4), .Z(c[1]) );
  XOR U10 ( .A(a[2]), .B(b[2]), .Z(n9) );
  NAND U11 ( .A(a[1]), .B(b[1]), .Z(n7) );
  NAND U12 ( .A(n5), .B(n4), .Z(n6) );
  NAND U13 ( .A(n7), .B(n6), .Z(n8) );
  XOR U14 ( .A(n9), .B(n8), .Z(c[2]) );
  XOR U15 ( .A(a[3]), .B(b[3]), .Z(n13) );
  NAND U16 ( .A(a[2]), .B(b[2]), .Z(n11) );
  NAND U17 ( .A(n9), .B(n8), .Z(n10) );
  NAND U18 ( .A(n11), .B(n10), .Z(n12) );
  XOR U19 ( .A(n13), .B(n12), .Z(c[3]) );
  XOR U20 ( .A(a[4]), .B(b[4]), .Z(n17) );
  NAND U21 ( .A(a[3]), .B(b[3]), .Z(n15) );
  NAND U22 ( .A(n13), .B(n12), .Z(n14) );
  NAND U23 ( .A(n15), .B(n14), .Z(n16) );
  XOR U24 ( .A(n17), .B(n16), .Z(c[4]) );
  XOR U25 ( .A(a[5]), .B(b[5]), .Z(n21) );
  NAND U26 ( .A(a[4]), .B(b[4]), .Z(n19) );
  NAND U27 ( .A(n17), .B(n16), .Z(n18) );
  NAND U28 ( .A(n19), .B(n18), .Z(n20) );
  XOR U29 ( .A(n21), .B(n20), .Z(c[5]) );
  XOR U30 ( .A(a[6]), .B(b[6]), .Z(n25) );
  NAND U31 ( .A(a[5]), .B(b[5]), .Z(n23) );
  NAND U32 ( .A(n21), .B(n20), .Z(n22) );
  NAND U33 ( .A(n23), .B(n22), .Z(n24) );
  XOR U34 ( .A(n25), .B(n24), .Z(c[6]) );
  XOR U35 ( .A(a[7]), .B(b[7]), .Z(n29) );
  NAND U36 ( .A(a[6]), .B(b[6]), .Z(n27) );
  NAND U37 ( .A(n25), .B(n24), .Z(n26) );
  NAND U38 ( .A(n27), .B(n26), .Z(n28) );
  XOR U39 ( .A(n29), .B(n28), .Z(c[7]) );
  XOR U40 ( .A(a[8]), .B(b[8]), .Z(n33) );
  NAND U41 ( .A(a[7]), .B(b[7]), .Z(n31) );
  NAND U42 ( .A(n29), .B(n28), .Z(n30) );
  NAND U43 ( .A(n31), .B(n30), .Z(n32) );
  XOR U44 ( .A(n33), .B(n32), .Z(c[8]) );
  XOR U45 ( .A(a[9]), .B(b[9]), .Z(n37) );
  NAND U46 ( .A(a[8]), .B(b[8]), .Z(n35) );
  NAND U47 ( .A(n33), .B(n32), .Z(n34) );
  NAND U48 ( .A(n35), .B(n34), .Z(n36) );
  XOR U49 ( .A(n37), .B(n36), .Z(c[9]) );
  XOR U50 ( .A(a[10]), .B(b[10]), .Z(n41) );
  NAND U51 ( .A(a[9]), .B(b[9]), .Z(n39) );
  NAND U52 ( .A(n37), .B(n36), .Z(n38) );
  NAND U53 ( .A(n39), .B(n38), .Z(n40) );
  XOR U54 ( .A(n41), .B(n40), .Z(c[10]) );
  XOR U55 ( .A(a[11]), .B(b[11]), .Z(n45) );
  NAND U56 ( .A(a[10]), .B(b[10]), .Z(n43) );
  NAND U57 ( .A(n41), .B(n40), .Z(n42) );
  NAND U58 ( .A(n43), .B(n42), .Z(n44) );
  XOR U59 ( .A(n45), .B(n44), .Z(c[11]) );
  XOR U60 ( .A(a[12]), .B(b[12]), .Z(n49) );
  NAND U61 ( .A(a[11]), .B(b[11]), .Z(n47) );
  NAND U62 ( .A(n45), .B(n44), .Z(n46) );
  NAND U63 ( .A(n47), .B(n46), .Z(n48) );
  XOR U64 ( .A(n49), .B(n48), .Z(c[12]) );
  XOR U65 ( .A(a[13]), .B(b[13]), .Z(n53) );
  NAND U66 ( .A(a[12]), .B(b[12]), .Z(n51) );
  NAND U67 ( .A(n49), .B(n48), .Z(n50) );
  NAND U68 ( .A(n51), .B(n50), .Z(n52) );
  XOR U69 ( .A(n53), .B(n52), .Z(c[13]) );
  XOR U70 ( .A(a[14]), .B(b[14]), .Z(n57) );
  NAND U71 ( .A(a[13]), .B(b[13]), .Z(n55) );
  NAND U72 ( .A(n53), .B(n52), .Z(n54) );
  NAND U73 ( .A(n55), .B(n54), .Z(n56) );
  XOR U74 ( .A(n57), .B(n56), .Z(c[14]) );
  XOR U75 ( .A(a[15]), .B(b[15]), .Z(n61) );
  NAND U76 ( .A(a[14]), .B(b[14]), .Z(n59) );
  NAND U77 ( .A(n57), .B(n56), .Z(n58) );
  NAND U78 ( .A(n59), .B(n58), .Z(n60) );
  XOR U79 ( .A(n61), .B(n60), .Z(c[15]) );
  XOR U80 ( .A(a[16]), .B(b[16]), .Z(n65) );
  NAND U81 ( .A(a[15]), .B(b[15]), .Z(n63) );
  NAND U82 ( .A(n61), .B(n60), .Z(n62) );
  NAND U83 ( .A(n63), .B(n62), .Z(n64) );
  XOR U84 ( .A(n65), .B(n64), .Z(c[16]) );
  XOR U85 ( .A(a[17]), .B(b[17]), .Z(n69) );
  NAND U86 ( .A(a[16]), .B(b[16]), .Z(n67) );
  NAND U87 ( .A(n65), .B(n64), .Z(n66) );
  NAND U88 ( .A(n67), .B(n66), .Z(n68) );
  XOR U89 ( .A(n69), .B(n68), .Z(c[17]) );
  XOR U90 ( .A(a[18]), .B(b[18]), .Z(n73) );
  NAND U91 ( .A(a[17]), .B(b[17]), .Z(n71) );
  NAND U92 ( .A(n69), .B(n68), .Z(n70) );
  NAND U93 ( .A(n71), .B(n70), .Z(n72) );
  XOR U94 ( .A(n73), .B(n72), .Z(c[18]) );
  XOR U95 ( .A(a[19]), .B(b[19]), .Z(n77) );
  NAND U96 ( .A(a[18]), .B(b[18]), .Z(n75) );
  NAND U97 ( .A(n73), .B(n72), .Z(n74) );
  NAND U98 ( .A(n75), .B(n74), .Z(n76) );
  XOR U99 ( .A(n77), .B(n76), .Z(c[19]) );
  XOR U100 ( .A(a[20]), .B(b[20]), .Z(n81) );
  NAND U101 ( .A(a[19]), .B(b[19]), .Z(n79) );
  NAND U102 ( .A(n77), .B(n76), .Z(n78) );
  NAND U103 ( .A(n79), .B(n78), .Z(n80) );
  XOR U104 ( .A(n81), .B(n80), .Z(c[20]) );
  XOR U105 ( .A(a[21]), .B(b[21]), .Z(n85) );
  NAND U106 ( .A(a[20]), .B(b[20]), .Z(n83) );
  NAND U107 ( .A(n81), .B(n80), .Z(n82) );
  NAND U108 ( .A(n83), .B(n82), .Z(n84) );
  XOR U109 ( .A(n85), .B(n84), .Z(c[21]) );
  XOR U110 ( .A(a[22]), .B(b[22]), .Z(n89) );
  NAND U111 ( .A(a[21]), .B(b[21]), .Z(n87) );
  NAND U112 ( .A(n85), .B(n84), .Z(n86) );
  NAND U113 ( .A(n87), .B(n86), .Z(n88) );
  XOR U114 ( .A(n89), .B(n88), .Z(c[22]) );
  XOR U115 ( .A(a[23]), .B(b[23]), .Z(n93) );
  NAND U116 ( .A(a[22]), .B(b[22]), .Z(n91) );
  NAND U117 ( .A(n89), .B(n88), .Z(n90) );
  NAND U118 ( .A(n91), .B(n90), .Z(n92) );
  XOR U119 ( .A(n93), .B(n92), .Z(c[23]) );
  XOR U120 ( .A(a[24]), .B(b[24]), .Z(n97) );
  NAND U121 ( .A(a[23]), .B(b[23]), .Z(n95) );
  NAND U122 ( .A(n93), .B(n92), .Z(n94) );
  NAND U123 ( .A(n95), .B(n94), .Z(n96) );
  XOR U124 ( .A(n97), .B(n96), .Z(c[24]) );
  XOR U125 ( .A(a[25]), .B(b[25]), .Z(n101) );
  NAND U126 ( .A(a[24]), .B(b[24]), .Z(n99) );
  NAND U127 ( .A(n97), .B(n96), .Z(n98) );
  NAND U128 ( .A(n99), .B(n98), .Z(n100) );
  XOR U129 ( .A(n101), .B(n100), .Z(c[25]) );
  XOR U130 ( .A(a[26]), .B(b[26]), .Z(n105) );
  NAND U131 ( .A(a[25]), .B(b[25]), .Z(n103) );
  NAND U132 ( .A(n101), .B(n100), .Z(n102) );
  NAND U133 ( .A(n103), .B(n102), .Z(n104) );
  XOR U134 ( .A(n105), .B(n104), .Z(c[26]) );
  XOR U135 ( .A(a[27]), .B(b[27]), .Z(n109) );
  NAND U136 ( .A(a[26]), .B(b[26]), .Z(n107) );
  NAND U137 ( .A(n105), .B(n104), .Z(n106) );
  NAND U138 ( .A(n107), .B(n106), .Z(n108) );
  XOR U139 ( .A(n109), .B(n108), .Z(c[27]) );
  XOR U140 ( .A(a[28]), .B(b[28]), .Z(n113) );
  NAND U141 ( .A(a[27]), .B(b[27]), .Z(n111) );
  NAND U142 ( .A(n109), .B(n108), .Z(n110) );
  NAND U143 ( .A(n111), .B(n110), .Z(n112) );
  XOR U144 ( .A(n113), .B(n112), .Z(c[28]) );
  XOR U145 ( .A(a[29]), .B(b[29]), .Z(n117) );
  NAND U146 ( .A(a[28]), .B(b[28]), .Z(n115) );
  NAND U147 ( .A(n113), .B(n112), .Z(n114) );
  NAND U148 ( .A(n115), .B(n114), .Z(n116) );
  XOR U149 ( .A(n117), .B(n116), .Z(c[29]) );
  XOR U150 ( .A(a[30]), .B(b[30]), .Z(n121) );
  NAND U151 ( .A(a[29]), .B(b[29]), .Z(n119) );
  NAND U152 ( .A(n117), .B(n116), .Z(n118) );
  NAND U153 ( .A(n119), .B(n118), .Z(n120) );
  XOR U154 ( .A(n121), .B(n120), .Z(c[30]) );
  XOR U155 ( .A(a[31]), .B(b[31]), .Z(n125) );
  NAND U156 ( .A(a[30]), .B(b[30]), .Z(n123) );
  NAND U157 ( .A(n121), .B(n120), .Z(n122) );
  NAND U158 ( .A(n123), .B(n122), .Z(n124) );
  XOR U159 ( .A(n125), .B(n124), .Z(c[31]) );
  XOR U160 ( .A(a[32]), .B(b[32]), .Z(n129) );
  NAND U161 ( .A(a[31]), .B(b[31]), .Z(n127) );
  NAND U162 ( .A(n125), .B(n124), .Z(n126) );
  NAND U163 ( .A(n127), .B(n126), .Z(n128) );
  XOR U164 ( .A(n129), .B(n128), .Z(c[32]) );
  XOR U165 ( .A(a[33]), .B(b[33]), .Z(n133) );
  NAND U166 ( .A(a[32]), .B(b[32]), .Z(n131) );
  NAND U167 ( .A(n129), .B(n128), .Z(n130) );
  NAND U168 ( .A(n131), .B(n130), .Z(n132) );
  XOR U169 ( .A(n133), .B(n132), .Z(c[33]) );
  XOR U170 ( .A(a[34]), .B(b[34]), .Z(n137) );
  NAND U171 ( .A(a[33]), .B(b[33]), .Z(n135) );
  NAND U172 ( .A(n133), .B(n132), .Z(n134) );
  NAND U173 ( .A(n135), .B(n134), .Z(n136) );
  XOR U174 ( .A(n137), .B(n136), .Z(c[34]) );
  XOR U175 ( .A(a[35]), .B(b[35]), .Z(n141) );
  NAND U176 ( .A(a[34]), .B(b[34]), .Z(n139) );
  NAND U177 ( .A(n137), .B(n136), .Z(n138) );
  NAND U178 ( .A(n139), .B(n138), .Z(n140) );
  XOR U179 ( .A(n141), .B(n140), .Z(c[35]) );
  XOR U180 ( .A(a[36]), .B(b[36]), .Z(n145) );
  NAND U181 ( .A(a[35]), .B(b[35]), .Z(n143) );
  NAND U182 ( .A(n141), .B(n140), .Z(n142) );
  NAND U183 ( .A(n143), .B(n142), .Z(n144) );
  XOR U184 ( .A(n145), .B(n144), .Z(c[36]) );
  XOR U185 ( .A(a[37]), .B(b[37]), .Z(n149) );
  NAND U186 ( .A(a[36]), .B(b[36]), .Z(n147) );
  NAND U187 ( .A(n145), .B(n144), .Z(n146) );
  NAND U188 ( .A(n147), .B(n146), .Z(n148) );
  XOR U189 ( .A(n149), .B(n148), .Z(c[37]) );
  XOR U190 ( .A(a[38]), .B(b[38]), .Z(n153) );
  NAND U191 ( .A(a[37]), .B(b[37]), .Z(n151) );
  NAND U192 ( .A(n149), .B(n148), .Z(n150) );
  NAND U193 ( .A(n151), .B(n150), .Z(n152) );
  XOR U194 ( .A(n153), .B(n152), .Z(c[38]) );
  XOR U195 ( .A(a[39]), .B(b[39]), .Z(n157) );
  NAND U196 ( .A(a[38]), .B(b[38]), .Z(n155) );
  NAND U197 ( .A(n153), .B(n152), .Z(n154) );
  NAND U198 ( .A(n155), .B(n154), .Z(n156) );
  XOR U199 ( .A(n157), .B(n156), .Z(c[39]) );
  XOR U200 ( .A(a[40]), .B(b[40]), .Z(n161) );
  NAND U201 ( .A(a[39]), .B(b[39]), .Z(n159) );
  NAND U202 ( .A(n157), .B(n156), .Z(n158) );
  NAND U203 ( .A(n159), .B(n158), .Z(n160) );
  XOR U204 ( .A(n161), .B(n160), .Z(c[40]) );
  XOR U205 ( .A(a[41]), .B(b[41]), .Z(n165) );
  NAND U206 ( .A(a[40]), .B(b[40]), .Z(n163) );
  NAND U207 ( .A(n161), .B(n160), .Z(n162) );
  NAND U208 ( .A(n163), .B(n162), .Z(n164) );
  XOR U209 ( .A(n165), .B(n164), .Z(c[41]) );
  XOR U210 ( .A(a[42]), .B(b[42]), .Z(n169) );
  NAND U211 ( .A(a[41]), .B(b[41]), .Z(n167) );
  NAND U212 ( .A(n165), .B(n164), .Z(n166) );
  NAND U213 ( .A(n167), .B(n166), .Z(n168) );
  XOR U214 ( .A(n169), .B(n168), .Z(c[42]) );
  XOR U215 ( .A(a[43]), .B(b[43]), .Z(n173) );
  NAND U216 ( .A(a[42]), .B(b[42]), .Z(n171) );
  NAND U217 ( .A(n169), .B(n168), .Z(n170) );
  NAND U218 ( .A(n171), .B(n170), .Z(n172) );
  XOR U219 ( .A(n173), .B(n172), .Z(c[43]) );
  XOR U220 ( .A(a[44]), .B(b[44]), .Z(n177) );
  NAND U221 ( .A(a[43]), .B(b[43]), .Z(n175) );
  NAND U222 ( .A(n173), .B(n172), .Z(n174) );
  NAND U223 ( .A(n175), .B(n174), .Z(n176) );
  XOR U224 ( .A(n177), .B(n176), .Z(c[44]) );
  XOR U225 ( .A(a[45]), .B(b[45]), .Z(n181) );
  NAND U226 ( .A(a[44]), .B(b[44]), .Z(n179) );
  NAND U227 ( .A(n177), .B(n176), .Z(n178) );
  NAND U228 ( .A(n179), .B(n178), .Z(n180) );
  XOR U229 ( .A(n181), .B(n180), .Z(c[45]) );
  XOR U230 ( .A(a[46]), .B(b[46]), .Z(n185) );
  NAND U231 ( .A(a[45]), .B(b[45]), .Z(n183) );
  NAND U232 ( .A(n181), .B(n180), .Z(n182) );
  NAND U233 ( .A(n183), .B(n182), .Z(n184) );
  XOR U234 ( .A(n185), .B(n184), .Z(c[46]) );
  XOR U235 ( .A(a[47]), .B(b[47]), .Z(n189) );
  NAND U236 ( .A(a[46]), .B(b[46]), .Z(n187) );
  NAND U237 ( .A(n185), .B(n184), .Z(n186) );
  NAND U238 ( .A(n187), .B(n186), .Z(n188) );
  XOR U239 ( .A(n189), .B(n188), .Z(c[47]) );
  XOR U240 ( .A(a[48]), .B(b[48]), .Z(n193) );
  NAND U241 ( .A(a[47]), .B(b[47]), .Z(n191) );
  NAND U242 ( .A(n189), .B(n188), .Z(n190) );
  NAND U243 ( .A(n191), .B(n190), .Z(n192) );
  XOR U244 ( .A(n193), .B(n192), .Z(c[48]) );
  XOR U245 ( .A(a[49]), .B(b[49]), .Z(n197) );
  NAND U246 ( .A(a[48]), .B(b[48]), .Z(n195) );
  NAND U247 ( .A(n193), .B(n192), .Z(n194) );
  NAND U248 ( .A(n195), .B(n194), .Z(n196) );
  XOR U249 ( .A(n197), .B(n196), .Z(c[49]) );
  XOR U250 ( .A(a[50]), .B(b[50]), .Z(n201) );
  NAND U251 ( .A(a[49]), .B(b[49]), .Z(n199) );
  NAND U252 ( .A(n197), .B(n196), .Z(n198) );
  NAND U253 ( .A(n199), .B(n198), .Z(n200) );
  XOR U254 ( .A(n201), .B(n200), .Z(c[50]) );
  XOR U255 ( .A(a[51]), .B(b[51]), .Z(n205) );
  NAND U256 ( .A(a[50]), .B(b[50]), .Z(n203) );
  NAND U257 ( .A(n201), .B(n200), .Z(n202) );
  NAND U258 ( .A(n203), .B(n202), .Z(n204) );
  XOR U259 ( .A(n205), .B(n204), .Z(c[51]) );
  XOR U260 ( .A(a[52]), .B(b[52]), .Z(n209) );
  NAND U261 ( .A(a[51]), .B(b[51]), .Z(n207) );
  NAND U262 ( .A(n205), .B(n204), .Z(n206) );
  NAND U263 ( .A(n207), .B(n206), .Z(n208) );
  XOR U264 ( .A(n209), .B(n208), .Z(c[52]) );
  XOR U265 ( .A(a[53]), .B(b[53]), .Z(n213) );
  NAND U266 ( .A(a[52]), .B(b[52]), .Z(n211) );
  NAND U267 ( .A(n209), .B(n208), .Z(n210) );
  NAND U268 ( .A(n211), .B(n210), .Z(n212) );
  XOR U269 ( .A(n213), .B(n212), .Z(c[53]) );
  XOR U270 ( .A(a[54]), .B(b[54]), .Z(n217) );
  NAND U271 ( .A(a[53]), .B(b[53]), .Z(n215) );
  NAND U272 ( .A(n213), .B(n212), .Z(n214) );
  NAND U273 ( .A(n215), .B(n214), .Z(n216) );
  XOR U274 ( .A(n217), .B(n216), .Z(c[54]) );
  XOR U275 ( .A(a[55]), .B(b[55]), .Z(n221) );
  NAND U276 ( .A(a[54]), .B(b[54]), .Z(n219) );
  NAND U277 ( .A(n217), .B(n216), .Z(n218) );
  NAND U278 ( .A(n219), .B(n218), .Z(n220) );
  XOR U279 ( .A(n221), .B(n220), .Z(c[55]) );
  XOR U280 ( .A(a[56]), .B(b[56]), .Z(n225) );
  NAND U281 ( .A(a[55]), .B(b[55]), .Z(n223) );
  NAND U282 ( .A(n221), .B(n220), .Z(n222) );
  NAND U283 ( .A(n223), .B(n222), .Z(n224) );
  XOR U284 ( .A(n225), .B(n224), .Z(c[56]) );
  XOR U285 ( .A(a[57]), .B(b[57]), .Z(n229) );
  NAND U286 ( .A(a[56]), .B(b[56]), .Z(n227) );
  NAND U287 ( .A(n225), .B(n224), .Z(n226) );
  NAND U288 ( .A(n227), .B(n226), .Z(n228) );
  XOR U289 ( .A(n229), .B(n228), .Z(c[57]) );
  XOR U290 ( .A(a[58]), .B(b[58]), .Z(n233) );
  NAND U291 ( .A(a[57]), .B(b[57]), .Z(n231) );
  NAND U292 ( .A(n229), .B(n228), .Z(n230) );
  NAND U293 ( .A(n231), .B(n230), .Z(n232) );
  XOR U294 ( .A(n233), .B(n232), .Z(c[58]) );
  XOR U295 ( .A(a[59]), .B(b[59]), .Z(n237) );
  NAND U296 ( .A(a[58]), .B(b[58]), .Z(n235) );
  NAND U297 ( .A(n233), .B(n232), .Z(n234) );
  NAND U298 ( .A(n235), .B(n234), .Z(n236) );
  XOR U299 ( .A(n237), .B(n236), .Z(c[59]) );
  XOR U300 ( .A(a[60]), .B(b[60]), .Z(n241) );
  NAND U301 ( .A(a[59]), .B(b[59]), .Z(n239) );
  NAND U302 ( .A(n237), .B(n236), .Z(n238) );
  NAND U303 ( .A(n239), .B(n238), .Z(n240) );
  XOR U304 ( .A(n241), .B(n240), .Z(c[60]) );
  XOR U305 ( .A(a[61]), .B(b[61]), .Z(n245) );
  NAND U306 ( .A(a[60]), .B(b[60]), .Z(n243) );
  NAND U307 ( .A(n241), .B(n240), .Z(n242) );
  NAND U308 ( .A(n243), .B(n242), .Z(n244) );
  XOR U309 ( .A(n245), .B(n244), .Z(c[61]) );
  XOR U310 ( .A(a[62]), .B(b[62]), .Z(n249) );
  NAND U311 ( .A(a[61]), .B(b[61]), .Z(n247) );
  NAND U312 ( .A(n245), .B(n244), .Z(n246) );
  NAND U313 ( .A(n247), .B(n246), .Z(n248) );
  XOR U314 ( .A(n249), .B(n248), .Z(c[62]) );
  NAND U315 ( .A(a[62]), .B(b[62]), .Z(n251) );
  NAND U316 ( .A(n249), .B(n248), .Z(n250) );
  AND U317 ( .A(n251), .B(n250), .Z(n253) );
  XOR U318 ( .A(a[63]), .B(b[63]), .Z(n252) );
  XNOR U319 ( .A(n253), .B(n252), .Z(c[63]) );
  NAND U320 ( .A(a[63]), .B(b[63]), .Z(n255) );
  NANDN U321 ( .A(n253), .B(n252), .Z(n254) );
  NAND U322 ( .A(n255), .B(n254), .Z(carry_on_d) );
endmodule
