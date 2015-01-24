
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
         \stack[1][3] , \stack[1][2] , \stack[1][1] , \stack[1][0] ,
         \stack[0][3] , \stack[0][2] , \stack[0][1] , \stack[0][0] , n298,
         n305, n312, n319, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666;

  DFF \stack_reg[0][0]  ( .D(o[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][0] ) );
  DFF \stack_reg[1][0]  ( .D(n356), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][0] ) );
  DFF \stack_reg[0][1]  ( .D(o[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][1] ) );
  DFF \stack_reg[1][1]  ( .D(n355), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][1] ) );
  DFF \stack_reg[0][2]  ( .D(o[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][2] ) );
  DFF \stack_reg[1][2]  ( .D(n354), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][2] ) );
  DFF \stack_reg[0][3]  ( .D(o[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][3] ) );
  DFF \stack_reg[1][3]  ( .D(n353), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n349), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n345), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n341), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n337), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n333), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n319), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][3] ) );
  DFF \stack_reg[2][2]  ( .D(n350), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n346), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n342), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n338), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n334), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n312), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][2] ) );
  DFF \stack_reg[2][1]  ( .D(n351), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n347), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n343), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n339), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n335), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n305), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][1] ) );
  DFF \stack_reg[2][0]  ( .D(n352), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n348), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n344), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n340), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n336), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n298), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][0] ) );
  XNOR U347 ( .A(\stack[1][3] ), .B(\stack[0][3] ), .Z(n373) );
  OR U348 ( .A(\stack[0][3] ), .B(\stack[1][3] ), .Z(n399) );
  OR U349 ( .A(\stack[0][2] ), .B(\stack[1][2] ), .Z(n440) );
  NANDN U350 ( .A(n477), .B(n415), .Z(n479) );
  NAND U351 ( .A(n357), .B(n358), .Z(o[3]) );
  NAND U352 ( .A(n359), .B(n360), .Z(n358) );
  NAND U353 ( .A(n361), .B(n362), .Z(n359) );
  AND U354 ( .A(n363), .B(n364), .Z(n362) );
  NANDN U355 ( .A(n365), .B(\stack[0][3] ), .Z(n364) );
  AND U356 ( .A(n366), .B(n367), .Z(n363) );
  NAND U357 ( .A(n368), .B(n369), .Z(n367) );
  AND U358 ( .A(n370), .B(n371), .Z(n368) );
  NANDN U359 ( .A(n372), .B(n373), .Z(n371) );
  NAND U360 ( .A(n374), .B(n372), .Z(n370) );
  XOR U361 ( .A(n375), .B(n376), .Z(n372) );
  XOR U362 ( .A(n377), .B(n378), .Z(n376) );
  NAND U363 ( .A(\stack[1][1] ), .B(\stack[0][2] ), .Z(n378) );
  AND U364 ( .A(n379), .B(\stack[1][2] ), .Z(n377) );
  AND U365 ( .A(n380), .B(\stack[0][0] ), .Z(n379) );
  XOR U366 ( .A(n381), .B(n382), .Z(n375) );
  XOR U367 ( .A(n383), .B(n384), .Z(n382) );
  AND U368 ( .A(\stack[0][1] ), .B(\stack[1][2] ), .Z(n384) );
  AND U369 ( .A(n385), .B(n386), .Z(n383) );
  NANDN U370 ( .A(n387), .B(n388), .Z(n386) );
  OR U371 ( .A(n389), .B(n390), .Z(n388) );
  AND U372 ( .A(n391), .B(n392), .Z(n385) );
  NAND U373 ( .A(\stack[0][3] ), .B(n393), .Z(n392) );
  NAND U374 ( .A(n390), .B(n389), .Z(n391) );
  AND U375 ( .A(n394), .B(\stack[1][3] ), .Z(n381) );
  XOR U376 ( .A(\stack[1][3] ), .B(\stack[0][3] ), .Z(n374) );
  NAND U377 ( .A(n395), .B(n396), .Z(n366) );
  AND U378 ( .A(\stack[1][3] ), .B(\stack[0][3] ), .Z(n395) );
  AND U379 ( .A(n397), .B(n398), .Z(n361) );
  NAND U380 ( .A(n399), .B(n400), .Z(n398) );
  XOR U381 ( .A(n401), .B(n402), .Z(n397) );
  XOR U382 ( .A(n403), .B(n404), .Z(n402) );
  NAND U383 ( .A(n405), .B(n406), .Z(n404) );
  NANDN U384 ( .A(n407), .B(n408), .Z(n406) );
  OR U385 ( .A(n409), .B(n410), .Z(n408) );
  NAND U386 ( .A(n409), .B(n410), .Z(n405) );
  AND U387 ( .A(n411), .B(n412), .Z(n403) );
  NAND U388 ( .A(\stack[0][3] ), .B(n413), .Z(n412) );
  NAND U389 ( .A(\stack[0][3] ), .B(n414), .Z(n411) );
  XOR U390 ( .A(n415), .B(n416), .Z(n401) );
  AND U391 ( .A(n417), .B(n418), .Z(n416) );
  NAND U392 ( .A(\stack[1][3] ), .B(n414), .Z(n418) );
  AND U393 ( .A(n419), .B(n420), .Z(n417) );
  NAND U394 ( .A(\stack[0][3] ), .B(n421), .Z(n420) );
  NAND U395 ( .A(\stack[1][3] ), .B(n413), .Z(n419) );
  NAND U396 ( .A(n422), .B(x[3]), .Z(n357) );
  NAND U397 ( .A(n423), .B(n424), .Z(o[2]) );
  NAND U398 ( .A(n425), .B(n360), .Z(n424) );
  NAND U399 ( .A(n426), .B(n427), .Z(n425) );
  AND U400 ( .A(n428), .B(n429), .Z(n427) );
  NANDN U401 ( .A(n365), .B(\stack[0][2] ), .Z(n429) );
  AND U402 ( .A(n430), .B(n431), .Z(n428) );
  NAND U403 ( .A(n432), .B(n369), .Z(n431) );
  XOR U404 ( .A(n390), .B(n433), .Z(n432) );
  XNOR U405 ( .A(n389), .B(n387), .Z(n433) );
  NAND U406 ( .A(\stack[1][0] ), .B(\stack[0][2] ), .Z(n387) );
  ANDN U407 ( .B(n380), .A(n434), .Z(n389) );
  XNOR U408 ( .A(n380), .B(n435), .Z(n390) );
  NAND U409 ( .A(\stack[0][0] ), .B(\stack[1][2] ), .Z(n435) );
  ANDN U410 ( .B(\stack[1][1] ), .A(n436), .Z(n380) );
  NAND U411 ( .A(n437), .B(n396), .Z(n430) );
  AND U412 ( .A(\stack[0][2] ), .B(\stack[1][2] ), .Z(n437) );
  AND U413 ( .A(n438), .B(n439), .Z(n426) );
  NAND U414 ( .A(n440), .B(n400), .Z(n439) );
  XOR U415 ( .A(n410), .B(n441), .Z(n438) );
  XOR U416 ( .A(n409), .B(n407), .Z(n441) );
  AND U417 ( .A(n442), .B(n443), .Z(n407) );
  NAND U418 ( .A(n414), .B(\stack[0][2] ), .Z(n443) );
  NAND U419 ( .A(\stack[0][2] ), .B(n413), .Z(n442) );
  NAND U420 ( .A(n444), .B(n445), .Z(n409) );
  NANDN U421 ( .A(n446), .B(n447), .Z(n445) );
  OR U422 ( .A(n448), .B(n449), .Z(n447) );
  NAND U423 ( .A(n448), .B(n449), .Z(n444) );
  XOR U424 ( .A(n450), .B(n451), .Z(n410) );
  NAND U425 ( .A(n452), .B(n453), .Z(n451) );
  NAND U426 ( .A(\stack[1][2] ), .B(n414), .Z(n453) );
  AND U427 ( .A(n454), .B(n455), .Z(n452) );
  NAND U428 ( .A(\stack[0][2] ), .B(n421), .Z(n455) );
  NAND U429 ( .A(\stack[1][2] ), .B(n413), .Z(n454) );
  NAND U430 ( .A(n422), .B(x[2]), .Z(n423) );
  NAND U431 ( .A(n456), .B(n457), .Z(o[1]) );
  NAND U432 ( .A(n458), .B(n360), .Z(n457) );
  NAND U433 ( .A(n459), .B(n460), .Z(n458) );
  AND U434 ( .A(n461), .B(n462), .Z(n460) );
  NANDN U435 ( .A(n365), .B(\stack[0][1] ), .Z(n462) );
  AND U436 ( .A(n463), .B(n464), .Z(n461) );
  NAND U437 ( .A(n465), .B(n369), .Z(n464) );
  XOR U438 ( .A(n466), .B(n467), .Z(n465) );
  AND U439 ( .A(\stack[1][0] ), .B(\stack[0][1] ), .Z(n467) );
  AND U440 ( .A(\stack[1][1] ), .B(\stack[0][0] ), .Z(n466) );
  NAND U441 ( .A(n468), .B(n396), .Z(n463) );
  AND U442 ( .A(\stack[1][1] ), .B(\stack[0][1] ), .Z(n468) );
  AND U443 ( .A(n469), .B(n470), .Z(n459) );
  NAND U444 ( .A(n471), .B(n400), .Z(n470) );
  NANDN U445 ( .A(\stack[1][1] ), .B(n436), .Z(n471) );
  IV U446 ( .A(\stack[0][1] ), .Z(n436) );
  XOR U447 ( .A(n449), .B(n472), .Z(n469) );
  XOR U448 ( .A(n448), .B(n446), .Z(n472) );
  AND U449 ( .A(n473), .B(n474), .Z(n446) );
  NAND U450 ( .A(\stack[0][1] ), .B(n413), .Z(n474) );
  NAND U451 ( .A(\stack[0][1] ), .B(n414), .Z(n473) );
  NAND U452 ( .A(n475), .B(n476), .Z(n448) );
  NAND U453 ( .A(n450), .B(n477), .Z(n476) );
  NANDN U454 ( .A(n478), .B(n479), .Z(n475) );
  XOR U455 ( .A(n450), .B(n480), .Z(n449) );
  NAND U456 ( .A(n481), .B(n482), .Z(n480) );
  NAND U457 ( .A(n414), .B(\stack[1][1] ), .Z(n482) );
  AND U458 ( .A(n483), .B(n484), .Z(n481) );
  NAND U459 ( .A(\stack[0][1] ), .B(n421), .Z(n484) );
  NAND U460 ( .A(\stack[1][1] ), .B(n413), .Z(n483) );
  NAND U461 ( .A(n422), .B(x[1]), .Z(n456) );
  NAND U462 ( .A(n485), .B(n486), .Z(o[0]) );
  NAND U463 ( .A(n487), .B(n360), .Z(n486) );
  NAND U464 ( .A(n488), .B(n489), .Z(n487) );
  AND U465 ( .A(n490), .B(n491), .Z(n489) );
  NANDN U466 ( .A(n365), .B(\stack[0][0] ), .Z(n491) );
  NAND U467 ( .A(n492), .B(n493), .Z(n365) );
  AND U468 ( .A(n494), .B(n495), .Z(n490) );
  NANDN U469 ( .A(n434), .B(n369), .Z(n495) );
  NAND U470 ( .A(\stack[1][0] ), .B(\stack[0][0] ), .Z(n434) );
  NAND U471 ( .A(n496), .B(n396), .Z(n494) );
  AND U472 ( .A(\stack[0][0] ), .B(\stack[1][0] ), .Z(n496) );
  AND U473 ( .A(n497), .B(n498), .Z(n488) );
  NAND U474 ( .A(n499), .B(n400), .Z(n498) );
  AND U475 ( .A(n500), .B(opcode[0]), .Z(n400) );
  AND U476 ( .A(opcode[2]), .B(opcode[1]), .Z(n500) );
  NAND U477 ( .A(n393), .B(n394), .Z(n499) );
  IV U478 ( .A(\stack[0][0] ), .Z(n394) );
  IV U479 ( .A(\stack[1][0] ), .Z(n393) );
  XOR U480 ( .A(n477), .B(n501), .Z(n497) );
  XNOR U481 ( .A(n415), .B(n478), .Z(n501) );
  AND U482 ( .A(n502), .B(n503), .Z(n478) );
  NAND U483 ( .A(\stack[0][0] ), .B(n413), .Z(n503) );
  NAND U484 ( .A(\stack[0][0] ), .B(n414), .Z(n502) );
  XOR U485 ( .A(n450), .B(n504), .Z(n477) );
  NAND U486 ( .A(n505), .B(n506), .Z(n504) );
  NAND U487 ( .A(\stack[1][0] ), .B(n414), .Z(n506) );
  AND U488 ( .A(n507), .B(n508), .Z(n505) );
  NAND U489 ( .A(\stack[0][0] ), .B(n421), .Z(n508) );
  NAND U490 ( .A(\stack[1][0] ), .B(n413), .Z(n507) );
  IV U491 ( .A(n415), .Z(n450) );
  ANDN U492 ( .B(n509), .A(n421), .Z(n415) );
  ANDN U493 ( .B(opcode[2]), .A(opcode[1]), .Z(n421) );
  NAND U494 ( .A(n422), .B(x[0]), .Z(n485) );
  NAND U495 ( .A(n510), .B(n511), .Z(n356) );
  NAND U496 ( .A(\stack[1][0] ), .B(n512), .Z(n511) );
  NAND U497 ( .A(n513), .B(n514), .Z(n510) );
  NAND U498 ( .A(n515), .B(n516), .Z(n514) );
  NAND U499 ( .A(n360), .B(\stack[2][0] ), .Z(n516) );
  NAND U500 ( .A(\stack[0][0] ), .B(n422), .Z(n515) );
  NAND U501 ( .A(n517), .B(n518), .Z(n355) );
  NAND U502 ( .A(n512), .B(\stack[1][1] ), .Z(n518) );
  NAND U503 ( .A(n513), .B(n519), .Z(n517) );
  NAND U504 ( .A(n520), .B(n521), .Z(n519) );
  NAND U505 ( .A(n360), .B(\stack[2][1] ), .Z(n521) );
  NAND U506 ( .A(\stack[0][1] ), .B(n422), .Z(n520) );
  NAND U507 ( .A(n522), .B(n523), .Z(n354) );
  NAND U508 ( .A(\stack[1][2] ), .B(n512), .Z(n523) );
  NAND U509 ( .A(n513), .B(n524), .Z(n522) );
  NAND U510 ( .A(n525), .B(n526), .Z(n524) );
  NAND U511 ( .A(n360), .B(\stack[2][2] ), .Z(n526) );
  NAND U512 ( .A(\stack[0][2] ), .B(n422), .Z(n525) );
  NAND U513 ( .A(n527), .B(n528), .Z(n353) );
  NAND U514 ( .A(\stack[1][3] ), .B(n512), .Z(n528) );
  NAND U515 ( .A(n513), .B(n529), .Z(n527) );
  NAND U516 ( .A(n530), .B(n531), .Z(n529) );
  NAND U517 ( .A(n360), .B(\stack[2][3] ), .Z(n531) );
  NAND U518 ( .A(\stack[0][3] ), .B(n422), .Z(n530) );
  NAND U519 ( .A(n532), .B(n533), .Z(n352) );
  NAND U520 ( .A(n512), .B(\stack[2][0] ), .Z(n533) );
  NAND U521 ( .A(n513), .B(n534), .Z(n532) );
  NAND U522 ( .A(n535), .B(n536), .Z(n534) );
  NAND U523 ( .A(n360), .B(\stack[3][0] ), .Z(n536) );
  NAND U524 ( .A(\stack[1][0] ), .B(n422), .Z(n535) );
  NAND U525 ( .A(n537), .B(n538), .Z(n351) );
  NAND U526 ( .A(n512), .B(\stack[2][1] ), .Z(n538) );
  NAND U527 ( .A(n513), .B(n539), .Z(n537) );
  NAND U528 ( .A(n540), .B(n541), .Z(n539) );
  NAND U529 ( .A(n360), .B(\stack[3][1] ), .Z(n541) );
  NAND U530 ( .A(\stack[1][1] ), .B(n422), .Z(n540) );
  NAND U531 ( .A(n542), .B(n543), .Z(n350) );
  NAND U532 ( .A(n512), .B(\stack[2][2] ), .Z(n543) );
  NAND U533 ( .A(n513), .B(n544), .Z(n542) );
  NAND U534 ( .A(n545), .B(n546), .Z(n544) );
  NAND U535 ( .A(n360), .B(\stack[3][2] ), .Z(n546) );
  NAND U536 ( .A(\stack[1][2] ), .B(n422), .Z(n545) );
  NAND U537 ( .A(n547), .B(n548), .Z(n349) );
  NAND U538 ( .A(n512), .B(\stack[2][3] ), .Z(n548) );
  NAND U539 ( .A(n513), .B(n549), .Z(n547) );
  NAND U540 ( .A(n550), .B(n551), .Z(n549) );
  NAND U541 ( .A(n360), .B(\stack[3][3] ), .Z(n551) );
  NAND U542 ( .A(\stack[1][3] ), .B(n422), .Z(n550) );
  NAND U543 ( .A(n552), .B(n553), .Z(n348) );
  NAND U544 ( .A(n512), .B(\stack[3][0] ), .Z(n553) );
  NAND U545 ( .A(n513), .B(n554), .Z(n552) );
  NAND U546 ( .A(n555), .B(n556), .Z(n554) );
  NAND U547 ( .A(n360), .B(\stack[4][0] ), .Z(n556) );
  NAND U548 ( .A(n422), .B(\stack[2][0] ), .Z(n555) );
  NAND U549 ( .A(n557), .B(n558), .Z(n347) );
  NAND U550 ( .A(n512), .B(\stack[3][1] ), .Z(n558) );
  NAND U551 ( .A(n513), .B(n559), .Z(n557) );
  NAND U552 ( .A(n560), .B(n561), .Z(n559) );
  NAND U553 ( .A(n360), .B(\stack[4][1] ), .Z(n561) );
  NAND U554 ( .A(n422), .B(\stack[2][1] ), .Z(n560) );
  NAND U555 ( .A(n562), .B(n563), .Z(n346) );
  NAND U556 ( .A(n512), .B(\stack[3][2] ), .Z(n563) );
  NAND U557 ( .A(n513), .B(n564), .Z(n562) );
  NAND U558 ( .A(n565), .B(n566), .Z(n564) );
  NAND U559 ( .A(n360), .B(\stack[4][2] ), .Z(n566) );
  NAND U560 ( .A(n422), .B(\stack[2][2] ), .Z(n565) );
  NAND U561 ( .A(n567), .B(n568), .Z(n345) );
  NAND U562 ( .A(n512), .B(\stack[3][3] ), .Z(n568) );
  NAND U563 ( .A(n513), .B(n569), .Z(n567) );
  NAND U564 ( .A(n570), .B(n571), .Z(n569) );
  NAND U565 ( .A(n360), .B(\stack[4][3] ), .Z(n571) );
  NAND U566 ( .A(n422), .B(\stack[2][3] ), .Z(n570) );
  NAND U567 ( .A(n572), .B(n573), .Z(n344) );
  NAND U568 ( .A(n512), .B(\stack[4][0] ), .Z(n573) );
  NAND U569 ( .A(n513), .B(n574), .Z(n572) );
  NAND U570 ( .A(n575), .B(n576), .Z(n574) );
  NAND U571 ( .A(n360), .B(\stack[5][0] ), .Z(n576) );
  NAND U572 ( .A(n422), .B(\stack[3][0] ), .Z(n575) );
  NAND U573 ( .A(n577), .B(n578), .Z(n343) );
  NAND U574 ( .A(n512), .B(\stack[4][1] ), .Z(n578) );
  NAND U575 ( .A(n513), .B(n579), .Z(n577) );
  NAND U576 ( .A(n580), .B(n581), .Z(n579) );
  NAND U577 ( .A(n360), .B(\stack[5][1] ), .Z(n581) );
  NAND U578 ( .A(n422), .B(\stack[3][1] ), .Z(n580) );
  NAND U579 ( .A(n582), .B(n583), .Z(n342) );
  NAND U580 ( .A(n512), .B(\stack[4][2] ), .Z(n583) );
  NAND U581 ( .A(n513), .B(n584), .Z(n582) );
  NAND U582 ( .A(n585), .B(n586), .Z(n584) );
  NAND U583 ( .A(n360), .B(\stack[5][2] ), .Z(n586) );
  NAND U584 ( .A(n422), .B(\stack[3][2] ), .Z(n585) );
  NAND U585 ( .A(n587), .B(n588), .Z(n341) );
  NAND U586 ( .A(n512), .B(\stack[4][3] ), .Z(n588) );
  NAND U587 ( .A(n513), .B(n589), .Z(n587) );
  NAND U588 ( .A(n590), .B(n591), .Z(n589) );
  NAND U589 ( .A(n360), .B(\stack[5][3] ), .Z(n591) );
  NAND U590 ( .A(n422), .B(\stack[3][3] ), .Z(n590) );
  NAND U591 ( .A(n592), .B(n593), .Z(n340) );
  NAND U592 ( .A(n512), .B(\stack[5][0] ), .Z(n593) );
  NAND U593 ( .A(n513), .B(n594), .Z(n592) );
  NAND U594 ( .A(n595), .B(n596), .Z(n594) );
  NAND U595 ( .A(n360), .B(\stack[6][0] ), .Z(n596) );
  NAND U596 ( .A(n422), .B(\stack[4][0] ), .Z(n595) );
  NAND U597 ( .A(n597), .B(n598), .Z(n339) );
  NAND U598 ( .A(n512), .B(\stack[5][1] ), .Z(n598) );
  NAND U599 ( .A(n513), .B(n599), .Z(n597) );
  NAND U600 ( .A(n600), .B(n601), .Z(n599) );
  NAND U601 ( .A(n360), .B(\stack[6][1] ), .Z(n601) );
  NAND U602 ( .A(n422), .B(\stack[4][1] ), .Z(n600) );
  NAND U603 ( .A(n602), .B(n603), .Z(n338) );
  NAND U604 ( .A(n512), .B(\stack[5][2] ), .Z(n603) );
  NAND U605 ( .A(n513), .B(n604), .Z(n602) );
  NAND U606 ( .A(n605), .B(n606), .Z(n604) );
  NAND U607 ( .A(n360), .B(\stack[6][2] ), .Z(n606) );
  NAND U608 ( .A(n422), .B(\stack[4][2] ), .Z(n605) );
  NAND U609 ( .A(n607), .B(n608), .Z(n337) );
  NAND U610 ( .A(n512), .B(\stack[5][3] ), .Z(n608) );
  NAND U611 ( .A(n513), .B(n609), .Z(n607) );
  NAND U612 ( .A(n610), .B(n611), .Z(n609) );
  NAND U613 ( .A(n360), .B(\stack[6][3] ), .Z(n611) );
  NAND U614 ( .A(n422), .B(\stack[4][3] ), .Z(n610) );
  NAND U615 ( .A(n612), .B(n613), .Z(n336) );
  NAND U616 ( .A(n512), .B(\stack[6][0] ), .Z(n613) );
  NAND U617 ( .A(n513), .B(n614), .Z(n612) );
  NAND U618 ( .A(n615), .B(n616), .Z(n614) );
  NAND U619 ( .A(n360), .B(\stack[7][0] ), .Z(n616) );
  NAND U620 ( .A(n422), .B(\stack[5][0] ), .Z(n615) );
  NAND U621 ( .A(n617), .B(n618), .Z(n335) );
  NAND U622 ( .A(n512), .B(\stack[6][1] ), .Z(n618) );
  NAND U623 ( .A(n513), .B(n619), .Z(n617) );
  NAND U624 ( .A(n620), .B(n621), .Z(n619) );
  NAND U625 ( .A(n360), .B(\stack[7][1] ), .Z(n621) );
  NAND U626 ( .A(n422), .B(\stack[5][1] ), .Z(n620) );
  NAND U627 ( .A(n622), .B(n623), .Z(n334) );
  NAND U628 ( .A(n512), .B(\stack[6][2] ), .Z(n623) );
  NAND U629 ( .A(n513), .B(n624), .Z(n622) );
  NAND U630 ( .A(n625), .B(n626), .Z(n624) );
  NAND U631 ( .A(n360), .B(\stack[7][2] ), .Z(n626) );
  NAND U632 ( .A(n422), .B(\stack[5][2] ), .Z(n625) );
  NAND U633 ( .A(n627), .B(n628), .Z(n333) );
  NAND U634 ( .A(n512), .B(\stack[6][3] ), .Z(n628) );
  NAND U635 ( .A(n513), .B(n629), .Z(n627) );
  NAND U636 ( .A(n630), .B(n631), .Z(n629) );
  NAND U637 ( .A(n360), .B(\stack[7][3] ), .Z(n631) );
  NAND U638 ( .A(n422), .B(\stack[5][3] ), .Z(n630) );
  ANDN U639 ( .B(n632), .A(n633), .Z(n422) );
  IV U640 ( .A(n512), .Z(n513) );
  AND U641 ( .A(n634), .B(n635), .Z(n512) );
  ANDN U642 ( .B(n636), .A(n369), .Z(n635) );
  ANDN U643 ( .B(opcode[0]), .A(n637), .Z(n369) );
  ANDN U644 ( .B(n509), .A(n396), .Z(n636) );
  ANDN U645 ( .B(opcode[2]), .A(n493), .Z(n396) );
  IV U646 ( .A(n414), .Z(n509) );
  ANDN U647 ( .B(n492), .A(n637), .Z(n414) );
  NAND U648 ( .A(n633), .B(opcode[1]), .Z(n637) );
  ANDN U649 ( .B(n360), .A(n413), .Z(n634) );
  ANDN U650 ( .B(n638), .A(n492), .Z(n413) );
  AND U651 ( .A(n493), .B(n633), .Z(n638) );
  NANDN U652 ( .A(n633), .B(n632), .Z(n360) );
  NAND U653 ( .A(n639), .B(n640), .Z(n319) );
  AND U654 ( .A(n641), .B(n642), .Z(n640) );
  NAND U655 ( .A(n633), .B(\stack[7][3] ), .Z(n642) );
  NAND U656 ( .A(opcode[2]), .B(n643), .Z(n641) );
  AND U657 ( .A(n632), .B(\stack[6][3] ), .Z(n643) );
  AND U658 ( .A(n644), .B(n645), .Z(n639) );
  NAND U659 ( .A(opcode[1]), .B(\stack[7][3] ), .Z(n645) );
  NAND U660 ( .A(opcode[0]), .B(\stack[7][3] ), .Z(n644) );
  NAND U661 ( .A(n646), .B(n647), .Z(n312) );
  AND U662 ( .A(n648), .B(n649), .Z(n647) );
  NAND U663 ( .A(n633), .B(\stack[7][2] ), .Z(n649) );
  NAND U664 ( .A(opcode[2]), .B(n650), .Z(n648) );
  AND U665 ( .A(n632), .B(\stack[6][2] ), .Z(n650) );
  AND U666 ( .A(n651), .B(n652), .Z(n646) );
  NAND U667 ( .A(opcode[1]), .B(\stack[7][2] ), .Z(n652) );
  NAND U668 ( .A(opcode[0]), .B(\stack[7][2] ), .Z(n651) );
  NAND U669 ( .A(n653), .B(n654), .Z(n305) );
  AND U670 ( .A(n655), .B(n656), .Z(n654) );
  NAND U671 ( .A(n633), .B(\stack[7][1] ), .Z(n656) );
  NAND U672 ( .A(opcode[2]), .B(n657), .Z(n655) );
  AND U673 ( .A(n632), .B(\stack[6][1] ), .Z(n657) );
  AND U674 ( .A(n658), .B(n659), .Z(n653) );
  NAND U675 ( .A(opcode[1]), .B(\stack[7][1] ), .Z(n659) );
  NAND U676 ( .A(opcode[0]), .B(\stack[7][1] ), .Z(n658) );
  NAND U677 ( .A(n660), .B(n661), .Z(n298) );
  AND U678 ( .A(n662), .B(n663), .Z(n661) );
  NAND U679 ( .A(n633), .B(\stack[7][0] ), .Z(n663) );
  IV U680 ( .A(opcode[2]), .Z(n633) );
  NAND U681 ( .A(opcode[2]), .B(n664), .Z(n662) );
  AND U682 ( .A(\stack[6][0] ), .B(n632), .Z(n664) );
  AND U683 ( .A(n493), .B(n492), .Z(n632) );
  IV U684 ( .A(opcode[0]), .Z(n492) );
  IV U685 ( .A(opcode[1]), .Z(n493) );
  AND U686 ( .A(n665), .B(n666), .Z(n660) );
  NAND U687 ( .A(opcode[1]), .B(\stack[7][0] ), .Z(n666) );
  NAND U688 ( .A(opcode[0]), .B(\stack[7][0] ), .Z(n665) );
endmodule

