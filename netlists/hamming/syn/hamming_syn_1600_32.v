
module hamming_N1600_CC32 ( clk, rst, x, y, o );
  input [49:0] x;
  input [49:0] y;
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
         n229, n230, n231, n232, n233;
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
  XOR U64 ( .A(n224), .B(n223), .Z(n221) );
  XOR U65 ( .A(n180), .B(n179), .Z(n177) );
  XNOR U66 ( .A(oglobal[4]), .B(n34), .Z(n14) );
  XNOR U67 ( .A(n142), .B(n189), .Z(n115) );
  XNOR U68 ( .A(oglobal[3]), .B(n49), .Z(n16) );
  XOR U69 ( .A(n89), .B(n91), .Z(n110) );
  XOR U70 ( .A(n200), .B(n199), .Z(n220) );
  XOR U71 ( .A(n58), .B(n60), .Z(n79) );
  XOR U72 ( .A(n177), .B(n176), .Z(n209) );
  XNOR U73 ( .A(oglobal[2]), .B(n81), .Z(n18) );
  XOR U74 ( .A(n12), .B(n13), .Z(o[5]) );
  XNOR U75 ( .A(n14), .B(n15), .Z(o[4]) );
  XNOR U76 ( .A(n16), .B(n17), .Z(o[3]) );
  XOR U77 ( .A(n18), .B(n19), .Z(o[2]) );
  XOR U78 ( .A(n20), .B(n21), .Z(o[1]) );
  XOR U79 ( .A(n22), .B(n23), .Z(o[10]) );
  XOR U80 ( .A(oglobal[10]), .B(n24), .Z(n23) );
  AND U81 ( .A(n22), .B(o[9]), .Z(n24) );
  XOR U82 ( .A(oglobal[9]), .B(n22), .Z(o[9]) );
  NOR U83 ( .A(o[8]), .B(n25), .Z(n22) );
  XNOR U84 ( .A(oglobal[8]), .B(n25), .Z(o[8]) );
  OR U85 ( .A(o[7]), .B(n26), .Z(n25) );
  XNOR U86 ( .A(oglobal[7]), .B(n26), .Z(o[7]) );
  OR U87 ( .A(o[6]), .B(n27), .Z(n26) );
  XNOR U88 ( .A(oglobal[6]), .B(n27), .Z(o[6]) );
  XNOR U89 ( .A(n28), .B(n29), .Z(n27) );
  ANDN U90 ( .B(n30), .A(n13), .Z(n28) );
  XNOR U91 ( .A(oglobal[5]), .B(n29), .Z(n13) );
  NANDN U92 ( .A(n29), .B(n12), .Z(n30) );
  OR U93 ( .A(n31), .B(n32), .Z(n12) );
  XOR U94 ( .A(n33), .B(n34), .Z(n29) );
  ANDN U95 ( .B(n35), .A(n14), .Z(n33) );
  XOR U96 ( .A(n34), .B(n15), .Z(n35) );
  XOR U97 ( .A(n31), .B(n32), .Z(n15) );
  AND U98 ( .A(n36), .B(n37), .Z(n32) );
  OR U99 ( .A(n38), .B(n39), .Z(n37) );
  XOR U100 ( .A(n40), .B(n41), .Z(n36) );
  ANDN U101 ( .B(n42), .A(n43), .Z(n40) );
  XOR U102 ( .A(n44), .B(n45), .Z(n42) );
  OR U103 ( .A(n46), .B(n47), .Z(n31) );
  XOR U104 ( .A(n48), .B(n49), .Z(n34) );
  ANDN U105 ( .B(n50), .A(n16), .Z(n48) );
  XOR U106 ( .A(n49), .B(n17), .Z(n50) );
  XNOR U107 ( .A(n43), .B(n45), .Z(n17) );
  XOR U108 ( .A(n46), .B(n47), .Z(n45) );
  AND U109 ( .A(n51), .B(n52), .Z(n47) );
  OR U110 ( .A(n53), .B(n54), .Z(n52) );
  XOR U111 ( .A(n55), .B(n56), .Z(n51) );
  AND U112 ( .A(n57), .B(n58), .Z(n55) );
  XOR U113 ( .A(n59), .B(n60), .Z(n57) );
  OR U114 ( .A(n61), .B(n62), .Z(n46) );
  XOR U115 ( .A(n41), .B(n63), .Z(n43) );
  XOR U116 ( .A(n38), .B(n39), .Z(n63) );
  AND U117 ( .A(n64), .B(n65), .Z(n39) );
  OR U118 ( .A(n66), .B(n67), .Z(n65) );
  XOR U119 ( .A(n68), .B(n69), .Z(n64) );
  AND U120 ( .A(n70), .B(n71), .Z(n68) );
  XNOR U121 ( .A(n72), .B(n69), .Z(n71) );
  OR U122 ( .A(n73), .B(n74), .Z(n38) );
  IV U123 ( .A(n44), .Z(n41) );
  XNOR U124 ( .A(n75), .B(n76), .Z(n44) );
  AND U125 ( .A(n77), .B(n78), .Z(n75) );
  XNOR U126 ( .A(n76), .B(n79), .Z(n78) );
  XOR U127 ( .A(n80), .B(n81), .Z(n49) );
  ANDN U128 ( .B(n82), .A(n18), .Z(n80) );
  XNOR U129 ( .A(n81), .B(n19), .Z(n82) );
  XNOR U130 ( .A(n77), .B(n79), .Z(n19) );
  XOR U131 ( .A(n61), .B(n62), .Z(n60) );
  AND U132 ( .A(n83), .B(n84), .Z(n62) );
  OR U133 ( .A(n85), .B(n86), .Z(n84) );
  XOR U134 ( .A(n87), .B(n88), .Z(n83) );
  NAND U135 ( .A(n89), .B(n90), .Z(n88) );
  XOR U136 ( .A(n87), .B(n91), .Z(n90) );
  OR U137 ( .A(n92), .B(n93), .Z(n61) );
  XOR U138 ( .A(n59), .B(n94), .Z(n58) );
  XOR U139 ( .A(n53), .B(n54), .Z(n94) );
  AND U140 ( .A(n95), .B(n96), .Z(n54) );
  OR U141 ( .A(n97), .B(n98), .Z(n96) );
  XOR U142 ( .A(n99), .B(n100), .Z(n95) );
  NAND U143 ( .A(n101), .B(n102), .Z(n100) );
  XNOR U144 ( .A(n99), .B(n103), .Z(n101) );
  OR U145 ( .A(n104), .B(n105), .Z(n53) );
  IV U146 ( .A(n56), .Z(n59) );
  XOR U147 ( .A(n106), .B(n107), .Z(n56) );
  NAND U148 ( .A(n108), .B(n109), .Z(n107) );
  XOR U149 ( .A(n106), .B(n110), .Z(n108) );
  XOR U150 ( .A(n70), .B(n111), .Z(n77) );
  XNOR U151 ( .A(n72), .B(n76), .Z(n111) );
  XNOR U152 ( .A(n112), .B(n113), .Z(n76) );
  NAND U153 ( .A(n114), .B(n115), .Z(n113) );
  XNOR U154 ( .A(n112), .B(n116), .Z(n114) );
  XOR U155 ( .A(n73), .B(n74), .Z(n72) );
  AND U156 ( .A(n117), .B(n118), .Z(n74) );
  OR U157 ( .A(n119), .B(n120), .Z(n118) );
  XOR U158 ( .A(n121), .B(n122), .Z(n117) );
  NAND U159 ( .A(n123), .B(n124), .Z(n122) );
  XNOR U160 ( .A(n121), .B(n125), .Z(n123) );
  OR U161 ( .A(n126), .B(n127), .Z(n73) );
  XNOR U162 ( .A(n69), .B(n128), .Z(n70) );
  XOR U163 ( .A(n66), .B(n67), .Z(n128) );
  AND U164 ( .A(n129), .B(n130), .Z(n67) );
  OR U165 ( .A(n131), .B(n132), .Z(n130) );
  XOR U166 ( .A(n133), .B(n134), .Z(n129) );
  NAND U167 ( .A(n135), .B(n136), .Z(n134) );
  XNOR U168 ( .A(n133), .B(n137), .Z(n135) );
  OR U169 ( .A(n138), .B(n139), .Z(n66) );
  XNOR U170 ( .A(n140), .B(n141), .Z(n69) );
  NAND U171 ( .A(n142), .B(n143), .Z(n141) );
  XOR U172 ( .A(n140), .B(n144), .Z(n143) );
  XNOR U173 ( .A(n145), .B(n146), .Z(n81) );
  NANDN U174 ( .A(n20), .B(n147), .Z(n146) );
  XNOR U175 ( .A(n145), .B(n21), .Z(n147) );
  XNOR U176 ( .A(n115), .B(n116), .Z(n21) );
  XOR U177 ( .A(n109), .B(n110), .Z(n116) );
  XOR U178 ( .A(n92), .B(n93), .Z(n91) );
  AND U179 ( .A(n148), .B(n149), .Z(n93) );
  OR U180 ( .A(n150), .B(n151), .Z(n149) );
  NANDN U181 ( .A(n152), .B(n153), .Z(n148) );
  OR U182 ( .A(n154), .B(n155), .Z(n92) );
  XOR U183 ( .A(n86), .B(n156), .Z(n89) );
  XOR U184 ( .A(n85), .B(n87), .Z(n156) );
  ANDN U185 ( .B(n157), .A(n158), .Z(n87) );
  OR U186 ( .A(n159), .B(n160), .Z(n85) );
  AND U187 ( .A(n161), .B(n162), .Z(n86) );
  OR U188 ( .A(n163), .B(n164), .Z(n162) );
  OR U189 ( .A(n165), .B(n166), .Z(n161) );
  XOR U190 ( .A(n102), .B(n167), .Z(n109) );
  XNOR U191 ( .A(n106), .B(n103), .Z(n167) );
  XNOR U192 ( .A(n104), .B(n105), .Z(n103) );
  AND U193 ( .A(n168), .B(n169), .Z(n105) );
  OR U194 ( .A(n170), .B(n171), .Z(n169) );
  OR U195 ( .A(n172), .B(n173), .Z(n168) );
  OR U196 ( .A(n174), .B(n175), .Z(n104) );
  ANDN U197 ( .B(n176), .A(n177), .Z(n106) );
  XOR U198 ( .A(n98), .B(n178), .Z(n102) );
  XOR U199 ( .A(n97), .B(n99), .Z(n178) );
  ANDN U200 ( .B(n179), .A(n180), .Z(n99) );
  OR U201 ( .A(n181), .B(n182), .Z(n97) );
  AND U202 ( .A(n183), .B(n184), .Z(n98) );
  OR U203 ( .A(n185), .B(n186), .Z(n184) );
  OR U204 ( .A(n187), .B(n188), .Z(n183) );
  XNOR U205 ( .A(n112), .B(n144), .Z(n189) );
  XOR U206 ( .A(n124), .B(n125), .Z(n144) );
  XNOR U207 ( .A(n126), .B(n127), .Z(n125) );
  AND U208 ( .A(n190), .B(n191), .Z(n127) );
  OR U209 ( .A(n192), .B(n193), .Z(n191) );
  OR U210 ( .A(n194), .B(n195), .Z(n190) );
  OR U211 ( .A(n196), .B(n197), .Z(n126) );
  XOR U212 ( .A(n120), .B(n198), .Z(n124) );
  XOR U213 ( .A(n119), .B(n121), .Z(n198) );
  ANDN U214 ( .B(n199), .A(n200), .Z(n121) );
  OR U215 ( .A(n201), .B(n202), .Z(n119) );
  AND U216 ( .A(n203), .B(n204), .Z(n120) );
  OR U217 ( .A(n205), .B(n206), .Z(n204) );
  OR U218 ( .A(n207), .B(n208), .Z(n203) );
  OR U219 ( .A(n209), .B(n210), .Z(n112) );
  XOR U220 ( .A(n136), .B(n211), .Z(n142) );
  XOR U221 ( .A(n140), .B(n137), .Z(n211) );
  XNOR U222 ( .A(n138), .B(n139), .Z(n137) );
  AND U223 ( .A(n212), .B(n213), .Z(n139) );
  OR U224 ( .A(n214), .B(n215), .Z(n213) );
  OR U225 ( .A(n216), .B(n217), .Z(n212) );
  OR U226 ( .A(n218), .B(n219), .Z(n138) );
  OR U227 ( .A(n220), .B(n221), .Z(n140) );
  XOR U228 ( .A(n132), .B(n222), .Z(n136) );
  XOR U229 ( .A(n131), .B(n133), .Z(n222) );
  ANDN U230 ( .B(n223), .A(n224), .Z(n133) );
  OR U231 ( .A(n225), .B(n226), .Z(n131) );
  AND U232 ( .A(n227), .B(n228), .Z(n132) );
  OR U233 ( .A(n229), .B(n230), .Z(n228) );
  OR U234 ( .A(n231), .B(n232), .Z(n227) );
  XNOR U235 ( .A(oglobal[1]), .B(n145), .Z(n20) );
  ANDN U236 ( .B(oglobal[0]), .A(n233), .Z(n145) );
  XNOR U237 ( .A(oglobal[0]), .B(n233), .Z(o[0]) );
  XNOR U238 ( .A(n210), .B(n209), .Z(n233) );
  XNOR U239 ( .A(n157), .B(n158), .Z(n176) );
  XOR U240 ( .A(n152), .B(n153), .Z(n158) );
  XOR U241 ( .A(n154), .B(n155), .Z(n153) );
  XNOR U242 ( .A(y[31]), .B(x[31]), .Z(n155) );
  XNOR U243 ( .A(y[30]), .B(x[30]), .Z(n154) );
  XNOR U244 ( .A(n150), .B(n151), .Z(n152) );
  XNOR U245 ( .A(y[29]), .B(x[29]), .Z(n151) );
  XNOR U246 ( .A(y[28]), .B(x[28]), .Z(n150) );
  XOR U247 ( .A(n165), .B(n166), .Z(n157) );
  XNOR U248 ( .A(n160), .B(n159), .Z(n166) );
  XNOR U249 ( .A(y[27]), .B(x[27]), .Z(n159) );
  XNOR U250 ( .A(y[26]), .B(x[26]), .Z(n160) );
  XNOR U251 ( .A(n163), .B(n164), .Z(n165) );
  XNOR U252 ( .A(y[25]), .B(x[25]), .Z(n164) );
  XNOR U253 ( .A(y[24]), .B(x[24]), .Z(n163) );
  XOR U254 ( .A(n172), .B(n173), .Z(n179) );
  XNOR U255 ( .A(n175), .B(n174), .Z(n173) );
  XNOR U256 ( .A(y[23]), .B(x[23]), .Z(n174) );
  XNOR U257 ( .A(y[22]), .B(x[22]), .Z(n175) );
  XNOR U258 ( .A(n170), .B(n171), .Z(n172) );
  XNOR U259 ( .A(y[21]), .B(x[21]), .Z(n171) );
  XNOR U260 ( .A(y[20]), .B(x[20]), .Z(n170) );
  XNOR U261 ( .A(n187), .B(n188), .Z(n180) );
  XNOR U262 ( .A(n182), .B(n181), .Z(n188) );
  XNOR U263 ( .A(y[19]), .B(x[19]), .Z(n181) );
  XNOR U264 ( .A(y[18]), .B(x[18]), .Z(n182) );
  XNOR U265 ( .A(n185), .B(n186), .Z(n187) );
  XNOR U266 ( .A(y[17]), .B(x[17]), .Z(n186) );
  XNOR U267 ( .A(y[16]), .B(x[16]), .Z(n185) );
  XNOR U268 ( .A(n221), .B(n220), .Z(n210) );
  XOR U269 ( .A(n194), .B(n195), .Z(n199) );
  XNOR U270 ( .A(n197), .B(n196), .Z(n195) );
  XNOR U271 ( .A(y[15]), .B(x[15]), .Z(n196) );
  XNOR U272 ( .A(y[14]), .B(x[14]), .Z(n197) );
  XNOR U273 ( .A(n192), .B(n193), .Z(n194) );
  XNOR U274 ( .A(y[13]), .B(x[13]), .Z(n193) );
  XNOR U275 ( .A(y[12]), .B(x[12]), .Z(n192) );
  XNOR U276 ( .A(n207), .B(n208), .Z(n200) );
  XNOR U277 ( .A(n202), .B(n201), .Z(n208) );
  XNOR U278 ( .A(y[11]), .B(x[11]), .Z(n201) );
  XNOR U279 ( .A(y[10]), .B(x[10]), .Z(n202) );
  XNOR U280 ( .A(n205), .B(n206), .Z(n207) );
  XNOR U281 ( .A(y[9]), .B(x[9]), .Z(n206) );
  XNOR U282 ( .A(y[8]), .B(x[8]), .Z(n205) );
  XOR U283 ( .A(n216), .B(n217), .Z(n223) );
  XNOR U284 ( .A(n219), .B(n218), .Z(n217) );
  XNOR U285 ( .A(y[7]), .B(x[7]), .Z(n218) );
  XNOR U286 ( .A(y[6]), .B(x[6]), .Z(n219) );
  XNOR U287 ( .A(n214), .B(n215), .Z(n216) );
  XNOR U288 ( .A(y[5]), .B(x[5]), .Z(n215) );
  XNOR U289 ( .A(y[4]), .B(x[4]), .Z(n214) );
  XNOR U290 ( .A(n231), .B(n232), .Z(n224) );
  XNOR U291 ( .A(n226), .B(n225), .Z(n232) );
  XNOR U292 ( .A(y[3]), .B(x[3]), .Z(n225) );
  XNOR U293 ( .A(y[2]), .B(x[2]), .Z(n226) );
  XNOR U294 ( .A(n229), .B(n230), .Z(n231) );
  XNOR U295 ( .A(y[1]), .B(x[1]), .Z(n230) );
  XNOR U296 ( .A(y[0]), .B(x[0]), .Z(n229) );
endmodule

