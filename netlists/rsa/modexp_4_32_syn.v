
module modexp_2N_NN_N4_CC32 ( clk, rst, m, e, n, c );
  input [3:0] m;
  input [3:0] e;
  input [3:0] n;
  output [3:0] c;
  input clk, rst;
  wire   init, mul_pow, first_one, \modmult_1/xreg[3] , \modmult_1/xreg[2] ,
         \modmult_1/xreg[1] , \modmult_1/xin[2] , \modmult_1/xin[1] ,
         \modmult_1/xin[0] , \modmult_1/zreg[4] , \modmult_1/zreg[3] ,
         \modmult_1/zreg[2] , \modmult_1/zreg[1] , \modmult_1/zreg[0] ,
         \modmult_1/zout[0][4] , n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
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
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279;
  wire   [3:0] start_in;
  wire   [3:0] start_reg;
  wire   [3:0] ereg;
  wire   [3:0] o;
  wire   [3:0] creg;

  DFF init_reg ( .D(1'b1), .CLK(clk), .RST(rst), .Q(init) );
  DFF \start_reg_reg[0]  ( .D(start_in[3]), .CLK(clk), .RST(rst), .Q(
        start_reg[0]) );
  DFF \start_reg_reg[1]  ( .D(start_in[0]), .CLK(clk), .RST(rst), .Q(
        start_reg[1]) );
  DFF \start_reg_reg[2]  ( .D(start_in[1]), .CLK(clk), .RST(rst), .Q(
        start_reg[2]) );
  DFF \start_reg_reg[3]  ( .D(start_in[2]), .CLK(clk), .RST(rst), .Q(
        start_reg[3]) );
  DFF \modmult_1/xreg_reg[1]  ( .D(\modmult_1/xin[0] ), .CLK(clk), .RST(rst), 
        .Q(\modmult_1/xreg[1] ) );
  DFF \modmult_1/xreg_reg[2]  ( .D(\modmult_1/xin[1] ), .CLK(clk), .RST(rst), 
        .Q(\modmult_1/xreg[2] ) );
  DFF \modmult_1/xreg_reg[3]  ( .D(\modmult_1/xin[2] ), .CLK(clk), .RST(rst), 
        .Q(\modmult_1/xreg[3] ) );
  DFF \modmult_1/zreg_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(
        \modmult_1/zreg[0] ) );
  DFF \modmult_1/zreg_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(
        \modmult_1/zreg[1] ) );
  DFF \modmult_1/zreg_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(
        \modmult_1/zreg[2] ) );
  DFF \modmult_1/zreg_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(
        \modmult_1/zreg[3] ) );
  DFF \modmult_1/zreg_reg[4]  ( .D(\modmult_1/zout[0][4] ), .CLK(clk), .RST(
        rst), .Q(\modmult_1/zreg[4] ) );
  DFF mul_pow_reg ( .D(n47), .CLK(clk), .RST(rst), .Q(mul_pow) );
  DFF \ereg_reg[0]  ( .D(n46), .CLK(clk), .RST(rst), .Q(ereg[0]) );
  DFF \ereg_reg[1]  ( .D(n45), .CLK(clk), .RST(rst), .Q(ereg[1]) );
  DFF \ereg_reg[2]  ( .D(n44), .CLK(clk), .RST(rst), .Q(ereg[2]) );
  DFF \ereg_reg[3]  ( .D(n43), .CLK(clk), .RST(rst), .Q(ereg[3]) );
  DFF first_one_reg ( .D(n42), .CLK(clk), .RST(rst), .Q(first_one) );
  DFF \creg_reg[0]  ( .D(n41), .CLK(clk), .RST(rst), .Q(creg[0]) );
  DFF \creg_reg[1]  ( .D(n40), .CLK(clk), .RST(rst), .Q(creg[1]) );
  DFF \creg_reg[2]  ( .D(n39), .CLK(clk), .RST(rst), .Q(creg[2]) );
  DFF \creg_reg[3]  ( .D(n38), .CLK(clk), .RST(rst), .Q(creg[3]) );
  OR U142 ( .A(n[1]), .B(n169), .Z(n108) );
  NANDN U143 ( .A(n170), .B(n108), .Z(n109) );
  AND U144 ( .A(n171), .B(n109), .Z(n110) );
  NOR U145 ( .A(n173), .B(n175), .Z(n111) );
  NAND U146 ( .A(n174), .B(n110), .Z(n112) );
  AND U147 ( .A(n111), .B(n112), .Z(n113) );
  NAND U148 ( .A(n201), .B(n113), .Z(n188) );
  OR U149 ( .A(n176), .B(n173), .Z(n114) );
  AND U150 ( .A(n174), .B(n114), .Z(n115) );
  XNOR U151 ( .A(n175), .B(n115), .Z(n116) );
  OR U152 ( .A(n115), .B(n188), .Z(n117) );
  NAND U153 ( .A(n116), .B(n117), .Z(n222) );
  NAND U154 ( .A(n212), .B(n214), .Z(n118) );
  XOR U155 ( .A(n212), .B(n214), .Z(n119) );
  NAND U156 ( .A(n119), .B(n213), .Z(n120) );
  NAND U157 ( .A(n118), .B(n120), .Z(n215) );
  XOR U158 ( .A(n158), .B(n153), .Z(n121) );
  NANDN U159 ( .A(n154), .B(n121), .Z(n122) );
  NAND U160 ( .A(n158), .B(n153), .Z(n123) );
  AND U161 ( .A(n122), .B(n123), .Z(n149) );
  NAND U162 ( .A(n246), .B(start_reg[3]), .Z(n124) );
  AND U163 ( .A(init), .B(n124), .Z(n259) );
  NAND U164 ( .A(n207), .B(n209), .Z(n125) );
  XOR U165 ( .A(n207), .B(n209), .Z(n126) );
  NAND U166 ( .A(n126), .B(n208), .Z(n127) );
  NAND U167 ( .A(n125), .B(n127), .Z(n213) );
  ANDN U168 ( .B(n159), .A(n162), .Z(n153) );
  NAND U169 ( .A(n180), .B(n[1]), .Z(n128) );
  XOR U170 ( .A(n180), .B(n[1]), .Z(n129) );
  NAND U171 ( .A(n129), .B(n169), .Z(n130) );
  NAND U172 ( .A(n128), .B(n130), .Z(n187) );
  XOR U173 ( .A(n208), .B(n207), .Z(n131) );
  XNOR U174 ( .A(n206), .B(n131), .Z(o[1]) );
  NAND U175 ( .A(init), .B(start_reg[0]), .Z(n236) );
  NANDN U176 ( .A(n236), .B(creg[3]), .Z(n133) );
  NANDN U177 ( .A(start_reg[0]), .B(init), .Z(start_in[0]) );
  NANDN U178 ( .A(start_in[0]), .B(\modmult_1/xreg[3] ), .Z(n132) );
  NAND U179 ( .A(n133), .B(n132), .Z(n134) );
  NANDN U180 ( .A(init), .B(m[3]), .Z(n249) );
  NANDN U181 ( .A(n134), .B(n249), .Z(n160) );
  IV U182 ( .A(n160), .Z(n156) );
  ANDN U183 ( .B(init), .A(mul_pow), .Z(n240) );
  NANDN U184 ( .A(creg[0]), .B(n240), .Z(n136) );
  OR U185 ( .A(n240), .B(m[0]), .Z(n135) );
  AND U186 ( .A(n136), .B(n135), .Z(n137) );
  NANDN U187 ( .A(n156), .B(n137), .Z(n168) );
  NANDN U188 ( .A(start_in[0]), .B(\modmult_1/zreg[2] ), .Z(n148) );
  NANDN U189 ( .A(creg[3]), .B(n240), .Z(n139) );
  OR U190 ( .A(n240), .B(m[3]), .Z(n138) );
  NAND U191 ( .A(n139), .B(n138), .Z(n147) );
  NANDN U192 ( .A(creg[2]), .B(n240), .Z(n141) );
  OR U193 ( .A(n240), .B(m[2]), .Z(n140) );
  NAND U194 ( .A(n141), .B(n140), .Z(n154) );
  NAND U195 ( .A(creg[1]), .B(n240), .Z(n143) );
  NANDN U196 ( .A(n240), .B(m[1]), .Z(n142) );
  NAND U197 ( .A(n143), .B(n142), .Z(n159) );
  NANDN U198 ( .A(start_in[0]), .B(\modmult_1/zreg[0] ), .Z(n162) );
  ANDN U199 ( .B(\modmult_1/zreg[1] ), .A(start_in[0]), .Z(n158) );
  XOR U200 ( .A(n147), .B(n149), .Z(n144) );
  NAND U201 ( .A(n160), .B(n144), .Z(n145) );
  XOR U202 ( .A(n148), .B(n145), .Z(n179) );
  ANDN U203 ( .B(n179), .A(n[3]), .Z(n173) );
  NAND U204 ( .A(n148), .B(n147), .Z(n146) );
  AND U205 ( .A(n146), .B(n160), .Z(n152) );
  XOR U206 ( .A(n148), .B(n147), .Z(n150) );
  NAND U207 ( .A(n150), .B(n149), .Z(n151) );
  AND U208 ( .A(n152), .B(n151), .Z(n164) );
  ANDN U209 ( .B(\modmult_1/zreg[3] ), .A(start_in[0]), .Z(n163) );
  XOR U210 ( .A(n164), .B(n163), .Z(n175) );
  XNOR U211 ( .A(n154), .B(n153), .Z(n155) );
  NANDN U212 ( .A(n156), .B(n155), .Z(n157) );
  XNOR U213 ( .A(n158), .B(n157), .Z(n191) );
  NANDN U214 ( .A(n191), .B(n[2]), .Z(n171) );
  ANDN U215 ( .B(n191), .A(n[2]), .Z(n170) );
  NAND U216 ( .A(n160), .B(n159), .Z(n161) );
  XOR U217 ( .A(n162), .B(n161), .Z(n183) );
  IV U218 ( .A(n183), .Z(n169) );
  NANDN U219 ( .A(n179), .B(n[3]), .Z(n174) );
  NAND U220 ( .A(n164), .B(n163), .Z(n166) );
  NANDN U221 ( .A(start_in[0]), .B(\modmult_1/zreg[4] ), .Z(n165) );
  XNOR U222 ( .A(n166), .B(n165), .Z(n201) );
  NAND U223 ( .A(n188), .B(n[0]), .Z(n167) );
  XNOR U224 ( .A(n168), .B(n167), .Z(n204) );
  AND U225 ( .A(n[0]), .B(n168), .Z(n180) );
  NANDN U226 ( .A(n170), .B(n187), .Z(n172) );
  AND U227 ( .A(n172), .B(n171), .Z(n176) );
  XNOR U228 ( .A(n[3]), .B(n176), .Z(n177) );
  AND U229 ( .A(n177), .B(n188), .Z(n178) );
  XOR U230 ( .A(n179), .B(n178), .Z(n216) );
  AND U231 ( .A(n[0]), .B(n204), .Z(n205) );
  NAND U232 ( .A(n205), .B(n[1]), .Z(n186) );
  XOR U233 ( .A(n[1]), .B(n180), .Z(n181) );
  AND U234 ( .A(n181), .B(n188), .Z(n182) );
  XOR U235 ( .A(n183), .B(n182), .Z(n209) );
  IV U236 ( .A(n209), .Z(n206) );
  XOR U237 ( .A(n205), .B(n[1]), .Z(n184) );
  NAND U238 ( .A(n206), .B(n184), .Z(n185) );
  NAND U239 ( .A(n186), .B(n185), .Z(n192) );
  NAND U240 ( .A(n192), .B(n[2]), .Z(n195) );
  XOR U241 ( .A(n[2]), .B(n187), .Z(n189) );
  AND U242 ( .A(n189), .B(n188), .Z(n190) );
  XOR U243 ( .A(n191), .B(n190), .Z(n214) );
  XOR U244 ( .A(n192), .B(n[2]), .Z(n193) );
  NANDN U245 ( .A(n214), .B(n193), .Z(n194) );
  NAND U246 ( .A(n195), .B(n194), .Z(n196) );
  NANDN U247 ( .A(n216), .B(n196), .Z(n199) );
  XNOR U248 ( .A(n216), .B(n196), .Z(n197) );
  NAND U249 ( .A(n197), .B(n[3]), .Z(n198) );
  NAND U250 ( .A(n199), .B(n198), .Z(n200) );
  AND U251 ( .A(n222), .B(n200), .Z(n202) );
  NAND U252 ( .A(n202), .B(n201), .Z(n211) );
  AND U253 ( .A(n211), .B(n[0]), .Z(n203) );
  XNOR U254 ( .A(n204), .B(n203), .Z(o[0]) );
  NAND U255 ( .A(n[1]), .B(n211), .Z(n207) );
  NAND U256 ( .A(n205), .B(n211), .Z(n208) );
  NAND U257 ( .A(n[2]), .B(n211), .Z(n212) );
  XNOR U258 ( .A(n214), .B(n213), .Z(n210) );
  XNOR U259 ( .A(n212), .B(n210), .Z(o[2]) );
  AND U260 ( .A(n[3]), .B(n211), .Z(n217) );
  XOR U261 ( .A(n216), .B(n215), .Z(n218) );
  XNOR U262 ( .A(n217), .B(n218), .Z(o[3]) );
  OR U263 ( .A(n216), .B(n215), .Z(n220) );
  NAND U264 ( .A(n218), .B(n217), .Z(n219) );
  NAND U265 ( .A(n220), .B(n219), .Z(n221) );
  XNOR U266 ( .A(n222), .B(n221), .Z(\modmult_1/zout[0][4] ) );
  NANDN U267 ( .A(init), .B(e[3]), .Z(n268) );
  NAND U268 ( .A(ereg[3]), .B(init), .Z(n223) );
  AND U269 ( .A(n268), .B(n223), .Z(n244) );
  NAND U270 ( .A(creg[0]), .B(n244), .Z(n225) );
  NANDN U271 ( .A(n244), .B(o[0]), .Z(n224) );
  NAND U272 ( .A(n225), .B(n224), .Z(c[0]) );
  NAND U273 ( .A(creg[1]), .B(n244), .Z(n227) );
  NANDN U274 ( .A(n244), .B(o[1]), .Z(n226) );
  NAND U275 ( .A(n227), .B(n226), .Z(c[1]) );
  NAND U276 ( .A(creg[2]), .B(n244), .Z(n229) );
  NANDN U277 ( .A(n244), .B(o[2]), .Z(n228) );
  NAND U278 ( .A(n229), .B(n228), .Z(c[2]) );
  NAND U279 ( .A(creg[3]), .B(n244), .Z(n231) );
  NANDN U280 ( .A(n244), .B(o[3]), .Z(n230) );
  NAND U281 ( .A(n231), .B(n230), .Z(c[3]) );
  NANDN U282 ( .A(init), .B(m[0]), .Z(n263) );
  NANDN U283 ( .A(n236), .B(creg[0]), .Z(n232) );
  NAND U284 ( .A(n263), .B(n232), .Z(\modmult_1/xin[0] ) );
  NANDN U285 ( .A(n236), .B(creg[1]), .Z(n234) );
  NANDN U286 ( .A(start_in[0]), .B(\modmult_1/xreg[1] ), .Z(n233) );
  NAND U287 ( .A(n234), .B(n233), .Z(n235) );
  NANDN U288 ( .A(init), .B(m[1]), .Z(n257) );
  NANDN U289 ( .A(n235), .B(n257), .Z(\modmult_1/xin[1] ) );
  NANDN U290 ( .A(n236), .B(creg[2]), .Z(n238) );
  NANDN U291 ( .A(start_in[0]), .B(\modmult_1/xreg[2] ), .Z(n237) );
  NAND U292 ( .A(n238), .B(n237), .Z(n239) );
  NANDN U293 ( .A(init), .B(m[2]), .Z(n253) );
  NANDN U294 ( .A(n239), .B(n253), .Z(\modmult_1/xin[2] ) );
  AND U295 ( .A(init), .B(start_reg[1]), .Z(start_in[1]) );
  AND U296 ( .A(init), .B(start_reg[2]), .Z(start_in[2]) );
  NANDN U297 ( .A(start_reg[3]), .B(init), .Z(n241) );
  ANDN U298 ( .B(n241), .A(n240), .Z(n274) );
  NANDN U299 ( .A(n274), .B(ereg[0]), .Z(n243) );
  NANDN U300 ( .A(init), .B(e[0]), .Z(n242) );
  NAND U301 ( .A(n243), .B(n242), .Z(n46) );
  NAND U302 ( .A(n244), .B(mul_pow), .Z(n245) );
  AND U303 ( .A(first_one), .B(n245), .Z(n246) );
  NAND U304 ( .A(creg[3]), .B(n259), .Z(n248) );
  AND U305 ( .A(init), .B(start_reg[3]), .Z(start_in[3]) );
  AND U306 ( .A(start_in[3]), .B(n246), .Z(n260) );
  NAND U307 ( .A(n260), .B(o[3]), .Z(n247) );
  AND U308 ( .A(n248), .B(n247), .Z(n250) );
  NAND U309 ( .A(n250), .B(n249), .Z(n38) );
  NAND U310 ( .A(o[2]), .B(n260), .Z(n252) );
  NAND U311 ( .A(n259), .B(creg[2]), .Z(n251) );
  AND U312 ( .A(n252), .B(n251), .Z(n254) );
  NAND U313 ( .A(n254), .B(n253), .Z(n39) );
  NAND U314 ( .A(o[1]), .B(n260), .Z(n256) );
  NAND U315 ( .A(n259), .B(creg[1]), .Z(n255) );
  AND U316 ( .A(n256), .B(n255), .Z(n258) );
  NAND U317 ( .A(n258), .B(n257), .Z(n40) );
  NAND U318 ( .A(creg[0]), .B(n259), .Z(n262) );
  NAND U319 ( .A(n260), .B(o[0]), .Z(n261) );
  AND U320 ( .A(n262), .B(n261), .Z(n264) );
  NAND U321 ( .A(n264), .B(n263), .Z(n41) );
  AND U322 ( .A(mul_pow), .B(start_in[3]), .Z(n277) );
  NAND U323 ( .A(ereg[3]), .B(n277), .Z(n265) );
  NANDN U324 ( .A(first_one), .B(n265), .Z(n42) );
  NAND U325 ( .A(ereg[2]), .B(n277), .Z(n267) );
  NANDN U326 ( .A(n274), .B(ereg[3]), .Z(n266) );
  AND U327 ( .A(n267), .B(n266), .Z(n269) );
  NAND U328 ( .A(n269), .B(n268), .Z(n43) );
  NANDN U329 ( .A(init), .B(e[2]), .Z(n271) );
  NANDN U330 ( .A(n274), .B(ereg[2]), .Z(n270) );
  AND U331 ( .A(n271), .B(n270), .Z(n273) );
  NAND U332 ( .A(n277), .B(ereg[1]), .Z(n272) );
  NAND U333 ( .A(n273), .B(n272), .Z(n44) );
  NANDN U334 ( .A(init), .B(e[1]), .Z(n276) );
  NANDN U335 ( .A(n274), .B(ereg[1]), .Z(n275) );
  AND U336 ( .A(n276), .B(n275), .Z(n279) );
  NAND U337 ( .A(n277), .B(ereg[0]), .Z(n278) );
  NAND U338 ( .A(n279), .B(n278), .Z(n45) );
  XOR U339 ( .A(mul_pow), .B(start_in[3]), .Z(n47) );
endmodule

