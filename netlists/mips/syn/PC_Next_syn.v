
module PC_Next ( clk, rst, pc_new, take_branch, opcode25_0, pc_source, 
        pc_current, pc_plus4 );
  input [31:2] pc_new;
  input [25:0] opcode25_0;
  input [1:0] pc_source;
  output [31:2] pc_current;
  output [31:2] pc_plus4;
  input clk, rst, take_branch;
  wire   n308, n309, n310, n311, \add_48/carry[29] , \add_48/carry[28] ,
         \add_48/carry[27] , \add_48/carry[26] , \add_48/carry[25] ,
         \add_48/carry[24] , \add_48/carry[23] , \add_48/carry[22] ,
         \add_48/carry[21] , \add_48/carry[20] , \add_48/carry[19] ,
         \add_48/carry[18] , \add_48/carry[17] , \add_48/carry[16] ,
         \add_48/carry[15] , \add_48/carry[14] , \add_48/carry[13] ,
         \add_48/carry[12] , \add_48/carry[11] , \add_48/carry[10] ,
         \add_48/carry[9] , \add_48/carry[8] , \add_48/carry[7] ,
         \add_48/carry[6] , \add_48/carry[5] , \add_48/carry[4] ,
         \add_48/carry[3] , \add_48/carry[2] , \add_48/carry[1] ,
         \add_32/carry[29] , \add_32/carry[28] , \add_32/carry[27] ,
         \add_32/carry[26] , \add_32/carry[25] , \add_32/carry[24] ,
         \add_32/carry[23] , \add_32/carry[22] , \add_32/carry[21] ,
         \add_32/carry[20] , \add_32/carry[19] , \add_32/carry[18] ,
         \add_32/carry[17] , \add_32/carry[16] , \add_32/carry[15] ,
         \add_32/carry[14] , \add_32/carry[13] , \add_32/carry[12] ,
         \add_32/carry[11] , \add_32/carry[10] , \add_32/carry[9] ,
         \add_32/carry[8] , \add_32/carry[7] , \add_32/carry[6] ,
         \add_32/carry[5] , \add_32/carry[4] , \add_32/carry[3] ,
         \add_32/carry[2] , n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526;
  wire   [31:2] pc_jump;
  wire   [31:2] pc_future;

  DFF \pc_reg[2]  ( .D(pc_future[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[2]) );
  DFF \pc_reg[31]  ( .D(n308), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[31]) );
  DFF \pc_reg[3]  ( .D(pc_future[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[3]) );
  DFF \pc_reg[4]  ( .D(pc_future[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[4]) );
  DFF \pc_reg[5]  ( .D(pc_future[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[5]) );
  DFF \pc_reg[6]  ( .D(pc_future[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[6]) );
  DFF \pc_reg[7]  ( .D(pc_future[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[7]) );
  DFF \pc_reg[8]  ( .D(pc_future[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[8]) );
  DFF \pc_reg[9]  ( .D(pc_future[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[9]) );
  DFF \pc_reg[10]  ( .D(pc_future[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[10]) );
  DFF \pc_reg[11]  ( .D(pc_future[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[11]) );
  DFF \pc_reg[12]  ( .D(pc_future[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[12]) );
  DFF \pc_reg[13]  ( .D(pc_future[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[13]) );
  DFF \pc_reg[14]  ( .D(pc_future[14]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[14]) );
  DFF \pc_reg[15]  ( .D(pc_future[15]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[15]) );
  DFF \pc_reg[16]  ( .D(pc_future[16]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[16]) );
  DFF \pc_reg[17]  ( .D(pc_future[17]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[17]) );
  DFF \pc_reg[18]  ( .D(pc_future[18]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[18]) );
  DFF \pc_reg[19]  ( .D(pc_future[19]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[19]) );
  DFF \pc_reg[20]  ( .D(pc_future[20]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[20]) );
  DFF \pc_reg[21]  ( .D(pc_future[21]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[21]) );
  DFF \pc_reg[22]  ( .D(pc_future[22]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[22]) );
  DFF \pc_reg[23]  ( .D(pc_future[23]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[23]) );
  DFF \pc_reg[24]  ( .D(pc_future[24]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[24]) );
  DFF \pc_reg[25]  ( .D(pc_future[25]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[25]) );
  DFF \pc_reg[26]  ( .D(pc_future[26]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[26]) );
  DFF \pc_reg[27]  ( .D(pc_future[27]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[27]) );
  DFF \pc_reg[28]  ( .D(n311), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[28]) );
  DFF \pc_reg[29]  ( .D(n310), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[29]) );
  DFF \pc_reg[30]  ( .D(n309), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        pc_current[30]) );
  FADDER \add_48/U1_1  ( .CIN(pc_current[3]), .IN0(opcode25_0[1]), .IN1(
        \add_48/carry[1] ), .COUT(\add_48/carry[2] ), .SUM(pc_jump[3]) );
  FADDER \add_48/U1_2  ( .CIN(pc_current[4]), .IN0(opcode25_0[2]), .IN1(
        \add_48/carry[2] ), .COUT(\add_48/carry[3] ), .SUM(pc_jump[4]) );
  FADDER \add_48/U1_3  ( .CIN(pc_current[5]), .IN0(opcode25_0[3]), .IN1(
        \add_48/carry[3] ), .COUT(\add_48/carry[4] ), .SUM(pc_jump[5]) );
  FADDER \add_48/U1_4  ( .CIN(pc_current[6]), .IN0(opcode25_0[4]), .IN1(
        \add_48/carry[4] ), .COUT(\add_48/carry[5] ), .SUM(pc_jump[6]) );
  FADDER \add_48/U1_5  ( .CIN(pc_current[7]), .IN0(opcode25_0[5]), .IN1(
        \add_48/carry[5] ), .COUT(\add_48/carry[6] ), .SUM(pc_jump[7]) );
  FADDER \add_48/U1_6  ( .CIN(pc_current[8]), .IN0(opcode25_0[6]), .IN1(
        \add_48/carry[6] ), .COUT(\add_48/carry[7] ), .SUM(pc_jump[8]) );
  FADDER \add_48/U1_7  ( .CIN(pc_current[9]), .IN0(opcode25_0[7]), .IN1(
        \add_48/carry[7] ), .COUT(\add_48/carry[8] ), .SUM(pc_jump[9]) );
  FADDER \add_48/U1_8  ( .CIN(pc_current[10]), .IN0(opcode25_0[8]), .IN1(
        \add_48/carry[8] ), .COUT(\add_48/carry[9] ), .SUM(pc_jump[10]) );
  FADDER \add_48/U1_9  ( .CIN(pc_current[11]), .IN0(opcode25_0[9]), .IN1(
        \add_48/carry[9] ), .COUT(\add_48/carry[10] ), .SUM(pc_jump[11]) );
  FADDER \add_48/U1_10  ( .CIN(pc_current[12]), .IN0(opcode25_0[10]), .IN1(
        \add_48/carry[10] ), .COUT(\add_48/carry[11] ), .SUM(pc_jump[12]) );
  FADDER \add_48/U1_11  ( .CIN(pc_current[13]), .IN0(opcode25_0[11]), .IN1(
        \add_48/carry[11] ), .COUT(\add_48/carry[12] ), .SUM(pc_jump[13]) );
  FADDER \add_48/U1_12  ( .CIN(pc_current[14]), .IN0(opcode25_0[12]), .IN1(
        \add_48/carry[12] ), .COUT(\add_48/carry[13] ), .SUM(pc_jump[14]) );
  FADDER \add_48/U1_13  ( .CIN(pc_current[15]), .IN0(opcode25_0[13]), .IN1(
        \add_48/carry[13] ), .COUT(\add_48/carry[14] ), .SUM(pc_jump[15]) );
  FADDER \add_48/U1_14  ( .CIN(pc_current[16]), .IN0(opcode25_0[14]), .IN1(
        \add_48/carry[14] ), .COUT(\add_48/carry[15] ), .SUM(pc_jump[16]) );
  FADDER \add_48/U1_15  ( .CIN(pc_current[17]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[15] ), .COUT(\add_48/carry[16] ), .SUM(pc_jump[17]) );
  FADDER \add_48/U1_16  ( .CIN(pc_current[18]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[16] ), .COUT(\add_48/carry[17] ), .SUM(pc_jump[18]) );
  FADDER \add_48/U1_17  ( .CIN(pc_current[19]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[17] ), .COUT(\add_48/carry[18] ), .SUM(pc_jump[19]) );
  FADDER \add_48/U1_18  ( .CIN(pc_current[20]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[18] ), .COUT(\add_48/carry[19] ), .SUM(pc_jump[20]) );
  FADDER \add_48/U1_19  ( .CIN(pc_current[21]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[19] ), .COUT(\add_48/carry[20] ), .SUM(pc_jump[21]) );
  FADDER \add_48/U1_20  ( .CIN(pc_current[22]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[20] ), .COUT(\add_48/carry[21] ), .SUM(pc_jump[22]) );
  FADDER \add_48/U1_21  ( .CIN(pc_current[23]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[21] ), .COUT(\add_48/carry[22] ), .SUM(pc_jump[23]) );
  FADDER \add_48/U1_22  ( .CIN(pc_current[24]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[22] ), .COUT(\add_48/carry[23] ), .SUM(pc_jump[24]) );
  FADDER \add_48/U1_23  ( .CIN(pc_current[25]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[23] ), .COUT(\add_48/carry[24] ), .SUM(pc_jump[25]) );
  FADDER \add_48/U1_24  ( .CIN(pc_current[26]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[24] ), .COUT(\add_48/carry[25] ), .SUM(pc_jump[26]) );
  FADDER \add_48/U1_25  ( .CIN(pc_current[27]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[25] ), .COUT(\add_48/carry[26] ), .SUM(pc_jump[27]) );
  FADDER \add_48/U1_26  ( .CIN(pc_current[28]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[26] ), .COUT(\add_48/carry[27] ), .SUM(pc_jump[28]) );
  FADDER \add_48/U1_27  ( .CIN(pc_current[29]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[27] ), .COUT(\add_48/carry[28] ), .SUM(pc_jump[29]) );
  FADDER \add_48/U1_28  ( .CIN(pc_current[30]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[28] ), .COUT(\add_48/carry[29] ), .SUM(pc_jump[30]) );
  FADDER \add_48/U1_29  ( .CIN(pc_current[31]), .IN0(opcode25_0[15]), .IN1(
        \add_48/carry[29] ), .SUM(pc_jump[31]) );
  HADDER \add_32/U1_1_1  ( .IN0(pc_current[3]), .IN1(pc_current[2]), .COUT(
        \add_32/carry[2] ), .SUM(pc_plus4[3]) );
  HADDER \add_32/U1_1_2  ( .IN0(pc_current[4]), .IN1(\add_32/carry[2] ), 
        .COUT(\add_32/carry[3] ), .SUM(pc_plus4[4]) );
  HADDER \add_32/U1_1_3  ( .IN0(pc_current[5]), .IN1(\add_32/carry[3] ), 
        .COUT(\add_32/carry[4] ), .SUM(pc_plus4[5]) );
  HADDER \add_32/U1_1_4  ( .IN0(pc_current[6]), .IN1(\add_32/carry[4] ), 
        .COUT(\add_32/carry[5] ), .SUM(pc_plus4[6]) );
  HADDER \add_32/U1_1_5  ( .IN0(pc_current[7]), .IN1(\add_32/carry[5] ), 
        .COUT(\add_32/carry[6] ), .SUM(pc_plus4[7]) );
  HADDER \add_32/U1_1_6  ( .IN0(pc_current[8]), .IN1(\add_32/carry[6] ), 
        .COUT(\add_32/carry[7] ), .SUM(pc_plus4[8]) );
  HADDER \add_32/U1_1_7  ( .IN0(pc_current[9]), .IN1(\add_32/carry[7] ), 
        .COUT(\add_32/carry[8] ), .SUM(pc_plus4[9]) );
  HADDER \add_32/U1_1_8  ( .IN0(pc_current[10]), .IN1(\add_32/carry[8] ), 
        .COUT(\add_32/carry[9] ), .SUM(pc_plus4[10]) );
  HADDER \add_32/U1_1_9  ( .IN0(pc_current[11]), .IN1(\add_32/carry[9] ), 
        .COUT(\add_32/carry[10] ), .SUM(pc_plus4[11]) );
  HADDER \add_32/U1_1_10  ( .IN0(pc_current[12]), .IN1(\add_32/carry[10] ), 
        .COUT(\add_32/carry[11] ), .SUM(pc_plus4[12]) );
  HADDER \add_32/U1_1_11  ( .IN0(pc_current[13]), .IN1(\add_32/carry[11] ), 
        .COUT(\add_32/carry[12] ), .SUM(pc_plus4[13]) );
  HADDER \add_32/U1_1_12  ( .IN0(pc_current[14]), .IN1(\add_32/carry[12] ), 
        .COUT(\add_32/carry[13] ), .SUM(pc_plus4[14]) );
  HADDER \add_32/U1_1_13  ( .IN0(pc_current[15]), .IN1(\add_32/carry[13] ), 
        .COUT(\add_32/carry[14] ), .SUM(pc_plus4[15]) );
  HADDER \add_32/U1_1_14  ( .IN0(pc_current[16]), .IN1(\add_32/carry[14] ), 
        .COUT(\add_32/carry[15] ), .SUM(pc_plus4[16]) );
  HADDER \add_32/U1_1_15  ( .IN0(pc_current[17]), .IN1(\add_32/carry[15] ), 
        .COUT(\add_32/carry[16] ), .SUM(pc_plus4[17]) );
  HADDER \add_32/U1_1_16  ( .IN0(pc_current[18]), .IN1(\add_32/carry[16] ), 
        .COUT(\add_32/carry[17] ), .SUM(pc_plus4[18]) );
  HADDER \add_32/U1_1_17  ( .IN0(pc_current[19]), .IN1(\add_32/carry[17] ), 
        .COUT(\add_32/carry[18] ), .SUM(pc_plus4[19]) );
  HADDER \add_32/U1_1_18  ( .IN0(pc_current[20]), .IN1(\add_32/carry[18] ), 
        .COUT(\add_32/carry[19] ), .SUM(pc_plus4[20]) );
  HADDER \add_32/U1_1_19  ( .IN0(pc_current[21]), .IN1(\add_32/carry[19] ), 
        .COUT(\add_32/carry[20] ), .SUM(pc_plus4[21]) );
  HADDER \add_32/U1_1_20  ( .IN0(pc_current[22]), .IN1(\add_32/carry[20] ), 
        .COUT(\add_32/carry[21] ), .SUM(pc_plus4[22]) );
  HADDER \add_32/U1_1_21  ( .IN0(pc_current[23]), .IN1(\add_32/carry[21] ), 
        .COUT(\add_32/carry[22] ), .SUM(pc_plus4[23]) );
  HADDER \add_32/U1_1_22  ( .IN0(pc_current[24]), .IN1(\add_32/carry[22] ), 
        .COUT(\add_32/carry[23] ), .SUM(pc_plus4[24]) );
  HADDER \add_32/U1_1_23  ( .IN0(pc_current[25]), .IN1(\add_32/carry[23] ), 
        .COUT(\add_32/carry[24] ), .SUM(pc_plus4[25]) );
  HADDER \add_32/U1_1_24  ( .IN0(pc_current[26]), .IN1(\add_32/carry[24] ), 
        .COUT(\add_32/carry[25] ), .SUM(pc_plus4[26]) );
  HADDER \add_32/U1_1_25  ( .IN0(pc_current[27]), .IN1(\add_32/carry[25] ), 
        .COUT(\add_32/carry[26] ), .SUM(pc_plus4[27]) );
  HADDER \add_32/U1_1_26  ( .IN0(pc_current[28]), .IN1(\add_32/carry[26] ), 
        .COUT(\add_32/carry[27] ), .SUM(pc_plus4[28]) );
  HADDER \add_32/U1_1_27  ( .IN0(pc_current[29]), .IN1(\add_32/carry[27] ), 
        .COUT(\add_32/carry[28] ), .SUM(pc_plus4[29]) );
  HADDER \add_32/U1_1_28  ( .IN0(pc_current[30]), .IN1(\add_32/carry[28] ), 
        .COUT(\add_32/carry[29] ), .SUM(pc_plus4[30]) );
  AND U339 ( .A(opcode25_0[0]), .B(pc_current[2]), .Z(\add_48/carry[1] ) );
  XOR U340 ( .A(pc_current[2]), .B(opcode25_0[0]), .Z(pc_jump[2]) );
  NAND U341 ( .A(n312), .B(n313), .Z(pc_future[9]) );
  AND U342 ( .A(n314), .B(n315), .Z(n313) );
  NAND U343 ( .A(n316), .B(pc_plus4[9]), .Z(n315) );
  NAND U344 ( .A(n317), .B(opcode25_0[7]), .Z(n314) );
  AND U345 ( .A(n318), .B(n319), .Z(n312) );
  NAND U346 ( .A(n320), .B(n321), .Z(n319) );
  MUX U347 ( .IN0(pc_plus4[9]), .IN1(pc_jump[9]), .SEL(take_branch), .F(n320)
         );
  NAND U348 ( .A(n322), .B(pc_new[9]), .Z(n318) );
  NAND U349 ( .A(n323), .B(n324), .Z(pc_future[8]) );
  AND U350 ( .A(n325), .B(n326), .Z(n324) );
  NAND U351 ( .A(n316), .B(pc_plus4[8]), .Z(n326) );
  NAND U352 ( .A(n317), .B(opcode25_0[6]), .Z(n325) );
  AND U353 ( .A(n327), .B(n328), .Z(n323) );
  NAND U354 ( .A(n329), .B(n321), .Z(n328) );
  MUX U355 ( .IN0(pc_plus4[8]), .IN1(pc_jump[8]), .SEL(take_branch), .F(n329)
         );
  NAND U356 ( .A(n322), .B(pc_new[8]), .Z(n327) );
  NAND U357 ( .A(n330), .B(n331), .Z(pc_future[7]) );
  AND U358 ( .A(n332), .B(n333), .Z(n331) );
  NAND U359 ( .A(n316), .B(pc_plus4[7]), .Z(n333) );
  NAND U360 ( .A(n317), .B(opcode25_0[5]), .Z(n332) );
  AND U361 ( .A(n334), .B(n335), .Z(n330) );
  NAND U362 ( .A(n336), .B(n321), .Z(n335) );
  MUX U363 ( .IN0(pc_plus4[7]), .IN1(pc_jump[7]), .SEL(take_branch), .F(n336)
         );
  NAND U364 ( .A(n322), .B(pc_new[7]), .Z(n334) );
  NAND U365 ( .A(n337), .B(n338), .Z(pc_future[6]) );
  AND U366 ( .A(n339), .B(n340), .Z(n338) );
  NAND U367 ( .A(n316), .B(pc_plus4[6]), .Z(n340) );
  NAND U368 ( .A(n317), .B(opcode25_0[4]), .Z(n339) );
  AND U369 ( .A(n341), .B(n342), .Z(n337) );
  NAND U370 ( .A(n343), .B(n321), .Z(n342) );
  MUX U371 ( .IN0(pc_plus4[6]), .IN1(pc_jump[6]), .SEL(take_branch), .F(n343)
         );
  NAND U372 ( .A(n322), .B(pc_new[6]), .Z(n341) );
  NAND U373 ( .A(n344), .B(n345), .Z(pc_future[5]) );
  AND U374 ( .A(n346), .B(n347), .Z(n345) );
  NAND U375 ( .A(n316), .B(pc_plus4[5]), .Z(n347) );
  NAND U376 ( .A(n317), .B(opcode25_0[3]), .Z(n346) );
  AND U377 ( .A(n348), .B(n349), .Z(n344) );
  NAND U378 ( .A(n350), .B(n321), .Z(n349) );
  MUX U379 ( .IN0(pc_plus4[5]), .IN1(pc_jump[5]), .SEL(take_branch), .F(n350)
         );
  NAND U380 ( .A(n322), .B(pc_new[5]), .Z(n348) );
  NAND U381 ( .A(n351), .B(n352), .Z(pc_future[4]) );
  AND U382 ( .A(n353), .B(n354), .Z(n352) );
  NAND U383 ( .A(n316), .B(pc_plus4[4]), .Z(n354) );
  NAND U384 ( .A(n317), .B(opcode25_0[2]), .Z(n353) );
  AND U385 ( .A(n355), .B(n356), .Z(n351) );
  NAND U386 ( .A(n357), .B(n321), .Z(n356) );
  MUX U387 ( .IN0(pc_plus4[4]), .IN1(pc_jump[4]), .SEL(take_branch), .F(n357)
         );
  NAND U388 ( .A(n322), .B(pc_new[4]), .Z(n355) );
  NAND U389 ( .A(n358), .B(n359), .Z(pc_future[3]) );
  AND U390 ( .A(n360), .B(n361), .Z(n359) );
  NAND U391 ( .A(n316), .B(pc_plus4[3]), .Z(n361) );
  NAND U392 ( .A(n317), .B(opcode25_0[1]), .Z(n360) );
  AND U393 ( .A(n362), .B(n363), .Z(n358) );
  NAND U394 ( .A(n364), .B(n321), .Z(n363) );
  MUX U395 ( .IN0(pc_plus4[3]), .IN1(pc_jump[3]), .SEL(take_branch), .F(n364)
         );
  NAND U396 ( .A(n322), .B(pc_new[3]), .Z(n362) );
  NAND U397 ( .A(n365), .B(n366), .Z(pc_future[2]) );
  AND U398 ( .A(n367), .B(n368), .Z(n366) );
  NAND U399 ( .A(pc_plus4[2]), .B(n316), .Z(n368) );
  NAND U400 ( .A(n317), .B(opcode25_0[0]), .Z(n367) );
  AND U401 ( .A(n369), .B(n370), .Z(n365) );
  NAND U402 ( .A(n371), .B(n321), .Z(n370) );
  MUX U403 ( .IN0(pc_plus4[2]), .IN1(pc_jump[2]), .SEL(take_branch), .F(n371)
         );
  NAND U404 ( .A(n322), .B(pc_new[2]), .Z(n369) );
  NAND U405 ( .A(n372), .B(n373), .Z(pc_future[27]) );
  AND U406 ( .A(n374), .B(n375), .Z(n373) );
  NAND U407 ( .A(n316), .B(pc_plus4[27]), .Z(n375) );
  NAND U408 ( .A(n317), .B(opcode25_0[25]), .Z(n374) );
  AND U409 ( .A(n376), .B(n377), .Z(n372) );
  NAND U410 ( .A(n378), .B(n321), .Z(n377) );
  MUX U411 ( .IN0(pc_plus4[27]), .IN1(pc_jump[27]), .SEL(take_branch), .F(n378) );
  NAND U412 ( .A(n322), .B(pc_new[27]), .Z(n376) );
  NAND U413 ( .A(n379), .B(n380), .Z(pc_future[26]) );
  AND U414 ( .A(n381), .B(n382), .Z(n380) );
  NAND U415 ( .A(n316), .B(pc_plus4[26]), .Z(n382) );
  NAND U416 ( .A(n317), .B(opcode25_0[24]), .Z(n381) );
  AND U417 ( .A(n383), .B(n384), .Z(n379) );
  NAND U418 ( .A(n385), .B(n321), .Z(n384) );
  MUX U419 ( .IN0(pc_plus4[26]), .IN1(pc_jump[26]), .SEL(take_branch), .F(n385) );
  NAND U420 ( .A(n322), .B(pc_new[26]), .Z(n383) );
  NAND U421 ( .A(n386), .B(n387), .Z(pc_future[25]) );
  AND U422 ( .A(n388), .B(n389), .Z(n387) );
  NAND U423 ( .A(n316), .B(pc_plus4[25]), .Z(n389) );
  NAND U424 ( .A(n317), .B(opcode25_0[23]), .Z(n388) );
  AND U425 ( .A(n390), .B(n391), .Z(n386) );
  NAND U426 ( .A(n392), .B(n321), .Z(n391) );
  MUX U427 ( .IN0(pc_plus4[25]), .IN1(pc_jump[25]), .SEL(take_branch), .F(n392) );
  NAND U428 ( .A(n322), .B(pc_new[25]), .Z(n390) );
  NAND U429 ( .A(n393), .B(n394), .Z(pc_future[24]) );
  AND U430 ( .A(n395), .B(n396), .Z(n394) );
  NAND U431 ( .A(n316), .B(pc_plus4[24]), .Z(n396) );
  NAND U432 ( .A(n317), .B(opcode25_0[22]), .Z(n395) );
  AND U433 ( .A(n397), .B(n398), .Z(n393) );
  NAND U434 ( .A(n399), .B(n321), .Z(n398) );
  MUX U435 ( .IN0(pc_plus4[24]), .IN1(pc_jump[24]), .SEL(take_branch), .F(n399) );
  NAND U436 ( .A(n322), .B(pc_new[24]), .Z(n397) );
  NAND U437 ( .A(n400), .B(n401), .Z(pc_future[23]) );
  AND U438 ( .A(n402), .B(n403), .Z(n401) );
  NAND U439 ( .A(n316), .B(pc_plus4[23]), .Z(n403) );
  NAND U440 ( .A(n317), .B(opcode25_0[21]), .Z(n402) );
  AND U441 ( .A(n404), .B(n405), .Z(n400) );
  NAND U442 ( .A(n406), .B(n321), .Z(n405) );
  MUX U443 ( .IN0(pc_plus4[23]), .IN1(pc_jump[23]), .SEL(take_branch), .F(n406) );
  NAND U444 ( .A(n322), .B(pc_new[23]), .Z(n404) );
  NAND U445 ( .A(n407), .B(n408), .Z(pc_future[22]) );
  AND U446 ( .A(n409), .B(n410), .Z(n408) );
  NAND U447 ( .A(n316), .B(pc_plus4[22]), .Z(n410) );
  NAND U448 ( .A(n317), .B(opcode25_0[20]), .Z(n409) );
  AND U449 ( .A(n411), .B(n412), .Z(n407) );
  NAND U450 ( .A(n413), .B(n321), .Z(n412) );
  MUX U451 ( .IN0(pc_plus4[22]), .IN1(pc_jump[22]), .SEL(take_branch), .F(n413) );
  NAND U452 ( .A(n322), .B(pc_new[22]), .Z(n411) );
  NAND U453 ( .A(n414), .B(n415), .Z(pc_future[21]) );
  AND U454 ( .A(n416), .B(n417), .Z(n415) );
  NAND U455 ( .A(n316), .B(pc_plus4[21]), .Z(n417) );
  NAND U456 ( .A(n317), .B(opcode25_0[19]), .Z(n416) );
  AND U457 ( .A(n418), .B(n419), .Z(n414) );
  NAND U458 ( .A(n420), .B(n321), .Z(n419) );
  MUX U459 ( .IN0(pc_plus4[21]), .IN1(pc_jump[21]), .SEL(take_branch), .F(n420) );
  NAND U460 ( .A(n322), .B(pc_new[21]), .Z(n418) );
  NAND U461 ( .A(n421), .B(n422), .Z(pc_future[20]) );
  AND U462 ( .A(n423), .B(n424), .Z(n422) );
  NAND U463 ( .A(n316), .B(pc_plus4[20]), .Z(n424) );
  NAND U464 ( .A(n317), .B(opcode25_0[18]), .Z(n423) );
  AND U465 ( .A(n425), .B(n426), .Z(n421) );
  NAND U466 ( .A(n427), .B(n321), .Z(n426) );
  MUX U467 ( .IN0(pc_plus4[20]), .IN1(pc_jump[20]), .SEL(take_branch), .F(n427) );
  NAND U468 ( .A(n322), .B(pc_new[20]), .Z(n425) );
  NAND U469 ( .A(n428), .B(n429), .Z(pc_future[19]) );
  AND U470 ( .A(n430), .B(n431), .Z(n429) );
  NAND U471 ( .A(n316), .B(pc_plus4[19]), .Z(n431) );
  NAND U472 ( .A(n317), .B(opcode25_0[17]), .Z(n430) );
  AND U473 ( .A(n432), .B(n433), .Z(n428) );
  NAND U474 ( .A(n434), .B(n321), .Z(n433) );
  MUX U475 ( .IN0(pc_plus4[19]), .IN1(pc_jump[19]), .SEL(take_branch), .F(n434) );
  NAND U476 ( .A(n322), .B(pc_new[19]), .Z(n432) );
  NAND U477 ( .A(n435), .B(n436), .Z(pc_future[18]) );
  AND U478 ( .A(n437), .B(n438), .Z(n436) );
  NAND U479 ( .A(n316), .B(pc_plus4[18]), .Z(n438) );
  NAND U480 ( .A(n317), .B(opcode25_0[16]), .Z(n437) );
  AND U481 ( .A(n439), .B(n440), .Z(n435) );
  NAND U482 ( .A(n441), .B(n321), .Z(n440) );
  MUX U483 ( .IN0(pc_plus4[18]), .IN1(pc_jump[18]), .SEL(take_branch), .F(n441) );
  NAND U484 ( .A(n322), .B(pc_new[18]), .Z(n439) );
  NAND U485 ( .A(n442), .B(n443), .Z(pc_future[17]) );
  AND U486 ( .A(n444), .B(n445), .Z(n443) );
  NAND U487 ( .A(n316), .B(pc_plus4[17]), .Z(n445) );
  NAND U488 ( .A(n317), .B(opcode25_0[15]), .Z(n444) );
  AND U489 ( .A(n446), .B(n447), .Z(n442) );
  NAND U490 ( .A(n448), .B(n321), .Z(n447) );
  MUX U491 ( .IN0(pc_plus4[17]), .IN1(pc_jump[17]), .SEL(take_branch), .F(n448) );
  NAND U492 ( .A(n322), .B(pc_new[17]), .Z(n446) );
  NAND U493 ( .A(n449), .B(n450), .Z(pc_future[16]) );
  AND U494 ( .A(n451), .B(n452), .Z(n450) );
  NAND U495 ( .A(n316), .B(pc_plus4[16]), .Z(n452) );
  NAND U496 ( .A(n317), .B(opcode25_0[14]), .Z(n451) );
  AND U497 ( .A(n453), .B(n454), .Z(n449) );
  NAND U498 ( .A(n455), .B(n321), .Z(n454) );
  MUX U499 ( .IN0(pc_plus4[16]), .IN1(pc_jump[16]), .SEL(take_branch), .F(n455) );
  NAND U500 ( .A(n322), .B(pc_new[16]), .Z(n453) );
  NAND U501 ( .A(n456), .B(n457), .Z(pc_future[15]) );
  AND U502 ( .A(n458), .B(n459), .Z(n457) );
  NAND U503 ( .A(n316), .B(pc_plus4[15]), .Z(n459) );
  NAND U504 ( .A(n317), .B(opcode25_0[13]), .Z(n458) );
  AND U505 ( .A(n460), .B(n461), .Z(n456) );
  NAND U506 ( .A(n462), .B(n321), .Z(n461) );
  MUX U507 ( .IN0(pc_plus4[15]), .IN1(pc_jump[15]), .SEL(take_branch), .F(n462) );
  NAND U508 ( .A(n322), .B(pc_new[15]), .Z(n460) );
  NAND U509 ( .A(n463), .B(n464), .Z(pc_future[14]) );
  AND U510 ( .A(n465), .B(n466), .Z(n464) );
  NAND U511 ( .A(n316), .B(pc_plus4[14]), .Z(n466) );
  NAND U512 ( .A(n317), .B(opcode25_0[12]), .Z(n465) );
  AND U513 ( .A(n467), .B(n468), .Z(n463) );
  NAND U514 ( .A(n469), .B(n321), .Z(n468) );
  MUX U515 ( .IN0(pc_plus4[14]), .IN1(pc_jump[14]), .SEL(take_branch), .F(n469) );
  NAND U516 ( .A(n322), .B(pc_new[14]), .Z(n467) );
  NAND U517 ( .A(n470), .B(n471), .Z(pc_future[13]) );
  AND U518 ( .A(n472), .B(n473), .Z(n471) );
  NAND U519 ( .A(n316), .B(pc_plus4[13]), .Z(n473) );
  NAND U520 ( .A(n317), .B(opcode25_0[11]), .Z(n472) );
  AND U521 ( .A(n474), .B(n475), .Z(n470) );
  NAND U522 ( .A(n476), .B(n321), .Z(n475) );
  MUX U523 ( .IN0(pc_plus4[13]), .IN1(pc_jump[13]), .SEL(take_branch), .F(n476) );
  NAND U524 ( .A(n322), .B(pc_new[13]), .Z(n474) );
  NAND U525 ( .A(n477), .B(n478), .Z(pc_future[12]) );
  AND U526 ( .A(n479), .B(n480), .Z(n478) );
  NAND U527 ( .A(n316), .B(pc_plus4[12]), .Z(n480) );
  NAND U528 ( .A(n317), .B(opcode25_0[10]), .Z(n479) );
  AND U529 ( .A(n481), .B(n482), .Z(n477) );
  NAND U530 ( .A(n483), .B(n321), .Z(n482) );
  MUX U531 ( .IN0(pc_plus4[12]), .IN1(pc_jump[12]), .SEL(take_branch), .F(n483) );
  NAND U532 ( .A(n322), .B(pc_new[12]), .Z(n481) );
  NAND U533 ( .A(n484), .B(n485), .Z(pc_future[11]) );
  AND U534 ( .A(n486), .B(n487), .Z(n485) );
  NAND U535 ( .A(n316), .B(pc_plus4[11]), .Z(n487) );
  NAND U536 ( .A(n317), .B(opcode25_0[9]), .Z(n486) );
  AND U537 ( .A(n488), .B(n489), .Z(n484) );
  NAND U538 ( .A(n490), .B(n321), .Z(n489) );
  MUX U539 ( .IN0(pc_plus4[11]), .IN1(pc_jump[11]), .SEL(take_branch), .F(n490) );
  NAND U540 ( .A(n322), .B(pc_new[11]), .Z(n488) );
  NAND U541 ( .A(n491), .B(n492), .Z(pc_future[10]) );
  AND U542 ( .A(n493), .B(n494), .Z(n492) );
  NAND U543 ( .A(n316), .B(pc_plus4[10]), .Z(n494) );
  NAND U544 ( .A(n317), .B(opcode25_0[8]), .Z(n493) );
  AND U545 ( .A(n495), .B(n496), .Z(n491) );
  NAND U546 ( .A(n497), .B(n321), .Z(n496) );
  MUX U547 ( .IN0(pc_plus4[10]), .IN1(pc_jump[10]), .SEL(take_branch), .F(n497) );
  NAND U548 ( .A(n322), .B(pc_new[10]), .Z(n495) );
  IV U549 ( .A(pc_current[2]), .Z(pc_plus4[2]) );
  NAND U550 ( .A(n498), .B(n499), .Z(n311) );
  AND U551 ( .A(n500), .B(n501), .Z(n499) );
  NAND U552 ( .A(n317), .B(pc_current[28]), .Z(n501) );
  NAND U553 ( .A(n316), .B(pc_plus4[28]), .Z(n500) );
  AND U554 ( .A(n502), .B(n503), .Z(n498) );
  NAND U555 ( .A(n504), .B(n321), .Z(n503) );
  MUX U556 ( .IN0(pc_plus4[28]), .IN1(pc_jump[28]), .SEL(take_branch), .F(n504) );
  NAND U557 ( .A(n322), .B(pc_new[28]), .Z(n502) );
  NAND U558 ( .A(n505), .B(n506), .Z(n310) );
  AND U559 ( .A(n507), .B(n508), .Z(n506) );
  NAND U560 ( .A(n317), .B(pc_current[29]), .Z(n508) );
  NAND U561 ( .A(n316), .B(pc_plus4[29]), .Z(n507) );
  AND U562 ( .A(n509), .B(n510), .Z(n505) );
  NAND U563 ( .A(n511), .B(n321), .Z(n510) );
  MUX U564 ( .IN0(pc_plus4[29]), .IN1(pc_jump[29]), .SEL(take_branch), .F(n511) );
  NAND U565 ( .A(n322), .B(pc_new[29]), .Z(n509) );
  NAND U566 ( .A(n512), .B(n513), .Z(n309) );
  AND U567 ( .A(n514), .B(n515), .Z(n513) );
  NAND U568 ( .A(pc_current[30]), .B(n317), .Z(n515) );
  NAND U569 ( .A(n316), .B(pc_plus4[30]), .Z(n514) );
  AND U570 ( .A(n516), .B(n517), .Z(n512) );
  NAND U571 ( .A(n518), .B(n321), .Z(n517) );
  MUX U572 ( .IN0(pc_plus4[30]), .IN1(pc_jump[30]), .SEL(take_branch), .F(n518) );
  NAND U573 ( .A(pc_new[30]), .B(n322), .Z(n516) );
  NAND U574 ( .A(n519), .B(n520), .Z(n308) );
  AND U575 ( .A(n521), .B(n522), .Z(n520) );
  NAND U576 ( .A(n317), .B(pc_current[31]), .Z(n522) );
  ANDN U577 ( .B(pc_source[0]), .A(pc_source[1]), .Z(n317) );
  NAND U578 ( .A(n316), .B(pc_plus4[31]), .Z(n521) );
  ANDN U579 ( .B(n523), .A(pc_source[0]), .Z(n316) );
  AND U580 ( .A(n524), .B(n525), .Z(n519) );
  NAND U581 ( .A(n526), .B(n321), .Z(n525) );
  ANDN U582 ( .B(pc_source[1]), .A(pc_source[0]), .Z(n321) );
  MUX U583 ( .IN0(pc_plus4[31]), .IN1(pc_jump[31]), .SEL(take_branch), .F(n526) );
  XOR U584 ( .A(pc_current[31]), .B(\add_32/carry[29] ), .Z(pc_plus4[31]) );
  NAND U585 ( .A(n322), .B(pc_new[31]), .Z(n524) );
  ANDN U586 ( .B(pc_source[0]), .A(n523), .Z(n322) );
  IV U587 ( .A(pc_source[1]), .Z(n523) );
endmodule

