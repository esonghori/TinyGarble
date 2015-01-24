
module k_nns_seq_W31_K2 ( clk, rst, q, DB, min_val_out );
  input [30:0] q;
  input [30:0] DB;
  output [61:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[1][4] , \min_dist_reg[1][3] , \min_dist_reg[1][2] ,
         \min_dist_reg[1][1] , \min_dist_reg[1][0] , \min_dist_reg[0][4] ,
         \min_dist_reg[0][3] , \min_dist_reg[0][2] , \min_dist_reg[0][1] ,
         \min_dist_reg[0][0] , \local_min_dist[0][4] , \local_min_dist[0][3] ,
         \local_min_dist[0][2] , \local_min_dist[0][1] ,
         \local_min_dist[0][0] , \min_dist[1][4] , \min_dist[1][3] ,
         \min_dist[1][2] , \min_dist[1][1] , \min_dist[1][0] ,
         \min_val_reg[1][30] , \min_val_reg[1][29] , \min_val_reg[1][28] ,
         \min_val_reg[1][27] , \min_val_reg[1][26] , \min_val_reg[1][25] ,
         \min_val_reg[1][24] , \min_val_reg[1][23] , \min_val_reg[1][22] ,
         \min_val_reg[1][21] , \min_val_reg[1][20] , \min_val_reg[1][19] ,
         \min_val_reg[1][18] , \min_val_reg[1][17] , \min_val_reg[1][16] ,
         \min_val_reg[1][15] , \min_val_reg[1][14] , \min_val_reg[1][13] ,
         \min_val_reg[1][12] , \min_val_reg[1][11] , \min_val_reg[1][10] ,
         \min_val_reg[1][9] , \min_val_reg[1][8] , \min_val_reg[1][7] ,
         \min_val_reg[1][6] , \min_val_reg[1][5] , \min_val_reg[1][4] ,
         \min_val_reg[1][3] , \min_val_reg[1][2] , \min_val_reg[1][1] ,
         \min_val_reg[1][0] , \min_val_reg[0][30] , \min_val_reg[0][29] ,
         \min_val_reg[0][28] , \min_val_reg[0][27] , \min_val_reg[0][26] ,
         \min_val_reg[0][25] , \min_val_reg[0][24] , \min_val_reg[0][23] ,
         \min_val_reg[0][22] , \min_val_reg[0][21] , \min_val_reg[0][20] ,
         \min_val_reg[0][19] , \min_val_reg[0][18] , \min_val_reg[0][17] ,
         \min_val_reg[0][16] , \min_val_reg[0][15] , \min_val_reg[0][14] ,
         \min_val_reg[0][13] , \min_val_reg[0][12] , \min_val_reg[0][11] ,
         \min_val_reg[0][10] , \min_val_reg[0][9] , \min_val_reg[0][8] ,
         \min_val_reg[0][7] , \min_val_reg[0][6] , \min_val_reg[0][5] ,
         \min_val_reg[0][4] , \min_val_reg[0][3] , \min_val_reg[0][2] ,
         \min_val_reg[0][1] , \min_val_reg[0][0] , n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555;

  DFF \min_dist_reg_reg[0][0]  ( .D(\local_min_dist[0][0] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][0] ) );
  DFF \min_dist_reg_reg[0][1]  ( .D(\local_min_dist[0][1] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][1] ) );
  DFF \min_dist_reg_reg[0][2]  ( .D(\local_min_dist[0][2] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][2] ) );
  DFF \min_dist_reg_reg[0][3]  ( .D(\local_min_dist[0][3] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][3] ) );
  DFF \min_dist_reg_reg[0][4]  ( .D(\local_min_dist[0][4] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][4] ) );
  DFF \min_dist_reg_reg[1][0]  ( .D(\min_dist[1][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][0] ) );
  DFF \min_dist_reg_reg[1][1]  ( .D(\min_dist[1][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][1] ) );
  DFF \min_dist_reg_reg[1][2]  ( .D(\min_dist[1][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][2] ) );
  DFF \min_dist_reg_reg[1][3]  ( .D(\min_dist[1][3] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][3] ) );
  DFF \min_dist_reg_reg[1][4]  ( .D(\min_dist[1][4] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][4] ) );
  DFF \min_val_reg_reg[0][0]  ( .D(min_val_out[0]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][0] ) );
  DFF \min_val_reg_reg[0][1]  ( .D(min_val_out[1]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][1] ) );
  DFF \min_val_reg_reg[0][2]  ( .D(min_val_out[2]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][2] ) );
  DFF \min_val_reg_reg[0][3]  ( .D(min_val_out[3]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][3] ) );
  DFF \min_val_reg_reg[0][4]  ( .D(min_val_out[4]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][4] ) );
  DFF \min_val_reg_reg[0][5]  ( .D(min_val_out[5]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][5] ) );
  DFF \min_val_reg_reg[0][6]  ( .D(min_val_out[6]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][6] ) );
  DFF \min_val_reg_reg[0][7]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][7] ) );
  DFF \min_val_reg_reg[0][8]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][8] ) );
  DFF \min_val_reg_reg[0][9]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[0][9] ) );
  DFF \min_val_reg_reg[0][10]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][10] ) );
  DFF \min_val_reg_reg[0][11]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][11] ) );
  DFF \min_val_reg_reg[0][12]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][12] ) );
  DFF \min_val_reg_reg[0][13]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][13] ) );
  DFF \min_val_reg_reg[0][14]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][14] ) );
  DFF \min_val_reg_reg[0][15]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][15] ) );
  DFF \min_val_reg_reg[0][16]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][16] ) );
  DFF \min_val_reg_reg[0][17]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][17] ) );
  DFF \min_val_reg_reg[0][18]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][18] ) );
  DFF \min_val_reg_reg[0][19]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][19] ) );
  DFF \min_val_reg_reg[0][20]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][20] ) );
  DFF \min_val_reg_reg[0][21]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][21] ) );
  DFF \min_val_reg_reg[0][22]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][22] ) );
  DFF \min_val_reg_reg[0][23]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][23] ) );
  DFF \min_val_reg_reg[0][24]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][24] ) );
  DFF \min_val_reg_reg[0][25]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][25] ) );
  DFF \min_val_reg_reg[0][26]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][26] ) );
  DFF \min_val_reg_reg[0][27]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][27] ) );
  DFF \min_val_reg_reg[0][28]  ( .D(min_val_out[28]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][28] ) );
  DFF \min_val_reg_reg[0][29]  ( .D(min_val_out[29]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][29] ) );
  DFF \min_val_reg_reg[0][30]  ( .D(min_val_out[30]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[0][30] ) );
  DFF \min_val_reg_reg[1][0]  ( .D(min_val_out[31]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][0] ) );
  DFF \min_val_reg_reg[1][1]  ( .D(min_val_out[32]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][1] ) );
  DFF \min_val_reg_reg[1][2]  ( .D(min_val_out[33]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][2] ) );
  DFF \min_val_reg_reg[1][3]  ( .D(min_val_out[34]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][3] ) );
  DFF \min_val_reg_reg[1][4]  ( .D(min_val_out[35]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][4] ) );
  DFF \min_val_reg_reg[1][5]  ( .D(min_val_out[36]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][5] ) );
  DFF \min_val_reg_reg[1][6]  ( .D(min_val_out[37]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][6] ) );
  DFF \min_val_reg_reg[1][7]  ( .D(min_val_out[38]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][7] ) );
  DFF \min_val_reg_reg[1][8]  ( .D(min_val_out[39]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][8] ) );
  DFF \min_val_reg_reg[1][9]  ( .D(min_val_out[40]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][9] ) );
  DFF \min_val_reg_reg[1][10]  ( .D(min_val_out[41]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][10] ) );
  DFF \min_val_reg_reg[1][11]  ( .D(min_val_out[42]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][11] ) );
  DFF \min_val_reg_reg[1][12]  ( .D(min_val_out[43]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][12] ) );
  DFF \min_val_reg_reg[1][13]  ( .D(min_val_out[44]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][13] ) );
  DFF \min_val_reg_reg[1][14]  ( .D(min_val_out[45]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][14] ) );
  DFF \min_val_reg_reg[1][15]  ( .D(min_val_out[46]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][15] ) );
  DFF \min_val_reg_reg[1][16]  ( .D(min_val_out[47]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][16] ) );
  DFF \min_val_reg_reg[1][17]  ( .D(min_val_out[48]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][17] ) );
  DFF \min_val_reg_reg[1][18]  ( .D(min_val_out[49]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][18] ) );
  DFF \min_val_reg_reg[1][19]  ( .D(min_val_out[50]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][19] ) );
  DFF \min_val_reg_reg[1][20]  ( .D(min_val_out[51]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][20] ) );
  DFF \min_val_reg_reg[1][21]  ( .D(min_val_out[52]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][21] ) );
  DFF \min_val_reg_reg[1][22]  ( .D(min_val_out[53]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][22] ) );
  DFF \min_val_reg_reg[1][23]  ( .D(min_val_out[54]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][23] ) );
  DFF \min_val_reg_reg[1][24]  ( .D(min_val_out[55]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][24] ) );
  DFF \min_val_reg_reg[1][25]  ( .D(min_val_out[56]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][25] ) );
  DFF \min_val_reg_reg[1][26]  ( .D(min_val_out[57]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][26] ) );
  DFF \min_val_reg_reg[1][27]  ( .D(min_val_out[58]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][27] ) );
  DFF \min_val_reg_reg[1][28]  ( .D(min_val_out[59]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][28] ) );
  DFF \min_val_reg_reg[1][29]  ( .D(min_val_out[60]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][29] ) );
  DFF \min_val_reg_reg[1][30]  ( .D(min_val_out[61]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][30] ) );
  XNOR U106 ( .A(n289), .B(n290), .Z(n73) );
  XOR U107 ( .A(\min_val_reg[0][9] ), .B(n74), .Z(min_val_out[9]) );
  AND U108 ( .A(n75), .B(n76), .Z(n74) );
  XOR U109 ( .A(\min_val_reg[0][8] ), .B(n77), .Z(min_val_out[8]) );
  AND U110 ( .A(n75), .B(n78), .Z(n77) );
  XOR U111 ( .A(\min_val_reg[0][7] ), .B(n79), .Z(min_val_out[7]) );
  AND U112 ( .A(n75), .B(n80), .Z(n79) );
  XOR U113 ( .A(\min_val_reg[0][6] ), .B(n81), .Z(min_val_out[6]) );
  AND U114 ( .A(n75), .B(n82), .Z(n81) );
  XNOR U115 ( .A(n83), .B(n84), .Z(min_val_out[61]) );
  AND U116 ( .A(n85), .B(n86), .Z(n83) );
  XNOR U117 ( .A(n87), .B(n88), .Z(min_val_out[60]) );
  AND U118 ( .A(n85), .B(n89), .Z(n87) );
  XOR U119 ( .A(\min_val_reg[0][5] ), .B(n90), .Z(min_val_out[5]) );
  AND U120 ( .A(n75), .B(n91), .Z(n90) );
  XNOR U121 ( .A(n92), .B(n93), .Z(min_val_out[59]) );
  AND U122 ( .A(n85), .B(n94), .Z(n92) );
  XNOR U123 ( .A(n95), .B(n96), .Z(min_val_out[58]) );
  AND U124 ( .A(n85), .B(n97), .Z(n95) );
  XNOR U125 ( .A(n98), .B(n99), .Z(min_val_out[57]) );
  AND U126 ( .A(n85), .B(n100), .Z(n98) );
  XNOR U127 ( .A(n101), .B(n102), .Z(min_val_out[56]) );
  AND U128 ( .A(n85), .B(n103), .Z(n101) );
  XNOR U129 ( .A(n104), .B(n105), .Z(min_val_out[55]) );
  AND U130 ( .A(n85), .B(n106), .Z(n104) );
  XNOR U131 ( .A(n107), .B(n108), .Z(min_val_out[54]) );
  AND U132 ( .A(n85), .B(n109), .Z(n107) );
  XNOR U133 ( .A(n110), .B(n111), .Z(min_val_out[53]) );
  AND U134 ( .A(n85), .B(n112), .Z(n110) );
  XNOR U135 ( .A(n113), .B(n114), .Z(min_val_out[52]) );
  AND U136 ( .A(n85), .B(n115), .Z(n113) );
  XNOR U137 ( .A(n116), .B(n117), .Z(min_val_out[51]) );
  AND U138 ( .A(n85), .B(n118), .Z(n116) );
  XNOR U139 ( .A(n119), .B(n120), .Z(min_val_out[50]) );
  AND U140 ( .A(n85), .B(n121), .Z(n119) );
  XOR U141 ( .A(\min_val_reg[0][4] ), .B(n122), .Z(min_val_out[4]) );
  AND U142 ( .A(n75), .B(n123), .Z(n122) );
  XNOR U143 ( .A(n124), .B(n125), .Z(min_val_out[49]) );
  AND U144 ( .A(n85), .B(n126), .Z(n124) );
  XNOR U145 ( .A(n127), .B(n128), .Z(min_val_out[48]) );
  AND U146 ( .A(n85), .B(n129), .Z(n127) );
  XNOR U147 ( .A(n130), .B(n131), .Z(min_val_out[47]) );
  AND U148 ( .A(n85), .B(n132), .Z(n130) );
  XNOR U149 ( .A(n133), .B(n134), .Z(min_val_out[46]) );
  AND U150 ( .A(n85), .B(n135), .Z(n133) );
  XNOR U151 ( .A(n136), .B(n137), .Z(min_val_out[45]) );
  AND U152 ( .A(n85), .B(n138), .Z(n136) );
  XNOR U153 ( .A(n139), .B(n140), .Z(min_val_out[44]) );
  AND U154 ( .A(n85), .B(n141), .Z(n139) );
  XNOR U155 ( .A(n142), .B(n143), .Z(min_val_out[43]) );
  AND U156 ( .A(n85), .B(n144), .Z(n142) );
  XNOR U157 ( .A(n145), .B(n146), .Z(min_val_out[42]) );
  AND U158 ( .A(n85), .B(n147), .Z(n145) );
  XNOR U159 ( .A(n148), .B(n149), .Z(min_val_out[41]) );
  AND U160 ( .A(n85), .B(n150), .Z(n148) );
  XNOR U161 ( .A(n151), .B(n152), .Z(min_val_out[40]) );
  AND U162 ( .A(n85), .B(n76), .Z(n151) );
  XNOR U163 ( .A(\min_val_reg[0][9] ), .B(n152), .Z(n76) );
  XOR U164 ( .A(\min_val_reg[1][9] ), .B(n153), .Z(n152) );
  NAND U165 ( .A(n154), .B(n155), .Z(n153) );
  XOR U166 ( .A(\min_val_reg[1][9] ), .B(DB[9]), .Z(n154) );
  XOR U167 ( .A(\min_val_reg[0][3] ), .B(n156), .Z(min_val_out[3]) );
  AND U168 ( .A(n75), .B(n157), .Z(n156) );
  XNOR U169 ( .A(n158), .B(n159), .Z(min_val_out[39]) );
  AND U170 ( .A(n85), .B(n78), .Z(n158) );
  XNOR U171 ( .A(\min_val_reg[0][8] ), .B(n159), .Z(n78) );
  XOR U172 ( .A(\min_val_reg[1][8] ), .B(n160), .Z(n159) );
  NAND U173 ( .A(n161), .B(n155), .Z(n160) );
  XOR U174 ( .A(\min_val_reg[1][8] ), .B(DB[8]), .Z(n161) );
  XNOR U175 ( .A(n162), .B(n163), .Z(min_val_out[38]) );
  AND U176 ( .A(n85), .B(n80), .Z(n162) );
  XNOR U177 ( .A(\min_val_reg[0][7] ), .B(n163), .Z(n80) );
  XOR U178 ( .A(\min_val_reg[1][7] ), .B(n164), .Z(n163) );
  NAND U179 ( .A(n165), .B(n155), .Z(n164) );
  XOR U180 ( .A(\min_val_reg[1][7] ), .B(DB[7]), .Z(n165) );
  XNOR U181 ( .A(n166), .B(n167), .Z(min_val_out[37]) );
  AND U182 ( .A(n85), .B(n82), .Z(n166) );
  XNOR U183 ( .A(\min_val_reg[0][6] ), .B(n167), .Z(n82) );
  XOR U184 ( .A(\min_val_reg[1][6] ), .B(n168), .Z(n167) );
  NAND U185 ( .A(n169), .B(n155), .Z(n168) );
  XOR U186 ( .A(\min_val_reg[1][6] ), .B(DB[6]), .Z(n169) );
  XNOR U187 ( .A(n170), .B(n171), .Z(min_val_out[36]) );
  AND U188 ( .A(n85), .B(n91), .Z(n170) );
  XNOR U189 ( .A(\min_val_reg[0][5] ), .B(n171), .Z(n91) );
  XOR U190 ( .A(\min_val_reg[1][5] ), .B(n172), .Z(n171) );
  NAND U191 ( .A(n173), .B(n155), .Z(n172) );
  XOR U192 ( .A(\min_val_reg[1][5] ), .B(DB[5]), .Z(n173) );
  XNOR U193 ( .A(n174), .B(n175), .Z(min_val_out[35]) );
  AND U194 ( .A(n85), .B(n123), .Z(n174) );
  XNOR U195 ( .A(\min_val_reg[0][4] ), .B(n175), .Z(n123) );
  XOR U196 ( .A(\min_val_reg[1][4] ), .B(n176), .Z(n175) );
  NAND U197 ( .A(n177), .B(n155), .Z(n176) );
  XOR U198 ( .A(\min_val_reg[1][4] ), .B(DB[4]), .Z(n177) );
  XNOR U199 ( .A(n178), .B(n179), .Z(min_val_out[34]) );
  AND U200 ( .A(n85), .B(n157), .Z(n178) );
  XNOR U201 ( .A(\min_val_reg[0][3] ), .B(n179), .Z(n157) );
  XOR U202 ( .A(\min_val_reg[1][3] ), .B(n180), .Z(n179) );
  NAND U203 ( .A(n181), .B(n155), .Z(n180) );
  XOR U204 ( .A(\min_val_reg[1][3] ), .B(DB[3]), .Z(n181) );
  XNOR U205 ( .A(n182), .B(n183), .Z(min_val_out[33]) );
  AND U206 ( .A(n85), .B(n184), .Z(n182) );
  XNOR U207 ( .A(n185), .B(n186), .Z(min_val_out[32]) );
  AND U208 ( .A(n85), .B(n187), .Z(n185) );
  XNOR U209 ( .A(n188), .B(n189), .Z(min_val_out[31]) );
  AND U210 ( .A(n85), .B(n190), .Z(n188) );
  XOR U211 ( .A(\min_val_reg[0][30] ), .B(n191), .Z(min_val_out[30]) );
  AND U212 ( .A(n75), .B(n86), .Z(n191) );
  XNOR U213 ( .A(\min_val_reg[0][30] ), .B(n84), .Z(n86) );
  XOR U214 ( .A(\min_val_reg[1][30] ), .B(n192), .Z(n84) );
  NAND U215 ( .A(n193), .B(n155), .Z(n192) );
  XOR U216 ( .A(\min_val_reg[1][30] ), .B(DB[30]), .Z(n193) );
  XOR U217 ( .A(\min_val_reg[0][2] ), .B(n194), .Z(min_val_out[2]) );
  AND U218 ( .A(n75), .B(n184), .Z(n194) );
  XNOR U219 ( .A(\min_val_reg[0][2] ), .B(n183), .Z(n184) );
  XOR U220 ( .A(\min_val_reg[1][2] ), .B(n195), .Z(n183) );
  NAND U221 ( .A(n196), .B(n155), .Z(n195) );
  XOR U222 ( .A(\min_val_reg[1][2] ), .B(DB[2]), .Z(n196) );
  XOR U223 ( .A(\min_val_reg[0][29] ), .B(n197), .Z(min_val_out[29]) );
  AND U224 ( .A(n75), .B(n89), .Z(n197) );
  XNOR U225 ( .A(\min_val_reg[0][29] ), .B(n88), .Z(n89) );
  XOR U226 ( .A(\min_val_reg[1][29] ), .B(n198), .Z(n88) );
  NAND U227 ( .A(n199), .B(n155), .Z(n198) );
  XOR U228 ( .A(\min_val_reg[1][29] ), .B(DB[29]), .Z(n199) );
  XOR U229 ( .A(\min_val_reg[0][28] ), .B(n200), .Z(min_val_out[28]) );
  AND U230 ( .A(n75), .B(n94), .Z(n200) );
  XNOR U231 ( .A(\min_val_reg[0][28] ), .B(n93), .Z(n94) );
  XOR U232 ( .A(\min_val_reg[1][28] ), .B(n201), .Z(n93) );
  NAND U233 ( .A(n202), .B(n155), .Z(n201) );
  XOR U234 ( .A(\min_val_reg[1][28] ), .B(DB[28]), .Z(n202) );
  XOR U235 ( .A(\min_val_reg[0][27] ), .B(n203), .Z(min_val_out[27]) );
  AND U236 ( .A(n75), .B(n97), .Z(n203) );
  XNOR U237 ( .A(\min_val_reg[0][27] ), .B(n96), .Z(n97) );
  XOR U238 ( .A(\min_val_reg[1][27] ), .B(n204), .Z(n96) );
  NAND U239 ( .A(n205), .B(n155), .Z(n204) );
  XOR U240 ( .A(\min_val_reg[1][27] ), .B(DB[27]), .Z(n205) );
  XOR U241 ( .A(\min_val_reg[0][26] ), .B(n206), .Z(min_val_out[26]) );
  AND U242 ( .A(n75), .B(n100), .Z(n206) );
  XNOR U243 ( .A(\min_val_reg[0][26] ), .B(n99), .Z(n100) );
  XOR U244 ( .A(\min_val_reg[1][26] ), .B(n207), .Z(n99) );
  NAND U245 ( .A(n208), .B(n155), .Z(n207) );
  XOR U246 ( .A(\min_val_reg[1][26] ), .B(DB[26]), .Z(n208) );
  XOR U247 ( .A(\min_val_reg[0][25] ), .B(n209), .Z(min_val_out[25]) );
  AND U248 ( .A(n75), .B(n103), .Z(n209) );
  XNOR U249 ( .A(\min_val_reg[0][25] ), .B(n102), .Z(n103) );
  XOR U250 ( .A(\min_val_reg[1][25] ), .B(n210), .Z(n102) );
  NAND U251 ( .A(n211), .B(n155), .Z(n210) );
  XOR U252 ( .A(\min_val_reg[1][25] ), .B(DB[25]), .Z(n211) );
  XOR U253 ( .A(\min_val_reg[0][24] ), .B(n212), .Z(min_val_out[24]) );
  AND U254 ( .A(n75), .B(n106), .Z(n212) );
  XNOR U255 ( .A(\min_val_reg[0][24] ), .B(n105), .Z(n106) );
  XOR U256 ( .A(\min_val_reg[1][24] ), .B(n213), .Z(n105) );
  NAND U257 ( .A(n214), .B(n155), .Z(n213) );
  XOR U258 ( .A(\min_val_reg[1][24] ), .B(DB[24]), .Z(n214) );
  XOR U259 ( .A(\min_val_reg[0][23] ), .B(n215), .Z(min_val_out[23]) );
  AND U260 ( .A(n75), .B(n109), .Z(n215) );
  XNOR U261 ( .A(\min_val_reg[0][23] ), .B(n108), .Z(n109) );
  XOR U262 ( .A(\min_val_reg[1][23] ), .B(n216), .Z(n108) );
  NAND U263 ( .A(n217), .B(n155), .Z(n216) );
  XOR U264 ( .A(\min_val_reg[1][23] ), .B(DB[23]), .Z(n217) );
  XOR U265 ( .A(\min_val_reg[0][22] ), .B(n218), .Z(min_val_out[22]) );
  AND U266 ( .A(n75), .B(n112), .Z(n218) );
  XNOR U267 ( .A(\min_val_reg[0][22] ), .B(n111), .Z(n112) );
  XOR U268 ( .A(\min_val_reg[1][22] ), .B(n219), .Z(n111) );
  NAND U269 ( .A(n220), .B(n155), .Z(n219) );
  XOR U270 ( .A(\min_val_reg[1][22] ), .B(DB[22]), .Z(n220) );
  XOR U271 ( .A(\min_val_reg[0][21] ), .B(n221), .Z(min_val_out[21]) );
  AND U272 ( .A(n75), .B(n115), .Z(n221) );
  XNOR U273 ( .A(\min_val_reg[0][21] ), .B(n114), .Z(n115) );
  XOR U274 ( .A(\min_val_reg[1][21] ), .B(n222), .Z(n114) );
  NAND U275 ( .A(n223), .B(n155), .Z(n222) );
  XOR U276 ( .A(\min_val_reg[1][21] ), .B(DB[21]), .Z(n223) );
  XOR U277 ( .A(\min_val_reg[0][20] ), .B(n224), .Z(min_val_out[20]) );
  AND U278 ( .A(n75), .B(n118), .Z(n224) );
  XNOR U279 ( .A(\min_val_reg[0][20] ), .B(n117), .Z(n118) );
  XOR U280 ( .A(\min_val_reg[1][20] ), .B(n225), .Z(n117) );
  NAND U281 ( .A(n226), .B(n155), .Z(n225) );
  XOR U282 ( .A(\min_val_reg[1][20] ), .B(DB[20]), .Z(n226) );
  XOR U283 ( .A(\min_val_reg[0][1] ), .B(n227), .Z(min_val_out[1]) );
  AND U284 ( .A(n75), .B(n187), .Z(n227) );
  XNOR U285 ( .A(\min_val_reg[0][1] ), .B(n186), .Z(n187) );
  XOR U286 ( .A(\min_val_reg[1][1] ), .B(n228), .Z(n186) );
  NAND U287 ( .A(n229), .B(n155), .Z(n228) );
  XOR U288 ( .A(\min_val_reg[1][1] ), .B(DB[1]), .Z(n229) );
  XOR U289 ( .A(\min_val_reg[0][19] ), .B(n230), .Z(min_val_out[19]) );
  AND U290 ( .A(n75), .B(n121), .Z(n230) );
  XNOR U291 ( .A(\min_val_reg[0][19] ), .B(n120), .Z(n121) );
  XOR U292 ( .A(\min_val_reg[1][19] ), .B(n231), .Z(n120) );
  NAND U293 ( .A(n232), .B(n155), .Z(n231) );
  XOR U294 ( .A(\min_val_reg[1][19] ), .B(DB[19]), .Z(n232) );
  XOR U295 ( .A(\min_val_reg[0][18] ), .B(n233), .Z(min_val_out[18]) );
  AND U296 ( .A(n75), .B(n126), .Z(n233) );
  XNOR U297 ( .A(\min_val_reg[0][18] ), .B(n125), .Z(n126) );
  XOR U298 ( .A(\min_val_reg[1][18] ), .B(n234), .Z(n125) );
  NAND U299 ( .A(n235), .B(n155), .Z(n234) );
  XOR U300 ( .A(\min_val_reg[1][18] ), .B(DB[18]), .Z(n235) );
  XOR U301 ( .A(\min_val_reg[0][17] ), .B(n236), .Z(min_val_out[17]) );
  AND U302 ( .A(n75), .B(n129), .Z(n236) );
  XNOR U303 ( .A(\min_val_reg[0][17] ), .B(n128), .Z(n129) );
  XOR U304 ( .A(\min_val_reg[1][17] ), .B(n237), .Z(n128) );
  NAND U305 ( .A(n238), .B(n155), .Z(n237) );
  XOR U306 ( .A(\min_val_reg[1][17] ), .B(DB[17]), .Z(n238) );
  XOR U307 ( .A(\min_val_reg[0][16] ), .B(n239), .Z(min_val_out[16]) );
  AND U308 ( .A(n75), .B(n132), .Z(n239) );
  XNOR U309 ( .A(\min_val_reg[0][16] ), .B(n131), .Z(n132) );
  XOR U310 ( .A(\min_val_reg[1][16] ), .B(n240), .Z(n131) );
  NAND U311 ( .A(n241), .B(n155), .Z(n240) );
  XOR U312 ( .A(\min_val_reg[1][16] ), .B(DB[16]), .Z(n241) );
  XOR U313 ( .A(\min_val_reg[0][15] ), .B(n242), .Z(min_val_out[15]) );
  AND U314 ( .A(n75), .B(n135), .Z(n242) );
  XNOR U315 ( .A(\min_val_reg[0][15] ), .B(n134), .Z(n135) );
  XOR U316 ( .A(\min_val_reg[1][15] ), .B(n243), .Z(n134) );
  NAND U317 ( .A(n244), .B(n155), .Z(n243) );
  XOR U318 ( .A(\min_val_reg[1][15] ), .B(DB[15]), .Z(n244) );
  XOR U319 ( .A(\min_val_reg[0][14] ), .B(n245), .Z(min_val_out[14]) );
  AND U320 ( .A(n75), .B(n138), .Z(n245) );
  XNOR U321 ( .A(\min_val_reg[0][14] ), .B(n137), .Z(n138) );
  XOR U322 ( .A(\min_val_reg[1][14] ), .B(n246), .Z(n137) );
  NAND U323 ( .A(n247), .B(n155), .Z(n246) );
  XOR U324 ( .A(\min_val_reg[1][14] ), .B(DB[14]), .Z(n247) );
  XOR U325 ( .A(\min_val_reg[0][13] ), .B(n248), .Z(min_val_out[13]) );
  AND U326 ( .A(n75), .B(n141), .Z(n248) );
  XNOR U327 ( .A(\min_val_reg[0][13] ), .B(n140), .Z(n141) );
  XOR U328 ( .A(\min_val_reg[1][13] ), .B(n249), .Z(n140) );
  NAND U329 ( .A(n250), .B(n155), .Z(n249) );
  XOR U330 ( .A(\min_val_reg[1][13] ), .B(DB[13]), .Z(n250) );
  XOR U331 ( .A(\min_val_reg[0][12] ), .B(n251), .Z(min_val_out[12]) );
  AND U332 ( .A(n75), .B(n144), .Z(n251) );
  XNOR U333 ( .A(\min_val_reg[0][12] ), .B(n143), .Z(n144) );
  XOR U334 ( .A(\min_val_reg[1][12] ), .B(n252), .Z(n143) );
  NAND U335 ( .A(n253), .B(n155), .Z(n252) );
  XOR U336 ( .A(\min_val_reg[1][12] ), .B(DB[12]), .Z(n253) );
  XOR U337 ( .A(\min_val_reg[0][11] ), .B(n254), .Z(min_val_out[11]) );
  AND U338 ( .A(n75), .B(n147), .Z(n254) );
  XNOR U339 ( .A(\min_val_reg[0][11] ), .B(n146), .Z(n147) );
  XOR U340 ( .A(\min_val_reg[1][11] ), .B(n255), .Z(n146) );
  NAND U341 ( .A(n256), .B(n155), .Z(n255) );
  XOR U342 ( .A(\min_val_reg[1][11] ), .B(DB[11]), .Z(n256) );
  XOR U343 ( .A(\min_val_reg[0][10] ), .B(n257), .Z(min_val_out[10]) );
  AND U344 ( .A(n75), .B(n150), .Z(n257) );
  XNOR U345 ( .A(\min_val_reg[0][10] ), .B(n149), .Z(n150) );
  XOR U346 ( .A(\min_val_reg[1][10] ), .B(n258), .Z(n149) );
  NAND U347 ( .A(n259), .B(n155), .Z(n258) );
  XOR U348 ( .A(\min_val_reg[1][10] ), .B(DB[10]), .Z(n259) );
  XOR U349 ( .A(\min_val_reg[0][0] ), .B(n260), .Z(min_val_out[0]) );
  AND U350 ( .A(n75), .B(n190), .Z(n260) );
  XNOR U351 ( .A(\min_val_reg[0][0] ), .B(n189), .Z(n190) );
  XOR U352 ( .A(\min_val_reg[1][0] ), .B(n261), .Z(n189) );
  NAND U353 ( .A(n262), .B(n155), .Z(n261) );
  XOR U354 ( .A(\min_val_reg[1][0] ), .B(DB[0]), .Z(n262) );
  XNOR U355 ( .A(n263), .B(n264), .Z(\min_dist[1][4] ) );
  AND U356 ( .A(n85), .B(n265), .Z(n263) );
  XNOR U357 ( .A(\min_dist_reg[0][4] ), .B(n264), .Z(n265) );
  XOR U358 ( .A(n266), .B(n267), .Z(\min_dist[1][3] ) );
  AND U359 ( .A(n85), .B(n268), .Z(n266) );
  XNOR U360 ( .A(\min_dist_reg[0][3] ), .B(n269), .Z(n268) );
  XOR U361 ( .A(n270), .B(n271), .Z(\min_dist[1][2] ) );
  AND U362 ( .A(n85), .B(n272), .Z(n270) );
  XNOR U363 ( .A(\min_dist_reg[0][2] ), .B(n273), .Z(n272) );
  XOR U364 ( .A(n274), .B(n275), .Z(\min_dist[1][1] ) );
  AND U365 ( .A(n85), .B(n276), .Z(n274) );
  XNOR U366 ( .A(\min_dist_reg[0][1] ), .B(n277), .Z(n276) );
  XNOR U367 ( .A(n278), .B(n279), .Z(\min_dist[1][0] ) );
  AND U368 ( .A(n85), .B(n280), .Z(n278) );
  XNOR U369 ( .A(\min_dist_reg[0][0] ), .B(n279), .Z(n280) );
  XNOR U370 ( .A(n281), .B(n282), .Z(n85) );
  AND U371 ( .A(n283), .B(n284), .Z(n281) );
  XNOR U372 ( .A(n264), .B(n282), .Z(n284) );
  IV U373 ( .A(n285), .Z(n264) );
  XNOR U374 ( .A(\min_dist_reg[0][4] ), .B(n282), .Z(n283) );
  XOR U375 ( .A(n286), .B(n73), .Z(n282) );
  AND U376 ( .A(n287), .B(n288), .Z(n286) );
  XNOR U377 ( .A(n269), .B(n73), .Z(n288) );
  IV U378 ( .A(n267), .Z(n269) );
  XNOR U379 ( .A(\min_dist_reg[0][3] ), .B(n73), .Z(n287) );
  AND U380 ( .A(n291), .B(n292), .Z(n289) );
  XOR U381 ( .A(n273), .B(n290), .Z(n292) );
  XOR U382 ( .A(\min_dist_reg[0][2] ), .B(n290), .Z(n291) );
  XOR U383 ( .A(n293), .B(n294), .Z(n290) );
  NAND U384 ( .A(n295), .B(n296), .Z(n294) );
  XNOR U385 ( .A(n293), .B(n277), .Z(n296) );
  XNOR U386 ( .A(\min_dist_reg[0][1] ), .B(n293), .Z(n295) );
  NOR U387 ( .A(n279), .B(\min_dist_reg[0][0] ), .Z(n293) );
  IV U388 ( .A(n297), .Z(n279) );
  AND U389 ( .A(\min_dist_reg[0][4] ), .B(n298), .Z(\local_min_dist[0][4] ) );
  NANDN U390 ( .A(n285), .B(n75), .Z(n298) );
  XOR U391 ( .A(\min_dist_reg[0][3] ), .B(n299), .Z(\local_min_dist[0][3] ) );
  AND U392 ( .A(n75), .B(n300), .Z(n299) );
  XOR U393 ( .A(\min_dist_reg[0][3] ), .B(n267), .Z(n300) );
  XOR U394 ( .A(\min_dist_reg[0][2] ), .B(n301), .Z(\local_min_dist[0][2] ) );
  AND U395 ( .A(n75), .B(n302), .Z(n301) );
  XOR U396 ( .A(\min_dist_reg[0][2] ), .B(n271), .Z(n302) );
  XOR U397 ( .A(\min_dist_reg[0][1] ), .B(n303), .Z(\local_min_dist[0][1] ) );
  AND U398 ( .A(n75), .B(n304), .Z(n303) );
  XOR U399 ( .A(\min_dist_reg[0][1] ), .B(n275), .Z(n304) );
  XOR U400 ( .A(\min_dist_reg[0][0] ), .B(n305), .Z(\local_min_dist[0][0] ) );
  AND U401 ( .A(n75), .B(n306), .Z(n305) );
  XOR U402 ( .A(\min_dist_reg[0][0] ), .B(n297), .Z(n306) );
  XNOR U403 ( .A(n307), .B(n308), .Z(n75) );
  AND U404 ( .A(n309), .B(n310), .Z(n307) );
  XNOR U405 ( .A(n311), .B(n285), .Z(n310) );
  XNOR U406 ( .A(\min_dist_reg[1][4] ), .B(n312), .Z(n285) );
  NAND U407 ( .A(n313), .B(n155), .Z(n312) );
  XOR U408 ( .A(\min_dist_reg[1][4] ), .B(n314), .Z(n313) );
  XNOR U409 ( .A(\min_dist_reg[0][4] ), .B(n308), .Z(n309) );
  IV U410 ( .A(n311), .Z(n308) );
  XOR U411 ( .A(n315), .B(n316), .Z(n311) );
  AND U412 ( .A(n317), .B(n318), .Z(n315) );
  XNOR U413 ( .A(n316), .B(n267), .Z(n318) );
  XNOR U414 ( .A(\min_dist_reg[1][3] ), .B(n319), .Z(n267) );
  NAND U415 ( .A(n320), .B(n155), .Z(n319) );
  XNOR U416 ( .A(\min_dist_reg[1][3] ), .B(n321), .Z(n320) );
  XNOR U417 ( .A(\min_dist_reg[0][3] ), .B(n322), .Z(n317) );
  IV U418 ( .A(n316), .Z(n322) );
  XOR U419 ( .A(n323), .B(n324), .Z(n316) );
  AND U420 ( .A(n325), .B(n326), .Z(n323) );
  XOR U421 ( .A(n324), .B(n273), .Z(n326) );
  IV U422 ( .A(n271), .Z(n273) );
  XNOR U423 ( .A(\min_dist_reg[1][2] ), .B(n327), .Z(n271) );
  NAND U424 ( .A(n328), .B(n155), .Z(n327) );
  XNOR U425 ( .A(\min_dist_reg[1][2] ), .B(n329), .Z(n328) );
  XOR U426 ( .A(\min_dist_reg[0][2] ), .B(n324), .Z(n325) );
  XOR U427 ( .A(n330), .B(n331), .Z(n324) );
  NAND U428 ( .A(n332), .B(n333), .Z(n331) );
  XNOR U429 ( .A(n330), .B(n277), .Z(n333) );
  IV U430 ( .A(n275), .Z(n277) );
  XNOR U431 ( .A(\min_dist_reg[1][1] ), .B(n334), .Z(n275) );
  NAND U432 ( .A(n335), .B(n155), .Z(n334) );
  XNOR U433 ( .A(\min_dist_reg[1][1] ), .B(n336), .Z(n335) );
  XNOR U434 ( .A(\min_dist_reg[0][1] ), .B(n330), .Z(n332) );
  ANDN U435 ( .B(n297), .A(\min_dist_reg[0][0] ), .Z(n330) );
  XOR U436 ( .A(n337), .B(n338), .Z(n297) );
  NAND U437 ( .A(n339), .B(n155), .Z(n338) );
  XNOR U438 ( .A(n340), .B(n341), .Z(n155) );
  AND U439 ( .A(n342), .B(n343), .Z(n340) );
  XNOR U440 ( .A(n344), .B(n314), .Z(n343) );
  XNOR U441 ( .A(n345), .B(n346), .Z(n314) );
  ANDN U442 ( .B(n347), .A(n348), .Z(n345) );
  XOR U443 ( .A(n346), .B(n349), .Z(n347) );
  XNOR U444 ( .A(\min_dist_reg[1][4] ), .B(n341), .Z(n342) );
  IV U445 ( .A(n344), .Z(n341) );
  XOR U446 ( .A(n350), .B(n351), .Z(n344) );
  AND U447 ( .A(n352), .B(n353), .Z(n350) );
  XOR U448 ( .A(n351), .B(n321), .Z(n353) );
  XOR U449 ( .A(n354), .B(n349), .Z(n321) );
  XNOR U450 ( .A(n355), .B(n356), .Z(n349) );
  ANDN U451 ( .B(n357), .A(n358), .Z(n355) );
  XOR U452 ( .A(n359), .B(n360), .Z(n357) );
  IV U453 ( .A(n348), .Z(n354) );
  XOR U454 ( .A(n361), .B(n362), .Z(n348) );
  XNOR U455 ( .A(n363), .B(n364), .Z(n362) );
  ANDN U456 ( .B(n365), .A(n366), .Z(n363) );
  XNOR U457 ( .A(n367), .B(n368), .Z(n365) );
  IV U458 ( .A(n346), .Z(n361) );
  XOR U459 ( .A(n369), .B(n370), .Z(n346) );
  ANDN U460 ( .B(n371), .A(n372), .Z(n369) );
  XOR U461 ( .A(n370), .B(n373), .Z(n371) );
  XNOR U462 ( .A(\min_dist_reg[1][3] ), .B(n374), .Z(n352) );
  IV U463 ( .A(n351), .Z(n374) );
  XOR U464 ( .A(n375), .B(n376), .Z(n351) );
  AND U465 ( .A(n377), .B(n378), .Z(n375) );
  XOR U466 ( .A(n376), .B(n329), .Z(n378) );
  XOR U467 ( .A(n379), .B(n373), .Z(n329) );
  XOR U468 ( .A(n380), .B(n360), .Z(n373) );
  XNOR U469 ( .A(n381), .B(n382), .Z(n360) );
  ANDN U470 ( .B(n383), .A(n384), .Z(n381) );
  XOR U471 ( .A(n385), .B(n386), .Z(n383) );
  IV U472 ( .A(n358), .Z(n380) );
  XOR U473 ( .A(n356), .B(n387), .Z(n358) );
  XNOR U474 ( .A(n388), .B(n389), .Z(n387) );
  ANDN U475 ( .B(n390), .A(n391), .Z(n388) );
  XNOR U476 ( .A(n392), .B(n393), .Z(n390) );
  IV U477 ( .A(n359), .Z(n356) );
  XOR U478 ( .A(n394), .B(n395), .Z(n359) );
  ANDN U479 ( .B(n396), .A(n397), .Z(n394) );
  XOR U480 ( .A(n395), .B(n398), .Z(n396) );
  IV U481 ( .A(n372), .Z(n379) );
  XOR U482 ( .A(n399), .B(n400), .Z(n372) );
  XNOR U483 ( .A(n367), .B(n401), .Z(n400) );
  IV U484 ( .A(n370), .Z(n401) );
  XOR U485 ( .A(n402), .B(n403), .Z(n370) );
  ANDN U486 ( .B(n404), .A(n405), .Z(n402) );
  XOR U487 ( .A(n403), .B(n406), .Z(n404) );
  XNOR U488 ( .A(n407), .B(n408), .Z(n367) );
  ANDN U489 ( .B(n409), .A(n410), .Z(n407) );
  XOR U490 ( .A(n408), .B(n411), .Z(n409) );
  IV U491 ( .A(n366), .Z(n399) );
  XOR U492 ( .A(n364), .B(n412), .Z(n366) );
  XNOR U493 ( .A(n413), .B(n414), .Z(n412) );
  ANDN U494 ( .B(n415), .A(n416), .Z(n413) );
  XNOR U495 ( .A(n417), .B(n418), .Z(n415) );
  IV U496 ( .A(n368), .Z(n364) );
  XOR U497 ( .A(n419), .B(n420), .Z(n368) );
  ANDN U498 ( .B(n421), .A(n422), .Z(n419) );
  XOR U499 ( .A(n423), .B(n420), .Z(n421) );
  XOR U500 ( .A(\min_dist_reg[1][2] ), .B(n376), .Z(n377) );
  XOR U501 ( .A(n424), .B(n425), .Z(n376) );
  NAND U502 ( .A(n426), .B(n427), .Z(n425) );
  XNOR U503 ( .A(n424), .B(n336), .Z(n427) );
  XOR U504 ( .A(n428), .B(n406), .Z(n336) );
  XOR U505 ( .A(n429), .B(n398), .Z(n406) );
  XOR U506 ( .A(n430), .B(n386), .Z(n398) );
  XNOR U507 ( .A(n431), .B(n432), .Z(n386) );
  ANDN U508 ( .B(n433), .A(n434), .Z(n431) );
  XNOR U509 ( .A(n432), .B(n435), .Z(n433) );
  IV U510 ( .A(n384), .Z(n430) );
  XOR U511 ( .A(n382), .B(n436), .Z(n384) );
  XNOR U512 ( .A(n437), .B(n438), .Z(n436) );
  ANDN U513 ( .B(n439), .A(n440), .Z(n437) );
  XNOR U514 ( .A(n441), .B(n442), .Z(n439) );
  IV U515 ( .A(n438), .Z(n442) );
  IV U516 ( .A(n385), .Z(n382) );
  XNOR U517 ( .A(n443), .B(n444), .Z(n385) );
  ANDN U518 ( .B(n445), .A(n446), .Z(n443) );
  XNOR U519 ( .A(n444), .B(n447), .Z(n445) );
  IV U520 ( .A(n397), .Z(n429) );
  XOR U521 ( .A(n448), .B(n449), .Z(n397) );
  XNOR U522 ( .A(n392), .B(n450), .Z(n449) );
  IV U523 ( .A(n395), .Z(n450) );
  XNOR U524 ( .A(n451), .B(n452), .Z(n395) );
  ANDN U525 ( .B(n453), .A(n454), .Z(n451) );
  XNOR U526 ( .A(n452), .B(n455), .Z(n453) );
  XOR U527 ( .A(n456), .B(n457), .Z(n392) );
  ANDN U528 ( .B(n458), .A(n459), .Z(n456) );
  XNOR U529 ( .A(n457), .B(n460), .Z(n458) );
  IV U530 ( .A(n391), .Z(n448) );
  XOR U531 ( .A(n389), .B(n461), .Z(n391) );
  XNOR U532 ( .A(n462), .B(n463), .Z(n461) );
  ANDN U533 ( .B(n464), .A(n465), .Z(n462) );
  XNOR U534 ( .A(n466), .B(n467), .Z(n464) );
  IV U535 ( .A(n463), .Z(n467) );
  IV U536 ( .A(n393), .Z(n389) );
  XNOR U537 ( .A(n468), .B(n469), .Z(n393) );
  ANDN U538 ( .B(n470), .A(n471), .Z(n468) );
  XNOR U539 ( .A(n472), .B(n469), .Z(n470) );
  IV U540 ( .A(n405), .Z(n428) );
  XOR U541 ( .A(n473), .B(n474), .Z(n405) );
  XOR U542 ( .A(n423), .B(n475), .Z(n474) );
  IV U543 ( .A(n403), .Z(n475) );
  XNOR U544 ( .A(n476), .B(n477), .Z(n403) );
  ANDN U545 ( .B(n478), .A(n479), .Z(n476) );
  XNOR U546 ( .A(n477), .B(n480), .Z(n478) );
  XOR U547 ( .A(n481), .B(n411), .Z(n423) );
  XNOR U548 ( .A(n482), .B(n483), .Z(n411) );
  ANDN U549 ( .B(n484), .A(n485), .Z(n482) );
  XNOR U550 ( .A(n483), .B(n486), .Z(n484) );
  IV U551 ( .A(n410), .Z(n481) );
  XOR U552 ( .A(n487), .B(n488), .Z(n410) );
  XNOR U553 ( .A(n489), .B(n490), .Z(n488) );
  ANDN U554 ( .B(n491), .A(n492), .Z(n489) );
  XNOR U555 ( .A(n493), .B(n494), .Z(n491) );
  IV U556 ( .A(n490), .Z(n494) );
  IV U557 ( .A(n408), .Z(n487) );
  XNOR U558 ( .A(n495), .B(n496), .Z(n408) );
  ANDN U559 ( .B(n497), .A(n498), .Z(n495) );
  XNOR U560 ( .A(n496), .B(n499), .Z(n497) );
  IV U561 ( .A(n422), .Z(n473) );
  XOR U562 ( .A(n500), .B(n501), .Z(n422) );
  XNOR U563 ( .A(n417), .B(n502), .Z(n501) );
  IV U564 ( .A(n420), .Z(n502) );
  XNOR U565 ( .A(n503), .B(n504), .Z(n420) );
  ANDN U566 ( .B(n505), .A(n506), .Z(n503) );
  XNOR U567 ( .A(n507), .B(n504), .Z(n505) );
  XOR U568 ( .A(n508), .B(n509), .Z(n417) );
  ANDN U569 ( .B(n510), .A(n511), .Z(n508) );
  XNOR U570 ( .A(n509), .B(n512), .Z(n510) );
  IV U571 ( .A(n416), .Z(n500) );
  XOR U572 ( .A(n414), .B(n513), .Z(n416) );
  XNOR U573 ( .A(n514), .B(n515), .Z(n513) );
  ANDN U574 ( .B(n516), .A(n517), .Z(n514) );
  XNOR U575 ( .A(n518), .B(n519), .Z(n516) );
  IV U576 ( .A(n515), .Z(n519) );
  IV U577 ( .A(n418), .Z(n414) );
  XNOR U578 ( .A(n520), .B(n521), .Z(n418) );
  ANDN U579 ( .B(n522), .A(n523), .Z(n520) );
  XNOR U580 ( .A(n524), .B(n521), .Z(n522) );
  XNOR U581 ( .A(\min_dist_reg[1][1] ), .B(n424), .Z(n426) );
  NOR U582 ( .A(\min_dist_reg[1][0] ), .B(n525), .Z(n424) );
  XOR U583 ( .A(n337), .B(n525), .Z(n339) );
  XOR U584 ( .A(n526), .B(n480), .Z(n525) );
  XOR U585 ( .A(n527), .B(n455), .Z(n480) );
  XOR U586 ( .A(n528), .B(n447), .Z(n455) );
  XOR U587 ( .A(n529), .B(n435), .Z(n447) );
  XNOR U588 ( .A(q[30]), .B(DB[30]), .Z(n435) );
  IV U589 ( .A(n434), .Z(n529) );
  XOR U590 ( .A(n432), .B(n530), .Z(n434) );
  XNOR U591 ( .A(q[29]), .B(DB[29]), .Z(n530) );
  XOR U592 ( .A(q[28]), .B(DB[28]), .Z(n432) );
  IV U593 ( .A(n446), .Z(n528) );
  XOR U594 ( .A(n531), .B(n532), .Z(n446) );
  XNOR U595 ( .A(n441), .B(n444), .Z(n532) );
  XOR U596 ( .A(q[24]), .B(DB[24]), .Z(n444) );
  XOR U597 ( .A(q[27]), .B(DB[27]), .Z(n441) );
  IV U598 ( .A(n440), .Z(n531) );
  XOR U599 ( .A(n438), .B(n533), .Z(n440) );
  XNOR U600 ( .A(q[26]), .B(DB[26]), .Z(n533) );
  XOR U601 ( .A(q[25]), .B(DB[25]), .Z(n438) );
  IV U602 ( .A(n454), .Z(n527) );
  XOR U603 ( .A(n534), .B(n535), .Z(n454) );
  XOR U604 ( .A(n472), .B(n452), .Z(n535) );
  XOR U605 ( .A(q[16]), .B(DB[16]), .Z(n452) );
  XOR U606 ( .A(n536), .B(n460), .Z(n472) );
  XNOR U607 ( .A(q[23]), .B(DB[23]), .Z(n460) );
  IV U608 ( .A(n459), .Z(n536) );
  XOR U609 ( .A(n457), .B(n537), .Z(n459) );
  XNOR U610 ( .A(q[22]), .B(DB[22]), .Z(n537) );
  XOR U611 ( .A(q[21]), .B(DB[21]), .Z(n457) );
  IV U612 ( .A(n471), .Z(n534) );
  XOR U613 ( .A(n538), .B(n539), .Z(n471) );
  XNOR U614 ( .A(n466), .B(n469), .Z(n539) );
  XOR U615 ( .A(q[17]), .B(DB[17]), .Z(n469) );
  XOR U616 ( .A(q[20]), .B(DB[20]), .Z(n466) );
  IV U617 ( .A(n465), .Z(n538) );
  XOR U618 ( .A(n463), .B(n540), .Z(n465) );
  XNOR U619 ( .A(q[19]), .B(DB[19]), .Z(n540) );
  XOR U620 ( .A(q[18]), .B(DB[18]), .Z(n463) );
  IV U621 ( .A(n479), .Z(n526) );
  XOR U622 ( .A(n541), .B(n542), .Z(n479) );
  XOR U623 ( .A(n507), .B(n477), .Z(n542) );
  XOR U624 ( .A(q[0]), .B(DB[0]), .Z(n477) );
  XOR U625 ( .A(n543), .B(n499), .Z(n507) );
  XOR U626 ( .A(n544), .B(n486), .Z(n499) );
  XNOR U627 ( .A(q[15]), .B(DB[15]), .Z(n486) );
  IV U628 ( .A(n485), .Z(n544) );
  XOR U629 ( .A(n483), .B(n545), .Z(n485) );
  XNOR U630 ( .A(q[14]), .B(DB[14]), .Z(n545) );
  XOR U631 ( .A(q[13]), .B(DB[13]), .Z(n483) );
  IV U632 ( .A(n498), .Z(n543) );
  XOR U633 ( .A(n546), .B(n547), .Z(n498) );
  XNOR U634 ( .A(n493), .B(n496), .Z(n547) );
  XOR U635 ( .A(q[9]), .B(DB[9]), .Z(n496) );
  XOR U636 ( .A(q[12]), .B(DB[12]), .Z(n493) );
  IV U637 ( .A(n492), .Z(n546) );
  XOR U638 ( .A(n490), .B(n548), .Z(n492) );
  XNOR U639 ( .A(q[11]), .B(DB[11]), .Z(n548) );
  XOR U640 ( .A(q[10]), .B(DB[10]), .Z(n490) );
  IV U641 ( .A(n506), .Z(n541) );
  XOR U642 ( .A(n549), .B(n550), .Z(n506) );
  XOR U643 ( .A(n524), .B(n504), .Z(n550) );
  XOR U644 ( .A(q[1]), .B(DB[1]), .Z(n504) );
  XOR U645 ( .A(n551), .B(n512), .Z(n524) );
  XNOR U646 ( .A(q[8]), .B(DB[8]), .Z(n512) );
  IV U647 ( .A(n511), .Z(n551) );
  XOR U648 ( .A(n509), .B(n552), .Z(n511) );
  XNOR U649 ( .A(q[7]), .B(DB[7]), .Z(n552) );
  XOR U650 ( .A(q[6]), .B(DB[6]), .Z(n509) );
  IV U651 ( .A(n523), .Z(n549) );
  XOR U652 ( .A(n553), .B(n554), .Z(n523) );
  XNOR U653 ( .A(n518), .B(n521), .Z(n554) );
  XOR U654 ( .A(q[2]), .B(DB[2]), .Z(n521) );
  XOR U655 ( .A(q[5]), .B(DB[5]), .Z(n518) );
  IV U656 ( .A(n517), .Z(n553) );
  XOR U657 ( .A(n515), .B(n555), .Z(n517) );
  XNOR U658 ( .A(q[4]), .B(DB[4]), .Z(n555) );
  XOR U659 ( .A(q[3]), .B(DB[3]), .Z(n515) );
  IV U660 ( .A(\min_dist_reg[1][0] ), .Z(n337) );
endmodule

