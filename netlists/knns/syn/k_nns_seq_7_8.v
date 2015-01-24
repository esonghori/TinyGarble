
module k_nns_seq_W7_K8 ( clk, rst, q, DB, min_val_out );
  input [6:0] q;
  input [6:0] DB;
  output [55:0] min_val_out;
  input clk, rst;
  wire   \min_dist_reg[7][2] , \min_dist_reg[7][1] , \min_dist_reg[7][0] ,
         \min_dist_reg[6][2] , \min_dist_reg[6][1] , \min_dist_reg[6][0] ,
         \min_dist_reg[5][2] , \min_dist_reg[5][1] , \min_dist_reg[5][0] ,
         \min_dist_reg[4][2] , \min_dist_reg[4][1] , \min_dist_reg[4][0] ,
         \min_dist_reg[3][2] , \min_dist_reg[3][1] , \min_dist_reg[3][0] ,
         \min_dist_reg[2][2] , \min_dist_reg[2][1] , \min_dist_reg[2][0] ,
         \min_dist_reg[1][2] , \min_dist_reg[1][1] , \min_dist_reg[1][0] ,
         \min_dist_reg[0][2] , \min_dist_reg[0][1] , \min_dist_reg[0][0] ,
         \local_min_dist[0][2] , \local_min_dist[0][1] ,
         \local_min_dist[0][0] , \min_dist[7][2] , \min_dist[7][1] ,
         \min_dist[7][0] , \min_dist[6][2] , \min_dist[6][1] ,
         \min_dist[6][0] , \min_dist[5][2] , \min_dist[5][1] ,
         \min_dist[5][0] , \min_dist[4][2] , \min_dist[4][1] ,
         \min_dist[4][0] , \min_dist[3][2] , \min_dist[3][1] ,
         \min_dist[3][0] , \min_dist[2][2] , \min_dist[2][1] ,
         \min_dist[2][0] , \min_dist[1][2] , \min_dist[1][1] ,
         \min_dist[1][0] , \min_val_reg[7][6] , \min_val_reg[7][5] ,
         \min_val_reg[7][4] , \min_val_reg[7][3] , \min_val_reg[7][2] ,
         \min_val_reg[7][1] , \min_val_reg[7][0] , \min_val_reg[6][6] ,
         \min_val_reg[6][5] , \min_val_reg[6][4] , \min_val_reg[6][3] ,
         \min_val_reg[6][2] , \min_val_reg[6][1] , \min_val_reg[6][0] ,
         \min_val_reg[5][6] , \min_val_reg[5][5] , \min_val_reg[5][4] ,
         \min_val_reg[5][3] , \min_val_reg[5][2] , \min_val_reg[5][1] ,
         \min_val_reg[5][0] , \min_val_reg[4][6] , \min_val_reg[4][5] ,
         \min_val_reg[4][4] , \min_val_reg[4][3] , \min_val_reg[4][2] ,
         \min_val_reg[4][1] , \min_val_reg[4][0] , \min_val_reg[3][6] ,
         \min_val_reg[3][5] , \min_val_reg[3][4] , \min_val_reg[3][3] ,
         \min_val_reg[3][2] , \min_val_reg[3][1] , \min_val_reg[3][0] ,
         \min_val_reg[2][6] , \min_val_reg[2][5] , \min_val_reg[2][4] ,
         \min_val_reg[2][3] , \min_val_reg[2][2] , \min_val_reg[2][1] ,
         \min_val_reg[2][0] , \min_val_reg[1][6] , \min_val_reg[1][5] ,
         \min_val_reg[1][4] , \min_val_reg[1][3] , \min_val_reg[1][2] ,
         \min_val_reg[1][1] , \min_val_reg[1][0] , \min_val_reg[0][6] ,
         \min_val_reg[0][5] , \min_val_reg[0][4] , \min_val_reg[0][3] ,
         \min_val_reg[0][2] , \min_val_reg[0][1] , \min_val_reg[0][0] , n81,
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
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518;

  DFF \min_dist_reg_reg[0][0]  ( .D(\local_min_dist[0][0] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][0] ) );
  DFF \min_dist_reg_reg[0][1]  ( .D(\local_min_dist[0][1] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][1] ) );
  DFF \min_dist_reg_reg[0][2]  ( .D(\local_min_dist[0][2] ), .CLK(clk), .RST(
        rst), .I(1'b1), .Q(\min_dist_reg[0][2] ) );
  DFF \min_dist_reg_reg[1][0]  ( .D(\min_dist[1][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][0] ) );
  DFF \min_dist_reg_reg[1][1]  ( .D(\min_dist[1][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][1] ) );
  DFF \min_dist_reg_reg[1][2]  ( .D(\min_dist[1][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[1][2] ) );
  DFF \min_dist_reg_reg[2][0]  ( .D(\min_dist[2][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][0] ) );
  DFF \min_dist_reg_reg[2][1]  ( .D(\min_dist[2][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][1] ) );
  DFF \min_dist_reg_reg[2][2]  ( .D(\min_dist[2][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[2][2] ) );
  DFF \min_dist_reg_reg[3][0]  ( .D(\min_dist[3][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][0] ) );
  DFF \min_dist_reg_reg[3][1]  ( .D(\min_dist[3][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][1] ) );
  DFF \min_dist_reg_reg[3][2]  ( .D(\min_dist[3][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[3][2] ) );
  DFF \min_dist_reg_reg[4][0]  ( .D(\min_dist[4][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[4][0] ) );
  DFF \min_dist_reg_reg[4][1]  ( .D(\min_dist[4][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[4][1] ) );
  DFF \min_dist_reg_reg[4][2]  ( .D(\min_dist[4][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[4][2] ) );
  DFF \min_dist_reg_reg[5][0]  ( .D(\min_dist[5][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[5][0] ) );
  DFF \min_dist_reg_reg[5][1]  ( .D(\min_dist[5][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[5][1] ) );
  DFF \min_dist_reg_reg[5][2]  ( .D(\min_dist[5][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[5][2] ) );
  DFF \min_dist_reg_reg[6][0]  ( .D(\min_dist[6][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[6][0] ) );
  DFF \min_dist_reg_reg[6][1]  ( .D(\min_dist[6][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[6][1] ) );
  DFF \min_dist_reg_reg[6][2]  ( .D(\min_dist[6][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[6][2] ) );
  DFF \min_dist_reg_reg[7][0]  ( .D(\min_dist[7][0] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[7][0] ) );
  DFF \min_dist_reg_reg[7][1]  ( .D(\min_dist[7][1] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[7][1] ) );
  DFF \min_dist_reg_reg[7][2]  ( .D(\min_dist[7][2] ), .CLK(clk), .RST(rst), 
        .I(1'b1), .Q(\min_dist_reg[7][2] ) );
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
  DFF \min_val_reg_reg[1][0]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][0] ) );
  DFF \min_val_reg_reg[1][1]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][1] ) );
  DFF \min_val_reg_reg[1][2]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][2] ) );
  DFF \min_val_reg_reg[1][3]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][3] ) );
  DFF \min_val_reg_reg[1][4]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][4] ) );
  DFF \min_val_reg_reg[1][5]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][5] ) );
  DFF \min_val_reg_reg[1][6]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[1][6] ) );
  DFF \min_val_reg_reg[2][0]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][0] ) );
  DFF \min_val_reg_reg[2][1]  ( .D(min_val_out[15]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][1] ) );
  DFF \min_val_reg_reg[2][2]  ( .D(min_val_out[16]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][2] ) );
  DFF \min_val_reg_reg[2][3]  ( .D(min_val_out[17]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][3] ) );
  DFF \min_val_reg_reg[2][4]  ( .D(min_val_out[18]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][4] ) );
  DFF \min_val_reg_reg[2][5]  ( .D(min_val_out[19]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][5] ) );
  DFF \min_val_reg_reg[2][6]  ( .D(min_val_out[20]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[2][6] ) );
  DFF \min_val_reg_reg[3][0]  ( .D(min_val_out[21]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][0] ) );
  DFF \min_val_reg_reg[3][1]  ( .D(min_val_out[22]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][1] ) );
  DFF \min_val_reg_reg[3][2]  ( .D(min_val_out[23]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][2] ) );
  DFF \min_val_reg_reg[3][3]  ( .D(min_val_out[24]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][3] ) );
  DFF \min_val_reg_reg[3][4]  ( .D(min_val_out[25]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][4] ) );
  DFF \min_val_reg_reg[3][5]  ( .D(min_val_out[26]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][5] ) );
  DFF \min_val_reg_reg[3][6]  ( .D(min_val_out[27]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[3][6] ) );
  DFF \min_val_reg_reg[4][0]  ( .D(min_val_out[28]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][0] ) );
  DFF \min_val_reg_reg[4][1]  ( .D(min_val_out[29]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][1] ) );
  DFF \min_val_reg_reg[4][2]  ( .D(min_val_out[30]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][2] ) );
  DFF \min_val_reg_reg[4][3]  ( .D(min_val_out[31]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][3] ) );
  DFF \min_val_reg_reg[4][4]  ( .D(min_val_out[32]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][4] ) );
  DFF \min_val_reg_reg[4][5]  ( .D(min_val_out[33]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][5] ) );
  DFF \min_val_reg_reg[4][6]  ( .D(min_val_out[34]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[4][6] ) );
  DFF \min_val_reg_reg[5][0]  ( .D(min_val_out[35]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][0] ) );
  DFF \min_val_reg_reg[5][1]  ( .D(min_val_out[36]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][1] ) );
  DFF \min_val_reg_reg[5][2]  ( .D(min_val_out[37]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][2] ) );
  DFF \min_val_reg_reg[5][3]  ( .D(min_val_out[38]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][3] ) );
  DFF \min_val_reg_reg[5][4]  ( .D(min_val_out[39]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][4] ) );
  DFF \min_val_reg_reg[5][5]  ( .D(min_val_out[40]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][5] ) );
  DFF \min_val_reg_reg[5][6]  ( .D(min_val_out[41]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[5][6] ) );
  DFF \min_val_reg_reg[6][0]  ( .D(min_val_out[42]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][0] ) );
  DFF \min_val_reg_reg[6][1]  ( .D(min_val_out[43]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][1] ) );
  DFF \min_val_reg_reg[6][2]  ( .D(min_val_out[44]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][2] ) );
  DFF \min_val_reg_reg[6][3]  ( .D(min_val_out[45]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][3] ) );
  DFF \min_val_reg_reg[6][4]  ( .D(min_val_out[46]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][4] ) );
  DFF \min_val_reg_reg[6][5]  ( .D(min_val_out[47]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][5] ) );
  DFF \min_val_reg_reg[6][6]  ( .D(min_val_out[48]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[6][6] ) );
  DFF \min_val_reg_reg[7][0]  ( .D(min_val_out[49]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][0] ) );
  DFF \min_val_reg_reg[7][1]  ( .D(min_val_out[50]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][1] ) );
  DFF \min_val_reg_reg[7][2]  ( .D(min_val_out[51]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][2] ) );
  DFF \min_val_reg_reg[7][3]  ( .D(min_val_out[52]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][3] ) );
  DFF \min_val_reg_reg[7][4]  ( .D(min_val_out[53]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][4] ) );
  DFF \min_val_reg_reg[7][5]  ( .D(min_val_out[54]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][5] ) );
  DFF \min_val_reg_reg[7][6]  ( .D(min_val_out[55]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(\min_val_reg[7][6] ) );
  XOR U90 ( .A(n81), .B(n82), .Z(min_val_out[9]) );
  AND U91 ( .A(n83), .B(n84), .Z(n81) );
  XOR U92 ( .A(n85), .B(n86), .Z(min_val_out[8]) );
  AND U93 ( .A(n83), .B(n87), .Z(n85) );
  XOR U94 ( .A(n88), .B(n89), .Z(min_val_out[7]) );
  AND U95 ( .A(n83), .B(n90), .Z(n88) );
  XOR U96 ( .A(\min_val_reg[0][6] ), .B(n91), .Z(min_val_out[6]) );
  AND U97 ( .A(n92), .B(n93), .Z(n91) );
  XOR U98 ( .A(\min_val_reg[0][5] ), .B(n94), .Z(min_val_out[5]) );
  AND U99 ( .A(n92), .B(n95), .Z(n94) );
  XNOR U100 ( .A(n96), .B(n97), .Z(min_val_out[55]) );
  AND U101 ( .A(n98), .B(n99), .Z(n96) );
  XNOR U102 ( .A(n100), .B(n101), .Z(min_val_out[54]) );
  AND U103 ( .A(n98), .B(n102), .Z(n100) );
  XNOR U104 ( .A(n103), .B(n104), .Z(min_val_out[53]) );
  AND U105 ( .A(n98), .B(n105), .Z(n103) );
  XNOR U106 ( .A(n106), .B(n107), .Z(min_val_out[52]) );
  AND U107 ( .A(n98), .B(n108), .Z(n106) );
  XNOR U108 ( .A(n109), .B(n110), .Z(min_val_out[51]) );
  AND U109 ( .A(n98), .B(n111), .Z(n109) );
  XNOR U110 ( .A(n112), .B(n113), .Z(min_val_out[50]) );
  AND U111 ( .A(n98), .B(n114), .Z(n112) );
  XOR U112 ( .A(\min_val_reg[0][4] ), .B(n115), .Z(min_val_out[4]) );
  AND U113 ( .A(n92), .B(n116), .Z(n115) );
  XNOR U114 ( .A(n117), .B(n118), .Z(min_val_out[49]) );
  AND U115 ( .A(n98), .B(n119), .Z(n117) );
  XOR U116 ( .A(n120), .B(n121), .Z(min_val_out[48]) );
  AND U117 ( .A(n122), .B(n123), .Z(n120) );
  XOR U118 ( .A(n124), .B(n125), .Z(min_val_out[47]) );
  AND U119 ( .A(n122), .B(n126), .Z(n124) );
  XNOR U120 ( .A(n127), .B(n128), .Z(min_val_out[46]) );
  AND U121 ( .A(n122), .B(n129), .Z(n127) );
  XNOR U122 ( .A(n130), .B(n131), .Z(min_val_out[45]) );
  AND U123 ( .A(n122), .B(n132), .Z(n130) );
  XOR U124 ( .A(n133), .B(n134), .Z(min_val_out[44]) );
  AND U125 ( .A(n122), .B(n135), .Z(n133) );
  XOR U126 ( .A(n136), .B(n137), .Z(min_val_out[43]) );
  AND U127 ( .A(n122), .B(n138), .Z(n136) );
  XOR U128 ( .A(n139), .B(n140), .Z(min_val_out[42]) );
  AND U129 ( .A(n122), .B(n141), .Z(n139) );
  XOR U130 ( .A(n142), .B(n143), .Z(min_val_out[41]) );
  AND U131 ( .A(n144), .B(n145), .Z(n142) );
  XOR U132 ( .A(n146), .B(n147), .Z(min_val_out[40]) );
  AND U133 ( .A(n144), .B(n148), .Z(n146) );
  XOR U134 ( .A(\min_val_reg[0][3] ), .B(n149), .Z(min_val_out[3]) );
  AND U135 ( .A(n92), .B(n150), .Z(n149) );
  XOR U136 ( .A(n151), .B(n152), .Z(min_val_out[39]) );
  AND U137 ( .A(n144), .B(n153), .Z(n151) );
  XNOR U138 ( .A(n154), .B(n155), .Z(min_val_out[38]) );
  AND U139 ( .A(n144), .B(n156), .Z(n154) );
  XOR U140 ( .A(n157), .B(n158), .Z(min_val_out[37]) );
  AND U141 ( .A(n144), .B(n159), .Z(n157) );
  XOR U142 ( .A(n160), .B(n161), .Z(min_val_out[36]) );
  AND U143 ( .A(n144), .B(n162), .Z(n160) );
  XOR U144 ( .A(n163), .B(n164), .Z(min_val_out[35]) );
  AND U145 ( .A(n144), .B(n165), .Z(n163) );
  XOR U146 ( .A(n166), .B(n167), .Z(min_val_out[34]) );
  AND U147 ( .A(n168), .B(n169), .Z(n166) );
  XOR U148 ( .A(n170), .B(n171), .Z(min_val_out[33]) );
  AND U149 ( .A(n168), .B(n172), .Z(n170) );
  XOR U150 ( .A(n173), .B(n174), .Z(min_val_out[32]) );
  AND U151 ( .A(n168), .B(n175), .Z(n173) );
  XOR U152 ( .A(n176), .B(n177), .Z(min_val_out[31]) );
  AND U153 ( .A(n168), .B(n178), .Z(n176) );
  XOR U154 ( .A(n179), .B(n180), .Z(min_val_out[30]) );
  AND U155 ( .A(n168), .B(n181), .Z(n179) );
  XOR U156 ( .A(\min_val_reg[0][2] ), .B(n182), .Z(min_val_out[2]) );
  AND U157 ( .A(n92), .B(n84), .Z(n182) );
  XOR U158 ( .A(\min_val_reg[0][2] ), .B(n82), .Z(n84) );
  XNOR U159 ( .A(\min_val_reg[1][2] ), .B(n183), .Z(n82) );
  NAND U160 ( .A(n184), .B(n185), .Z(n183) );
  XOR U161 ( .A(n186), .B(n187), .Z(min_val_out[29]) );
  AND U162 ( .A(n168), .B(n188), .Z(n186) );
  XOR U163 ( .A(n189), .B(n190), .Z(min_val_out[28]) );
  AND U164 ( .A(n168), .B(n191), .Z(n189) );
  XOR U165 ( .A(n192), .B(n193), .Z(min_val_out[27]) );
  AND U166 ( .A(n194), .B(n195), .Z(n192) );
  XOR U167 ( .A(n196), .B(n197), .Z(min_val_out[26]) );
  AND U168 ( .A(n194), .B(n198), .Z(n196) );
  XOR U169 ( .A(n199), .B(n200), .Z(min_val_out[25]) );
  AND U170 ( .A(n194), .B(n201), .Z(n199) );
  XOR U171 ( .A(n202), .B(n203), .Z(min_val_out[24]) );
  AND U172 ( .A(n194), .B(n204), .Z(n202) );
  XOR U173 ( .A(n205), .B(n206), .Z(min_val_out[23]) );
  AND U174 ( .A(n194), .B(n207), .Z(n205) );
  XOR U175 ( .A(n208), .B(n209), .Z(min_val_out[22]) );
  AND U176 ( .A(n194), .B(n210), .Z(n208) );
  XOR U177 ( .A(n211), .B(n212), .Z(min_val_out[21]) );
  AND U178 ( .A(n194), .B(n213), .Z(n211) );
  XOR U179 ( .A(n214), .B(n215), .Z(min_val_out[20]) );
  AND U180 ( .A(n185), .B(n216), .Z(n214) );
  XOR U181 ( .A(\min_val_reg[0][1] ), .B(n217), .Z(min_val_out[1]) );
  AND U182 ( .A(n92), .B(n87), .Z(n217) );
  XOR U183 ( .A(\min_val_reg[0][1] ), .B(n86), .Z(n87) );
  XNOR U184 ( .A(\min_val_reg[1][1] ), .B(n218), .Z(n86) );
  NAND U185 ( .A(n219), .B(n185), .Z(n218) );
  XOR U186 ( .A(n220), .B(n221), .Z(min_val_out[19]) );
  AND U187 ( .A(n185), .B(n222), .Z(n220) );
  XOR U188 ( .A(n223), .B(n224), .Z(min_val_out[18]) );
  AND U189 ( .A(n185), .B(n225), .Z(n223) );
  XOR U190 ( .A(n226), .B(n227), .Z(min_val_out[17]) );
  AND U191 ( .A(n185), .B(n228), .Z(n226) );
  XOR U192 ( .A(n229), .B(n230), .Z(min_val_out[16]) );
  AND U193 ( .A(n185), .B(n184), .Z(n229) );
  XOR U194 ( .A(\min_val_reg[1][2] ), .B(n230), .Z(n184) );
  XNOR U195 ( .A(\min_val_reg[2][2] ), .B(n231), .Z(n230) );
  NAND U196 ( .A(n207), .B(n194), .Z(n231) );
  XOR U197 ( .A(\min_val_reg[2][2] ), .B(n206), .Z(n207) );
  XNOR U198 ( .A(\min_val_reg[3][2] ), .B(n232), .Z(n206) );
  NAND U199 ( .A(n181), .B(n168), .Z(n232) );
  XOR U200 ( .A(\min_val_reg[3][2] ), .B(n180), .Z(n181) );
  XNOR U201 ( .A(\min_val_reg[4][2] ), .B(n233), .Z(n180) );
  NAND U202 ( .A(n159), .B(n144), .Z(n233) );
  XOR U203 ( .A(\min_val_reg[4][2] ), .B(n158), .Z(n159) );
  XNOR U204 ( .A(\min_val_reg[5][2] ), .B(n234), .Z(n158) );
  NAND U205 ( .A(n135), .B(n122), .Z(n234) );
  XOR U206 ( .A(\min_val_reg[5][2] ), .B(n134), .Z(n135) );
  XNOR U207 ( .A(\min_val_reg[6][2] ), .B(n235), .Z(n134) );
  NAND U208 ( .A(n111), .B(n98), .Z(n235) );
  XNOR U209 ( .A(\min_val_reg[6][2] ), .B(n110), .Z(n111) );
  XOR U210 ( .A(\min_val_reg[7][2] ), .B(n236), .Z(n110) );
  NAND U211 ( .A(n237), .B(n238), .Z(n236) );
  XOR U212 ( .A(\min_val_reg[7][2] ), .B(DB[2]), .Z(n237) );
  XOR U213 ( .A(n239), .B(n240), .Z(min_val_out[15]) );
  AND U214 ( .A(n185), .B(n219), .Z(n239) );
  XOR U215 ( .A(\min_val_reg[1][1] ), .B(n240), .Z(n219) );
  XNOR U216 ( .A(\min_val_reg[2][1] ), .B(n241), .Z(n240) );
  NAND U217 ( .A(n210), .B(n194), .Z(n241) );
  XOR U218 ( .A(\min_val_reg[2][1] ), .B(n209), .Z(n210) );
  XNOR U219 ( .A(\min_val_reg[3][1] ), .B(n242), .Z(n209) );
  NAND U220 ( .A(n188), .B(n168), .Z(n242) );
  XOR U221 ( .A(\min_val_reg[3][1] ), .B(n187), .Z(n188) );
  XNOR U222 ( .A(\min_val_reg[4][1] ), .B(n243), .Z(n187) );
  NAND U223 ( .A(n162), .B(n144), .Z(n243) );
  XOR U224 ( .A(\min_val_reg[4][1] ), .B(n161), .Z(n162) );
  XNOR U225 ( .A(\min_val_reg[5][1] ), .B(n244), .Z(n161) );
  NAND U226 ( .A(n138), .B(n122), .Z(n244) );
  XOR U227 ( .A(\min_val_reg[5][1] ), .B(n137), .Z(n138) );
  XNOR U228 ( .A(\min_val_reg[6][1] ), .B(n245), .Z(n137) );
  NAND U229 ( .A(n114), .B(n98), .Z(n245) );
  XNOR U230 ( .A(\min_val_reg[6][1] ), .B(n113), .Z(n114) );
  XOR U231 ( .A(\min_val_reg[7][1] ), .B(n246), .Z(n113) );
  NAND U232 ( .A(n247), .B(n238), .Z(n246) );
  XOR U233 ( .A(\min_val_reg[7][1] ), .B(DB[1]), .Z(n247) );
  XOR U234 ( .A(n248), .B(n249), .Z(min_val_out[14]) );
  AND U235 ( .A(n185), .B(n250), .Z(n248) );
  XOR U236 ( .A(n251), .B(n252), .Z(min_val_out[13]) );
  AND U237 ( .A(n83), .B(n93), .Z(n251) );
  XOR U238 ( .A(\min_val_reg[0][6] ), .B(n252), .Z(n93) );
  XNOR U239 ( .A(\min_val_reg[1][6] ), .B(n253), .Z(n252) );
  NAND U240 ( .A(n216), .B(n185), .Z(n253) );
  XOR U241 ( .A(\min_val_reg[1][6] ), .B(n215), .Z(n216) );
  XNOR U242 ( .A(\min_val_reg[2][6] ), .B(n254), .Z(n215) );
  NAND U243 ( .A(n195), .B(n194), .Z(n254) );
  XOR U244 ( .A(\min_val_reg[2][6] ), .B(n193), .Z(n195) );
  XNOR U245 ( .A(\min_val_reg[3][6] ), .B(n255), .Z(n193) );
  NAND U246 ( .A(n169), .B(n168), .Z(n255) );
  XOR U247 ( .A(\min_val_reg[3][6] ), .B(n167), .Z(n169) );
  XNOR U248 ( .A(\min_val_reg[4][6] ), .B(n256), .Z(n167) );
  NAND U249 ( .A(n145), .B(n144), .Z(n256) );
  XOR U250 ( .A(\min_val_reg[4][6] ), .B(n143), .Z(n145) );
  XNOR U251 ( .A(\min_val_reg[5][6] ), .B(n257), .Z(n143) );
  NAND U252 ( .A(n123), .B(n122), .Z(n257) );
  XOR U253 ( .A(\min_val_reg[5][6] ), .B(n121), .Z(n123) );
  XNOR U254 ( .A(\min_val_reg[6][6] ), .B(n258), .Z(n121) );
  NAND U255 ( .A(n99), .B(n98), .Z(n258) );
  XNOR U256 ( .A(\min_val_reg[6][6] ), .B(n97), .Z(n99) );
  XOR U257 ( .A(\min_val_reg[7][6] ), .B(n259), .Z(n97) );
  NAND U258 ( .A(n260), .B(n238), .Z(n259) );
  XOR U259 ( .A(\min_val_reg[7][6] ), .B(DB[6]), .Z(n260) );
  XOR U260 ( .A(n261), .B(n262), .Z(min_val_out[12]) );
  AND U261 ( .A(n83), .B(n95), .Z(n261) );
  XOR U262 ( .A(\min_val_reg[0][5] ), .B(n262), .Z(n95) );
  XNOR U263 ( .A(\min_val_reg[1][5] ), .B(n263), .Z(n262) );
  NAND U264 ( .A(n222), .B(n185), .Z(n263) );
  XOR U265 ( .A(\min_val_reg[1][5] ), .B(n221), .Z(n222) );
  XNOR U266 ( .A(\min_val_reg[2][5] ), .B(n264), .Z(n221) );
  NAND U267 ( .A(n198), .B(n194), .Z(n264) );
  XOR U268 ( .A(\min_val_reg[2][5] ), .B(n197), .Z(n198) );
  XNOR U269 ( .A(\min_val_reg[3][5] ), .B(n265), .Z(n197) );
  NAND U270 ( .A(n172), .B(n168), .Z(n265) );
  XOR U271 ( .A(\min_val_reg[3][5] ), .B(n171), .Z(n172) );
  XNOR U272 ( .A(\min_val_reg[4][5] ), .B(n266), .Z(n171) );
  NAND U273 ( .A(n148), .B(n144), .Z(n266) );
  XOR U274 ( .A(\min_val_reg[4][5] ), .B(n147), .Z(n148) );
  XNOR U275 ( .A(\min_val_reg[5][5] ), .B(n267), .Z(n147) );
  NAND U276 ( .A(n126), .B(n122), .Z(n267) );
  XOR U277 ( .A(\min_val_reg[5][5] ), .B(n125), .Z(n126) );
  XNOR U278 ( .A(\min_val_reg[6][5] ), .B(n268), .Z(n125) );
  NAND U279 ( .A(n102), .B(n98), .Z(n268) );
  XNOR U280 ( .A(\min_val_reg[6][5] ), .B(n101), .Z(n102) );
  XOR U281 ( .A(\min_val_reg[7][5] ), .B(n269), .Z(n101) );
  NAND U282 ( .A(n270), .B(n238), .Z(n269) );
  XOR U283 ( .A(\min_val_reg[7][5] ), .B(DB[5]), .Z(n270) );
  XOR U284 ( .A(n271), .B(n272), .Z(min_val_out[11]) );
  AND U285 ( .A(n83), .B(n116), .Z(n271) );
  XOR U286 ( .A(\min_val_reg[0][4] ), .B(n272), .Z(n116) );
  XNOR U287 ( .A(\min_val_reg[1][4] ), .B(n273), .Z(n272) );
  NAND U288 ( .A(n225), .B(n185), .Z(n273) );
  XOR U289 ( .A(\min_val_reg[1][4] ), .B(n224), .Z(n225) );
  XNOR U290 ( .A(\min_val_reg[2][4] ), .B(n274), .Z(n224) );
  NAND U291 ( .A(n201), .B(n194), .Z(n274) );
  XOR U292 ( .A(\min_val_reg[2][4] ), .B(n200), .Z(n201) );
  XNOR U293 ( .A(\min_val_reg[3][4] ), .B(n275), .Z(n200) );
  NAND U294 ( .A(n175), .B(n168), .Z(n275) );
  XOR U295 ( .A(\min_val_reg[3][4] ), .B(n174), .Z(n175) );
  XNOR U296 ( .A(\min_val_reg[4][4] ), .B(n276), .Z(n174) );
  NAND U297 ( .A(n153), .B(n144), .Z(n276) );
  XOR U298 ( .A(\min_val_reg[4][4] ), .B(n152), .Z(n153) );
  XNOR U299 ( .A(\min_val_reg[5][4] ), .B(n277), .Z(n152) );
  NAND U300 ( .A(n129), .B(n122), .Z(n277) );
  XNOR U301 ( .A(\min_val_reg[5][4] ), .B(n128), .Z(n129) );
  XOR U302 ( .A(\min_val_reg[6][4] ), .B(n278), .Z(n128) );
  NAND U303 ( .A(n105), .B(n98), .Z(n278) );
  XNOR U304 ( .A(\min_val_reg[6][4] ), .B(n104), .Z(n105) );
  XOR U305 ( .A(\min_val_reg[7][4] ), .B(n279), .Z(n104) );
  NAND U306 ( .A(n280), .B(n238), .Z(n279) );
  XOR U307 ( .A(\min_val_reg[7][4] ), .B(DB[4]), .Z(n280) );
  XOR U308 ( .A(n281), .B(n282), .Z(min_val_out[10]) );
  AND U309 ( .A(n83), .B(n150), .Z(n281) );
  XOR U310 ( .A(\min_val_reg[0][3] ), .B(n282), .Z(n150) );
  XNOR U311 ( .A(\min_val_reg[1][3] ), .B(n283), .Z(n282) );
  NAND U312 ( .A(n228), .B(n185), .Z(n283) );
  XOR U313 ( .A(\min_val_reg[1][3] ), .B(n227), .Z(n228) );
  XNOR U314 ( .A(\min_val_reg[2][3] ), .B(n284), .Z(n227) );
  NAND U315 ( .A(n204), .B(n194), .Z(n284) );
  XOR U316 ( .A(\min_val_reg[2][3] ), .B(n203), .Z(n204) );
  XNOR U317 ( .A(\min_val_reg[3][3] ), .B(n285), .Z(n203) );
  NAND U318 ( .A(n178), .B(n168), .Z(n285) );
  XOR U319 ( .A(\min_val_reg[3][3] ), .B(n177), .Z(n178) );
  XNOR U320 ( .A(\min_val_reg[4][3] ), .B(n286), .Z(n177) );
  NAND U321 ( .A(n156), .B(n144), .Z(n286) );
  XNOR U322 ( .A(\min_val_reg[4][3] ), .B(n155), .Z(n156) );
  XOR U323 ( .A(\min_val_reg[5][3] ), .B(n287), .Z(n155) );
  NAND U324 ( .A(n132), .B(n122), .Z(n287) );
  XNOR U325 ( .A(\min_val_reg[5][3] ), .B(n131), .Z(n132) );
  XOR U326 ( .A(\min_val_reg[6][3] ), .B(n288), .Z(n131) );
  NAND U327 ( .A(n108), .B(n98), .Z(n288) );
  XNOR U328 ( .A(\min_val_reg[6][3] ), .B(n107), .Z(n108) );
  XOR U329 ( .A(\min_val_reg[7][3] ), .B(n289), .Z(n107) );
  NAND U330 ( .A(n290), .B(n238), .Z(n289) );
  XOR U331 ( .A(\min_val_reg[7][3] ), .B(DB[3]), .Z(n290) );
  XOR U332 ( .A(\min_val_reg[0][0] ), .B(n291), .Z(min_val_out[0]) );
  AND U333 ( .A(n92), .B(n90), .Z(n291) );
  XOR U334 ( .A(\min_val_reg[0][0] ), .B(n89), .Z(n90) );
  XNOR U335 ( .A(\min_val_reg[1][0] ), .B(n292), .Z(n89) );
  NAND U336 ( .A(n250), .B(n185), .Z(n292) );
  XOR U337 ( .A(\min_val_reg[1][0] ), .B(n249), .Z(n250) );
  XNOR U338 ( .A(\min_val_reg[2][0] ), .B(n293), .Z(n249) );
  NAND U339 ( .A(n213), .B(n194), .Z(n293) );
  XOR U340 ( .A(\min_val_reg[2][0] ), .B(n212), .Z(n213) );
  XNOR U341 ( .A(\min_val_reg[3][0] ), .B(n294), .Z(n212) );
  NAND U342 ( .A(n191), .B(n168), .Z(n294) );
  XOR U343 ( .A(\min_val_reg[3][0] ), .B(n190), .Z(n191) );
  XNOR U344 ( .A(\min_val_reg[4][0] ), .B(n295), .Z(n190) );
  NAND U345 ( .A(n165), .B(n144), .Z(n295) );
  XOR U346 ( .A(\min_val_reg[4][0] ), .B(n164), .Z(n165) );
  XNOR U347 ( .A(\min_val_reg[5][0] ), .B(n296), .Z(n164) );
  NAND U348 ( .A(n141), .B(n122), .Z(n296) );
  XOR U349 ( .A(\min_val_reg[5][0] ), .B(n140), .Z(n141) );
  XNOR U350 ( .A(\min_val_reg[6][0] ), .B(n297), .Z(n140) );
  NAND U351 ( .A(n119), .B(n98), .Z(n297) );
  XNOR U352 ( .A(\min_val_reg[6][0] ), .B(n118), .Z(n119) );
  XOR U353 ( .A(\min_val_reg[7][0] ), .B(n298), .Z(n118) );
  NAND U354 ( .A(n299), .B(n238), .Z(n298) );
  XOR U355 ( .A(\min_val_reg[7][0] ), .B(DB[0]), .Z(n299) );
  XNOR U356 ( .A(n300), .B(n301), .Z(\min_dist[7][2] ) );
  AND U357 ( .A(n98), .B(n302), .Z(n300) );
  XOR U358 ( .A(\min_dist_reg[6][2] ), .B(n303), .Z(n302) );
  XOR U359 ( .A(n304), .B(n305), .Z(\min_dist[7][1] ) );
  AND U360 ( .A(n98), .B(n306), .Z(n304) );
  XNOR U361 ( .A(\min_dist_reg[6][1] ), .B(n307), .Z(n306) );
  XOR U362 ( .A(n308), .B(n309), .Z(\min_dist[7][0] ) );
  AND U363 ( .A(n98), .B(n310), .Z(n308) );
  XOR U364 ( .A(n311), .B(n312), .Z(\min_dist[6][2] ) );
  AND U365 ( .A(n122), .B(n313), .Z(n311) );
  XOR U366 ( .A(\min_dist_reg[5][2] ), .B(n312), .Z(n313) );
  XOR U367 ( .A(n314), .B(n315), .Z(\min_dist[6][1] ) );
  AND U368 ( .A(n122), .B(n316), .Z(n314) );
  XOR U369 ( .A(\min_dist_reg[5][1] ), .B(n315), .Z(n316) );
  XOR U370 ( .A(n317), .B(n318), .Z(\min_dist[6][0] ) );
  AND U371 ( .A(n122), .B(n319), .Z(n317) );
  XOR U372 ( .A(n320), .B(n321), .Z(\min_dist[5][2] ) );
  AND U373 ( .A(n144), .B(n322), .Z(n320) );
  XOR U374 ( .A(\min_dist_reg[4][2] ), .B(n321), .Z(n322) );
  XOR U375 ( .A(n323), .B(n324), .Z(\min_dist[5][1] ) );
  AND U376 ( .A(n144), .B(n325), .Z(n323) );
  XOR U377 ( .A(\min_dist_reg[4][1] ), .B(n324), .Z(n325) );
  XOR U378 ( .A(n326), .B(n327), .Z(\min_dist[5][0] ) );
  AND U379 ( .A(n144), .B(n328), .Z(n326) );
  XOR U380 ( .A(n329), .B(n330), .Z(\min_dist[4][2] ) );
  AND U381 ( .A(n168), .B(n331), .Z(n329) );
  XOR U382 ( .A(\min_dist_reg[3][2] ), .B(n330), .Z(n331) );
  XOR U383 ( .A(n332), .B(n333), .Z(\min_dist[4][1] ) );
  AND U384 ( .A(n168), .B(n334), .Z(n332) );
  XOR U385 ( .A(\min_dist_reg[3][1] ), .B(n333), .Z(n334) );
  XOR U386 ( .A(n335), .B(n336), .Z(\min_dist[4][0] ) );
  AND U387 ( .A(n168), .B(n337), .Z(n335) );
  XOR U388 ( .A(n338), .B(n339), .Z(\min_dist[3][2] ) );
  AND U389 ( .A(n194), .B(n340), .Z(n338) );
  XOR U390 ( .A(\min_dist_reg[2][2] ), .B(n339), .Z(n340) );
  XOR U391 ( .A(n341), .B(n342), .Z(\min_dist[3][1] ) );
  AND U392 ( .A(n194), .B(n343), .Z(n341) );
  XOR U393 ( .A(\min_dist_reg[2][1] ), .B(n342), .Z(n343) );
  XOR U394 ( .A(n344), .B(n345), .Z(\min_dist[3][0] ) );
  AND U395 ( .A(n194), .B(n346), .Z(n344) );
  XOR U396 ( .A(n347), .B(n348), .Z(\min_dist[2][2] ) );
  AND U397 ( .A(n185), .B(n349), .Z(n347) );
  XOR U398 ( .A(\min_dist_reg[1][2] ), .B(n348), .Z(n349) );
  XOR U399 ( .A(n350), .B(n351), .Z(\min_dist[2][1] ) );
  AND U400 ( .A(n185), .B(n352), .Z(n350) );
  XOR U401 ( .A(\min_dist_reg[1][1] ), .B(n351), .Z(n352) );
  XOR U402 ( .A(n353), .B(n354), .Z(\min_dist[2][0] ) );
  AND U403 ( .A(n185), .B(n355), .Z(n353) );
  XOR U404 ( .A(n356), .B(n357), .Z(\min_dist[1][2] ) );
  AND U405 ( .A(n83), .B(n358), .Z(n356) );
  XOR U406 ( .A(\min_dist_reg[0][2] ), .B(n357), .Z(n358) );
  XOR U407 ( .A(n359), .B(n360), .Z(\min_dist[1][1] ) );
  AND U408 ( .A(n83), .B(n361), .Z(n359) );
  XNOR U409 ( .A(n362), .B(n363), .Z(\min_dist[1][0] ) );
  AND U410 ( .A(n83), .B(n364), .Z(n362) );
  XNOR U411 ( .A(\min_dist_reg[0][0] ), .B(n363), .Z(n364) );
  XOR U412 ( .A(n365), .B(n366), .Z(n83) );
  AND U413 ( .A(n367), .B(n368), .Z(n365) );
  XNOR U414 ( .A(n357), .B(n366), .Z(n368) );
  XOR U415 ( .A(\min_dist_reg[0][2] ), .B(n366), .Z(n367) );
  XOR U416 ( .A(n369), .B(n370), .Z(n366) );
  NAND U417 ( .A(n371), .B(n372), .Z(n370) );
  XOR U418 ( .A(n369), .B(n360), .Z(n372) );
  XNOR U419 ( .A(\min_dist_reg[0][1] ), .B(n369), .Z(n371) );
  ANDN U420 ( .B(n373), .A(\min_dist_reg[0][0] ), .Z(n369) );
  AND U421 ( .A(\min_dist_reg[0][2] ), .B(n374), .Z(\local_min_dist[0][2] ) );
  NANDN U422 ( .A(n357), .B(n92), .Z(n374) );
  XOR U423 ( .A(\min_dist_reg[0][1] ), .B(n375), .Z(\local_min_dist[0][1] ) );
  AND U424 ( .A(n92), .B(n361), .Z(n375) );
  XOR U425 ( .A(\min_dist_reg[0][1] ), .B(n360), .Z(n361) );
  XOR U426 ( .A(\min_dist_reg[0][0] ), .B(n376), .Z(\local_min_dist[0][0] ) );
  AND U427 ( .A(n92), .B(n377), .Z(n376) );
  XOR U428 ( .A(\min_dist_reg[0][0] ), .B(n373), .Z(n377) );
  IV U429 ( .A(n363), .Z(n373) );
  XOR U430 ( .A(n378), .B(n379), .Z(n92) );
  AND U431 ( .A(n380), .B(n381), .Z(n378) );
  XNOR U432 ( .A(n357), .B(n379), .Z(n381) );
  AND U433 ( .A(n382), .B(\min_dist_reg[1][2] ), .Z(n357) );
  NANDN U434 ( .A(n348), .B(n185), .Z(n382) );
  XOR U435 ( .A(\min_dist_reg[0][2] ), .B(n379), .Z(n380) );
  XOR U436 ( .A(n383), .B(n384), .Z(n379) );
  NAND U437 ( .A(n385), .B(n386), .Z(n384) );
  XOR U438 ( .A(n383), .B(n360), .Z(n386) );
  XNOR U439 ( .A(\min_dist_reg[1][1] ), .B(n387), .Z(n360) );
  NAND U440 ( .A(n388), .B(n185), .Z(n387) );
  XNOR U441 ( .A(n389), .B(n351), .Z(n388) );
  XNOR U442 ( .A(\min_dist_reg[0][1] ), .B(n383), .Z(n385) );
  NOR U443 ( .A(n363), .B(\min_dist_reg[0][0] ), .Z(n383) );
  XOR U444 ( .A(\min_dist_reg[1][0] ), .B(n390), .Z(n363) );
  NAND U445 ( .A(n355), .B(n185), .Z(n390) );
  XOR U446 ( .A(n391), .B(n392), .Z(n185) );
  AND U447 ( .A(n393), .B(n394), .Z(n391) );
  XNOR U448 ( .A(n348), .B(n392), .Z(n394) );
  AND U449 ( .A(n395), .B(\min_dist_reg[2][2] ), .Z(n348) );
  NANDN U450 ( .A(n339), .B(n194), .Z(n395) );
  XNOR U451 ( .A(n396), .B(n392), .Z(n393) );
  XOR U452 ( .A(n397), .B(n398), .Z(n392) );
  NAND U453 ( .A(n399), .B(n400), .Z(n398) );
  XOR U454 ( .A(n397), .B(n351), .Z(n400) );
  XNOR U455 ( .A(\min_dist_reg[2][1] ), .B(n401), .Z(n351) );
  NAND U456 ( .A(n402), .B(n194), .Z(n401) );
  XNOR U457 ( .A(n403), .B(n342), .Z(n402) );
  XOR U458 ( .A(n389), .B(n397), .Z(n399) );
  IV U459 ( .A(\min_dist_reg[1][1] ), .Z(n389) );
  AND U460 ( .A(n354), .B(n404), .Z(n397) );
  IV U461 ( .A(\min_dist_reg[1][2] ), .Z(n396) );
  XNOR U462 ( .A(n404), .B(n354), .Z(n355) );
  XNOR U463 ( .A(\min_dist_reg[2][0] ), .B(n405), .Z(n354) );
  NAND U464 ( .A(n346), .B(n194), .Z(n405) );
  XOR U465 ( .A(n406), .B(n407), .Z(n194) );
  AND U466 ( .A(n408), .B(n409), .Z(n406) );
  XNOR U467 ( .A(n339), .B(n407), .Z(n409) );
  AND U468 ( .A(n410), .B(\min_dist_reg[3][2] ), .Z(n339) );
  NANDN U469 ( .A(n330), .B(n168), .Z(n410) );
  XNOR U470 ( .A(n411), .B(n407), .Z(n408) );
  XOR U471 ( .A(n412), .B(n413), .Z(n407) );
  NAND U472 ( .A(n414), .B(n415), .Z(n413) );
  XOR U473 ( .A(n412), .B(n342), .Z(n415) );
  XNOR U474 ( .A(\min_dist_reg[3][1] ), .B(n416), .Z(n342) );
  NAND U475 ( .A(n417), .B(n168), .Z(n416) );
  XNOR U476 ( .A(n418), .B(n333), .Z(n417) );
  XOR U477 ( .A(n403), .B(n412), .Z(n414) );
  IV U478 ( .A(\min_dist_reg[2][1] ), .Z(n403) );
  ANDN U479 ( .B(n345), .A(\min_dist_reg[2][0] ), .Z(n412) );
  IV U480 ( .A(\min_dist_reg[2][2] ), .Z(n411) );
  XOR U481 ( .A(\min_dist_reg[2][0] ), .B(n345), .Z(n346) );
  XNOR U482 ( .A(\min_dist_reg[3][0] ), .B(n419), .Z(n345) );
  NAND U483 ( .A(n337), .B(n168), .Z(n419) );
  XOR U484 ( .A(n420), .B(n421), .Z(n168) );
  AND U485 ( .A(n422), .B(n423), .Z(n420) );
  XNOR U486 ( .A(n330), .B(n421), .Z(n423) );
  AND U487 ( .A(n424), .B(\min_dist_reg[4][2] ), .Z(n330) );
  NANDN U488 ( .A(n321), .B(n144), .Z(n424) );
  XNOR U489 ( .A(n425), .B(n421), .Z(n422) );
  XOR U490 ( .A(n426), .B(n427), .Z(n421) );
  NAND U491 ( .A(n428), .B(n429), .Z(n427) );
  XOR U492 ( .A(n426), .B(n333), .Z(n429) );
  XNOR U493 ( .A(\min_dist_reg[4][1] ), .B(n430), .Z(n333) );
  NAND U494 ( .A(n431), .B(n144), .Z(n430) );
  XNOR U495 ( .A(n432), .B(n324), .Z(n431) );
  XOR U496 ( .A(n418), .B(n426), .Z(n428) );
  IV U497 ( .A(\min_dist_reg[3][1] ), .Z(n418) );
  ANDN U498 ( .B(n336), .A(\min_dist_reg[3][0] ), .Z(n426) );
  IV U499 ( .A(\min_dist_reg[3][2] ), .Z(n425) );
  XOR U500 ( .A(\min_dist_reg[3][0] ), .B(n336), .Z(n337) );
  XNOR U501 ( .A(\min_dist_reg[4][0] ), .B(n433), .Z(n336) );
  NAND U502 ( .A(n328), .B(n144), .Z(n433) );
  XOR U503 ( .A(n434), .B(n435), .Z(n144) );
  AND U504 ( .A(n436), .B(n437), .Z(n434) );
  XNOR U505 ( .A(n321), .B(n435), .Z(n437) );
  AND U506 ( .A(n438), .B(\min_dist_reg[5][2] ), .Z(n321) );
  NANDN U507 ( .A(n312), .B(n122), .Z(n438) );
  XNOR U508 ( .A(n439), .B(n435), .Z(n436) );
  XOR U509 ( .A(n440), .B(n441), .Z(n435) );
  NAND U510 ( .A(n442), .B(n443), .Z(n441) );
  XOR U511 ( .A(n440), .B(n324), .Z(n443) );
  XNOR U512 ( .A(\min_dist_reg[5][1] ), .B(n444), .Z(n324) );
  NAND U513 ( .A(n445), .B(n122), .Z(n444) );
  XNOR U514 ( .A(n446), .B(n315), .Z(n445) );
  XOR U515 ( .A(n432), .B(n440), .Z(n442) );
  IV U516 ( .A(\min_dist_reg[4][1] ), .Z(n432) );
  ANDN U517 ( .B(n327), .A(\min_dist_reg[4][0] ), .Z(n440) );
  IV U518 ( .A(\min_dist_reg[4][2] ), .Z(n439) );
  XOR U519 ( .A(\min_dist_reg[4][0] ), .B(n327), .Z(n328) );
  XNOR U520 ( .A(\min_dist_reg[5][0] ), .B(n447), .Z(n327) );
  NAND U521 ( .A(n319), .B(n122), .Z(n447) );
  XOR U522 ( .A(n448), .B(n449), .Z(n122) );
  AND U523 ( .A(n450), .B(n451), .Z(n448) );
  XNOR U524 ( .A(n312), .B(n449), .Z(n451) );
  AND U525 ( .A(n452), .B(\min_dist_reg[6][2] ), .Z(n312) );
  NANDN U526 ( .A(n303), .B(n98), .Z(n452) );
  XNOR U527 ( .A(n453), .B(n449), .Z(n450) );
  XOR U528 ( .A(n454), .B(n455), .Z(n449) );
  NAND U529 ( .A(n456), .B(n457), .Z(n455) );
  XOR U530 ( .A(n454), .B(n315), .Z(n457) );
  XNOR U531 ( .A(\min_dist_reg[6][1] ), .B(n458), .Z(n315) );
  NAND U532 ( .A(n459), .B(n98), .Z(n458) );
  XNOR U533 ( .A(n460), .B(n305), .Z(n459) );
  XOR U534 ( .A(n446), .B(n454), .Z(n456) );
  IV U535 ( .A(\min_dist_reg[5][1] ), .Z(n446) );
  ANDN U536 ( .B(n318), .A(\min_dist_reg[5][0] ), .Z(n454) );
  IV U537 ( .A(\min_dist_reg[5][2] ), .Z(n453) );
  XOR U538 ( .A(\min_dist_reg[5][0] ), .B(n318), .Z(n319) );
  XNOR U539 ( .A(\min_dist_reg[6][0] ), .B(n461), .Z(n318) );
  NAND U540 ( .A(n310), .B(n98), .Z(n461) );
  XOR U541 ( .A(n462), .B(n463), .Z(n98) );
  AND U542 ( .A(n464), .B(n465), .Z(n462) );
  XOR U543 ( .A(n301), .B(n463), .Z(n465) );
  IV U544 ( .A(n303), .Z(n301) );
  XNOR U545 ( .A(\min_dist_reg[7][2] ), .B(n466), .Z(n303) );
  NAND U546 ( .A(n467), .B(n238), .Z(n466) );
  XOR U547 ( .A(\min_dist_reg[7][2] ), .B(n468), .Z(n467) );
  XNOR U548 ( .A(n469), .B(n463), .Z(n464) );
  XOR U549 ( .A(n470), .B(n471), .Z(n463) );
  NAND U550 ( .A(n472), .B(n473), .Z(n471) );
  XNOR U551 ( .A(n470), .B(n307), .Z(n473) );
  IV U552 ( .A(n305), .Z(n307) );
  XNOR U553 ( .A(\min_dist_reg[7][1] ), .B(n474), .Z(n305) );
  NAND U554 ( .A(n475), .B(n238), .Z(n474) );
  XNOR U555 ( .A(\min_dist_reg[7][1] ), .B(n476), .Z(n475) );
  XOR U556 ( .A(n460), .B(n470), .Z(n472) );
  IV U557 ( .A(\min_dist_reg[6][1] ), .Z(n460) );
  ANDN U558 ( .B(n309), .A(\min_dist_reg[6][0] ), .Z(n470) );
  IV U559 ( .A(\min_dist_reg[6][2] ), .Z(n469) );
  XOR U560 ( .A(\min_dist_reg[6][0] ), .B(n309), .Z(n310) );
  XOR U561 ( .A(n477), .B(n478), .Z(n309) );
  NAND U562 ( .A(n479), .B(n238), .Z(n478) );
  XOR U563 ( .A(n480), .B(n481), .Z(n238) );
  AND U564 ( .A(n482), .B(n483), .Z(n480) );
  XNOR U565 ( .A(n481), .B(n468), .Z(n483) );
  XNOR U566 ( .A(n484), .B(n485), .Z(n468) );
  ANDN U567 ( .B(n486), .A(n487), .Z(n484) );
  XOR U568 ( .A(n485), .B(n488), .Z(n486) );
  XOR U569 ( .A(\min_dist_reg[7][2] ), .B(n481), .Z(n482) );
  XOR U570 ( .A(n489), .B(n490), .Z(n481) );
  NAND U571 ( .A(n491), .B(n492), .Z(n490) );
  XNOR U572 ( .A(n489), .B(n476), .Z(n492) );
  XOR U573 ( .A(n493), .B(n488), .Z(n476) );
  XNOR U574 ( .A(n494), .B(n495), .Z(n488) );
  ANDN U575 ( .B(n496), .A(n497), .Z(n494) );
  XNOR U576 ( .A(n495), .B(n498), .Z(n496) );
  IV U577 ( .A(n487), .Z(n493) );
  XOR U578 ( .A(n499), .B(n500), .Z(n487) );
  XNOR U579 ( .A(n501), .B(n502), .Z(n500) );
  ANDN U580 ( .B(n503), .A(n504), .Z(n501) );
  XNOR U581 ( .A(n505), .B(n506), .Z(n503) );
  IV U582 ( .A(n502), .Z(n506) );
  IV U583 ( .A(n485), .Z(n499) );
  XNOR U584 ( .A(n507), .B(n508), .Z(n485) );
  ANDN U585 ( .B(n509), .A(n510), .Z(n507) );
  XNOR U586 ( .A(n508), .B(n511), .Z(n509) );
  XNOR U587 ( .A(\min_dist_reg[7][1] ), .B(n489), .Z(n491) );
  NOR U588 ( .A(\min_dist_reg[7][0] ), .B(n512), .Z(n489) );
  XOR U589 ( .A(n477), .B(n512), .Z(n479) );
  XOR U590 ( .A(n513), .B(n511), .Z(n512) );
  XOR U591 ( .A(n514), .B(n498), .Z(n511) );
  XNOR U592 ( .A(q[6]), .B(DB[6]), .Z(n498) );
  IV U593 ( .A(n497), .Z(n514) );
  XOR U594 ( .A(n495), .B(n515), .Z(n497) );
  XNOR U595 ( .A(q[5]), .B(DB[5]), .Z(n515) );
  XOR U596 ( .A(q[4]), .B(DB[4]), .Z(n495) );
  IV U597 ( .A(n510), .Z(n513) );
  XOR U598 ( .A(n516), .B(n517), .Z(n510) );
  XNOR U599 ( .A(n505), .B(n508), .Z(n517) );
  XOR U600 ( .A(q[0]), .B(DB[0]), .Z(n508) );
  XOR U601 ( .A(q[3]), .B(DB[3]), .Z(n505) );
  IV U602 ( .A(n504), .Z(n516) );
  XOR U603 ( .A(n502), .B(n518), .Z(n504) );
  XNOR U604 ( .A(q[2]), .B(DB[2]), .Z(n518) );
  XOR U605 ( .A(q[1]), .B(DB[1]), .Z(n502) );
  IV U606 ( .A(\min_dist_reg[7][0] ), .Z(n477) );
  IV U607 ( .A(\min_dist_reg[1][0] ), .Z(n404) );
endmodule

