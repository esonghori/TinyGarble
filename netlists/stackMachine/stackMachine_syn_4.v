
module stackMachine_N4 ( clk, rst, x, opcode, o );
  input [3:0] x;
  input [2:0] opcode;
  output [3:0] o;
  input clk, rst;
  wire   \stack[7][3] , \stack[7][2] , \stack[7][1] , \stack[7][0] ,
         \stack[6][3] , \stack[6][2] , \stack[6][1] , \stack[6][0] ,
         \stack[5][3] , \stack[5][2] , \stack[5][1] , \stack[5][0] ,
         \stack[4][3] , \stack[4][2] , \stack[4][1] , \stack[4][0] ,
         \stack[3][3] , \stack[3][2] , \stack[3][1] , \stack[3][0] ,
         \stack[2][3] , \stack[2][2] , \stack[2][1] , \stack[2][0] ,
         \stack[1][3] , \stack[1][2] , \stack[1][1] , \stack[1][0] , N44, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505;
  assign o[0] = N44;

  DFF \stack_reg[0][0]  ( .D(n173), .CLK(clk), .RST(rst), .Q(N44) );
  DFF \stack_reg[1][0]  ( .D(n172), .CLK(clk), .RST(rst), .Q(\stack[1][0] ) );
  DFF \stack_reg[0][1]  ( .D(n171), .CLK(clk), .RST(rst), .Q(o[1]) );
  DFF \stack_reg[1][1]  ( .D(n170), .CLK(clk), .RST(rst), .Q(\stack[1][1] ) );
  DFF \stack_reg[2][1]  ( .D(n169), .CLK(clk), .RST(rst), .Q(\stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n168), .CLK(clk), .RST(rst), .Q(\stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n167), .CLK(clk), .RST(rst), .Q(\stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n166), .CLK(clk), .RST(rst), .Q(\stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n165), .CLK(clk), .RST(rst), .Q(\stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n164), .CLK(clk), .RST(rst), .Q(\stack[7][1] ) );
  DFF \stack_reg[0][2]  ( .D(n163), .CLK(clk), .RST(rst), .Q(o[2]) );
  DFF \stack_reg[1][2]  ( .D(n162), .CLK(clk), .RST(rst), .Q(\stack[1][2] ) );
  DFF \stack_reg[0][3]  ( .D(n161), .CLK(clk), .RST(rst), .Q(o[3]) );
  DFF \stack_reg[1][3]  ( .D(n160), .CLK(clk), .RST(rst), .Q(\stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n159), .CLK(clk), .RST(rst), .Q(\stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n158), .CLK(clk), .RST(rst), .Q(\stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n157), .CLK(clk), .RST(rst), .Q(\stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n156), .CLK(clk), .RST(rst), .Q(\stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n155), .CLK(clk), .RST(rst), .Q(\stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n154), .CLK(clk), .RST(rst), .Q(\stack[7][3] ) );
  DFF \stack_reg[2][2]  ( .D(n153), .CLK(clk), .RST(rst), .Q(\stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n152), .CLK(clk), .RST(rst), .Q(\stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n151), .CLK(clk), .RST(rst), .Q(\stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n150), .CLK(clk), .RST(rst), .Q(\stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n149), .CLK(clk), .RST(rst), .Q(\stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n148), .CLK(clk), .RST(rst), .Q(\stack[7][2] ) );
  DFF \stack_reg[2][0]  ( .D(n147), .CLK(clk), .RST(rst), .Q(\stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n146), .CLK(clk), .RST(rst), .Q(\stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n145), .CLK(clk), .RST(rst), .Q(\stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n144), .CLK(clk), .RST(rst), .Q(\stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n143), .CLK(clk), .RST(rst), .Q(\stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n142), .CLK(clk), .RST(rst), .Q(\stack[7][0] ) );
  XNOR U260 ( .A(n382), .B(n383), .Z(n417) );
  NANDN U261 ( .A(n463), .B(n424), .Z(n259) );
  NANDN U262 ( .A(n458), .B(n423), .Z(n260) );
  NAND U263 ( .A(n259), .B(n260), .Z(n261) );
  AND U264 ( .A(n490), .B(n420), .Z(n262) );
  AND U265 ( .A(n421), .B(n262), .Z(n263) );
  NANDN U266 ( .A(n422), .B(n263), .Z(n264) );
  NAND U267 ( .A(opcode[0]), .B(n422), .Z(n265) );
  NANDN U268 ( .A(n486), .B(x[2]), .Z(n266) );
  NAND U269 ( .A(n265), .B(n266), .Z(n267) );
  XNOR U270 ( .A(n417), .B(n416), .Z(n268) );
  ANDN U271 ( .B(n268), .A(n487), .Z(n269) );
  NAND U272 ( .A(o[2]), .B(n264), .Z(n270) );
  ANDN U273 ( .B(n270), .A(n269), .Z(n271) );
  NANDN U274 ( .A(n267), .B(n271), .Z(n272) );
  XNOR U275 ( .A(\stack[1][2] ), .B(n415), .Z(n273) );
  ANDN U276 ( .B(n273), .A(n494), .Z(n274) );
  NOR U277 ( .A(n274), .B(n272), .Z(n275) );
  NANDN U278 ( .A(o[2]), .B(n261), .Z(n276) );
  NAND U279 ( .A(n275), .B(n276), .Z(n163) );
  NOR U280 ( .A(opcode[0]), .B(opcode[1]), .Z(n277) );
  NAND U281 ( .A(opcode[2]), .B(n277), .Z(n486) );
  NAND U282 ( .A(\stack[7][0] ), .B(n486), .Z(n279) );
  NANDN U283 ( .A(n486), .B(\stack[6][0] ), .Z(n278) );
  NAND U284 ( .A(n279), .B(n278), .Z(n142) );
  NANDN U285 ( .A(n486), .B(\stack[5][0] ), .Z(n282) );
  ANDN U286 ( .B(opcode[0]), .A(opcode[1]), .Z(n280) );
  ANDN U287 ( .B(n280), .A(opcode[2]), .Z(n495) );
  NOR U288 ( .A(n495), .B(opcode[1]), .Z(n480) );
  NANDN U289 ( .A(n480), .B(\stack[7][0] ), .Z(n281) );
  AND U290 ( .A(n282), .B(n281), .Z(n284) );
  AND U291 ( .A(n480), .B(n486), .Z(n483) );
  NAND U292 ( .A(n483), .B(\stack[6][0] ), .Z(n283) );
  NAND U293 ( .A(n284), .B(n283), .Z(n143) );
  NANDN U294 ( .A(n486), .B(\stack[4][0] ), .Z(n286) );
  NANDN U295 ( .A(n480), .B(\stack[6][0] ), .Z(n285) );
  AND U296 ( .A(n286), .B(n285), .Z(n288) );
  NAND U297 ( .A(n483), .B(\stack[5][0] ), .Z(n287) );
  NAND U298 ( .A(n288), .B(n287), .Z(n144) );
  NANDN U299 ( .A(n486), .B(\stack[3][0] ), .Z(n290) );
  NANDN U300 ( .A(n480), .B(\stack[5][0] ), .Z(n289) );
  AND U301 ( .A(n290), .B(n289), .Z(n292) );
  NAND U302 ( .A(n483), .B(\stack[4][0] ), .Z(n291) );
  NAND U303 ( .A(n292), .B(n291), .Z(n145) );
  NANDN U304 ( .A(n486), .B(\stack[2][0] ), .Z(n294) );
  NANDN U305 ( .A(n480), .B(\stack[4][0] ), .Z(n293) );
  AND U306 ( .A(n294), .B(n293), .Z(n296) );
  NAND U307 ( .A(n483), .B(\stack[3][0] ), .Z(n295) );
  NAND U308 ( .A(n296), .B(n295), .Z(n146) );
  NANDN U309 ( .A(n480), .B(\stack[3][0] ), .Z(n298) );
  NANDN U310 ( .A(n486), .B(\stack[1][0] ), .Z(n297) );
  NAND U311 ( .A(n298), .B(n297), .Z(n300) );
  NAND U312 ( .A(n483), .B(\stack[2][0] ), .Z(n299) );
  NANDN U313 ( .A(n300), .B(n299), .Z(n147) );
  NAND U314 ( .A(\stack[7][2] ), .B(n486), .Z(n302) );
  NANDN U315 ( .A(n486), .B(\stack[6][2] ), .Z(n301) );
  NAND U316 ( .A(n302), .B(n301), .Z(n148) );
  NANDN U317 ( .A(n486), .B(\stack[5][2] ), .Z(n304) );
  NANDN U318 ( .A(n480), .B(\stack[7][2] ), .Z(n303) );
  AND U319 ( .A(n304), .B(n303), .Z(n306) );
  NAND U320 ( .A(n483), .B(\stack[6][2] ), .Z(n305) );
  NAND U321 ( .A(n306), .B(n305), .Z(n149) );
  NANDN U322 ( .A(n486), .B(\stack[4][2] ), .Z(n308) );
  NANDN U323 ( .A(n480), .B(\stack[6][2] ), .Z(n307) );
  AND U324 ( .A(n308), .B(n307), .Z(n310) );
  NAND U325 ( .A(n483), .B(\stack[5][2] ), .Z(n309) );
  NAND U326 ( .A(n310), .B(n309), .Z(n150) );
  NANDN U327 ( .A(n486), .B(\stack[3][2] ), .Z(n312) );
  NANDN U328 ( .A(n480), .B(\stack[5][2] ), .Z(n311) );
  AND U329 ( .A(n312), .B(n311), .Z(n314) );
  NAND U330 ( .A(n483), .B(\stack[4][2] ), .Z(n313) );
  NAND U331 ( .A(n314), .B(n313), .Z(n151) );
  NANDN U332 ( .A(n486), .B(\stack[2][2] ), .Z(n316) );
  NANDN U333 ( .A(n480), .B(\stack[4][2] ), .Z(n315) );
  AND U334 ( .A(n316), .B(n315), .Z(n318) );
  NAND U335 ( .A(n483), .B(\stack[3][2] ), .Z(n317) );
  NAND U336 ( .A(n318), .B(n317), .Z(n152) );
  NANDN U337 ( .A(n480), .B(\stack[3][2] ), .Z(n320) );
  NANDN U338 ( .A(n486), .B(\stack[1][2] ), .Z(n319) );
  NAND U339 ( .A(n320), .B(n319), .Z(n322) );
  NAND U340 ( .A(n483), .B(\stack[2][2] ), .Z(n321) );
  NANDN U341 ( .A(n322), .B(n321), .Z(n153) );
  NAND U342 ( .A(\stack[7][3] ), .B(n486), .Z(n324) );
  NANDN U343 ( .A(n486), .B(\stack[6][3] ), .Z(n323) );
  NAND U344 ( .A(n324), .B(n323), .Z(n154) );
  NANDN U345 ( .A(n486), .B(\stack[5][3] ), .Z(n326) );
  NANDN U346 ( .A(n480), .B(\stack[7][3] ), .Z(n325) );
  AND U347 ( .A(n326), .B(n325), .Z(n328) );
  NAND U348 ( .A(n483), .B(\stack[6][3] ), .Z(n327) );
  NAND U349 ( .A(n328), .B(n327), .Z(n155) );
  NANDN U350 ( .A(n486), .B(\stack[4][3] ), .Z(n330) );
  NANDN U351 ( .A(n480), .B(\stack[6][3] ), .Z(n329) );
  AND U352 ( .A(n330), .B(n329), .Z(n332) );
  NAND U353 ( .A(n483), .B(\stack[5][3] ), .Z(n331) );
  NAND U354 ( .A(n332), .B(n331), .Z(n156) );
  NANDN U355 ( .A(n486), .B(\stack[3][3] ), .Z(n334) );
  NANDN U356 ( .A(n480), .B(\stack[5][3] ), .Z(n333) );
  AND U357 ( .A(n334), .B(n333), .Z(n336) );
  NAND U358 ( .A(n483), .B(\stack[4][3] ), .Z(n335) );
  NAND U359 ( .A(n336), .B(n335), .Z(n157) );
  NANDN U360 ( .A(n486), .B(\stack[2][3] ), .Z(n338) );
  NANDN U361 ( .A(n480), .B(\stack[4][3] ), .Z(n337) );
  AND U362 ( .A(n338), .B(n337), .Z(n340) );
  NAND U363 ( .A(n483), .B(\stack[3][3] ), .Z(n339) );
  NAND U364 ( .A(n340), .B(n339), .Z(n158) );
  NANDN U365 ( .A(n480), .B(\stack[3][3] ), .Z(n342) );
  NANDN U366 ( .A(n486), .B(\stack[1][3] ), .Z(n341) );
  NAND U367 ( .A(n342), .B(n341), .Z(n344) );
  NAND U368 ( .A(n483), .B(\stack[2][3] ), .Z(n343) );
  NANDN U369 ( .A(n344), .B(n343), .Z(n159) );
  NANDN U370 ( .A(n480), .B(\stack[2][3] ), .Z(n346) );
  NANDN U371 ( .A(n486), .B(o[3]), .Z(n345) );
  NAND U372 ( .A(n346), .B(n345), .Z(n348) );
  NAND U373 ( .A(\stack[1][3] ), .B(n483), .Z(n347) );
  NANDN U374 ( .A(n348), .B(n347), .Z(n160) );
  AND U375 ( .A(opcode[2]), .B(opcode[1]), .Z(n502) );
  AND U376 ( .A(n502), .B(\stack[1][3] ), .Z(n350) );
  OR U377 ( .A(opcode[0]), .B(o[3]), .Z(n349) );
  NAND U378 ( .A(n350), .B(n349), .Z(n352) );
  NANDN U379 ( .A(n486), .B(x[3]), .Z(n351) );
  AND U380 ( .A(n352), .B(n351), .Z(n379) );
  ANDN U381 ( .B(opcode[1]), .A(opcode[2]), .Z(n380) );
  NANDN U382 ( .A(opcode[0]), .B(n380), .Z(n494) );
  ANDN U383 ( .B(\stack[1][0] ), .A(N44), .Z(n476) );
  NAND U384 ( .A(n476), .B(\stack[1][1] ), .Z(n355) );
  XOR U385 ( .A(n476), .B(\stack[1][1] ), .Z(n353) );
  NANDN U386 ( .A(o[1]), .B(n353), .Z(n354) );
  NAND U387 ( .A(n355), .B(n354), .Z(n356) );
  NANDN U388 ( .A(o[2]), .B(n356), .Z(n358) );
  XNOR U389 ( .A(o[2]), .B(n356), .Z(n415) );
  NAND U390 ( .A(\stack[1][2] ), .B(n415), .Z(n357) );
  NAND U391 ( .A(n358), .B(n357), .Z(n367) );
  NANDN U392 ( .A(n494), .B(n367), .Z(n366) );
  AND U393 ( .A(N44), .B(\stack[1][0] ), .Z(n456) );
  IV U394 ( .A(o[1]), .Z(n466) );
  NANDN U395 ( .A(\stack[1][1] ), .B(n466), .Z(n359) );
  NAND U396 ( .A(n456), .B(n359), .Z(n360) );
  ANDN U397 ( .B(\stack[1][1] ), .A(n466), .Z(n381) );
  ANDN U398 ( .B(n360), .A(n381), .Z(n361) );
  NANDN U399 ( .A(n361), .B(\stack[1][2] ), .Z(n364) );
  IV U400 ( .A(n361), .Z(n418) );
  NOR U401 ( .A(n418), .B(\stack[1][2] ), .Z(n362) );
  NANDN U402 ( .A(n362), .B(o[2]), .Z(n363) );
  AND U403 ( .A(n364), .B(n363), .Z(n368) );
  NANDN U404 ( .A(n368), .B(n495), .Z(n365) );
  AND U405 ( .A(n366), .B(n365), .Z(n402) );
  NAND U406 ( .A(n402), .B(\stack[1][3] ), .Z(n372) );
  OR U407 ( .A(n494), .B(n367), .Z(n370) );
  IV U408 ( .A(n495), .Z(n458) );
  NANDN U409 ( .A(n458), .B(n368), .Z(n369) );
  AND U410 ( .A(n370), .B(n369), .Z(n401) );
  NANDN U411 ( .A(\stack[1][3] ), .B(n401), .Z(n371) );
  NAND U412 ( .A(n372), .B(n371), .Z(n375) );
  NANDN U413 ( .A(N44), .B(n466), .Z(n419) );
  OR U414 ( .A(o[2]), .B(n419), .Z(n373) );
  ANDN U415 ( .B(n373), .A(opcode[1]), .Z(n405) );
  AND U416 ( .A(opcode[2]), .B(opcode[0]), .Z(n491) );
  NANDN U417 ( .A(n405), .B(n491), .Z(n374) );
  AND U418 ( .A(n375), .B(n374), .Z(n376) );
  NANDN U419 ( .A(opcode[2]), .B(n480), .Z(n490) );
  NAND U420 ( .A(n376), .B(n490), .Z(n377) );
  NAND U421 ( .A(o[3]), .B(n377), .Z(n378) );
  AND U422 ( .A(n379), .B(n378), .Z(n400) );
  NAND U423 ( .A(opcode[0]), .B(n380), .Z(n487) );
  ANDN U424 ( .B(\stack[1][0] ), .A(n466), .Z(n452) );
  AND U425 ( .A(N44), .B(\stack[1][1] ), .Z(n451) );
  AND U426 ( .A(n452), .B(n451), .Z(n382) );
  NAND U427 ( .A(o[2]), .B(\stack[1][0] ), .Z(n383) );
  IV U428 ( .A(n381), .Z(n394) );
  AND U429 ( .A(N44), .B(\stack[1][2] ), .Z(n395) );
  XOR U430 ( .A(n394), .B(n395), .Z(n416) );
  NAND U431 ( .A(n417), .B(n416), .Z(n385) );
  ANDN U432 ( .B(n383), .A(n382), .Z(n384) );
  ANDN U433 ( .B(n385), .A(n384), .Z(n393) );
  AND U434 ( .A(o[3]), .B(\stack[1][0] ), .Z(n387) );
  NANDN U435 ( .A(n466), .B(\stack[1][2] ), .Z(n386) );
  XNOR U436 ( .A(n387), .B(n386), .Z(n391) );
  AND U437 ( .A(\stack[1][1] ), .B(o[2]), .Z(n389) );
  NAND U438 ( .A(\stack[1][3] ), .B(N44), .Z(n388) );
  XNOR U439 ( .A(n389), .B(n388), .Z(n390) );
  XNOR U440 ( .A(n391), .B(n390), .Z(n392) );
  XNOR U441 ( .A(n393), .B(n392), .Z(n397) );
  ANDN U442 ( .B(n395), .A(n394), .Z(n396) );
  XOR U443 ( .A(n397), .B(n396), .Z(n398) );
  NANDN U444 ( .A(n487), .B(n398), .Z(n399) );
  AND U445 ( .A(n400), .B(n399), .Z(n410) );
  NAND U446 ( .A(n401), .B(\stack[1][3] ), .Z(n404) );
  NANDN U447 ( .A(\stack[1][3] ), .B(n402), .Z(n403) );
  NAND U448 ( .A(n404), .B(n403), .Z(n407) );
  IV U449 ( .A(n491), .Z(n463) );
  NANDN U450 ( .A(n463), .B(n405), .Z(n406) );
  NAND U451 ( .A(n407), .B(n406), .Z(n408) );
  NANDN U452 ( .A(o[3]), .B(n408), .Z(n409) );
  NAND U453 ( .A(n410), .B(n409), .Z(n161) );
  NANDN U454 ( .A(n480), .B(\stack[2][2] ), .Z(n412) );
  NANDN U455 ( .A(n486), .B(o[2]), .Z(n411) );
  NAND U456 ( .A(n412), .B(n411), .Z(n414) );
  NAND U457 ( .A(\stack[1][2] ), .B(n483), .Z(n413) );
  NANDN U458 ( .A(n414), .B(n413), .Z(n162) );
  AND U459 ( .A(\stack[1][2] ), .B(n502), .Z(n422) );
  XOR U460 ( .A(\stack[1][2] ), .B(n418), .Z(n423) );
  NANDN U461 ( .A(n423), .B(n495), .Z(n421) );
  ANDN U462 ( .B(n419), .A(opcode[1]), .Z(n424) );
  NANDN U463 ( .A(n424), .B(n491), .Z(n420) );
  NAND U464 ( .A(\stack[7][1] ), .B(n486), .Z(n426) );
  NANDN U465 ( .A(n486), .B(\stack[6][1] ), .Z(n425) );
  NAND U466 ( .A(n426), .B(n425), .Z(n164) );
  NANDN U467 ( .A(n486), .B(\stack[5][1] ), .Z(n428) );
  NANDN U468 ( .A(n480), .B(\stack[7][1] ), .Z(n427) );
  AND U469 ( .A(n428), .B(n427), .Z(n430) );
  NAND U470 ( .A(n483), .B(\stack[6][1] ), .Z(n429) );
  NAND U471 ( .A(n430), .B(n429), .Z(n165) );
  NANDN U472 ( .A(n486), .B(\stack[4][1] ), .Z(n432) );
  NANDN U473 ( .A(n480), .B(\stack[6][1] ), .Z(n431) );
  AND U474 ( .A(n432), .B(n431), .Z(n434) );
  NAND U475 ( .A(n483), .B(\stack[5][1] ), .Z(n433) );
  NAND U476 ( .A(n434), .B(n433), .Z(n166) );
  NANDN U477 ( .A(n486), .B(\stack[3][1] ), .Z(n436) );
  NANDN U478 ( .A(n480), .B(\stack[5][1] ), .Z(n435) );
  AND U479 ( .A(n436), .B(n435), .Z(n438) );
  NAND U480 ( .A(n483), .B(\stack[4][1] ), .Z(n437) );
  NAND U481 ( .A(n438), .B(n437), .Z(n167) );
  NANDN U482 ( .A(n486), .B(\stack[2][1] ), .Z(n440) );
  NANDN U483 ( .A(n480), .B(\stack[4][1] ), .Z(n439) );
  AND U484 ( .A(n440), .B(n439), .Z(n442) );
  NAND U485 ( .A(n483), .B(\stack[3][1] ), .Z(n441) );
  NAND U486 ( .A(n442), .B(n441), .Z(n168) );
  NANDN U487 ( .A(n480), .B(\stack[3][1] ), .Z(n444) );
  NANDN U488 ( .A(n486), .B(\stack[1][1] ), .Z(n443) );
  NAND U489 ( .A(n444), .B(n443), .Z(n446) );
  NAND U490 ( .A(n483), .B(\stack[2][1] ), .Z(n445) );
  NANDN U491 ( .A(n446), .B(n445), .Z(n169) );
  NANDN U492 ( .A(n480), .B(\stack[2][1] ), .Z(n448) );
  OR U493 ( .A(n486), .B(n466), .Z(n447) );
  NAND U494 ( .A(n448), .B(n447), .Z(n450) );
  NAND U495 ( .A(\stack[1][1] ), .B(n483), .Z(n449) );
  NANDN U496 ( .A(n450), .B(n449), .Z(n170) );
  XOR U497 ( .A(n452), .B(n451), .Z(n453) );
  ANDN U498 ( .B(n453), .A(n487), .Z(n472) );
  AND U499 ( .A(\stack[1][1] ), .B(n502), .Z(n455) );
  NANDN U500 ( .A(opcode[0]), .B(n466), .Z(n454) );
  AND U501 ( .A(n455), .B(n454), .Z(n460) );
  XOR U502 ( .A(\stack[1][1] ), .B(o[1]), .Z(n475) );
  XOR U503 ( .A(n475), .B(n456), .Z(n457) );
  NANDN U504 ( .A(n458), .B(n457), .Z(n459) );
  NANDN U505 ( .A(n460), .B(n459), .Z(n470) );
  ANDN U506 ( .B(N44), .A(opcode[1]), .Z(n464) );
  NANDN U507 ( .A(n464), .B(n491), .Z(n461) );
  AND U508 ( .A(n490), .B(n461), .Z(n462) );
  OR U509 ( .A(n462), .B(n466), .Z(n468) );
  ANDN U510 ( .B(n464), .A(n463), .Z(n465) );
  NAND U511 ( .A(n466), .B(n465), .Z(n467) );
  AND U512 ( .A(n468), .B(n467), .Z(n469) );
  NANDN U513 ( .A(n470), .B(n469), .Z(n471) );
  NOR U514 ( .A(n472), .B(n471), .Z(n474) );
  NANDN U515 ( .A(n486), .B(x[1]), .Z(n473) );
  NAND U516 ( .A(n474), .B(n473), .Z(n479) );
  XOR U517 ( .A(n476), .B(n475), .Z(n477) );
  NANDN U518 ( .A(n494), .B(n477), .Z(n478) );
  NANDN U519 ( .A(n479), .B(n478), .Z(n171) );
  NANDN U520 ( .A(n480), .B(\stack[2][0] ), .Z(n482) );
  NANDN U521 ( .A(n486), .B(N44), .Z(n481) );
  NAND U522 ( .A(n482), .B(n481), .Z(n485) );
  NAND U523 ( .A(\stack[1][0] ), .B(n483), .Z(n484) );
  NANDN U524 ( .A(n485), .B(n484), .Z(n172) );
  NANDN U525 ( .A(n486), .B(x[0]), .Z(n501) );
  NANDN U526 ( .A(n502), .B(n487), .Z(n488) );
  NAND U527 ( .A(\stack[1][0] ), .B(n488), .Z(n489) );
  NAND U528 ( .A(n490), .B(n489), .Z(n492) );
  OR U529 ( .A(n492), .B(n491), .Z(n493) );
  NAND U530 ( .A(N44), .B(n493), .Z(n499) );
  NANDN U531 ( .A(n495), .B(n494), .Z(n497) );
  XOR U532 ( .A(N44), .B(\stack[1][0] ), .Z(n496) );
  NAND U533 ( .A(n497), .B(n496), .Z(n498) );
  NAND U534 ( .A(n499), .B(n498), .Z(n500) );
  ANDN U535 ( .B(n501), .A(n500), .Z(n505) );
  AND U536 ( .A(n502), .B(opcode[0]), .Z(n503) );
  NAND U537 ( .A(\stack[1][0] ), .B(n503), .Z(n504) );
  NAND U538 ( .A(n505), .B(n504), .Z(n173) );
endmodule

