
module hamming_N160_CC4 ( clk, rst, x, y, o );
  input [39:0] x;
  input [39:0] y;
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
         n227, n228, n229, n230, n231, n232, n233;
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
  XOR U52 ( .A(n142), .B(n139), .Z(n212) );
  XNOR U53 ( .A(n108), .B(n105), .Z(n168) );
  XOR U54 ( .A(n201), .B(n200), .Z(n222) );
  OR U55 ( .A(n155), .B(n156), .Z(n94) );
  ANDN U56 ( .B(n159), .A(n158), .Z(n89) );
  XOR U57 ( .A(n225), .B(n224), .Z(n221) );
  XOR U58 ( .A(n181), .B(n180), .Z(n178) );
  ANDN U59 ( .B(n37), .A(n38), .Z(n35) );
  XOR U60 ( .A(oglobal[7]), .B(n10), .Z(o[7]) );
  ANDN U61 ( .B(oglobal[6]), .A(n11), .Z(n10) );
  XNOR U62 ( .A(oglobal[6]), .B(n11), .Z(o[6]) );
  AND U63 ( .A(n12), .B(n13), .Z(n11) );
  NANDN U64 ( .A(n14), .B(oglobal[5]), .Z(n13) );
  NANDN U65 ( .A(n15), .B(oglobal[5]), .Z(n12) );
  XNOR U66 ( .A(n15), .B(n16), .Z(o[5]) );
  XNOR U67 ( .A(oglobal[5]), .B(n14), .Z(n16) );
  AND U68 ( .A(n17), .B(n18), .Z(n14) );
  NANDN U69 ( .A(n19), .B(oglobal[4]), .Z(n18) );
  NAND U70 ( .A(n20), .B(n21), .Z(n17) );
  NAND U71 ( .A(n22), .B(n19), .Z(n20) );
  OR U72 ( .A(n23), .B(n24), .Z(n15) );
  XNOR U73 ( .A(n21), .B(n25), .Z(o[4]) );
  XNOR U74 ( .A(n22), .B(n19), .Z(n25) );
  AND U75 ( .A(n26), .B(n27), .Z(n19) );
  NANDN U76 ( .A(n28), .B(oglobal[3]), .Z(n27) );
  NAND U77 ( .A(n29), .B(n30), .Z(n26) );
  NANDN U78 ( .A(oglobal[3]), .B(n28), .Z(n29) );
  IV U79 ( .A(oglobal[4]), .Z(n22) );
  XOR U80 ( .A(n23), .B(n24), .Z(n21) );
  AND U81 ( .A(n31), .B(n32), .Z(n24) );
  OR U82 ( .A(n33), .B(n34), .Z(n32) );
  XOR U83 ( .A(n35), .B(n36), .Z(n31) );
  XOR U84 ( .A(n39), .B(n40), .Z(n37) );
  OR U85 ( .A(n41), .B(n42), .Z(n23) );
  XOR U86 ( .A(n30), .B(n43), .Z(o[3]) );
  XNOR U87 ( .A(oglobal[3]), .B(n28), .Z(n43) );
  AND U88 ( .A(n44), .B(n45), .Z(n28) );
  NANDN U89 ( .A(n46), .B(oglobal[2]), .Z(n45) );
  NANDN U90 ( .A(n47), .B(n48), .Z(n44) );
  NANDN U91 ( .A(oglobal[2]), .B(n46), .Z(n48) );
  XNOR U92 ( .A(n38), .B(n40), .Z(n30) );
  XOR U93 ( .A(n41), .B(n42), .Z(n40) );
  AND U94 ( .A(n49), .B(n50), .Z(n42) );
  OR U95 ( .A(n51), .B(n52), .Z(n50) );
  XOR U96 ( .A(n53), .B(n54), .Z(n49) );
  AND U97 ( .A(n55), .B(n56), .Z(n53) );
  XOR U98 ( .A(n57), .B(n58), .Z(n56) );
  OR U99 ( .A(n59), .B(n60), .Z(n41) );
  XOR U100 ( .A(n36), .B(n61), .Z(n38) );
  XOR U101 ( .A(n33), .B(n34), .Z(n61) );
  AND U102 ( .A(n62), .B(n63), .Z(n34) );
  OR U103 ( .A(n64), .B(n65), .Z(n63) );
  XOR U104 ( .A(n66), .B(n67), .Z(n62) );
  AND U105 ( .A(n68), .B(n69), .Z(n66) );
  XNOR U106 ( .A(n70), .B(n67), .Z(n69) );
  OR U107 ( .A(n71), .B(n72), .Z(n33) );
  IV U108 ( .A(n39), .Z(n36) );
  XNOR U109 ( .A(n73), .B(n74), .Z(n39) );
  AND U110 ( .A(n75), .B(n76), .Z(n73) );
  XNOR U111 ( .A(n74), .B(n77), .Z(n76) );
  XNOR U112 ( .A(n47), .B(n78), .Z(o[2]) );
  XNOR U113 ( .A(oglobal[2]), .B(n46), .Z(n78) );
  AND U114 ( .A(n79), .B(n80), .Z(n46) );
  NAND U115 ( .A(n81), .B(oglobal[1]), .Z(n80) );
  NANDN U116 ( .A(n82), .B(n83), .Z(n79) );
  OR U117 ( .A(oglobal[1]), .B(n81), .Z(n83) );
  IV U118 ( .A(n84), .Z(n81) );
  XNOR U119 ( .A(n75), .B(n77), .Z(n47) );
  XOR U120 ( .A(n55), .B(n58), .Z(n77) );
  XOR U121 ( .A(n59), .B(n60), .Z(n58) );
  AND U122 ( .A(n85), .B(n86), .Z(n60) );
  OR U123 ( .A(n87), .B(n88), .Z(n86) );
  XOR U124 ( .A(n89), .B(n90), .Z(n85) );
  NAND U125 ( .A(n91), .B(n92), .Z(n90) );
  XOR U126 ( .A(n89), .B(n93), .Z(n91) );
  OR U127 ( .A(n94), .B(n95), .Z(n59) );
  XOR U128 ( .A(n57), .B(n96), .Z(n55) );
  XOR U129 ( .A(n51), .B(n52), .Z(n96) );
  AND U130 ( .A(n97), .B(n98), .Z(n52) );
  OR U131 ( .A(n99), .B(n100), .Z(n98) );
  XOR U132 ( .A(n101), .B(n102), .Z(n97) );
  NAND U133 ( .A(n103), .B(n104), .Z(n102) );
  XNOR U134 ( .A(n101), .B(n105), .Z(n103) );
  OR U135 ( .A(n106), .B(n107), .Z(n51) );
  IV U136 ( .A(n54), .Z(n57) );
  XOR U137 ( .A(n108), .B(n109), .Z(n54) );
  NAND U138 ( .A(n110), .B(n111), .Z(n109) );
  XOR U139 ( .A(n108), .B(n112), .Z(n110) );
  XOR U140 ( .A(n68), .B(n113), .Z(n75) );
  XNOR U141 ( .A(n70), .B(n74), .Z(n113) );
  XNOR U142 ( .A(n114), .B(n115), .Z(n74) );
  NAND U143 ( .A(n116), .B(n117), .Z(n115) );
  XOR U144 ( .A(n114), .B(n118), .Z(n116) );
  XOR U145 ( .A(n71), .B(n72), .Z(n70) );
  AND U146 ( .A(n119), .B(n120), .Z(n72) );
  OR U147 ( .A(n121), .B(n122), .Z(n120) );
  XOR U148 ( .A(n123), .B(n124), .Z(n119) );
  NAND U149 ( .A(n125), .B(n126), .Z(n124) );
  XNOR U150 ( .A(n123), .B(n127), .Z(n125) );
  OR U151 ( .A(n128), .B(n129), .Z(n71) );
  XNOR U152 ( .A(n67), .B(n130), .Z(n68) );
  XOR U153 ( .A(n64), .B(n65), .Z(n130) );
  AND U154 ( .A(n131), .B(n132), .Z(n65) );
  OR U155 ( .A(n133), .B(n134), .Z(n132) );
  XOR U156 ( .A(n135), .B(n136), .Z(n131) );
  NAND U157 ( .A(n137), .B(n138), .Z(n136) );
  XNOR U158 ( .A(n135), .B(n139), .Z(n137) );
  OR U159 ( .A(n140), .B(n141), .Z(n64) );
  XNOR U160 ( .A(n142), .B(n143), .Z(n67) );
  NAND U161 ( .A(n144), .B(n145), .Z(n143) );
  XOR U162 ( .A(n142), .B(n146), .Z(n144) );
  XNOR U163 ( .A(n82), .B(n147), .Z(o[1]) );
  XNOR U164 ( .A(oglobal[1]), .B(n84), .Z(n147) );
  NANDN U165 ( .A(n148), .B(oglobal[0]), .Z(n84) );
  XOR U166 ( .A(n117), .B(n118), .Z(n82) );
  XNOR U167 ( .A(n111), .B(n112), .Z(n118) );
  XOR U168 ( .A(n92), .B(n93), .Z(n112) );
  XOR U169 ( .A(n94), .B(n95), .Z(n93) );
  AND U170 ( .A(n149), .B(n150), .Z(n95) );
  OR U171 ( .A(n151), .B(n152), .Z(n150) );
  NANDN U172 ( .A(n153), .B(n154), .Z(n149) );
  XOR U173 ( .A(n88), .B(n157), .Z(n92) );
  XOR U174 ( .A(n87), .B(n89), .Z(n157) );
  OR U175 ( .A(n160), .B(n161), .Z(n87) );
  AND U176 ( .A(n162), .B(n163), .Z(n88) );
  OR U177 ( .A(n164), .B(n165), .Z(n163) );
  OR U178 ( .A(n166), .B(n167), .Z(n162) );
  XOR U179 ( .A(n104), .B(n168), .Z(n111) );
  XNOR U180 ( .A(n106), .B(n107), .Z(n105) );
  AND U181 ( .A(n169), .B(n170), .Z(n107) );
  OR U182 ( .A(n171), .B(n172), .Z(n170) );
  OR U183 ( .A(n173), .B(n174), .Z(n169) );
  OR U184 ( .A(n175), .B(n176), .Z(n106) );
  ANDN U185 ( .B(n177), .A(n178), .Z(n108) );
  XOR U186 ( .A(n100), .B(n179), .Z(n104) );
  XOR U187 ( .A(n99), .B(n101), .Z(n179) );
  ANDN U188 ( .B(n180), .A(n181), .Z(n101) );
  OR U189 ( .A(n182), .B(n183), .Z(n99) );
  AND U190 ( .A(n184), .B(n185), .Z(n100) );
  OR U191 ( .A(n186), .B(n187), .Z(n185) );
  OR U192 ( .A(n188), .B(n189), .Z(n184) );
  XNOR U193 ( .A(n145), .B(n190), .Z(n117) );
  XNOR U194 ( .A(n114), .B(n146), .Z(n190) );
  XOR U195 ( .A(n126), .B(n127), .Z(n146) );
  XNOR U196 ( .A(n128), .B(n129), .Z(n127) );
  AND U197 ( .A(n191), .B(n192), .Z(n129) );
  OR U198 ( .A(n193), .B(n194), .Z(n192) );
  OR U199 ( .A(n195), .B(n196), .Z(n191) );
  OR U200 ( .A(n197), .B(n198), .Z(n128) );
  XOR U201 ( .A(n122), .B(n199), .Z(n126) );
  XOR U202 ( .A(n121), .B(n123), .Z(n199) );
  ANDN U203 ( .B(n200), .A(n201), .Z(n123) );
  OR U204 ( .A(n202), .B(n203), .Z(n121) );
  AND U205 ( .A(n204), .B(n205), .Z(n122) );
  OR U206 ( .A(n206), .B(n207), .Z(n205) );
  OR U207 ( .A(n208), .B(n209), .Z(n204) );
  NANDN U208 ( .A(n210), .B(n211), .Z(n114) );
  XOR U209 ( .A(n138), .B(n212), .Z(n145) );
  XNOR U210 ( .A(n140), .B(n141), .Z(n139) );
  AND U211 ( .A(n213), .B(n214), .Z(n141) );
  OR U212 ( .A(n215), .B(n216), .Z(n214) );
  OR U213 ( .A(n217), .B(n218), .Z(n213) );
  OR U214 ( .A(n219), .B(n220), .Z(n140) );
  OR U215 ( .A(n221), .B(n222), .Z(n142) );
  XOR U216 ( .A(n134), .B(n223), .Z(n138) );
  XOR U217 ( .A(n133), .B(n135), .Z(n223) );
  ANDN U218 ( .B(n224), .A(n225), .Z(n135) );
  OR U219 ( .A(n226), .B(n227), .Z(n133) );
  AND U220 ( .A(n228), .B(n229), .Z(n134) );
  OR U221 ( .A(n230), .B(n231), .Z(n229) );
  OR U222 ( .A(n232), .B(n233), .Z(n228) );
  XNOR U223 ( .A(oglobal[0]), .B(n148), .Z(o[0]) );
  XOR U224 ( .A(n211), .B(n210), .Z(n148) );
  XOR U225 ( .A(n178), .B(n177), .Z(n210) );
  XNOR U226 ( .A(n159), .B(n158), .Z(n177) );
  XOR U227 ( .A(n153), .B(n154), .Z(n158) );
  XOR U228 ( .A(n155), .B(n156), .Z(n154) );
  XNOR U229 ( .A(y[31]), .B(x[31]), .Z(n156) );
  XNOR U230 ( .A(y[30]), .B(x[30]), .Z(n155) );
  XNOR U231 ( .A(n151), .B(n152), .Z(n153) );
  XNOR U232 ( .A(y[29]), .B(x[29]), .Z(n152) );
  XNOR U233 ( .A(y[28]), .B(x[28]), .Z(n151) );
  XOR U234 ( .A(n166), .B(n167), .Z(n159) );
  XNOR U235 ( .A(n161), .B(n160), .Z(n167) );
  XNOR U236 ( .A(y[27]), .B(x[27]), .Z(n160) );
  XNOR U237 ( .A(y[26]), .B(x[26]), .Z(n161) );
  XNOR U238 ( .A(n164), .B(n165), .Z(n166) );
  XNOR U239 ( .A(y[25]), .B(x[25]), .Z(n165) );
  XNOR U240 ( .A(y[24]), .B(x[24]), .Z(n164) );
  XOR U241 ( .A(n173), .B(n174), .Z(n180) );
  XNOR U242 ( .A(n176), .B(n175), .Z(n174) );
  XNOR U243 ( .A(y[23]), .B(x[23]), .Z(n175) );
  XNOR U244 ( .A(y[22]), .B(x[22]), .Z(n176) );
  XNOR U245 ( .A(n171), .B(n172), .Z(n173) );
  XNOR U246 ( .A(y[21]), .B(x[21]), .Z(n172) );
  XNOR U247 ( .A(y[20]), .B(x[20]), .Z(n171) );
  XNOR U248 ( .A(n188), .B(n189), .Z(n181) );
  XNOR U249 ( .A(n183), .B(n182), .Z(n189) );
  XNOR U250 ( .A(y[19]), .B(x[19]), .Z(n182) );
  XNOR U251 ( .A(y[18]), .B(x[18]), .Z(n183) );
  XNOR U252 ( .A(n186), .B(n187), .Z(n188) );
  XNOR U253 ( .A(y[17]), .B(x[17]), .Z(n187) );
  XNOR U254 ( .A(y[16]), .B(x[16]), .Z(n186) );
  XOR U255 ( .A(n221), .B(n222), .Z(n211) );
  XOR U256 ( .A(n195), .B(n196), .Z(n200) );
  XNOR U257 ( .A(n198), .B(n197), .Z(n196) );
  XNOR U258 ( .A(y[15]), .B(x[15]), .Z(n197) );
  XNOR U259 ( .A(y[14]), .B(x[14]), .Z(n198) );
  XNOR U260 ( .A(n193), .B(n194), .Z(n195) );
  XNOR U261 ( .A(y[13]), .B(x[13]), .Z(n194) );
  XNOR U262 ( .A(y[12]), .B(x[12]), .Z(n193) );
  XNOR U263 ( .A(n208), .B(n209), .Z(n201) );
  XNOR U264 ( .A(n203), .B(n202), .Z(n209) );
  XNOR U265 ( .A(y[11]), .B(x[11]), .Z(n202) );
  XNOR U266 ( .A(y[10]), .B(x[10]), .Z(n203) );
  XNOR U267 ( .A(n206), .B(n207), .Z(n208) );
  XNOR U268 ( .A(y[9]), .B(x[9]), .Z(n207) );
  XNOR U269 ( .A(y[8]), .B(x[8]), .Z(n206) );
  XOR U270 ( .A(n217), .B(n218), .Z(n224) );
  XNOR U271 ( .A(n220), .B(n219), .Z(n218) );
  XNOR U272 ( .A(y[7]), .B(x[7]), .Z(n219) );
  XNOR U273 ( .A(y[6]), .B(x[6]), .Z(n220) );
  XNOR U274 ( .A(n215), .B(n216), .Z(n217) );
  XNOR U275 ( .A(y[5]), .B(x[5]), .Z(n216) );
  XNOR U276 ( .A(y[4]), .B(x[4]), .Z(n215) );
  XNOR U277 ( .A(n232), .B(n233), .Z(n225) );
  XNOR U278 ( .A(n227), .B(n226), .Z(n233) );
  XNOR U279 ( .A(y[3]), .B(x[3]), .Z(n226) );
  XNOR U280 ( .A(y[2]), .B(x[2]), .Z(n227) );
  XNOR U281 ( .A(n230), .B(n231), .Z(n232) );
  XNOR U282 ( .A(y[1]), .B(x[1]), .Z(n231) );
  XNOR U283 ( .A(y[0]), .B(x[0]), .Z(n230) );
endmodule

