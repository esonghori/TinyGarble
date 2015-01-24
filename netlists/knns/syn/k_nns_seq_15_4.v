
module k_nns_seq_W15_K4 ( clk, rst, q, DB, min_val_out );
  input [14:0] q;
  input [14:0] DB;
  output [59:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[3][3] , \min_dist_reg[3][2] , \min_dist_reg[3][1] ,
         \min_dist_reg[3][0] , \min_dist_reg[2][3] , \min_dist_reg[2][2] ,
         \min_dist_reg[2][1] , \min_dist_reg[2][0] , \min_dist_reg[1][3] ,
         \min_dist_reg[1][2] , \min_dist_reg[1][1] , \min_dist_reg[1][0] ,
         \min_dist_reg[0][3] , \min_dist_reg[0][2] , \min_dist_reg[0][1] ,
         \min_dist_reg[0][0] , \local_min_dist[0][3] , \local_min_dist[0][2] ,
         \local_min_dist[0][1] , \local_min_dist[0][0] , \min_dist[3][3] ,
         \min_dist[3][2] , \min_dist[3][1] , \min_dist[3][0] ,
         \min_dist[2][3] , \min_dist[2][2] , \min_dist[2][1] ,
         \min_dist[2][0] , \min_dist[1][3] , \min_dist[1][2] ,
         \min_dist[1][1] , \min_dist[1][0] , \min_val_reg[3][14] ,
         \min_val_reg[3][13] , \min_val_reg[3][12] , \min_val_reg[3][11] ,
         \min_val_reg[3][10] , \min_val_reg[3][9] , \min_val_reg[3][8] ,
         \min_val_reg[3][7] , \min_val_reg[3][6] , \min_val_reg[3][5] ,
         \min_val_reg[3][4] , \min_val_reg[3][3] , \min_val_reg[3][2] ,
         \min_val_reg[3][1] , \min_val_reg[3][0] , \min_val_reg[2][14] ,
         \min_val_reg[2][13] , \min_val_reg[2][12] , \min_val_reg[2][11] ,
         \min_val_reg[2][10] , \min_val_reg[2][9] , \min_val_reg[2][8] ,
         \min_val_reg[2][7] , \min_val_reg[2][6] , \min_val_reg[2][5] ,
         \min_val_reg[2][4] , \min_val_reg[2][3] , \min_val_reg[2][2] ,
         \min_val_reg[2][1] , \min_val_reg[2][0] , \min_val_reg[1][14] ,
         \min_val_reg[1][13] , \min_val_reg[1][12] , \min_val_reg[1][11] ,
         \min_val_reg[1][10] , \min_val_reg[1][9] , \min_val_reg[1][8] ,
         \min_val_reg[1][7] , \min_val_reg[1][6] , \min_val_reg[1][5] ,
         \min_val_reg[1][4] , \min_val_reg[1][3] , \min_val_reg[1][2] ,
         \min_val_reg[1][1] , \min_val_reg[1][0] , \min_val_reg[0][14] ,
         \min_val_reg[0][13] , \min_val_reg[0][12] , \min_val_reg[0][11] ,
         \min_val_reg[0][10] , \min_val_reg[0][9] , \min_val_reg[0][8] ,
         \min_val_reg[0][7] , \min_val_reg[0][6] , \min_val_reg[0][5] ,
         \min_val_reg[0][4] , \min_val_reg[0][3] , \min_val_reg[0][2] ,
         \min_val_reg[0][1] , \min_val_reg[0][0] , n77, n78, n79, n80, n81,
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
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511;

  DFF \min_dist_reg_reg[0][0]  ( .D(\local_min_dist[0][0] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][0] ) );
  DFF \min_dist_reg_reg[0][1]  ( .D(\local_min_dist[0][1] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][1] ) );
  DFF \min_dist_reg_reg[0][2]  ( .D(\local_min_dist[0][2] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][2] ) );
  DFF \min_dist_reg_reg[0][3]  ( .D(\local_min_dist[0][3] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][3] ) );
  DFF \min_dist_reg_reg[1][0]  ( .D(\min_dist[1][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][0] ) );
  DFF \min_dist_reg_reg[1][1]  ( .D(\min_dist[1][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][1] ) );
  DFF \min_dist_reg_reg[1][2]  ( .D(\min_dist[1][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][2] ) );
  DFF \min_dist_reg_reg[1][3]  ( .D(\min_dist[1][3] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][3] ) );
  DFF \min_dist_reg_reg[2][0]  ( .D(\min_dist[2][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][0] ) );
  DFF \min_dist_reg_reg[2][1]  ( .D(\min_dist[2][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][1] ) );
  DFF \min_dist_reg_reg[2][2]  ( .D(\min_dist[2][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][2] ) );
  DFF \min_dist_reg_reg[2][3]  ( .D(\min_dist[2][3] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][3] ) );
  DFF \min_dist_reg_reg[3][0]  ( .D(\min_dist[3][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][0] ) );
  DFF \min_dist_reg_reg[3][1]  ( .D(\min_dist[3][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][1] ) );
  DFF \min_dist_reg_reg[3][2]  ( .D(\min_dist[3][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][2] ) );
  DFF \min_dist_reg_reg[3][3]  ( .D(\min_dist[3][3] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][3] ) );
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
  DFF \min_val_reg_reg[1][0]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][0] ) );
  DFF \min_val_reg_reg[1][1]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][1] ) );
  DFF \min_val_reg_reg[1][2]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][2] ) );
  DFF \min_val_reg_reg[1][3]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][3] ) );
  DFF \min_val_reg_reg[1][4]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][4] ) );
  DFF \min_val_reg_reg[1][5]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][5] ) );
  DFF \min_val_reg_reg[1][6]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][6] ) );
  DFF \min_val_reg_reg[1][7]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][7] ) );
  DFF \min_val_reg_reg[1][8]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][8] ) );
  DFF \min_val_reg_reg[1][9]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][9] ) );
  DFF \min_val_reg_reg[1][10]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][10] ) );
  DFF \min_val_reg_reg[1][11]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][11] ) );
  DFF \min_val_reg_reg[1][12]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][12] ) );
  DFF \min_val_reg_reg[1][13]  ( .D(min_val_out[28]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][13] ) );
  DFF \min_val_reg_reg[1][14]  ( .D(min_val_out[29]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[1][14] ) );
  DFF \min_val_reg_reg[2][0]  ( .D(min_val_out[30]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][0] ) );
  DFF \min_val_reg_reg[2][1]  ( .D(min_val_out[31]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][1] ) );
  DFF \min_val_reg_reg[2][2]  ( .D(min_val_out[32]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][2] ) );
  DFF \min_val_reg_reg[2][3]  ( .D(min_val_out[33]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][3] ) );
  DFF \min_val_reg_reg[2][4]  ( .D(min_val_out[34]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][4] ) );
  DFF \min_val_reg_reg[2][5]  ( .D(min_val_out[35]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][5] ) );
  DFF \min_val_reg_reg[2][6]  ( .D(min_val_out[36]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][6] ) );
  DFF \min_val_reg_reg[2][7]  ( .D(min_val_out[37]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][7] ) );
  DFF \min_val_reg_reg[2][8]  ( .D(min_val_out[38]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][8] ) );
  DFF \min_val_reg_reg[2][9]  ( .D(min_val_out[39]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][9] ) );
  DFF \min_val_reg_reg[2][10]  ( .D(min_val_out[40]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[2][10] ) );
  DFF \min_val_reg_reg[2][11]  ( .D(min_val_out[41]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[2][11] ) );
  DFF \min_val_reg_reg[2][12]  ( .D(min_val_out[42]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[2][12] ) );
  DFF \min_val_reg_reg[2][13]  ( .D(min_val_out[43]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[2][13] ) );
  DFF \min_val_reg_reg[2][14]  ( .D(min_val_out[44]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[2][14] ) );
  DFF \min_val_reg_reg[3][0]  ( .D(min_val_out[45]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][0] ) );
  DFF \min_val_reg_reg[3][1]  ( .D(min_val_out[46]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][1] ) );
  DFF \min_val_reg_reg[3][2]  ( .D(min_val_out[47]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][2] ) );
  DFF \min_val_reg_reg[3][3]  ( .D(min_val_out[48]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][3] ) );
  DFF \min_val_reg_reg[3][4]  ( .D(min_val_out[49]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][4] ) );
  DFF \min_val_reg_reg[3][5]  ( .D(min_val_out[50]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][5] ) );
  DFF \min_val_reg_reg[3][6]  ( .D(min_val_out[51]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][6] ) );
  DFF \min_val_reg_reg[3][7]  ( .D(min_val_out[52]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][7] ) );
  DFF \min_val_reg_reg[3][8]  ( .D(min_val_out[53]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][8] ) );
  DFF \min_val_reg_reg[3][9]  ( .D(min_val_out[54]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][9] ) );
  DFF \min_val_reg_reg[3][10]  ( .D(min_val_out[55]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[3][10] ) );
  DFF \min_val_reg_reg[3][11]  ( .D(min_val_out[56]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[3][11] ) );
  DFF \min_val_reg_reg[3][12]  ( .D(min_val_out[57]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[3][12] ) );
  DFF \min_val_reg_reg[3][13]  ( .D(min_val_out[58]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[3][13] ) );
  DFF \min_val_reg_reg[3][14]  ( .D(min_val_out[59]), .CLK(clk), .RST(rst), 
        .I(1'b0), .Q(\min_val_reg[3][14] ) );
  XOR U94 ( .A(\min_val_reg[0][9] ), .B(n77), .Z(min_val_out[9]) );
  AND U95 ( .A(n78), .B(n79), .Z(n77) );
  XOR U96 ( .A(\min_val_reg[0][8] ), .B(n80), .Z(min_val_out[8]) );
  AND U97 ( .A(n78), .B(n81), .Z(n80) );
  XOR U98 ( .A(\min_val_reg[0][7] ), .B(n82), .Z(min_val_out[7]) );
  AND U99 ( .A(n78), .B(n83), .Z(n82) );
  XOR U100 ( .A(\min_val_reg[0][6] ), .B(n84), .Z(min_val_out[6]) );
  AND U101 ( .A(n78), .B(n85), .Z(n84) );
  XOR U102 ( .A(\min_val_reg[0][5] ), .B(n86), .Z(min_val_out[5]) );
  AND U103 ( .A(n78), .B(n87), .Z(n86) );
  XNOR U104 ( .A(n88), .B(n89), .Z(min_val_out[59]) );
  AND U105 ( .A(n90), .B(n91), .Z(n88) );
  XNOR U106 ( .A(n92), .B(n93), .Z(min_val_out[58]) );
  AND U107 ( .A(n90), .B(n94), .Z(n92) );
  XNOR U108 ( .A(n95), .B(n96), .Z(min_val_out[57]) );
  AND U109 ( .A(n90), .B(n97), .Z(n95) );
  XNOR U110 ( .A(n98), .B(n99), .Z(min_val_out[56]) );
  AND U111 ( .A(n90), .B(n100), .Z(n98) );
  XNOR U112 ( .A(n101), .B(n102), .Z(min_val_out[55]) );
  AND U113 ( .A(n90), .B(n103), .Z(n101) );
  XNOR U114 ( .A(n104), .B(n105), .Z(min_val_out[54]) );
  AND U115 ( .A(n90), .B(n106), .Z(n104) );
  XNOR U116 ( .A(n107), .B(n108), .Z(min_val_out[53]) );
  AND U117 ( .A(n90), .B(n109), .Z(n107) );
  XNOR U118 ( .A(n110), .B(n111), .Z(min_val_out[52]) );
  AND U119 ( .A(n90), .B(n112), .Z(n110) );
  XNOR U120 ( .A(n113), .B(n114), .Z(min_val_out[51]) );
  AND U121 ( .A(n90), .B(n115), .Z(n113) );
  XNOR U122 ( .A(n116), .B(n117), .Z(min_val_out[50]) );
  AND U123 ( .A(n90), .B(n118), .Z(n116) );
  XOR U124 ( .A(\min_val_reg[0][4] ), .B(n119), .Z(min_val_out[4]) );
  AND U125 ( .A(n78), .B(n120), .Z(n119) );
  XNOR U126 ( .A(n121), .B(n122), .Z(min_val_out[49]) );
  AND U127 ( .A(n90), .B(n123), .Z(n121) );
  XNOR U128 ( .A(n124), .B(n125), .Z(min_val_out[48]) );
  AND U129 ( .A(n90), .B(n126), .Z(n124) );
  XNOR U130 ( .A(n127), .B(n128), .Z(min_val_out[47]) );
  AND U131 ( .A(n90), .B(n129), .Z(n127) );
  XNOR U132 ( .A(n130), .B(n131), .Z(min_val_out[46]) );
  AND U133 ( .A(n90), .B(n132), .Z(n130) );
  XNOR U134 ( .A(n133), .B(n134), .Z(min_val_out[45]) );
  AND U135 ( .A(n90), .B(n135), .Z(n133) );
  XNOR U136 ( .A(n136), .B(n137), .Z(min_val_out[44]) );
  AND U137 ( .A(n138), .B(n139), .Z(n136) );
  XNOR U138 ( .A(n140), .B(n141), .Z(min_val_out[43]) );
  AND U139 ( .A(n138), .B(n142), .Z(n140) );
  XNOR U140 ( .A(n143), .B(n144), .Z(min_val_out[42]) );
  AND U141 ( .A(n138), .B(n145), .Z(n143) );
  XNOR U142 ( .A(n146), .B(n147), .Z(min_val_out[41]) );
  AND U143 ( .A(n138), .B(n148), .Z(n146) );
  XNOR U144 ( .A(n149), .B(n150), .Z(min_val_out[40]) );
  AND U145 ( .A(n138), .B(n151), .Z(n149) );
  XOR U146 ( .A(\min_val_reg[0][3] ), .B(n152), .Z(min_val_out[3]) );
  AND U147 ( .A(n78), .B(n153), .Z(n152) );
  XOR U148 ( .A(n154), .B(n155), .Z(min_val_out[39]) );
  AND U149 ( .A(n138), .B(n156), .Z(n154) );
  XOR U150 ( .A(n157), .B(n158), .Z(min_val_out[38]) );
  AND U151 ( .A(n138), .B(n159), .Z(n157) );
  XOR U152 ( .A(n160), .B(n161), .Z(min_val_out[37]) );
  AND U153 ( .A(n138), .B(n162), .Z(n160) );
  XOR U154 ( .A(n163), .B(n164), .Z(min_val_out[36]) );
  AND U155 ( .A(n138), .B(n165), .Z(n163) );
  XOR U156 ( .A(n166), .B(n167), .Z(min_val_out[35]) );
  AND U157 ( .A(n138), .B(n168), .Z(n166) );
  XOR U158 ( .A(n169), .B(n170), .Z(min_val_out[34]) );
  AND U159 ( .A(n138), .B(n171), .Z(n169) );
  XNOR U160 ( .A(n172), .B(n173), .Z(min_val_out[33]) );
  AND U161 ( .A(n138), .B(n174), .Z(n172) );
  XNOR U162 ( .A(n175), .B(n176), .Z(min_val_out[32]) );
  AND U163 ( .A(n138), .B(n177), .Z(n175) );
  XNOR U164 ( .A(n178), .B(n179), .Z(min_val_out[31]) );
  AND U165 ( .A(n138), .B(n180), .Z(n178) );
  XNOR U166 ( .A(n181), .B(n182), .Z(min_val_out[30]) );
  AND U167 ( .A(n138), .B(n183), .Z(n181) );
  XOR U168 ( .A(\min_val_reg[0][2] ), .B(n184), .Z(min_val_out[2]) );
  AND U169 ( .A(n78), .B(n185), .Z(n184) );
  XNOR U170 ( .A(n186), .B(n187), .Z(min_val_out[29]) );
  AND U171 ( .A(n188), .B(n189), .Z(n186) );
  XNOR U172 ( .A(n190), .B(n191), .Z(min_val_out[28]) );
  AND U173 ( .A(n188), .B(n192), .Z(n190) );
  XNOR U174 ( .A(n193), .B(n194), .Z(min_val_out[27]) );
  AND U175 ( .A(n188), .B(n195), .Z(n193) );
  XNOR U176 ( .A(n196), .B(n197), .Z(min_val_out[26]) );
  AND U177 ( .A(n188), .B(n198), .Z(n196) );
  XNOR U178 ( .A(n199), .B(n200), .Z(min_val_out[25]) );
  AND U179 ( .A(n188), .B(n201), .Z(n199) );
  XOR U180 ( .A(n202), .B(n203), .Z(min_val_out[24]) );
  AND U181 ( .A(n188), .B(n79), .Z(n202) );
  XOR U182 ( .A(\min_val_reg[0][9] ), .B(n203), .Z(n79) );
  XNOR U183 ( .A(\min_val_reg[1][9] ), .B(n204), .Z(n203) );
  NAND U184 ( .A(n156), .B(n138), .Z(n204) );
  XOR U185 ( .A(\min_val_reg[1][9] ), .B(n155), .Z(n156) );
  XNOR U186 ( .A(\min_val_reg[2][9] ), .B(n205), .Z(n155) );
  NAND U187 ( .A(n106), .B(n90), .Z(n205) );
  XNOR U188 ( .A(\min_val_reg[2][9] ), .B(n105), .Z(n106) );
  XOR U189 ( .A(\min_val_reg[3][9] ), .B(n206), .Z(n105) );
  NAND U190 ( .A(n207), .B(n208), .Z(n206) );
  XOR U191 ( .A(\min_val_reg[3][9] ), .B(DB[9]), .Z(n207) );
  XOR U192 ( .A(n209), .B(n210), .Z(min_val_out[23]) );
  AND U193 ( .A(n188), .B(n81), .Z(n209) );
  XOR U194 ( .A(\min_val_reg[0][8] ), .B(n210), .Z(n81) );
  XNOR U195 ( .A(\min_val_reg[1][8] ), .B(n211), .Z(n210) );
  NAND U196 ( .A(n159), .B(n138), .Z(n211) );
  XOR U197 ( .A(\min_val_reg[1][8] ), .B(n158), .Z(n159) );
  XNOR U198 ( .A(\min_val_reg[2][8] ), .B(n212), .Z(n158) );
  NAND U199 ( .A(n109), .B(n90), .Z(n212) );
  XNOR U200 ( .A(\min_val_reg[2][8] ), .B(n108), .Z(n109) );
  XOR U201 ( .A(\min_val_reg[3][8] ), .B(n213), .Z(n108) );
  NAND U202 ( .A(n214), .B(n208), .Z(n213) );
  XOR U203 ( .A(\min_val_reg[3][8] ), .B(DB[8]), .Z(n214) );
  XOR U204 ( .A(n215), .B(n216), .Z(min_val_out[22]) );
  AND U205 ( .A(n188), .B(n83), .Z(n215) );
  XOR U206 ( .A(\min_val_reg[0][7] ), .B(n216), .Z(n83) );
  XNOR U207 ( .A(\min_val_reg[1][7] ), .B(n217), .Z(n216) );
  NAND U208 ( .A(n162), .B(n138), .Z(n217) );
  XOR U209 ( .A(\min_val_reg[1][7] ), .B(n161), .Z(n162) );
  XNOR U210 ( .A(\min_val_reg[2][7] ), .B(n218), .Z(n161) );
  NAND U211 ( .A(n112), .B(n90), .Z(n218) );
  XNOR U212 ( .A(\min_val_reg[2][7] ), .B(n111), .Z(n112) );
  XOR U213 ( .A(\min_val_reg[3][7] ), .B(n219), .Z(n111) );
  NAND U214 ( .A(n220), .B(n208), .Z(n219) );
  XOR U215 ( .A(\min_val_reg[3][7] ), .B(DB[7]), .Z(n220) );
  XOR U216 ( .A(n221), .B(n222), .Z(min_val_out[21]) );
  AND U217 ( .A(n188), .B(n85), .Z(n221) );
  XOR U218 ( .A(\min_val_reg[0][6] ), .B(n222), .Z(n85) );
  XNOR U219 ( .A(\min_val_reg[1][6] ), .B(n223), .Z(n222) );
  NAND U220 ( .A(n165), .B(n138), .Z(n223) );
  XOR U221 ( .A(\min_val_reg[1][6] ), .B(n164), .Z(n165) );
  XNOR U222 ( .A(\min_val_reg[2][6] ), .B(n224), .Z(n164) );
  NAND U223 ( .A(n115), .B(n90), .Z(n224) );
  XNOR U224 ( .A(\min_val_reg[2][6] ), .B(n114), .Z(n115) );
  XOR U225 ( .A(\min_val_reg[3][6] ), .B(n225), .Z(n114) );
  NAND U226 ( .A(n226), .B(n208), .Z(n225) );
  XOR U227 ( .A(\min_val_reg[3][6] ), .B(DB[6]), .Z(n226) );
  XOR U228 ( .A(n227), .B(n228), .Z(min_val_out[20]) );
  AND U229 ( .A(n188), .B(n87), .Z(n227) );
  XOR U230 ( .A(\min_val_reg[0][5] ), .B(n228), .Z(n87) );
  XNOR U231 ( .A(\min_val_reg[1][5] ), .B(n229), .Z(n228) );
  NAND U232 ( .A(n168), .B(n138), .Z(n229) );
  XOR U233 ( .A(\min_val_reg[1][5] ), .B(n167), .Z(n168) );
  XNOR U234 ( .A(\min_val_reg[2][5] ), .B(n230), .Z(n167) );
  NAND U235 ( .A(n118), .B(n90), .Z(n230) );
  XNOR U236 ( .A(\min_val_reg[2][5] ), .B(n117), .Z(n118) );
  XOR U237 ( .A(\min_val_reg[3][5] ), .B(n231), .Z(n117) );
  NAND U238 ( .A(n232), .B(n208), .Z(n231) );
  XOR U239 ( .A(\min_val_reg[3][5] ), .B(DB[5]), .Z(n232) );
  XOR U240 ( .A(\min_val_reg[0][1] ), .B(n233), .Z(min_val_out[1]) );
  AND U241 ( .A(n78), .B(n234), .Z(n233) );
  XOR U242 ( .A(n235), .B(n236), .Z(min_val_out[19]) );
  AND U243 ( .A(n188), .B(n120), .Z(n235) );
  XOR U244 ( .A(\min_val_reg[0][4] ), .B(n236), .Z(n120) );
  XNOR U245 ( .A(\min_val_reg[1][4] ), .B(n237), .Z(n236) );
  NAND U246 ( .A(n171), .B(n138), .Z(n237) );
  XOR U247 ( .A(\min_val_reg[1][4] ), .B(n170), .Z(n171) );
  XNOR U248 ( .A(\min_val_reg[2][4] ), .B(n238), .Z(n170) );
  NAND U249 ( .A(n123), .B(n90), .Z(n238) );
  XNOR U250 ( .A(\min_val_reg[2][4] ), .B(n122), .Z(n123) );
  XOR U251 ( .A(\min_val_reg[3][4] ), .B(n239), .Z(n122) );
  NAND U252 ( .A(n240), .B(n208), .Z(n239) );
  XOR U253 ( .A(\min_val_reg[3][4] ), .B(DB[4]), .Z(n240) );
  XOR U254 ( .A(n241), .B(n242), .Z(min_val_out[18]) );
  AND U255 ( .A(n188), .B(n153), .Z(n241) );
  XOR U256 ( .A(\min_val_reg[0][3] ), .B(n242), .Z(n153) );
  XNOR U257 ( .A(\min_val_reg[1][3] ), .B(n243), .Z(n242) );
  NAND U258 ( .A(n174), .B(n138), .Z(n243) );
  XNOR U259 ( .A(\min_val_reg[1][3] ), .B(n173), .Z(n174) );
  XOR U260 ( .A(\min_val_reg[2][3] ), .B(n244), .Z(n173) );
  NAND U261 ( .A(n126), .B(n90), .Z(n244) );
  XNOR U262 ( .A(\min_val_reg[2][3] ), .B(n125), .Z(n126) );
  XOR U263 ( .A(\min_val_reg[3][3] ), .B(n245), .Z(n125) );
  NAND U264 ( .A(n246), .B(n208), .Z(n245) );
  XOR U265 ( .A(\min_val_reg[3][3] ), .B(DB[3]), .Z(n246) );
  XNOR U266 ( .A(n247), .B(n248), .Z(min_val_out[17]) );
  AND U267 ( .A(n188), .B(n185), .Z(n247) );
  XNOR U268 ( .A(\min_val_reg[0][2] ), .B(n248), .Z(n185) );
  XOR U269 ( .A(\min_val_reg[1][2] ), .B(n249), .Z(n248) );
  NAND U270 ( .A(n177), .B(n138), .Z(n249) );
  XNOR U271 ( .A(\min_val_reg[1][2] ), .B(n176), .Z(n177) );
  XOR U272 ( .A(\min_val_reg[2][2] ), .B(n250), .Z(n176) );
  NAND U273 ( .A(n129), .B(n90), .Z(n250) );
  XNOR U274 ( .A(\min_val_reg[2][2] ), .B(n128), .Z(n129) );
  XOR U275 ( .A(\min_val_reg[3][2] ), .B(n251), .Z(n128) );
  NAND U276 ( .A(n252), .B(n208), .Z(n251) );
  XOR U277 ( .A(\min_val_reg[3][2] ), .B(DB[2]), .Z(n252) );
  XNOR U278 ( .A(n253), .B(n254), .Z(min_val_out[16]) );
  AND U279 ( .A(n188), .B(n234), .Z(n253) );
  XNOR U280 ( .A(\min_val_reg[0][1] ), .B(n254), .Z(n234) );
  XOR U281 ( .A(\min_val_reg[1][1] ), .B(n255), .Z(n254) );
  NAND U282 ( .A(n180), .B(n138), .Z(n255) );
  XNOR U283 ( .A(\min_val_reg[1][1] ), .B(n179), .Z(n180) );
  XOR U284 ( .A(\min_val_reg[2][1] ), .B(n256), .Z(n179) );
  NAND U285 ( .A(n132), .B(n90), .Z(n256) );
  XNOR U286 ( .A(\min_val_reg[2][1] ), .B(n131), .Z(n132) );
  XOR U287 ( .A(\min_val_reg[3][1] ), .B(n257), .Z(n131) );
  NAND U288 ( .A(n258), .B(n208), .Z(n257) );
  XOR U289 ( .A(\min_val_reg[3][1] ), .B(DB[1]), .Z(n258) );
  XNOR U290 ( .A(n259), .B(n260), .Z(min_val_out[15]) );
  AND U291 ( .A(n188), .B(n261), .Z(n259) );
  XOR U292 ( .A(\min_val_reg[0][14] ), .B(n262), .Z(min_val_out[14]) );
  AND U293 ( .A(n78), .B(n189), .Z(n262) );
  XNOR U294 ( .A(\min_val_reg[0][14] ), .B(n187), .Z(n189) );
  XOR U295 ( .A(\min_val_reg[1][14] ), .B(n263), .Z(n187) );
  NAND U296 ( .A(n139), .B(n138), .Z(n263) );
  XNOR U297 ( .A(\min_val_reg[1][14] ), .B(n137), .Z(n139) );
  XOR U298 ( .A(\min_val_reg[2][14] ), .B(n264), .Z(n137) );
  NAND U299 ( .A(n91), .B(n90), .Z(n264) );
  XNOR U300 ( .A(\min_val_reg[2][14] ), .B(n89), .Z(n91) );
  XOR U301 ( .A(\min_val_reg[3][14] ), .B(n265), .Z(n89) );
  NAND U302 ( .A(n266), .B(n208), .Z(n265) );
  XOR U303 ( .A(\min_val_reg[3][14] ), .B(DB[14]), .Z(n266) );
  XOR U304 ( .A(\min_val_reg[0][13] ), .B(n267), .Z(min_val_out[13]) );
  AND U305 ( .A(n78), .B(n192), .Z(n267) );
  XNOR U306 ( .A(\min_val_reg[0][13] ), .B(n191), .Z(n192) );
  XOR U307 ( .A(\min_val_reg[1][13] ), .B(n268), .Z(n191) );
  NAND U308 ( .A(n142), .B(n138), .Z(n268) );
  XNOR U309 ( .A(\min_val_reg[1][13] ), .B(n141), .Z(n142) );
  XOR U310 ( .A(\min_val_reg[2][13] ), .B(n269), .Z(n141) );
  NAND U311 ( .A(n94), .B(n90), .Z(n269) );
  XNOR U312 ( .A(\min_val_reg[2][13] ), .B(n93), .Z(n94) );
  XOR U313 ( .A(\min_val_reg[3][13] ), .B(n270), .Z(n93) );
  NAND U314 ( .A(n271), .B(n208), .Z(n270) );
  XOR U315 ( .A(\min_val_reg[3][13] ), .B(DB[13]), .Z(n271) );
  XOR U316 ( .A(\min_val_reg[0][12] ), .B(n272), .Z(min_val_out[12]) );
  AND U317 ( .A(n78), .B(n195), .Z(n272) );
  XNOR U318 ( .A(\min_val_reg[0][12] ), .B(n194), .Z(n195) );
  XOR U319 ( .A(\min_val_reg[1][12] ), .B(n273), .Z(n194) );
  NAND U320 ( .A(n145), .B(n138), .Z(n273) );
  XNOR U321 ( .A(\min_val_reg[1][12] ), .B(n144), .Z(n145) );
  XOR U322 ( .A(\min_val_reg[2][12] ), .B(n274), .Z(n144) );
  NAND U323 ( .A(n97), .B(n90), .Z(n274) );
  XNOR U324 ( .A(\min_val_reg[2][12] ), .B(n96), .Z(n97) );
  XOR U325 ( .A(\min_val_reg[3][12] ), .B(n275), .Z(n96) );
  NAND U326 ( .A(n276), .B(n208), .Z(n275) );
  XOR U327 ( .A(\min_val_reg[3][12] ), .B(DB[12]), .Z(n276) );
  XOR U328 ( .A(\min_val_reg[0][11] ), .B(n277), .Z(min_val_out[11]) );
  AND U329 ( .A(n78), .B(n198), .Z(n277) );
  XNOR U330 ( .A(\min_val_reg[0][11] ), .B(n197), .Z(n198) );
  XOR U331 ( .A(\min_val_reg[1][11] ), .B(n278), .Z(n197) );
  NAND U332 ( .A(n148), .B(n138), .Z(n278) );
  XNOR U333 ( .A(\min_val_reg[1][11] ), .B(n147), .Z(n148) );
  XOR U334 ( .A(\min_val_reg[2][11] ), .B(n279), .Z(n147) );
  NAND U335 ( .A(n100), .B(n90), .Z(n279) );
  XNOR U336 ( .A(\min_val_reg[2][11] ), .B(n99), .Z(n100) );
  XOR U337 ( .A(\min_val_reg[3][11] ), .B(n280), .Z(n99) );
  NAND U338 ( .A(n281), .B(n208), .Z(n280) );
  XOR U339 ( .A(\min_val_reg[3][11] ), .B(DB[11]), .Z(n281) );
  XOR U340 ( .A(\min_val_reg[0][10] ), .B(n282), .Z(min_val_out[10]) );
  AND U341 ( .A(n78), .B(n201), .Z(n282) );
  XNOR U342 ( .A(\min_val_reg[0][10] ), .B(n200), .Z(n201) );
  XOR U343 ( .A(\min_val_reg[1][10] ), .B(n283), .Z(n200) );
  NAND U344 ( .A(n151), .B(n138), .Z(n283) );
  XNOR U345 ( .A(\min_val_reg[1][10] ), .B(n150), .Z(n151) );
  XOR U346 ( .A(\min_val_reg[2][10] ), .B(n284), .Z(n150) );
  NAND U347 ( .A(n103), .B(n90), .Z(n284) );
  XNOR U348 ( .A(\min_val_reg[2][10] ), .B(n102), .Z(n103) );
  XOR U349 ( .A(\min_val_reg[3][10] ), .B(n285), .Z(n102) );
  NAND U350 ( .A(n286), .B(n208), .Z(n285) );
  XOR U351 ( .A(\min_val_reg[3][10] ), .B(DB[10]), .Z(n286) );
  XOR U352 ( .A(\min_val_reg[0][0] ), .B(n287), .Z(min_val_out[0]) );
  AND U353 ( .A(n78), .B(n261), .Z(n287) );
  XNOR U354 ( .A(\min_val_reg[0][0] ), .B(n260), .Z(n261) );
  XOR U355 ( .A(\min_val_reg[1][0] ), .B(n288), .Z(n260) );
  NAND U356 ( .A(n183), .B(n138), .Z(n288) );
  XNOR U357 ( .A(\min_val_reg[1][0] ), .B(n182), .Z(n183) );
  XOR U358 ( .A(\min_val_reg[2][0] ), .B(n289), .Z(n182) );
  NAND U359 ( .A(n135), .B(n90), .Z(n289) );
  XNOR U360 ( .A(\min_val_reg[2][0] ), .B(n134), .Z(n135) );
  XOR U361 ( .A(\min_val_reg[3][0] ), .B(n290), .Z(n134) );
  NAND U362 ( .A(n291), .B(n208), .Z(n290) );
  XOR U363 ( .A(\min_val_reg[3][0] ), .B(DB[0]), .Z(n291) );
  XOR U364 ( .A(n292), .B(n293), .Z(\min_dist[3][3] ) );
  AND U365 ( .A(n90), .B(n294), .Z(n292) );
  XOR U366 ( .A(\min_dist_reg[2][3] ), .B(n293), .Z(n294) );
  XOR U367 ( .A(n295), .B(n296), .Z(\min_dist[3][2] ) );
  AND U368 ( .A(n90), .B(n297), .Z(n295) );
  XNOR U369 ( .A(\min_dist_reg[2][2] ), .B(n298), .Z(n297) );
  XOR U370 ( .A(n299), .B(n300), .Z(\min_dist[3][1] ) );
  AND U371 ( .A(n90), .B(n301), .Z(n299) );
  XNOR U372 ( .A(\min_dist_reg[2][1] ), .B(n302), .Z(n301) );
  XOR U373 ( .A(n303), .B(n304), .Z(\min_dist[3][0] ) );
  AND U374 ( .A(n90), .B(n305), .Z(n303) );
  XOR U375 ( .A(n306), .B(n307), .Z(\min_dist[2][3] ) );
  AND U376 ( .A(n138), .B(n308), .Z(n306) );
  XOR U377 ( .A(\min_dist_reg[1][3] ), .B(n307), .Z(n308) );
  XOR U378 ( .A(n309), .B(n310), .Z(\min_dist[2][2] ) );
  AND U379 ( .A(n138), .B(n311), .Z(n309) );
  XOR U380 ( .A(\min_dist_reg[1][2] ), .B(n310), .Z(n311) );
  XOR U381 ( .A(n312), .B(n313), .Z(\min_dist[2][1] ) );
  AND U382 ( .A(n138), .B(n314), .Z(n312) );
  XOR U383 ( .A(\min_dist_reg[1][1] ), .B(n313), .Z(n314) );
  XOR U384 ( .A(n315), .B(n316), .Z(\min_dist[2][0] ) );
  AND U385 ( .A(n138), .B(n317), .Z(n315) );
  XOR U386 ( .A(n318), .B(n319), .Z(\min_dist[1][3] ) );
  AND U387 ( .A(n188), .B(n320), .Z(n318) );
  XOR U388 ( .A(\min_dist_reg[0][3] ), .B(n319), .Z(n320) );
  XOR U389 ( .A(n321), .B(n322), .Z(\min_dist[1][2] ) );
  AND U390 ( .A(n188), .B(n323), .Z(n321) );
  XOR U391 ( .A(n324), .B(n325), .Z(\min_dist[1][1] ) );
  AND U392 ( .A(n188), .B(n326), .Z(n324) );
  XNOR U393 ( .A(n327), .B(n328), .Z(\min_dist[1][0] ) );
  AND U394 ( .A(n188), .B(n329), .Z(n327) );
  XNOR U395 ( .A(\min_dist_reg[0][0] ), .B(n328), .Z(n329) );
  XNOR U396 ( .A(n330), .B(n331), .Z(n188) );
  AND U397 ( .A(n332), .B(n333), .Z(n330) );
  XOR U398 ( .A(n319), .B(n331), .Z(n333) );
  XNOR U399 ( .A(\min_dist_reg[0][3] ), .B(n331), .Z(n332) );
  XNOR U400 ( .A(n334), .B(n335), .Z(n331) );
  AND U401 ( .A(n336), .B(n337), .Z(n334) );
  XNOR U402 ( .A(n322), .B(n335), .Z(n337) );
  XOR U403 ( .A(\min_dist_reg[0][2] ), .B(n335), .Z(n336) );
  XOR U404 ( .A(n338), .B(n339), .Z(n335) );
  NAND U405 ( .A(n340), .B(n341), .Z(n339) );
  XOR U406 ( .A(n338), .B(n325), .Z(n341) );
  XNOR U407 ( .A(\min_dist_reg[0][1] ), .B(n338), .Z(n340) );
  NOR U408 ( .A(n328), .B(\min_dist_reg[0][0] ), .Z(n338) );
  AND U409 ( .A(\min_dist_reg[0][3] ), .B(n342), .Z(\local_min_dist[0][3] ) );
  NANDN U410 ( .A(n319), .B(n78), .Z(n342) );
  XOR U411 ( .A(\min_dist_reg[0][2] ), .B(n343), .Z(\local_min_dist[0][2] ) );
  AND U412 ( .A(n78), .B(n323), .Z(n343) );
  XOR U413 ( .A(\min_dist_reg[0][2] ), .B(n322), .Z(n323) );
  XOR U414 ( .A(\min_dist_reg[0][1] ), .B(n344), .Z(\local_min_dist[0][1] ) );
  AND U415 ( .A(n78), .B(n326), .Z(n344) );
  XOR U416 ( .A(\min_dist_reg[0][1] ), .B(n325), .Z(n326) );
  XOR U417 ( .A(\min_dist_reg[0][0] ), .B(n345), .Z(\local_min_dist[0][0] ) );
  AND U418 ( .A(n78), .B(n346), .Z(n345) );
  XOR U419 ( .A(\min_dist_reg[0][0] ), .B(n347), .Z(n346) );
  XNOR U420 ( .A(n348), .B(n349), .Z(n78) );
  AND U421 ( .A(n350), .B(n351), .Z(n348) );
  XOR U422 ( .A(n319), .B(n349), .Z(n351) );
  AND U423 ( .A(n352), .B(\min_dist_reg[1][3] ), .Z(n319) );
  NANDN U424 ( .A(n307), .B(n138), .Z(n352) );
  XNOR U425 ( .A(\min_dist_reg[0][3] ), .B(n349), .Z(n350) );
  XNOR U426 ( .A(n353), .B(n354), .Z(n349) );
  AND U427 ( .A(n355), .B(n356), .Z(n353) );
  XNOR U428 ( .A(n354), .B(n322), .Z(n356) );
  XNOR U429 ( .A(\min_dist_reg[1][2] ), .B(n357), .Z(n322) );
  NAND U430 ( .A(n358), .B(n138), .Z(n357) );
  XNOR U431 ( .A(n359), .B(n310), .Z(n358) );
  XOR U432 ( .A(\min_dist_reg[0][2] ), .B(n354), .Z(n355) );
  XOR U433 ( .A(n360), .B(n361), .Z(n354) );
  NAND U434 ( .A(n362), .B(n363), .Z(n361) );
  XOR U435 ( .A(n360), .B(n325), .Z(n363) );
  XNOR U436 ( .A(\min_dist_reg[1][1] ), .B(n364), .Z(n325) );
  NAND U437 ( .A(n365), .B(n138), .Z(n364) );
  XNOR U438 ( .A(n366), .B(n313), .Z(n365) );
  XNOR U439 ( .A(\min_dist_reg[0][1] ), .B(n360), .Z(n362) );
  ANDN U440 ( .B(n347), .A(\min_dist_reg[0][0] ), .Z(n360) );
  IV U441 ( .A(n328), .Z(n347) );
  XOR U442 ( .A(\min_dist_reg[1][0] ), .B(n367), .Z(n328) );
  NAND U443 ( .A(n317), .B(n138), .Z(n367) );
  XOR U444 ( .A(n368), .B(n369), .Z(n138) );
  AND U445 ( .A(n370), .B(n371), .Z(n368) );
  XNOR U446 ( .A(n307), .B(n369), .Z(n371) );
  AND U447 ( .A(n372), .B(\min_dist_reg[2][3] ), .Z(n307) );
  NANDN U448 ( .A(n293), .B(n90), .Z(n372) );
  XNOR U449 ( .A(n373), .B(n369), .Z(n370) );
  XOR U450 ( .A(n374), .B(n375), .Z(n369) );
  AND U451 ( .A(n376), .B(n377), .Z(n374) );
  XNOR U452 ( .A(n310), .B(n375), .Z(n377) );
  XNOR U453 ( .A(\min_dist_reg[2][2] ), .B(n378), .Z(n310) );
  NAND U454 ( .A(n379), .B(n90), .Z(n378) );
  XNOR U455 ( .A(n380), .B(n296), .Z(n379) );
  XNOR U456 ( .A(n359), .B(n375), .Z(n376) );
  XOR U457 ( .A(n381), .B(n382), .Z(n375) );
  NAND U458 ( .A(n383), .B(n384), .Z(n382) );
  XOR U459 ( .A(n381), .B(n313), .Z(n384) );
  XNOR U460 ( .A(\min_dist_reg[2][1] ), .B(n385), .Z(n313) );
  NAND U461 ( .A(n386), .B(n90), .Z(n385) );
  XNOR U462 ( .A(n387), .B(n300), .Z(n386) );
  XOR U463 ( .A(n366), .B(n381), .Z(n383) );
  IV U464 ( .A(\min_dist_reg[1][1] ), .Z(n366) );
  AND U465 ( .A(n316), .B(n388), .Z(n381) );
  IV U466 ( .A(\min_dist_reg[1][2] ), .Z(n359) );
  IV U467 ( .A(\min_dist_reg[1][3] ), .Z(n373) );
  XNOR U468 ( .A(n388), .B(n316), .Z(n317) );
  XNOR U469 ( .A(\min_dist_reg[2][0] ), .B(n389), .Z(n316) );
  NAND U470 ( .A(n305), .B(n90), .Z(n389) );
  XOR U471 ( .A(n390), .B(n391), .Z(n90) );
  AND U472 ( .A(n392), .B(n393), .Z(n390) );
  XNOR U473 ( .A(n293), .B(n391), .Z(n393) );
  XNOR U474 ( .A(\min_dist_reg[3][3] ), .B(n394), .Z(n293) );
  NAND U475 ( .A(n395), .B(n208), .Z(n394) );
  XOR U476 ( .A(\min_dist_reg[3][3] ), .B(n396), .Z(n395) );
  XNOR U477 ( .A(n397), .B(n391), .Z(n392) );
  XOR U478 ( .A(n398), .B(n399), .Z(n391) );
  AND U479 ( .A(n400), .B(n401), .Z(n398) );
  XOR U480 ( .A(n298), .B(n399), .Z(n401) );
  IV U481 ( .A(n296), .Z(n298) );
  XNOR U482 ( .A(\min_dist_reg[3][2] ), .B(n402), .Z(n296) );
  NAND U483 ( .A(n403), .B(n208), .Z(n402) );
  XNOR U484 ( .A(\min_dist_reg[3][2] ), .B(n404), .Z(n403) );
  XNOR U485 ( .A(n380), .B(n399), .Z(n400) );
  XOR U486 ( .A(n405), .B(n406), .Z(n399) );
  NAND U487 ( .A(n407), .B(n408), .Z(n406) );
  XNOR U488 ( .A(n405), .B(n302), .Z(n408) );
  IV U489 ( .A(n300), .Z(n302) );
  XNOR U490 ( .A(\min_dist_reg[3][1] ), .B(n409), .Z(n300) );
  NAND U491 ( .A(n410), .B(n208), .Z(n409) );
  XNOR U492 ( .A(\min_dist_reg[3][1] ), .B(n411), .Z(n410) );
  XOR U493 ( .A(n387), .B(n405), .Z(n407) );
  IV U494 ( .A(\min_dist_reg[2][1] ), .Z(n387) );
  ANDN U495 ( .B(n304), .A(\min_dist_reg[2][0] ), .Z(n405) );
  IV U496 ( .A(\min_dist_reg[2][2] ), .Z(n380) );
  IV U497 ( .A(\min_dist_reg[2][3] ), .Z(n397) );
  XOR U498 ( .A(\min_dist_reg[2][0] ), .B(n304), .Z(n305) );
  XOR U499 ( .A(n412), .B(n413), .Z(n304) );
  NAND U500 ( .A(n414), .B(n208), .Z(n413) );
  XNOR U501 ( .A(n415), .B(n416), .Z(n208) );
  AND U502 ( .A(n417), .B(n418), .Z(n415) );
  XNOR U503 ( .A(n419), .B(n396), .Z(n418) );
  XNOR U504 ( .A(n420), .B(n421), .Z(n396) );
  ANDN U505 ( .B(n422), .A(n423), .Z(n420) );
  XOR U506 ( .A(n421), .B(n424), .Z(n422) );
  XNOR U507 ( .A(\min_dist_reg[3][3] ), .B(n416), .Z(n417) );
  IV U508 ( .A(n419), .Z(n416) );
  XOR U509 ( .A(n425), .B(n426), .Z(n419) );
  AND U510 ( .A(n427), .B(n428), .Z(n425) );
  XOR U511 ( .A(n426), .B(n404), .Z(n428) );
  XOR U512 ( .A(n429), .B(n424), .Z(n404) );
  XNOR U513 ( .A(n430), .B(n431), .Z(n424) );
  ANDN U514 ( .B(n432), .A(n433), .Z(n430) );
  XOR U515 ( .A(n434), .B(n435), .Z(n432) );
  IV U516 ( .A(n423), .Z(n429) );
  XOR U517 ( .A(n436), .B(n437), .Z(n423) );
  XNOR U518 ( .A(n438), .B(n439), .Z(n437) );
  ANDN U519 ( .B(n440), .A(n441), .Z(n438) );
  XNOR U520 ( .A(n442), .B(n443), .Z(n440) );
  IV U521 ( .A(n421), .Z(n436) );
  XOR U522 ( .A(n444), .B(n445), .Z(n421) );
  ANDN U523 ( .B(n446), .A(n447), .Z(n444) );
  XOR U524 ( .A(n445), .B(n448), .Z(n446) );
  XOR U525 ( .A(\min_dist_reg[3][2] ), .B(n426), .Z(n427) );
  XOR U526 ( .A(n449), .B(n450), .Z(n426) );
  NAND U527 ( .A(n451), .B(n452), .Z(n450) );
  XNOR U528 ( .A(n449), .B(n411), .Z(n452) );
  XOR U529 ( .A(n453), .B(n448), .Z(n411) );
  XOR U530 ( .A(n454), .B(n435), .Z(n448) );
  XNOR U531 ( .A(n455), .B(n456), .Z(n435) );
  ANDN U532 ( .B(n457), .A(n458), .Z(n455) );
  XNOR U533 ( .A(n456), .B(n459), .Z(n457) );
  IV U534 ( .A(n433), .Z(n454) );
  XOR U535 ( .A(n431), .B(n460), .Z(n433) );
  XNOR U536 ( .A(n461), .B(n462), .Z(n460) );
  ANDN U537 ( .B(n463), .A(n464), .Z(n461) );
  XNOR U538 ( .A(n465), .B(n466), .Z(n463) );
  IV U539 ( .A(n462), .Z(n466) );
  IV U540 ( .A(n434), .Z(n431) );
  XNOR U541 ( .A(n467), .B(n468), .Z(n434) );
  ANDN U542 ( .B(n469), .A(n470), .Z(n467) );
  XNOR U543 ( .A(n468), .B(n471), .Z(n469) );
  IV U544 ( .A(n447), .Z(n453) );
  XOR U545 ( .A(n472), .B(n473), .Z(n447) );
  XNOR U546 ( .A(n442), .B(n474), .Z(n473) );
  IV U547 ( .A(n445), .Z(n474) );
  XNOR U548 ( .A(n475), .B(n476), .Z(n445) );
  ANDN U549 ( .B(n477), .A(n478), .Z(n475) );
  XNOR U550 ( .A(n476), .B(n479), .Z(n477) );
  XOR U551 ( .A(n480), .B(n481), .Z(n442) );
  ANDN U552 ( .B(n482), .A(n483), .Z(n480) );
  XNOR U553 ( .A(n481), .B(n484), .Z(n482) );
  IV U554 ( .A(n441), .Z(n472) );
  XOR U555 ( .A(n439), .B(n485), .Z(n441) );
  XNOR U556 ( .A(n486), .B(n487), .Z(n485) );
  ANDN U557 ( .B(n488), .A(n489), .Z(n486) );
  XNOR U558 ( .A(n490), .B(n491), .Z(n488) );
  IV U559 ( .A(n487), .Z(n491) );
  IV U560 ( .A(n443), .Z(n439) );
  XNOR U561 ( .A(n492), .B(n493), .Z(n443) );
  ANDN U562 ( .B(n494), .A(n495), .Z(n492) );
  XNOR U563 ( .A(n496), .B(n493), .Z(n494) );
  XNOR U564 ( .A(\min_dist_reg[3][1] ), .B(n449), .Z(n451) );
  NOR U565 ( .A(\min_dist_reg[3][0] ), .B(n497), .Z(n449) );
  XOR U566 ( .A(n412), .B(n497), .Z(n414) );
  XOR U567 ( .A(n498), .B(n479), .Z(n497) );
  XOR U568 ( .A(n499), .B(n471), .Z(n479) );
  XOR U569 ( .A(n500), .B(n459), .Z(n471) );
  XNOR U570 ( .A(q[14]), .B(DB[14]), .Z(n459) );
  IV U571 ( .A(n458), .Z(n500) );
  XOR U572 ( .A(n456), .B(n501), .Z(n458) );
  XNOR U573 ( .A(q[13]), .B(DB[13]), .Z(n501) );
  XOR U574 ( .A(q[12]), .B(DB[12]), .Z(n456) );
  IV U575 ( .A(n470), .Z(n499) );
  XOR U576 ( .A(n502), .B(n503), .Z(n470) );
  XNOR U577 ( .A(n465), .B(n468), .Z(n503) );
  XOR U578 ( .A(q[8]), .B(DB[8]), .Z(n468) );
  XOR U579 ( .A(q[11]), .B(DB[11]), .Z(n465) );
  IV U580 ( .A(n464), .Z(n502) );
  XOR U581 ( .A(n462), .B(n504), .Z(n464) );
  XNOR U582 ( .A(q[10]), .B(DB[10]), .Z(n504) );
  XOR U583 ( .A(q[9]), .B(DB[9]), .Z(n462) );
  IV U584 ( .A(n478), .Z(n498) );
  XOR U585 ( .A(n505), .B(n506), .Z(n478) );
  XOR U586 ( .A(n496), .B(n476), .Z(n506) );
  XOR U587 ( .A(q[0]), .B(DB[0]), .Z(n476) );
  XOR U588 ( .A(n507), .B(n484), .Z(n496) );
  XNOR U589 ( .A(q[7]), .B(DB[7]), .Z(n484) );
  IV U590 ( .A(n483), .Z(n507) );
  XOR U591 ( .A(n481), .B(n508), .Z(n483) );
  XNOR U592 ( .A(q[6]), .B(DB[6]), .Z(n508) );
  XOR U593 ( .A(q[5]), .B(DB[5]), .Z(n481) );
  IV U594 ( .A(n495), .Z(n505) );
  XOR U595 ( .A(n509), .B(n510), .Z(n495) );
  XNOR U596 ( .A(n490), .B(n493), .Z(n510) );
  XOR U597 ( .A(q[1]), .B(DB[1]), .Z(n493) );
  XOR U598 ( .A(q[4]), .B(DB[4]), .Z(n490) );
  IV U599 ( .A(n489), .Z(n509) );
  XOR U600 ( .A(n487), .B(n511), .Z(n489) );
  XNOR U601 ( .A(q[3]), .B(DB[3]), .Z(n511) );
  XOR U602 ( .A(q[2]), .B(DB[2]), .Z(n487) );
  IV U603 ( .A(\min_dist_reg[3][0] ), .Z(n412) );
  IV U604 ( .A(\min_dist_reg[1][0] ), .Z(n388) );
endmodule

