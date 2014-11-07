
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
         \stack[1][3] , \stack[1][2] , \stack[1][1] , \stack[1][0] , N44, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516;
  assign o[0] = N44;

  DFF \stack_reg[0][0]  ( .D(n178), .CLK(clk), .RST(rst), .Q(N44) );
  DFF \stack_reg[1][0]  ( .D(n177), .CLK(clk), .RST(rst), .Q(\stack[1][0] ) );
  DFF \stack_reg[0][1]  ( .D(n176), .CLK(clk), .RST(rst), .Q(o[1]) );
  DFF \stack_reg[1][1]  ( .D(n175), .CLK(clk), .RST(rst), .Q(\stack[1][1] ) );
  DFF \stack_reg[2][1]  ( .D(n174), .CLK(clk), .RST(rst), .Q(\stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n173), .CLK(clk), .RST(rst), .Q(\stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n172), .CLK(clk), .RST(rst), .Q(\stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n171), .CLK(clk), .RST(rst), .Q(\stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n170), .CLK(clk), .RST(rst), .Q(\stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n169), .CLK(clk), .RST(rst), .Q(\stack[7][1] ) );
  DFF \stack_reg[0][2]  ( .D(n168), .CLK(clk), .RST(rst), .Q(o[2]) );
  DFF \stack_reg[1][2]  ( .D(n167), .CLK(clk), .RST(rst), .Q(\stack[1][2] ) );
  DFF \stack_reg[2][2]  ( .D(n166), .CLK(clk), .RST(rst), .Q(\stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n165), .CLK(clk), .RST(rst), .Q(\stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n164), .CLK(clk), .RST(rst), .Q(\stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n163), .CLK(clk), .RST(rst), .Q(\stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n162), .CLK(clk), .RST(rst), .Q(\stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n161), .CLK(clk), .RST(rst), .Q(\stack[7][2] ) );
  DFF \stack_reg[0][3]  ( .D(n160), .CLK(clk), .RST(rst), .Q(o[3]) );
  DFF \stack_reg[1][3]  ( .D(n159), .CLK(clk), .RST(rst), .Q(\stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n158), .CLK(clk), .RST(rst), .Q(\stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n157), .CLK(clk), .RST(rst), .Q(\stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n156), .CLK(clk), .RST(rst), .Q(\stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n155), .CLK(clk), .RST(rst), .Q(\stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n154), .CLK(clk), .RST(rst), .Q(\stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n153), .CLK(clk), .RST(rst), .Q(\stack[7][3] ) );
  DFF \stack_reg[2][0]  ( .D(n152), .CLK(clk), .RST(rst), .Q(\stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n151), .CLK(clk), .RST(rst), .Q(\stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n150), .CLK(clk), .RST(rst), .Q(\stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n149), .CLK(clk), .RST(rst), .Q(\stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n148), .CLK(clk), .RST(rst), .Q(\stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n147), .CLK(clk), .RST(rst), .Q(\stack[7][0] ) );
  AND U262 ( .A(n331), .B(n318), .Z(n261) );
  AND U263 ( .A(n416), .B(n413), .Z(n262) );
  XNOR U264 ( .A(n261), .B(n262), .Z(n263) );
  XOR U265 ( .A(n416), .B(n413), .Z(n264) );
  NANDN U266 ( .A(n414), .B(n264), .Z(n265) );
  NAND U267 ( .A(n263), .B(n265), .Z(n322) );
  NAND U268 ( .A(n343), .B(n505), .Z(n266) );
  NANDN U269 ( .A(n342), .B(n504), .Z(n267) );
  AND U270 ( .A(n266), .B(n267), .Z(n362) );
  IV U271 ( .A(opcode[0]), .Z(n328) );
  IV U272 ( .A(opcode[2]), .Z(n352) );
  ANDN U273 ( .B(n328), .A(n352), .Z(n268) );
  ANDN U274 ( .B(n268), .A(opcode[1]), .Z(n427) );
  IV U275 ( .A(n427), .Z(n511) );
  NANDN U276 ( .A(n511), .B(\stack[6][0] ), .Z(n270) );
  NANDN U277 ( .A(n427), .B(\stack[7][0] ), .Z(n269) );
  NAND U278 ( .A(n270), .B(n269), .Z(n147) );
  NANDN U279 ( .A(n511), .B(\stack[5][0] ), .Z(n273) );
  ANDN U280 ( .B(n352), .A(n328), .Z(n271) );
  ANDN U281 ( .B(n271), .A(opcode[1]), .Z(n505) );
  NOR U282 ( .A(opcode[1]), .B(n505), .Z(n489) );
  NANDN U283 ( .A(n489), .B(\stack[7][0] ), .Z(n272) );
  NAND U284 ( .A(n273), .B(n272), .Z(n275) );
  NANDN U285 ( .A(n427), .B(n489), .Z(n492) );
  NANDN U286 ( .A(n492), .B(\stack[6][0] ), .Z(n274) );
  NANDN U287 ( .A(n275), .B(n274), .Z(n148) );
  NANDN U288 ( .A(n511), .B(\stack[4][0] ), .Z(n277) );
  NANDN U289 ( .A(n489), .B(\stack[6][0] ), .Z(n276) );
  AND U290 ( .A(n277), .B(n276), .Z(n279) );
  NANDN U291 ( .A(n492), .B(\stack[5][0] ), .Z(n278) );
  NAND U292 ( .A(n279), .B(n278), .Z(n149) );
  NANDN U293 ( .A(n511), .B(\stack[3][0] ), .Z(n281) );
  NANDN U294 ( .A(n489), .B(\stack[5][0] ), .Z(n280) );
  AND U295 ( .A(n281), .B(n280), .Z(n283) );
  NANDN U296 ( .A(n492), .B(\stack[4][0] ), .Z(n282) );
  NAND U297 ( .A(n283), .B(n282), .Z(n150) );
  NANDN U298 ( .A(n511), .B(\stack[2][0] ), .Z(n285) );
  NANDN U299 ( .A(n489), .B(\stack[4][0] ), .Z(n284) );
  AND U300 ( .A(n285), .B(n284), .Z(n287) );
  NANDN U301 ( .A(n492), .B(\stack[3][0] ), .Z(n286) );
  NAND U302 ( .A(n287), .B(n286), .Z(n151) );
  NANDN U303 ( .A(n511), .B(\stack[1][0] ), .Z(n289) );
  NANDN U304 ( .A(n489), .B(\stack[3][0] ), .Z(n288) );
  AND U305 ( .A(n289), .B(n288), .Z(n291) );
  NANDN U306 ( .A(n492), .B(\stack[2][0] ), .Z(n290) );
  NAND U307 ( .A(n291), .B(n290), .Z(n152) );
  NANDN U308 ( .A(n511), .B(\stack[6][3] ), .Z(n293) );
  NANDN U309 ( .A(n427), .B(\stack[7][3] ), .Z(n292) );
  NAND U310 ( .A(n293), .B(n292), .Z(n153) );
  NANDN U311 ( .A(n511), .B(\stack[5][3] ), .Z(n295) );
  NANDN U312 ( .A(n489), .B(\stack[7][3] ), .Z(n294) );
  AND U313 ( .A(n295), .B(n294), .Z(n297) );
  NANDN U314 ( .A(n492), .B(\stack[6][3] ), .Z(n296) );
  NAND U315 ( .A(n297), .B(n296), .Z(n154) );
  NANDN U316 ( .A(n511), .B(\stack[4][3] ), .Z(n299) );
  NANDN U317 ( .A(n489), .B(\stack[6][3] ), .Z(n298) );
  AND U318 ( .A(n299), .B(n298), .Z(n301) );
  NANDN U319 ( .A(n492), .B(\stack[5][3] ), .Z(n300) );
  NAND U320 ( .A(n301), .B(n300), .Z(n155) );
  NANDN U321 ( .A(n511), .B(\stack[3][3] ), .Z(n303) );
  NANDN U322 ( .A(n489), .B(\stack[5][3] ), .Z(n302) );
  AND U323 ( .A(n303), .B(n302), .Z(n305) );
  NANDN U324 ( .A(n492), .B(\stack[4][3] ), .Z(n304) );
  NAND U325 ( .A(n305), .B(n304), .Z(n156) );
  NANDN U326 ( .A(n511), .B(\stack[2][3] ), .Z(n307) );
  NANDN U327 ( .A(n489), .B(\stack[4][3] ), .Z(n306) );
  AND U328 ( .A(n307), .B(n306), .Z(n309) );
  NANDN U329 ( .A(n492), .B(\stack[3][3] ), .Z(n308) );
  NAND U330 ( .A(n309), .B(n308), .Z(n157) );
  NANDN U331 ( .A(n511), .B(\stack[1][3] ), .Z(n311) );
  NANDN U332 ( .A(n489), .B(\stack[3][3] ), .Z(n310) );
  AND U333 ( .A(n311), .B(n310), .Z(n313) );
  NANDN U334 ( .A(n492), .B(\stack[2][3] ), .Z(n312) );
  NAND U335 ( .A(n313), .B(n312), .Z(n158) );
  NANDN U336 ( .A(n511), .B(o[3]), .Z(n315) );
  NANDN U337 ( .A(n489), .B(\stack[2][3] ), .Z(n314) );
  AND U338 ( .A(n315), .B(n314), .Z(n317) );
  IV U339 ( .A(\stack[1][3] ), .Z(n361) );
  OR U340 ( .A(n492), .B(n361), .Z(n316) );
  NAND U341 ( .A(n317), .B(n316), .Z(n159) );
  IV U342 ( .A(opcode[1]), .Z(n359) );
  NANDN U343 ( .A(n359), .B(n352), .Z(n341) );
  NOR U344 ( .A(n328), .B(n341), .Z(n496) );
  IV U345 ( .A(\stack[1][1] ), .Z(n452) );
  ANDN U346 ( .B(o[2]), .A(n452), .Z(n324) );
  ANDN U347 ( .B(o[1]), .A(n452), .Z(n331) );
  IV U348 ( .A(N44), .Z(n506) );
  ANDN U349 ( .B(\stack[1][2] ), .A(n506), .Z(n318) );
  AND U350 ( .A(N44), .B(\stack[1][1] ), .Z(n476) );
  NAND U351 ( .A(\stack[1][0] ), .B(o[1]), .Z(n457) );
  ANDN U352 ( .B(n476), .A(n457), .Z(n413) );
  IV U353 ( .A(o[2]), .Z(n408) );
  ANDN U354 ( .B(\stack[1][0] ), .A(n408), .Z(n416) );
  XNOR U355 ( .A(n331), .B(n318), .Z(n414) );
  IV U356 ( .A(\stack[1][0] ), .Z(n498) );
  ANDN U357 ( .B(o[3]), .A(n498), .Z(n320) );
  IV U358 ( .A(o[1]), .Z(n484) );
  NANDN U359 ( .A(n484), .B(\stack[1][2] ), .Z(n319) );
  XNOR U360 ( .A(n320), .B(n319), .Z(n321) );
  XOR U361 ( .A(n322), .B(n321), .Z(n323) );
  XNOR U362 ( .A(n324), .B(n323), .Z(n326) );
  ANDN U363 ( .B(N44), .A(n361), .Z(n325) );
  XNOR U364 ( .A(n326), .B(n325), .Z(n327) );
  AND U365 ( .A(n496), .B(n327), .Z(n358) );
  NANDN U366 ( .A(n511), .B(x[3]), .Z(n330) );
  NOR U367 ( .A(n352), .B(n328), .Z(n502) );
  IV U368 ( .A(n502), .Z(n473) );
  NOR U369 ( .A(n359), .B(n473), .Z(n480) );
  IV U370 ( .A(n480), .Z(n512) );
  NANDN U371 ( .A(n512), .B(\stack[1][3] ), .Z(n329) );
  NAND U372 ( .A(n330), .B(n329), .Z(n356) );
  NANDN U373 ( .A(n498), .B(N44), .Z(n465) );
  XOR U374 ( .A(n484), .B(n452), .Z(n470) );
  NANDN U375 ( .A(n465), .B(n470), .Z(n332) );
  ANDN U376 ( .B(n332), .A(n331), .Z(n397) );
  XNOR U377 ( .A(\stack[1][2] ), .B(n408), .Z(n423) );
  NANDN U378 ( .A(n397), .B(n423), .Z(n334) );
  NANDN U379 ( .A(n408), .B(\stack[1][2] ), .Z(n333) );
  AND U380 ( .A(n334), .B(n333), .Z(n343) );
  NANDN U381 ( .A(o[2]), .B(\stack[1][2] ), .Z(n340) );
  NOR U382 ( .A(n408), .B(\stack[1][2] ), .Z(n338) );
  AND U383 ( .A(\stack[1][0] ), .B(n506), .Z(n469) );
  OR U384 ( .A(n469), .B(n484), .Z(n337) );
  XOR U385 ( .A(n469), .B(n484), .Z(n335) );
  NANDN U386 ( .A(\stack[1][1] ), .B(n335), .Z(n336) );
  AND U387 ( .A(n337), .B(n336), .Z(n422) );
  NANDN U388 ( .A(n338), .B(n422), .Z(n339) );
  NAND U389 ( .A(n340), .B(n339), .Z(n342) );
  NOR U390 ( .A(opcode[0]), .B(n341), .Z(n504) );
  OR U391 ( .A(n362), .B(\stack[1][3] ), .Z(n348) );
  NOR U392 ( .A(n359), .B(n352), .Z(n495) );
  NAND U393 ( .A(n342), .B(n504), .Z(n345) );
  NANDN U394 ( .A(n343), .B(n505), .Z(n344) );
  AND U395 ( .A(n345), .B(n344), .Z(n363) );
  NANDN U396 ( .A(n495), .B(n363), .Z(n346) );
  NANDN U397 ( .A(n361), .B(n346), .Z(n347) );
  NAND U398 ( .A(n348), .B(n347), .Z(n351) );
  ANDN U399 ( .B(n506), .A(o[1]), .Z(n402) );
  AND U400 ( .A(n402), .B(n408), .Z(n360) );
  OR U401 ( .A(n360), .B(opcode[1]), .Z(n349) );
  NANDN U402 ( .A(n473), .B(n349), .Z(n350) );
  NANDN U403 ( .A(n351), .B(n350), .Z(n353) );
  NAND U404 ( .A(n352), .B(n489), .Z(n500) );
  NANDN U405 ( .A(n353), .B(n500), .Z(n354) );
  NAND U406 ( .A(o[3]), .B(n354), .Z(n355) );
  NANDN U407 ( .A(n356), .B(n355), .Z(n357) );
  NOR U408 ( .A(n358), .B(n357), .Z(n370) );
  AND U409 ( .A(n359), .B(n502), .Z(n461) );
  ANDN U410 ( .B(n461), .A(n360), .Z(n367) );
  OR U411 ( .A(n362), .B(n361), .Z(n365) );
  OR U412 ( .A(n363), .B(\stack[1][3] ), .Z(n364) );
  AND U413 ( .A(n365), .B(n364), .Z(n366) );
  NANDN U414 ( .A(n367), .B(n366), .Z(n368) );
  NANDN U415 ( .A(o[3]), .B(n368), .Z(n369) );
  NAND U416 ( .A(n370), .B(n369), .Z(n160) );
  NANDN U417 ( .A(n511), .B(\stack[6][2] ), .Z(n372) );
  NANDN U418 ( .A(n427), .B(\stack[7][2] ), .Z(n371) );
  NAND U419 ( .A(n372), .B(n371), .Z(n161) );
  NANDN U420 ( .A(n511), .B(\stack[5][2] ), .Z(n374) );
  NANDN U421 ( .A(n489), .B(\stack[7][2] ), .Z(n373) );
  AND U422 ( .A(n374), .B(n373), .Z(n376) );
  NANDN U423 ( .A(n492), .B(\stack[6][2] ), .Z(n375) );
  NAND U424 ( .A(n376), .B(n375), .Z(n162) );
  NANDN U425 ( .A(n511), .B(\stack[4][2] ), .Z(n378) );
  NANDN U426 ( .A(n489), .B(\stack[6][2] ), .Z(n377) );
  AND U427 ( .A(n378), .B(n377), .Z(n380) );
  NANDN U428 ( .A(n492), .B(\stack[5][2] ), .Z(n379) );
  NAND U429 ( .A(n380), .B(n379), .Z(n163) );
  NANDN U430 ( .A(n511), .B(\stack[3][2] ), .Z(n382) );
  NANDN U431 ( .A(n489), .B(\stack[5][2] ), .Z(n381) );
  AND U432 ( .A(n382), .B(n381), .Z(n384) );
  NANDN U433 ( .A(n492), .B(\stack[4][2] ), .Z(n383) );
  NAND U434 ( .A(n384), .B(n383), .Z(n164) );
  NANDN U435 ( .A(n511), .B(\stack[2][2] ), .Z(n386) );
  NANDN U436 ( .A(n489), .B(\stack[4][2] ), .Z(n385) );
  AND U437 ( .A(n386), .B(n385), .Z(n388) );
  NANDN U438 ( .A(n492), .B(\stack[3][2] ), .Z(n387) );
  NAND U439 ( .A(n388), .B(n387), .Z(n165) );
  NANDN U440 ( .A(n511), .B(\stack[1][2] ), .Z(n390) );
  NANDN U441 ( .A(n489), .B(\stack[3][2] ), .Z(n389) );
  AND U442 ( .A(n390), .B(n389), .Z(n392) );
  NANDN U443 ( .A(n492), .B(\stack[2][2] ), .Z(n391) );
  NAND U444 ( .A(n392), .B(n391), .Z(n166) );
  NANDN U445 ( .A(n511), .B(o[2]), .Z(n394) );
  NANDN U446 ( .A(n489), .B(\stack[2][2] ), .Z(n393) );
  AND U447 ( .A(n394), .B(n393), .Z(n396) );
  NANDN U448 ( .A(n492), .B(\stack[1][2] ), .Z(n395) );
  NAND U449 ( .A(n396), .B(n395), .Z(n167) );
  XNOR U450 ( .A(n397), .B(n423), .Z(n398) );
  NAND U451 ( .A(n398), .B(n505), .Z(n421) );
  NANDN U452 ( .A(n402), .B(n461), .Z(n399) );
  OR U453 ( .A(n399), .B(o[2]), .Z(n401) );
  NANDN U454 ( .A(n512), .B(\stack[1][2] ), .Z(n400) );
  AND U455 ( .A(n401), .B(n400), .Z(n410) );
  ANDN U456 ( .B(n500), .A(n480), .Z(n406) );
  IV U457 ( .A(n495), .Z(n472) );
  NANDN U458 ( .A(n472), .B(\stack[1][2] ), .Z(n404) );
  NANDN U459 ( .A(n473), .B(n402), .Z(n403) );
  AND U460 ( .A(n404), .B(n403), .Z(n405) );
  NAND U461 ( .A(n406), .B(n405), .Z(n407) );
  NANDN U462 ( .A(n408), .B(n407), .Z(n409) );
  AND U463 ( .A(n410), .B(n409), .Z(n412) );
  NANDN U464 ( .A(n511), .B(x[2]), .Z(n411) );
  AND U465 ( .A(n412), .B(n411), .Z(n419) );
  XOR U466 ( .A(n414), .B(n413), .Z(n415) );
  XOR U467 ( .A(n416), .B(n415), .Z(n417) );
  NANDN U468 ( .A(n417), .B(n496), .Z(n418) );
  AND U469 ( .A(n419), .B(n418), .Z(n420) );
  NAND U470 ( .A(n421), .B(n420), .Z(n426) );
  XOR U471 ( .A(n423), .B(n422), .Z(n424) );
  NAND U472 ( .A(n424), .B(n504), .Z(n425) );
  NANDN U473 ( .A(n426), .B(n425), .Z(n168) );
  NANDN U474 ( .A(n511), .B(\stack[6][1] ), .Z(n429) );
  NANDN U475 ( .A(n427), .B(\stack[7][1] ), .Z(n428) );
  NAND U476 ( .A(n429), .B(n428), .Z(n169) );
  NANDN U477 ( .A(n511), .B(\stack[5][1] ), .Z(n431) );
  NANDN U478 ( .A(n489), .B(\stack[7][1] ), .Z(n430) );
  AND U479 ( .A(n431), .B(n430), .Z(n433) );
  NANDN U480 ( .A(n492), .B(\stack[6][1] ), .Z(n432) );
  NAND U481 ( .A(n433), .B(n432), .Z(n170) );
  NANDN U482 ( .A(n511), .B(\stack[4][1] ), .Z(n435) );
  NANDN U483 ( .A(n489), .B(\stack[6][1] ), .Z(n434) );
  AND U484 ( .A(n435), .B(n434), .Z(n437) );
  NANDN U485 ( .A(n492), .B(\stack[5][1] ), .Z(n436) );
  NAND U486 ( .A(n437), .B(n436), .Z(n171) );
  NANDN U487 ( .A(n511), .B(\stack[3][1] ), .Z(n439) );
  NANDN U488 ( .A(n489), .B(\stack[5][1] ), .Z(n438) );
  AND U489 ( .A(n439), .B(n438), .Z(n441) );
  NANDN U490 ( .A(n492), .B(\stack[4][1] ), .Z(n440) );
  NAND U491 ( .A(n441), .B(n440), .Z(n172) );
  NANDN U492 ( .A(n511), .B(\stack[2][1] ), .Z(n443) );
  NANDN U493 ( .A(n489), .B(\stack[4][1] ), .Z(n442) );
  AND U494 ( .A(n443), .B(n442), .Z(n445) );
  NANDN U495 ( .A(n492), .B(\stack[3][1] ), .Z(n444) );
  NAND U496 ( .A(n445), .B(n444), .Z(n173) );
  NANDN U497 ( .A(n511), .B(\stack[1][1] ), .Z(n447) );
  NANDN U498 ( .A(n489), .B(\stack[3][1] ), .Z(n446) );
  AND U499 ( .A(n447), .B(n446), .Z(n449) );
  NANDN U500 ( .A(n492), .B(\stack[2][1] ), .Z(n448) );
  NAND U501 ( .A(n449), .B(n448), .Z(n174) );
  NANDN U502 ( .A(n511), .B(o[1]), .Z(n451) );
  NANDN U503 ( .A(n489), .B(\stack[2][1] ), .Z(n450) );
  AND U504 ( .A(n451), .B(n450), .Z(n454) );
  OR U505 ( .A(n492), .B(n452), .Z(n453) );
  NAND U506 ( .A(n454), .B(n453), .Z(n175) );
  NANDN U507 ( .A(n511), .B(x[1]), .Z(n456) );
  NANDN U508 ( .A(n512), .B(\stack[1][1] ), .Z(n455) );
  AND U509 ( .A(n456), .B(n455), .Z(n460) );
  AND U510 ( .A(n457), .B(n476), .Z(n458) );
  NAND U511 ( .A(n458), .B(n496), .Z(n459) );
  AND U512 ( .A(n460), .B(n459), .Z(n464) );
  ANDN U513 ( .B(n461), .A(o[1]), .Z(n462) );
  NANDN U514 ( .A(n506), .B(n462), .Z(n463) );
  AND U515 ( .A(n464), .B(n463), .Z(n468) );
  XNOR U516 ( .A(n470), .B(n465), .Z(n466) );
  NAND U517 ( .A(n466), .B(n505), .Z(n467) );
  AND U518 ( .A(n468), .B(n467), .Z(n488) );
  XOR U519 ( .A(n470), .B(n469), .Z(n471) );
  NAND U520 ( .A(n471), .B(n504), .Z(n486) );
  NANDN U521 ( .A(n472), .B(\stack[1][1] ), .Z(n475) );
  NANDN U522 ( .A(n473), .B(n506), .Z(n474) );
  AND U523 ( .A(n475), .B(n474), .Z(n479) );
  ANDN U524 ( .B(n496), .A(n476), .Z(n477) );
  NANDN U525 ( .A(n498), .B(n477), .Z(n478) );
  AND U526 ( .A(n479), .B(n478), .Z(n481) );
  ANDN U527 ( .B(n481), .A(n480), .Z(n482) );
  NAND U528 ( .A(n482), .B(n500), .Z(n483) );
  NANDN U529 ( .A(n484), .B(n483), .Z(n485) );
  AND U530 ( .A(n486), .B(n485), .Z(n487) );
  NAND U531 ( .A(n488), .B(n487), .Z(n176) );
  NANDN U532 ( .A(n511), .B(N44), .Z(n491) );
  NANDN U533 ( .A(n489), .B(\stack[2][0] ), .Z(n490) );
  AND U534 ( .A(n491), .B(n490), .Z(n494) );
  OR U535 ( .A(n492), .B(n498), .Z(n493) );
  NAND U536 ( .A(n494), .B(n493), .Z(n177) );
  OR U537 ( .A(n496), .B(n495), .Z(n497) );
  NANDN U538 ( .A(n498), .B(n497), .Z(n499) );
  AND U539 ( .A(n500), .B(n499), .Z(n501) );
  NANDN U540 ( .A(n502), .B(n501), .Z(n503) );
  NANDN U541 ( .A(n506), .B(n503), .Z(n510) );
  OR U542 ( .A(n505), .B(n504), .Z(n508) );
  XNOR U543 ( .A(n506), .B(\stack[1][0] ), .Z(n507) );
  NAND U544 ( .A(n508), .B(n507), .Z(n509) );
  NAND U545 ( .A(n510), .B(n509), .Z(n516) );
  NANDN U546 ( .A(n511), .B(x[0]), .Z(n514) );
  NANDN U547 ( .A(n512), .B(\stack[1][0] ), .Z(n513) );
  AND U548 ( .A(n514), .B(n513), .Z(n515) );
  NANDN U549 ( .A(n516), .B(n515), .Z(n178) );
endmodule

