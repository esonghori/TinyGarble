
module shift_reg_syn ( clk, rst, g_init, e_init, g_input, e_input, o );
  input [7:0] g_init;
  input [7:0] e_init;
  output [31:0] o;
  input clk, rst, g_input, e_input;
  wire   n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
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
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304;

  DFF \shift_register_reg[0]  ( .D(n176), .CLK(clk), .RST(rst), .I(e_init[0]), 
        .Q(o[0]) );
  DFF \shift_register_reg[1]  ( .D(n175), .CLK(clk), .RST(rst), .I(e_init[1]), 
        .Q(o[1]) );
  DFF \shift_register_reg[2]  ( .D(n174), .CLK(clk), .RST(rst), .I(e_init[2]), 
        .Q(o[2]) );
  DFF \shift_register_reg[3]  ( .D(n173), .CLK(clk), .RST(rst), .I(e_init[3]), 
        .Q(o[3]) );
  DFF \shift_register_reg[4]  ( .D(n172), .CLK(clk), .RST(rst), .I(e_init[4]), 
        .Q(o[4]) );
  DFF \shift_register_reg[5]  ( .D(n171), .CLK(clk), .RST(rst), .I(e_init[5]), 
        .Q(o[5]) );
  DFF \shift_register_reg[6]  ( .D(n170), .CLK(clk), .RST(rst), .I(e_init[6]), 
        .Q(o[6]) );
  DFF \shift_register_reg[7]  ( .D(n169), .CLK(clk), .RST(rst), .I(e_init[7]), 
        .Q(o[7]) );
  DFF \shift_register_reg[8]  ( .D(n168), .CLK(clk), .RST(rst), .I(g_init[0]), 
        .Q(o[8]) );
  DFF \shift_register_reg[9]  ( .D(n167), .CLK(clk), .RST(rst), .I(g_init[1]), 
        .Q(o[9]) );
  DFF \shift_register_reg[10]  ( .D(n166), .CLK(clk), .RST(rst), .I(g_init[2]), 
        .Q(o[10]) );
  DFF \shift_register_reg[11]  ( .D(n165), .CLK(clk), .RST(rst), .I(g_init[3]), 
        .Q(o[11]) );
  DFF \shift_register_reg[12]  ( .D(n164), .CLK(clk), .RST(rst), .I(g_init[4]), 
        .Q(o[12]) );
  DFF \shift_register_reg[13]  ( .D(n163), .CLK(clk), .RST(rst), .I(g_init[5]), 
        .Q(o[13]) );
  DFF \shift_register_reg[14]  ( .D(n162), .CLK(clk), .RST(rst), .I(g_init[6]), 
        .Q(o[14]) );
  DFF \shift_register_reg[15]  ( .D(n161), .CLK(clk), .RST(rst), .I(g_init[7]), 
        .Q(o[15]) );
  DFF \shift_register_reg[16]  ( .D(n160), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[16]) );
  DFF \shift_register_reg[17]  ( .D(n159), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[17]) );
  DFF \shift_register_reg[18]  ( .D(n158), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[18]) );
  DFF \shift_register_reg[19]  ( .D(n157), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[19]) );
  DFF \shift_register_reg[20]  ( .D(n156), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[20]) );
  DFF \shift_register_reg[21]  ( .D(n155), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[21]) );
  DFF \shift_register_reg[22]  ( .D(n154), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[22]) );
  DFF \shift_register_reg[23]  ( .D(n153), .CLK(clk), .RST(rst), .I(1'b1), .Q(
        o[23]) );
  DFF \shift_register_reg[24]  ( .D(n152), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[24]) );
  DFF \shift_register_reg[25]  ( .D(n151), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[25]) );
  DFF \shift_register_reg[26]  ( .D(n150), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[26]) );
  DFF \shift_register_reg[27]  ( .D(n149), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[27]) );
  DFF \shift_register_reg[28]  ( .D(n148), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[28]) );
  DFF \shift_register_reg[29]  ( .D(n147), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[29]) );
  DFF \shift_register_reg[30]  ( .D(n146), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[30]) );
  DFF \shift_register_reg[31]  ( .D(n145), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o[31]) );
  NAND U178 ( .A(n177), .B(n178), .Z(n176) );
  NAND U179 ( .A(n179), .B(o[0]), .Z(n178) );
  NAND U180 ( .A(n180), .B(o[1]), .Z(n177) );
  NAND U181 ( .A(n181), .B(n182), .Z(n175) );
  NAND U182 ( .A(n179), .B(o[1]), .Z(n182) );
  AND U183 ( .A(n183), .B(n184), .Z(n181) );
  NAND U184 ( .A(n180), .B(o[2]), .Z(n184) );
  NANDN U185 ( .B(n185), .A(o[0]), .Z(n183) );
  NAND U186 ( .A(n186), .B(n187), .Z(n174) );
  NAND U187 ( .A(n179), .B(o[2]), .Z(n187) );
  AND U188 ( .A(n188), .B(n189), .Z(n186) );
  NAND U189 ( .A(n180), .B(o[3]), .Z(n189) );
  NANDN U190 ( .B(n185), .A(o[1]), .Z(n188) );
  NAND U191 ( .A(n190), .B(n191), .Z(n173) );
  NAND U192 ( .A(n179), .B(o[3]), .Z(n191) );
  AND U193 ( .A(n192), .B(n193), .Z(n190) );
  NAND U194 ( .A(n180), .B(o[4]), .Z(n193) );
  NANDN U195 ( .B(n185), .A(o[2]), .Z(n192) );
  NAND U196 ( .A(n194), .B(n195), .Z(n172) );
  NAND U197 ( .A(n179), .B(o[4]), .Z(n195) );
  AND U198 ( .A(n196), .B(n197), .Z(n194) );
  NAND U199 ( .A(n180), .B(o[5]), .Z(n197) );
  NANDN U200 ( .B(n185), .A(o[3]), .Z(n196) );
  NAND U201 ( .A(n198), .B(n199), .Z(n171) );
  NAND U202 ( .A(n179), .B(o[5]), .Z(n199) );
  AND U203 ( .A(n200), .B(n201), .Z(n198) );
  NAND U204 ( .A(n180), .B(o[6]), .Z(n201) );
  NANDN U205 ( .B(n185), .A(o[4]), .Z(n200) );
  NAND U206 ( .A(n202), .B(n203), .Z(n170) );
  NAND U207 ( .A(n179), .B(o[6]), .Z(n203) );
  AND U208 ( .A(n204), .B(n205), .Z(n202) );
  NAND U209 ( .A(n180), .B(o[7]), .Z(n205) );
  NANDN U210 ( .B(n185), .A(o[5]), .Z(n204) );
  NAND U211 ( .A(n206), .B(n207), .Z(n169) );
  NAND U212 ( .A(n179), .B(o[7]), .Z(n207) );
  AND U213 ( .A(n208), .B(n209), .Z(n206) );
  NAND U214 ( .A(n180), .B(o[8]), .Z(n209) );
  NANDN U215 ( .B(n185), .A(o[6]), .Z(n208) );
  NAND U216 ( .A(n210), .B(n211), .Z(n168) );
  NAND U217 ( .A(n179), .B(o[8]), .Z(n211) );
  AND U218 ( .A(n212), .B(n213), .Z(n210) );
  NAND U219 ( .A(n180), .B(o[9]), .Z(n213) );
  NANDN U220 ( .B(n185), .A(o[7]), .Z(n212) );
  NAND U221 ( .A(n214), .B(n215), .Z(n167) );
  NAND U222 ( .A(n179), .B(o[9]), .Z(n215) );
  AND U223 ( .A(n216), .B(n217), .Z(n214) );
  NAND U224 ( .A(n180), .B(o[10]), .Z(n217) );
  NANDN U225 ( .B(n185), .A(o[8]), .Z(n216) );
  NAND U226 ( .A(n218), .B(n219), .Z(n166) );
  NAND U227 ( .A(n179), .B(o[10]), .Z(n219) );
  AND U228 ( .A(n220), .B(n221), .Z(n218) );
  NAND U229 ( .A(n180), .B(o[11]), .Z(n221) );
  NANDN U230 ( .B(n185), .A(o[9]), .Z(n220) );
  NAND U231 ( .A(n222), .B(n223), .Z(n165) );
  NAND U232 ( .A(n179), .B(o[11]), .Z(n223) );
  AND U233 ( .A(n224), .B(n225), .Z(n222) );
  NAND U234 ( .A(n180), .B(o[12]), .Z(n225) );
  NANDN U235 ( .B(n185), .A(o[10]), .Z(n224) );
  NAND U236 ( .A(n226), .B(n227), .Z(n164) );
  NAND U237 ( .A(n179), .B(o[12]), .Z(n227) );
  AND U238 ( .A(n228), .B(n229), .Z(n226) );
  NAND U239 ( .A(n180), .B(o[13]), .Z(n229) );
  NANDN U240 ( .B(n185), .A(o[11]), .Z(n228) );
  NAND U241 ( .A(n230), .B(n231), .Z(n163) );
  NAND U242 ( .A(n179), .B(o[13]), .Z(n231) );
  AND U243 ( .A(n232), .B(n233), .Z(n230) );
  NAND U244 ( .A(n180), .B(o[14]), .Z(n233) );
  NANDN U245 ( .B(n185), .A(o[12]), .Z(n232) );
  NAND U246 ( .A(n234), .B(n235), .Z(n162) );
  NAND U247 ( .A(n179), .B(o[14]), .Z(n235) );
  AND U248 ( .A(n236), .B(n237), .Z(n234) );
  NAND U249 ( .A(n180), .B(o[15]), .Z(n237) );
  NANDN U250 ( .B(n185), .A(o[13]), .Z(n236) );
  NAND U251 ( .A(n238), .B(n239), .Z(n161) );
  NAND U252 ( .A(n179), .B(o[15]), .Z(n239) );
  AND U253 ( .A(n240), .B(n241), .Z(n238) );
  NAND U254 ( .A(n180), .B(o[16]), .Z(n241) );
  NANDN U255 ( .B(n185), .A(o[14]), .Z(n240) );
  NAND U256 ( .A(n242), .B(n243), .Z(n160) );
  NAND U257 ( .A(n179), .B(o[16]), .Z(n243) );
  AND U258 ( .A(n244), .B(n245), .Z(n242) );
  NAND U259 ( .A(n180), .B(o[17]), .Z(n245) );
  NANDN U260 ( .B(n185), .A(o[15]), .Z(n244) );
  NAND U261 ( .A(n246), .B(n247), .Z(n159) );
  NAND U262 ( .A(n179), .B(o[17]), .Z(n247) );
  AND U263 ( .A(n248), .B(n249), .Z(n246) );
  NAND U264 ( .A(n180), .B(o[18]), .Z(n249) );
  NANDN U265 ( .B(n185), .A(o[16]), .Z(n248) );
  NAND U266 ( .A(n250), .B(n251), .Z(n158) );
  NAND U267 ( .A(n179), .B(o[18]), .Z(n251) );
  AND U268 ( .A(n252), .B(n253), .Z(n250) );
  NAND U269 ( .A(n180), .B(o[19]), .Z(n253) );
  NANDN U270 ( .B(n185), .A(o[17]), .Z(n252) );
  NAND U271 ( .A(n254), .B(n255), .Z(n157) );
  NAND U272 ( .A(n179), .B(o[19]), .Z(n255) );
  AND U273 ( .A(n256), .B(n257), .Z(n254) );
  NAND U274 ( .A(n180), .B(o[20]), .Z(n257) );
  NANDN U275 ( .B(n185), .A(o[18]), .Z(n256) );
  NAND U276 ( .A(n258), .B(n259), .Z(n156) );
  NAND U277 ( .A(n179), .B(o[20]), .Z(n259) );
  AND U278 ( .A(n260), .B(n261), .Z(n258) );
  NAND U279 ( .A(n180), .B(o[21]), .Z(n261) );
  NANDN U280 ( .B(n185), .A(o[19]), .Z(n260) );
  NAND U281 ( .A(n262), .B(n263), .Z(n155) );
  NAND U282 ( .A(n179), .B(o[21]), .Z(n263) );
  AND U283 ( .A(n264), .B(n265), .Z(n262) );
  NAND U284 ( .A(n180), .B(o[22]), .Z(n265) );
  NANDN U285 ( .B(n185), .A(o[20]), .Z(n264) );
  NAND U286 ( .A(n266), .B(n267), .Z(n154) );
  NAND U287 ( .A(n179), .B(o[22]), .Z(n267) );
  AND U288 ( .A(n268), .B(n269), .Z(n266) );
  NAND U289 ( .A(n180), .B(o[23]), .Z(n269) );
  NANDN U290 ( .B(n185), .A(o[21]), .Z(n268) );
  NAND U291 ( .A(n270), .B(n271), .Z(n153) );
  NAND U292 ( .A(n179), .B(o[23]), .Z(n271) );
  AND U293 ( .A(n272), .B(n273), .Z(n270) );
  NAND U294 ( .A(n180), .B(o[24]), .Z(n273) );
  NANDN U295 ( .B(n185), .A(o[22]), .Z(n272) );
  NAND U296 ( .A(n274), .B(n275), .Z(n152) );
  NAND U297 ( .A(n179), .B(o[24]), .Z(n275) );
  AND U298 ( .A(n276), .B(n277), .Z(n274) );
  NAND U299 ( .A(n180), .B(o[25]), .Z(n277) );
  NANDN U300 ( .B(n185), .A(o[23]), .Z(n276) );
  NAND U301 ( .A(n278), .B(n279), .Z(n151) );
  NAND U302 ( .A(n179), .B(o[25]), .Z(n279) );
  AND U303 ( .A(n280), .B(n281), .Z(n278) );
  NAND U304 ( .A(n180), .B(o[26]), .Z(n281) );
  NANDN U305 ( .B(n185), .A(o[24]), .Z(n280) );
  NAND U306 ( .A(n282), .B(n283), .Z(n150) );
  NAND U307 ( .A(n179), .B(o[26]), .Z(n283) );
  AND U308 ( .A(n284), .B(n285), .Z(n282) );
  NAND U309 ( .A(n180), .B(o[27]), .Z(n285) );
  NANDN U310 ( .B(n185), .A(o[25]), .Z(n284) );
  NAND U311 ( .A(n286), .B(n287), .Z(n149) );
  NAND U312 ( .A(n179), .B(o[27]), .Z(n287) );
  AND U313 ( .A(n288), .B(n289), .Z(n286) );
  NAND U314 ( .A(n180), .B(o[28]), .Z(n289) );
  NANDN U315 ( .B(n185), .A(o[26]), .Z(n288) );
  NAND U316 ( .A(n290), .B(n291), .Z(n148) );
  NAND U317 ( .A(n179), .B(o[28]), .Z(n291) );
  AND U318 ( .A(n292), .B(n293), .Z(n290) );
  NAND U319 ( .A(n180), .B(o[29]), .Z(n293) );
  NANDN U320 ( .B(n185), .A(o[27]), .Z(n292) );
  NAND U321 ( .A(n294), .B(n295), .Z(n147) );
  NAND U322 ( .A(n179), .B(o[29]), .Z(n295) );
  AND U323 ( .A(n296), .B(n297), .Z(n294) );
  NAND U324 ( .A(n180), .B(o[30]), .Z(n297) );
  NANDN U325 ( .B(n185), .A(o[28]), .Z(n296) );
  NAND U326 ( .A(n298), .B(n299), .Z(n146) );
  NAND U327 ( .A(o[30]), .B(n179), .Z(n299) );
  AND U328 ( .A(n300), .B(n301), .Z(n298) );
  NAND U329 ( .A(o[31]), .B(n180), .Z(n301) );
  NANDN U330 ( .B(n185), .A(o[29]), .Z(n300) );
  NAND U331 ( .A(n302), .B(n303), .Z(n145) );
  NAND U332 ( .A(n179), .B(o[31]), .Z(n303) );
  NOR U333 ( .A(n304), .B(n180), .Z(n179) );
  ANDN U334 ( .A(g_input), .B(e_input), .Z(n180) );
  IV U335 ( .A(n185), .Z(n304) );
  NANDN U336 ( .B(n185), .A(o[30]), .Z(n302) );
  NANDN U337 ( .B(g_input), .A(e_input), .Z(n185) );
endmodule

