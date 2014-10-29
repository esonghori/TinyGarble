
module stackMachine_N8 ( clk, rst, x, opcode, o );
  input [7:0] x;
  input [2:0] opcode;
  output [7:0] o;
  input clk, rst;
  wire   \stack[7][7] , \stack[7][6] , \stack[7][5] , \stack[7][4] ,
         \stack[7][3] , \stack[7][2] , \stack[7][1] , \stack[7][0] ,
         \stack[6][7] , \stack[6][6] , \stack[6][5] , \stack[6][4] ,
         \stack[6][3] , \stack[6][2] , \stack[6][1] , \stack[6][0] ,
         \stack[5][7] , \stack[5][6] , \stack[5][5] , \stack[5][4] ,
         \stack[5][3] , \stack[5][2] , \stack[5][1] , \stack[5][0] ,
         \stack[4][7] , \stack[4][6] , \stack[4][5] , \stack[4][4] ,
         \stack[4][3] , \stack[4][2] , \stack[4][1] , \stack[4][0] ,
         \stack[3][7] , \stack[3][6] , \stack[3][5] , \stack[3][4] ,
         \stack[3][3] , \stack[3][2] , \stack[3][1] , \stack[3][0] ,
         \stack[2][7] , \stack[2][6] , \stack[2][5] , \stack[2][4] ,
         \stack[2][3] , \stack[2][2] , \stack[2][1] , \stack[2][0] ,
         \stack[1][7] , \stack[1][6] , \stack[1][5] , \stack[1][4] ,
         \stack[1][3] , \stack[1][2] , \stack[1][1] , \stack[1][0] ,
         \C3/DATA5_0 , \C3/DATA5_1 , \C3/DATA5_2 , \C3/DATA5_3 , \C3/DATA5_4 ,
         \C3/DATA5_5 , \C3/DATA5_6 , \C3/DATA5_7 , n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, \C1/Z_0 , \U1/RSOP_16/C3/Z_7 ,
         \U1/RSOP_16/C3/Z_6 , \U1/RSOP_16/C3/Z_5 , \U1/RSOP_16/C3/Z_4 ,
         \U1/RSOP_16/C3/Z_3 , \U1/RSOP_16/C3/Z_2 , \U1/RSOP_16/C3/Z_1 ,
         \U1/RSOP_16/C3/Z_0 , \U1/RSOP_16/C2/Z_7 , \U1/RSOP_16/C2/Z_6 ,
         \U1/RSOP_16/C2/Z_5 , \U1/RSOP_16/C2/Z_4 , \U1/RSOP_16/C2/Z_3 ,
         \U1/RSOP_16/C2/Z_2 , \U1/RSOP_16/C2/Z_1 , \U1/RSOP_16/C2/Z_0 ,
         \DP_OP_25_64_4784/n78 , \DP_OP_25_64_4784/n77 ,
         \DP_OP_25_64_4784/n76 , \DP_OP_25_64_4784/n75 ,
         \DP_OP_25_64_4784/n74 , \DP_OP_25_64_4784/n73 ,
         \DP_OP_25_64_4784/n72 , \DP_OP_25_64_4784/n71 ,
         \DP_OP_25_64_4784/n66 , \DP_OP_25_64_4784/n65 ,
         \DP_OP_25_64_4784/n64 , \DP_OP_25_64_4784/n63 ,
         \DP_OP_25_64_4784/n62 , \DP_OP_25_64_4784/n61 ,
         \DP_OP_25_64_4784/n60 , \DP_OP_25_64_4784/n59 ,
         \DP_OP_25_64_4784/n58 , \DP_OP_25_64_4784/n57 ,
         \DP_OP_25_64_4784/n56 , \DP_OP_25_64_4784/n55 ,
         \DP_OP_25_64_4784/n54 , \DP_OP_25_64_4784/n53 ,
         \DP_OP_25_64_4784/n52 , \DP_OP_25_64_4784/n50 ,
         \DP_OP_25_64_4784/n49 , \DP_OP_25_64_4784/n43 ,
         \DP_OP_25_64_4784/n42 , \DP_OP_25_64_4784/n36 ,
         \DP_OP_25_64_4784/n35 , \DP_OP_25_64_4784/n29 ,
         \DP_OP_25_64_4784/n28 , \DP_OP_25_64_4784/n22 ,
         \DP_OP_25_64_4784/n21 , \DP_OP_25_64_4784/n15 ,
         \DP_OP_25_64_4784/n14 , \DP_OP_25_64_4784/n8 , \DP_OP_25_64_4784/n5 ,
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
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859;

  DFF \stack_reg[0][0]  ( .D(n327), .CLK(clk), .RST(rst), .Q(o[0]) );
  DFF \stack_reg[1][0]  ( .D(n326), .CLK(clk), .RST(rst), .Q(\stack[1][0] ) );
  DFF \stack_reg[0][1]  ( .D(n325), .CLK(clk), .RST(rst), .Q(o[1]) );
  DFF \stack_reg[1][1]  ( .D(n324), .CLK(clk), .RST(rst), .Q(\stack[1][1] ) );
  DFF \stack_reg[2][1]  ( .D(n323), .CLK(clk), .RST(rst), .Q(\stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n322), .CLK(clk), .RST(rst), .Q(\stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n321), .CLK(clk), .RST(rst), .Q(\stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n320), .CLK(clk), .RST(rst), .Q(\stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n319), .CLK(clk), .RST(rst), .Q(\stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n318), .CLK(clk), .RST(rst), .Q(\stack[7][1] ) );
  DFF \stack_reg[0][2]  ( .D(n317), .CLK(clk), .RST(rst), .Q(o[2]) );
  DFF \stack_reg[1][2]  ( .D(n316), .CLK(clk), .RST(rst), .Q(\stack[1][2] ) );
  DFF \stack_reg[2][2]  ( .D(n315), .CLK(clk), .RST(rst), .Q(\stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n314), .CLK(clk), .RST(rst), .Q(\stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n313), .CLK(clk), .RST(rst), .Q(\stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n312), .CLK(clk), .RST(rst), .Q(\stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n311), .CLK(clk), .RST(rst), .Q(\stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n310), .CLK(clk), .RST(rst), .Q(\stack[7][2] ) );
  DFF \stack_reg[0][3]  ( .D(n309), .CLK(clk), .RST(rst), .Q(o[3]) );
  DFF \stack_reg[1][3]  ( .D(n308), .CLK(clk), .RST(rst), .Q(\stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n307), .CLK(clk), .RST(rst), .Q(\stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n306), .CLK(clk), .RST(rst), .Q(\stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n305), .CLK(clk), .RST(rst), .Q(\stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n304), .CLK(clk), .RST(rst), .Q(\stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n303), .CLK(clk), .RST(rst), .Q(\stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n302), .CLK(clk), .RST(rst), .Q(\stack[7][3] ) );
  DFF \stack_reg[0][4]  ( .D(n301), .CLK(clk), .RST(rst), .Q(o[4]) );
  DFF \stack_reg[1][4]  ( .D(n300), .CLK(clk), .RST(rst), .Q(\stack[1][4] ) );
  DFF \stack_reg[2][4]  ( .D(n299), .CLK(clk), .RST(rst), .Q(\stack[2][4] ) );
  DFF \stack_reg[3][4]  ( .D(n298), .CLK(clk), .RST(rst), .Q(\stack[3][4] ) );
  DFF \stack_reg[4][4]  ( .D(n297), .CLK(clk), .RST(rst), .Q(\stack[4][4] ) );
  DFF \stack_reg[5][4]  ( .D(n296), .CLK(clk), .RST(rst), .Q(\stack[5][4] ) );
  DFF \stack_reg[6][4]  ( .D(n295), .CLK(clk), .RST(rst), .Q(\stack[6][4] ) );
  DFF \stack_reg[7][4]  ( .D(n294), .CLK(clk), .RST(rst), .Q(\stack[7][4] ) );
  DFF \stack_reg[0][5]  ( .D(n293), .CLK(clk), .RST(rst), .Q(o[5]) );
  DFF \stack_reg[1][5]  ( .D(n292), .CLK(clk), .RST(rst), .Q(\stack[1][5] ) );
  DFF \stack_reg[2][5]  ( .D(n291), .CLK(clk), .RST(rst), .Q(\stack[2][5] ) );
  DFF \stack_reg[3][5]  ( .D(n290), .CLK(clk), .RST(rst), .Q(\stack[3][5] ) );
  DFF \stack_reg[4][5]  ( .D(n289), .CLK(clk), .RST(rst), .Q(\stack[4][5] ) );
  DFF \stack_reg[5][5]  ( .D(n288), .CLK(clk), .RST(rst), .Q(\stack[5][5] ) );
  DFF \stack_reg[6][5]  ( .D(n287), .CLK(clk), .RST(rst), .Q(\stack[6][5] ) );
  DFF \stack_reg[7][5]  ( .D(n286), .CLK(clk), .RST(rst), .Q(\stack[7][5] ) );
  DFF \stack_reg[0][6]  ( .D(n285), .CLK(clk), .RST(rst), .Q(o[6]) );
  DFF \stack_reg[1][6]  ( .D(n284), .CLK(clk), .RST(rst), .Q(\stack[1][6] ) );
  DFF \stack_reg[2][6]  ( .D(n283), .CLK(clk), .RST(rst), .Q(\stack[2][6] ) );
  DFF \stack_reg[3][6]  ( .D(n282), .CLK(clk), .RST(rst), .Q(\stack[3][6] ) );
  DFF \stack_reg[4][6]  ( .D(n281), .CLK(clk), .RST(rst), .Q(\stack[4][6] ) );
  DFF \stack_reg[5][6]  ( .D(n280), .CLK(clk), .RST(rst), .Q(\stack[5][6] ) );
  DFF \stack_reg[6][6]  ( .D(n279), .CLK(clk), .RST(rst), .Q(\stack[6][6] ) );
  DFF \stack_reg[7][6]  ( .D(n278), .CLK(clk), .RST(rst), .Q(\stack[7][6] ) );
  DFF \stack_reg[0][7]  ( .D(n277), .CLK(clk), .RST(rst), .Q(o[7]) );
  DFF \stack_reg[1][7]  ( .D(n276), .CLK(clk), .RST(rst), .Q(\stack[1][7] ) );
  DFF \stack_reg[2][7]  ( .D(n275), .CLK(clk), .RST(rst), .Q(\stack[2][7] ) );
  DFF \stack_reg[3][7]  ( .D(n274), .CLK(clk), .RST(rst), .Q(\stack[3][7] ) );
  DFF \stack_reg[4][7]  ( .D(n273), .CLK(clk), .RST(rst), .Q(\stack[4][7] ) );
  DFF \stack_reg[5][7]  ( .D(n272), .CLK(clk), .RST(rst), .Q(\stack[5][7] ) );
  DFF \stack_reg[6][7]  ( .D(n271), .CLK(clk), .RST(rst), .Q(\stack[6][7] ) );
  DFF \stack_reg[7][7]  ( .D(n270), .CLK(clk), .RST(rst), .Q(\stack[7][7] ) );
  DFF \stack_reg[2][0]  ( .D(n269), .CLK(clk), .RST(rst), .Q(\stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n268), .CLK(clk), .RST(rst), .Q(\stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n267), .CLK(clk), .RST(rst), .Q(\stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n266), .CLK(clk), .RST(rst), .Q(\stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n265), .CLK(clk), .RST(rst), .Q(\stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n264), .CLK(clk), .RST(rst), .Q(\stack[7][0] ) );
  XOR \DP_OP_25_64_4784/U47  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_0 ), .Z(
        \DP_OP_25_64_4784/n78 ) );
  XOR \DP_OP_25_64_4784/U46  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_1 ), .Z(
        \DP_OP_25_64_4784/n77 ) );
  XOR \DP_OP_25_64_4784/U45  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_2 ), .Z(
        \DP_OP_25_64_4784/n76 ) );
  XOR \DP_OP_25_64_4784/U44  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_3 ), .Z(
        \DP_OP_25_64_4784/n75 ) );
  XOR \DP_OP_25_64_4784/U43  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_4 ), .Z(
        \DP_OP_25_64_4784/n74 ) );
  XOR \DP_OP_25_64_4784/U42  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_5 ), .Z(
        \DP_OP_25_64_4784/n73 ) );
  XOR \DP_OP_25_64_4784/U41  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_6 ), .Z(
        \DP_OP_25_64_4784/n72 ) );
  XOR \DP_OP_25_64_4784/U40  ( .A(\C1/Z_0 ), .B(\U1/RSOP_16/C3/Z_7 ), .Z(
        \DP_OP_25_64_4784/n71 ) );
  XOR \DP_OP_25_64_4784/U37  ( .A(\U1/RSOP_16/C2/Z_0 ), .B(\C1/Z_0 ), .Z(
        \DP_OP_25_64_4784/n59 ) );
  XOR \DP_OP_25_64_4784/U30  ( .A(\DP_OP_25_64_4784/n59 ), .B(
        \DP_OP_25_64_4784/n78 ), .Z(\C3/DATA5_0 ) );
  XOR \DP_OP_25_64_4784/U29  ( .A(\DP_OP_25_64_4784/n77 ), .B(
        \U1/RSOP_16/C2/Z_1 ), .Z(\DP_OP_25_64_4784/n58 ) );
  XOR \DP_OP_25_64_4784/U28  ( .A(\DP_OP_25_64_4784/n66 ), .B(
        \DP_OP_25_64_4784/n58 ), .Z(\C3/DATA5_1 ) );
  XOR \DP_OP_25_64_4784/U27  ( .A(\DP_OP_25_64_4784/n76 ), .B(
        \U1/RSOP_16/C2/Z_2 ), .Z(\DP_OP_25_64_4784/n57 ) );
  XOR \DP_OP_25_64_4784/U20  ( .A(\DP_OP_25_64_4784/n65 ), .B(
        \DP_OP_25_64_4784/n57 ), .Z(\C3/DATA5_2 ) );
  XOR \DP_OP_25_64_4784/U19  ( .A(\DP_OP_25_64_4784/n75 ), .B(
        \U1/RSOP_16/C2/Z_3 ), .Z(\DP_OP_25_64_4784/n56 ) );
  XOR \DP_OP_25_64_4784/U18  ( .A(\DP_OP_25_64_4784/n64 ), .B(
        \DP_OP_25_64_4784/n56 ), .Z(\C3/DATA5_3 ) );
  XOR \DP_OP_25_64_4784/U17  ( .A(\DP_OP_25_64_4784/n74 ), .B(
        \U1/RSOP_16/C2/Z_4 ), .Z(\DP_OP_25_64_4784/n55 ) );
  XOR \DP_OP_25_64_4784/U10  ( .A(\DP_OP_25_64_4784/n63 ), .B(
        \DP_OP_25_64_4784/n55 ), .Z(\C3/DATA5_4 ) );
  XOR \DP_OP_25_64_4784/U9  ( .A(\DP_OP_25_64_4784/n73 ), .B(
        \U1/RSOP_16/C2/Z_5 ), .Z(\DP_OP_25_64_4784/n54 ) );
  XOR \DP_OP_25_64_4784/U8  ( .A(\DP_OP_25_64_4784/n62 ), .B(
        \DP_OP_25_64_4784/n54 ), .Z(\C3/DATA5_5 ) );
  XOR \DP_OP_25_64_4784/U7  ( .A(\DP_OP_25_64_4784/n72 ), .B(
        \U1/RSOP_16/C2/Z_6 ), .Z(\DP_OP_25_64_4784/n53 ) );
  XOR \DP_OP_25_64_4784/U6  ( .A(\DP_OP_25_64_4784/n61 ), .B(
        \DP_OP_25_64_4784/n53 ), .Z(\C3/DATA5_6 ) );
  XOR \DP_OP_25_64_4784/U5  ( .A(\DP_OP_25_64_4784/n71 ), .B(
        \U1/RSOP_16/C2/Z_7 ), .Z(\DP_OP_25_64_4784/n52 ) );
  XOR \DP_OP_25_64_4784/U4  ( .A(\DP_OP_25_64_4784/n60 ), .B(
        \DP_OP_25_64_4784/n52 ), .Z(\C3/DATA5_7 ) );
  NAND \DP_OP_25_64_4784/U16  ( .A(\DP_OP_25_64_4784/n72 ), .B(
        \U1/RSOP_16/C2/Z_6 ), .Z(\DP_OP_25_64_4784/n5 ) );
  NAND \DP_OP_25_64_4784/U26  ( .A(\DP_OP_25_64_4784/n61 ), .B(
        \DP_OP_25_64_4784/n53 ), .Z(\DP_OP_25_64_4784/n8 ) );
  NAND \DP_OP_25_64_4784/U36  ( .A(\DP_OP_25_64_4784/n5 ), .B(
        \DP_OP_25_64_4784/n8 ), .Z(\DP_OP_25_64_4784/n60 ) );
  NAND \DP_OP_25_64_4784/U15  ( .A(\DP_OP_25_64_4784/n73 ), .B(
        \U1/RSOP_16/C2/Z_5 ), .Z(\DP_OP_25_64_4784/n14 ) );
  NAND \DP_OP_25_64_4784/U25  ( .A(\DP_OP_25_64_4784/n62 ), .B(
        \DP_OP_25_64_4784/n54 ), .Z(\DP_OP_25_64_4784/n15 ) );
  NAND \DP_OP_25_64_4784/U35  ( .A(\DP_OP_25_64_4784/n14 ), .B(
        \DP_OP_25_64_4784/n15 ), .Z(\DP_OP_25_64_4784/n61 ) );
  NAND \DP_OP_25_64_4784/U14  ( .A(\DP_OP_25_64_4784/n74 ), .B(
        \U1/RSOP_16/C2/Z_4 ), .Z(\DP_OP_25_64_4784/n21 ) );
  NAND \DP_OP_25_64_4784/U24  ( .A(\DP_OP_25_64_4784/n63 ), .B(
        \DP_OP_25_64_4784/n55 ), .Z(\DP_OP_25_64_4784/n22 ) );
  NAND \DP_OP_25_64_4784/U34  ( .A(\DP_OP_25_64_4784/n21 ), .B(
        \DP_OP_25_64_4784/n22 ), .Z(\DP_OP_25_64_4784/n62 ) );
  NAND \DP_OP_25_64_4784/U13  ( .A(\DP_OP_25_64_4784/n75 ), .B(
        \U1/RSOP_16/C2/Z_3 ), .Z(\DP_OP_25_64_4784/n28 ) );
  NAND \DP_OP_25_64_4784/U23  ( .A(\DP_OP_25_64_4784/n64 ), .B(
        \DP_OP_25_64_4784/n56 ), .Z(\DP_OP_25_64_4784/n29 ) );
  NAND \DP_OP_25_64_4784/U33  ( .A(\DP_OP_25_64_4784/n28 ), .B(
        \DP_OP_25_64_4784/n29 ), .Z(\DP_OP_25_64_4784/n63 ) );
  NAND \DP_OP_25_64_4784/U12  ( .A(\DP_OP_25_64_4784/n76 ), .B(
        \U1/RSOP_16/C2/Z_2 ), .Z(\DP_OP_25_64_4784/n35 ) );
  NAND \DP_OP_25_64_4784/U22  ( .A(\DP_OP_25_64_4784/n65 ), .B(
        \DP_OP_25_64_4784/n57 ), .Z(\DP_OP_25_64_4784/n36 ) );
  NAND \DP_OP_25_64_4784/U32  ( .A(\DP_OP_25_64_4784/n35 ), .B(
        \DP_OP_25_64_4784/n36 ), .Z(\DP_OP_25_64_4784/n64 ) );
  NAND \DP_OP_25_64_4784/U11  ( .A(\DP_OP_25_64_4784/n77 ), .B(
        \U1/RSOP_16/C2/Z_1 ), .Z(\DP_OP_25_64_4784/n42 ) );
  NAND \DP_OP_25_64_4784/U21  ( .A(\DP_OP_25_64_4784/n66 ), .B(
        \DP_OP_25_64_4784/n58 ), .Z(\DP_OP_25_64_4784/n43 ) );
  NAND \DP_OP_25_64_4784/U31  ( .A(\DP_OP_25_64_4784/n42 ), .B(
        \DP_OP_25_64_4784/n43 ), .Z(\DP_OP_25_64_4784/n65 ) );
  NAND \DP_OP_25_64_4784/U1  ( .A(\U1/RSOP_16/C2/Z_0 ), .B(\C1/Z_0 ), .Z(
        \DP_OP_25_64_4784/n49 ) );
  NAND \DP_OP_25_64_4784/U2  ( .A(\DP_OP_25_64_4784/n59 ), .B(
        \DP_OP_25_64_4784/n78 ), .Z(\DP_OP_25_64_4784/n50 ) );
  NAND \DP_OP_25_64_4784/U3  ( .A(\DP_OP_25_64_4784/n49 ), .B(
        \DP_OP_25_64_4784/n50 ), .Z(\DP_OP_25_64_4784/n66 ) );
  XNOR U384 ( .A(n537), .B(n538), .Z(n522) );
  XOR U385 ( .A(n567), .B(n566), .Z(n562) );
  NAND U386 ( .A(opcode[1]), .B(opcode[0]), .Z(n586) );
  XNOR U387 ( .A(n522), .B(n523), .Z(n705) );
  IV U388 ( .A(opcode[0]), .Z(n415) );
  IV U389 ( .A(opcode[2]), .Z(n414) );
  NOR U390 ( .A(opcode[0]), .B(opcode[2]), .Z(n383) );
  NAND U391 ( .A(opcode[1]), .B(n383), .Z(n403) );
  ANDN U392 ( .B(opcode[0]), .A(opcode[1]), .Z(n404) );
  NANDN U393 ( .A(opcode[2]), .B(n404), .Z(n384) );
  NAND U394 ( .A(n403), .B(n384), .Z(n399) );
  AND U395 ( .A(o[7]), .B(n399), .Z(\U1/RSOP_16/C2/Z_7 ) );
  AND U396 ( .A(o[6]), .B(n399), .Z(\U1/RSOP_16/C2/Z_6 ) );
  AND U397 ( .A(o[5]), .B(n399), .Z(\U1/RSOP_16/C2/Z_5 ) );
  AND U398 ( .A(o[4]), .B(n399), .Z(\U1/RSOP_16/C2/Z_4 ) );
  AND U399 ( .A(o[3]), .B(n399), .Z(\U1/RSOP_16/C2/Z_3 ) );
  AND U400 ( .A(o[2]), .B(n399), .Z(\U1/RSOP_16/C2/Z_2 ) );
  AND U401 ( .A(o[1]), .B(n399), .Z(\U1/RSOP_16/C2/Z_1 ) );
  AND U402 ( .A(o[0]), .B(n399), .Z(\U1/RSOP_16/C2/Z_0 ) );
  AND U403 ( .A(n404), .B(opcode[2]), .Z(n402) );
  NAND U404 ( .A(n402), .B(o[7]), .Z(n386) );
  NAND U405 ( .A(\stack[1][7] ), .B(n399), .Z(n385) );
  NAND U406 ( .A(n386), .B(n385), .Z(\U1/RSOP_16/C3/Z_7 ) );
  NAND U407 ( .A(n402), .B(o[6]), .Z(n388) );
  NAND U408 ( .A(\stack[1][6] ), .B(n399), .Z(n387) );
  NAND U409 ( .A(n388), .B(n387), .Z(\U1/RSOP_16/C3/Z_6 ) );
  NAND U410 ( .A(n402), .B(o[5]), .Z(n390) );
  NAND U411 ( .A(\stack[1][5] ), .B(n399), .Z(n389) );
  NAND U412 ( .A(n390), .B(n389), .Z(\U1/RSOP_16/C3/Z_5 ) );
  NAND U413 ( .A(n402), .B(o[4]), .Z(n392) );
  NAND U414 ( .A(\stack[1][4] ), .B(n399), .Z(n391) );
  NAND U415 ( .A(n392), .B(n391), .Z(\U1/RSOP_16/C3/Z_4 ) );
  NAND U416 ( .A(n402), .B(o[3]), .Z(n394) );
  NAND U417 ( .A(\stack[1][3] ), .B(n399), .Z(n393) );
  NAND U418 ( .A(n394), .B(n393), .Z(\U1/RSOP_16/C3/Z_3 ) );
  NAND U419 ( .A(n402), .B(o[2]), .Z(n396) );
  NAND U420 ( .A(\stack[1][2] ), .B(n399), .Z(n395) );
  NAND U421 ( .A(n396), .B(n395), .Z(\U1/RSOP_16/C3/Z_2 ) );
  NAND U422 ( .A(n402), .B(o[1]), .Z(n398) );
  NAND U423 ( .A(\stack[1][1] ), .B(n399), .Z(n397) );
  NAND U424 ( .A(n398), .B(n397), .Z(\U1/RSOP_16/C3/Z_1 ) );
  NAND U425 ( .A(n402), .B(o[0]), .Z(n401) );
  NAND U426 ( .A(\stack[1][0] ), .B(n399), .Z(n400) );
  NAND U427 ( .A(n401), .B(n400), .Z(\U1/RSOP_16/C3/Z_0 ) );
  NANDN U428 ( .A(n402), .B(n403), .Z(\C1/Z_0 ) );
  NANDN U429 ( .A(n404), .B(n403), .Z(n412) );
  NAND U430 ( .A(\C3/DATA5_7 ), .B(n412), .Z(n405) );
  NAND U431 ( .A(n585), .B(n405), .Z(n590) );
  NAND U432 ( .A(\C3/DATA5_6 ), .B(n412), .Z(n406) );
  AND U433 ( .A(n624), .B(n406), .Z(n636) );
  NAND U434 ( .A(\C3/DATA5_5 ), .B(n412), .Z(n407) );
  ANDN U435 ( .B(n407), .A(n672), .Z(n673) );
  NAND U436 ( .A(\C3/DATA5_4 ), .B(n412), .Z(n408) );
  AND U437 ( .A(n702), .B(n408), .Z(n714) );
  NAND U438 ( .A(\C3/DATA5_3 ), .B(n412), .Z(n409) );
  AND U439 ( .A(n742), .B(n409), .Z(n747) );
  NAND U440 ( .A(\C3/DATA5_2 ), .B(n412), .Z(n410) );
  NAND U441 ( .A(n786), .B(n410), .Z(n787) );
  NAND U442 ( .A(\C3/DATA5_1 ), .B(n412), .Z(n411) );
  AND U443 ( .A(n835), .B(n411), .Z(n836) );
  NAND U444 ( .A(\C3/DATA5_0 ), .B(n412), .Z(n413) );
  AND U445 ( .A(n857), .B(n413), .Z(n858) );
  ANDN U446 ( .B(n415), .A(opcode[1]), .Z(n416) );
  ANDN U447 ( .B(n416), .A(n414), .Z(n838) );
  IV U448 ( .A(n838), .Z(n845) );
  NANDN U449 ( .A(n845), .B(\stack[6][0] ), .Z(n418) );
  NANDN U450 ( .A(n838), .B(\stack[7][0] ), .Z(n417) );
  NAND U451 ( .A(n418), .B(n417), .Z(n264) );
  NANDN U452 ( .A(n845), .B(\stack[5][0] ), .Z(n421) );
  NANDN U453 ( .A(n415), .B(n414), .Z(n419) );
  ANDN U454 ( .B(n419), .A(opcode[1]), .Z(n839) );
  NANDN U455 ( .A(n839), .B(\stack[7][0] ), .Z(n420) );
  AND U456 ( .A(n421), .B(n420), .Z(n424) );
  XOR U457 ( .A(n414), .B(opcode[0]), .Z(n422) );
  NANDN U458 ( .A(opcode[1]), .B(n422), .Z(n842) );
  NANDN U459 ( .A(n842), .B(\stack[6][0] ), .Z(n423) );
  NAND U460 ( .A(n424), .B(n423), .Z(n265) );
  NANDN U461 ( .A(n845), .B(\stack[4][0] ), .Z(n426) );
  NANDN U462 ( .A(n839), .B(\stack[6][0] ), .Z(n425) );
  AND U463 ( .A(n426), .B(n425), .Z(n428) );
  NANDN U464 ( .A(n842), .B(\stack[5][0] ), .Z(n427) );
  NAND U465 ( .A(n428), .B(n427), .Z(n266) );
  NANDN U466 ( .A(n845), .B(\stack[3][0] ), .Z(n430) );
  NANDN U467 ( .A(n839), .B(\stack[5][0] ), .Z(n429) );
  AND U468 ( .A(n430), .B(n429), .Z(n432) );
  NANDN U469 ( .A(n842), .B(\stack[4][0] ), .Z(n431) );
  NAND U470 ( .A(n432), .B(n431), .Z(n267) );
  NANDN U471 ( .A(n845), .B(\stack[2][0] ), .Z(n434) );
  NANDN U472 ( .A(n839), .B(\stack[4][0] ), .Z(n433) );
  AND U473 ( .A(n434), .B(n433), .Z(n436) );
  NANDN U474 ( .A(n842), .B(\stack[3][0] ), .Z(n435) );
  NAND U475 ( .A(n436), .B(n435), .Z(n268) );
  IV U476 ( .A(\stack[1][0] ), .Z(n855) );
  NANDN U477 ( .A(n855), .B(n838), .Z(n438) );
  NANDN U478 ( .A(n839), .B(\stack[3][0] ), .Z(n437) );
  AND U479 ( .A(n438), .B(n437), .Z(n440) );
  NANDN U480 ( .A(n842), .B(\stack[2][0] ), .Z(n439) );
  NAND U481 ( .A(n440), .B(n439), .Z(n269) );
  NANDN U482 ( .A(n845), .B(\stack[6][7] ), .Z(n442) );
  NANDN U483 ( .A(n838), .B(\stack[7][7] ), .Z(n441) );
  NAND U484 ( .A(n442), .B(n441), .Z(n270) );
  NANDN U485 ( .A(n845), .B(\stack[5][7] ), .Z(n444) );
  NANDN U486 ( .A(n839), .B(\stack[7][7] ), .Z(n443) );
  AND U487 ( .A(n444), .B(n443), .Z(n446) );
  NANDN U488 ( .A(n842), .B(\stack[6][7] ), .Z(n445) );
  NAND U489 ( .A(n446), .B(n445), .Z(n271) );
  NANDN U490 ( .A(n845), .B(\stack[4][7] ), .Z(n448) );
  NANDN U491 ( .A(n839), .B(\stack[6][7] ), .Z(n447) );
  AND U492 ( .A(n448), .B(n447), .Z(n450) );
  NANDN U493 ( .A(n842), .B(\stack[5][7] ), .Z(n449) );
  NAND U494 ( .A(n450), .B(n449), .Z(n272) );
  NANDN U495 ( .A(n845), .B(\stack[3][7] ), .Z(n452) );
  NANDN U496 ( .A(n839), .B(\stack[5][7] ), .Z(n451) );
  AND U497 ( .A(n452), .B(n451), .Z(n454) );
  NANDN U498 ( .A(n842), .B(\stack[4][7] ), .Z(n453) );
  NAND U499 ( .A(n454), .B(n453), .Z(n273) );
  NANDN U500 ( .A(n845), .B(\stack[2][7] ), .Z(n456) );
  NANDN U501 ( .A(n839), .B(\stack[4][7] ), .Z(n455) );
  AND U502 ( .A(n456), .B(n455), .Z(n458) );
  NANDN U503 ( .A(n842), .B(\stack[3][7] ), .Z(n457) );
  NAND U504 ( .A(n458), .B(n457), .Z(n274) );
  NANDN U505 ( .A(n845), .B(\stack[1][7] ), .Z(n460) );
  NANDN U506 ( .A(n839), .B(\stack[3][7] ), .Z(n459) );
  AND U507 ( .A(n460), .B(n459), .Z(n462) );
  NANDN U508 ( .A(n842), .B(\stack[2][7] ), .Z(n461) );
  NAND U509 ( .A(n462), .B(n461), .Z(n275) );
  NANDN U510 ( .A(n845), .B(o[7]), .Z(n464) );
  NANDN U511 ( .A(n839), .B(\stack[2][7] ), .Z(n463) );
  AND U512 ( .A(n464), .B(n463), .Z(n466) );
  NANDN U513 ( .A(n842), .B(\stack[1][7] ), .Z(n465) );
  NAND U514 ( .A(n466), .B(n465), .Z(n276) );
  NOR U515 ( .A(opcode[2]), .B(n586), .Z(n627) );
  IV U516 ( .A(n627), .Z(n849) );
  AND U517 ( .A(o[2]), .B(\stack[1][4] ), .Z(n480) );
  IV U518 ( .A(\stack[1][4] ), .Z(n706) );
  NANDN U519 ( .A(n706), .B(o[1]), .Z(n468) );
  IV U520 ( .A(o[0]), .Z(n852) );
  NANDN U521 ( .A(n852), .B(\stack[1][5] ), .Z(n467) );
  NOR U522 ( .A(n468), .B(n467), .Z(n479) );
  NAND U523 ( .A(o[1]), .B(\stack[1][5] ), .Z(n495) );
  NANDN U524 ( .A(n852), .B(\stack[1][6] ), .Z(n494) );
  XOR U525 ( .A(n495), .B(n494), .Z(n478) );
  XOR U526 ( .A(n479), .B(n478), .Z(n481) );
  XOR U527 ( .A(n480), .B(n481), .Z(n558) );
  AND U528 ( .A(o[3]), .B(\stack[1][3] ), .Z(n748) );
  XOR U529 ( .A(n468), .B(n467), .Z(n469) );
  AND U530 ( .A(\stack[1][4] ), .B(o[0]), .Z(n514) );
  IV U531 ( .A(\stack[1][3] ), .Z(n741) );
  NANDN U532 ( .A(n741), .B(o[1]), .Z(n515) );
  ANDN U533 ( .B(n514), .A(n515), .Z(n470) );
  OR U534 ( .A(n469), .B(n470), .Z(n472) );
  XNOR U535 ( .A(n470), .B(n469), .Z(n529) );
  AND U536 ( .A(o[2]), .B(\stack[1][3] ), .Z(n528) );
  OR U537 ( .A(n529), .B(n528), .Z(n471) );
  AND U538 ( .A(n472), .B(n471), .Z(n473) );
  XNOR U539 ( .A(n748), .B(n473), .Z(n557) );
  OR U540 ( .A(n558), .B(n557), .Z(n475) );
  OR U541 ( .A(n473), .B(n748), .Z(n474) );
  AND U542 ( .A(n475), .B(n474), .Z(n575) );
  AND U543 ( .A(o[6]), .B(\stack[1][1] ), .Z(n477) );
  NANDN U544 ( .A(n855), .B(o[7]), .Z(n476) );
  XNOR U545 ( .A(n477), .B(n476), .Z(n493) );
  NOR U546 ( .A(n479), .B(n478), .Z(n483) );
  ANDN U547 ( .B(n481), .A(n480), .Z(n482) );
  NOR U548 ( .A(n483), .B(n482), .Z(n491) );
  ANDN U549 ( .B(o[3]), .A(n706), .Z(n485) );
  ANDN U550 ( .B(o[4]), .A(n741), .Z(n484) );
  XNOR U551 ( .A(n485), .B(n484), .Z(n489) );
  IV U552 ( .A(o[2]), .Z(n789) );
  ANDN U553 ( .B(\stack[1][5] ), .A(n789), .Z(n487) );
  NANDN U554 ( .A(n852), .B(\stack[1][7] ), .Z(n486) );
  XNOR U555 ( .A(n487), .B(n486), .Z(n488) );
  XOR U556 ( .A(n489), .B(n488), .Z(n490) );
  XNOR U557 ( .A(n491), .B(n490), .Z(n492) );
  XOR U558 ( .A(n493), .B(n492), .Z(n501) );
  NOR U559 ( .A(n495), .B(n494), .Z(n499) );
  IV U560 ( .A(\stack[1][2] ), .Z(n785) );
  ANDN U561 ( .B(o[5]), .A(n785), .Z(n497) );
  NAND U562 ( .A(o[1]), .B(\stack[1][6] ), .Z(n496) );
  XNOR U563 ( .A(n497), .B(n496), .Z(n498) );
  XNOR U564 ( .A(n499), .B(n498), .Z(n500) );
  XNOR U565 ( .A(n501), .B(n500), .Z(n573) );
  AND U566 ( .A(o[5]), .B(\stack[1][0] ), .Z(n526) );
  AND U567 ( .A(\stack[1][0] ), .B(o[3]), .Z(n506) );
  AND U568 ( .A(\stack[1][1] ), .B(o[0]), .Z(n828) );
  ANDN U569 ( .B(o[1]), .A(n855), .Z(n823) );
  AND U570 ( .A(n828), .B(n823), .Z(n502) );
  AND U571 ( .A(\stack[1][0] ), .B(o[2]), .Z(n503) );
  OR U572 ( .A(n502), .B(n503), .Z(n505) );
  XNOR U573 ( .A(n503), .B(n502), .Z(n792) );
  NAND U574 ( .A(\stack[1][1] ), .B(o[1]), .Z(n509) );
  NANDN U575 ( .A(n852), .B(\stack[1][2] ), .Z(n508) );
  XOR U576 ( .A(n509), .B(n508), .Z(n793) );
  OR U577 ( .A(n792), .B(n793), .Z(n504) );
  AND U578 ( .A(n505), .B(n504), .Z(n507) );
  OR U579 ( .A(n506), .B(n507), .Z(n511) );
  XNOR U580 ( .A(n507), .B(n506), .Z(n743) );
  OR U581 ( .A(n509), .B(n508), .Z(n516) );
  AND U582 ( .A(\stack[1][1] ), .B(o[2]), .Z(n517) );
  XOR U583 ( .A(n516), .B(n517), .Z(n519) );
  NANDN U584 ( .A(n785), .B(o[1]), .Z(n513) );
  NANDN U585 ( .A(n741), .B(o[0]), .Z(n512) );
  XOR U586 ( .A(n513), .B(n512), .Z(n518) );
  XOR U587 ( .A(n519), .B(n518), .Z(n744) );
  NANDN U588 ( .A(n743), .B(n744), .Z(n510) );
  AND U589 ( .A(n511), .B(n510), .Z(n523) );
  AND U590 ( .A(\stack[1][2] ), .B(o[2]), .Z(n782) );
  OR U591 ( .A(n513), .B(n512), .Z(n530) );
  XOR U592 ( .A(n782), .B(n530), .Z(n532) );
  XNOR U593 ( .A(n515), .B(n514), .Z(n531) );
  XNOR U594 ( .A(n532), .B(n531), .Z(n538) );
  NANDN U595 ( .A(n517), .B(n516), .Z(n521) );
  OR U596 ( .A(n519), .B(n518), .Z(n520) );
  AND U597 ( .A(n521), .B(n520), .Z(n535) );
  AND U598 ( .A(\stack[1][1] ), .B(o[3]), .Z(n536) );
  XNOR U599 ( .A(n535), .B(n536), .Z(n537) );
  OR U600 ( .A(n523), .B(n522), .Z(n525) );
  NANDN U601 ( .A(n855), .B(o[4]), .Z(n524) );
  NANDN U602 ( .A(n705), .B(n524), .Z(n701) );
  NAND U603 ( .A(n525), .B(n701), .Z(n527) );
  NANDN U604 ( .A(n526), .B(n527), .Z(n543) );
  XOR U605 ( .A(n527), .B(n526), .Z(n665) );
  XNOR U606 ( .A(n529), .B(n528), .Z(n554) );
  NANDN U607 ( .A(n782), .B(n530), .Z(n534) );
  OR U608 ( .A(n532), .B(n531), .Z(n533) );
  AND U609 ( .A(n534), .B(n533), .Z(n551) );
  AND U610 ( .A(o[3]), .B(\stack[1][2] ), .Z(n552) );
  XNOR U611 ( .A(n551), .B(n552), .Z(n553) );
  XNOR U612 ( .A(n554), .B(n553), .Z(n544) );
  IV U613 ( .A(n544), .Z(n546) );
  OR U614 ( .A(n536), .B(n535), .Z(n540) );
  OR U615 ( .A(n538), .B(n537), .Z(n539) );
  NAND U616 ( .A(n540), .B(n539), .Z(n545) );
  NAND U617 ( .A(\stack[1][1] ), .B(o[4]), .Z(n547) );
  XNOR U618 ( .A(n545), .B(n547), .Z(n541) );
  XNOR U619 ( .A(n546), .B(n541), .Z(n666) );
  NANDN U620 ( .A(n665), .B(n666), .Z(n542) );
  AND U621 ( .A(n543), .B(n542), .Z(n561) );
  NANDN U622 ( .A(n544), .B(n545), .Z(n550) );
  NOR U623 ( .A(n546), .B(n545), .Z(n548) );
  NANDN U624 ( .A(n548), .B(n547), .Z(n549) );
  NAND U625 ( .A(n550), .B(n549), .Z(n565) );
  AND U626 ( .A(o[5]), .B(\stack[1][1] ), .Z(n564) );
  XOR U627 ( .A(n565), .B(n564), .Z(n566) );
  OR U628 ( .A(n552), .B(n551), .Z(n556) );
  OR U629 ( .A(n554), .B(n553), .Z(n555) );
  AND U630 ( .A(n556), .B(n555), .Z(n576) );
  NANDN U631 ( .A(n785), .B(o[4]), .Z(n579) );
  XNOR U632 ( .A(n558), .B(n557), .Z(n577) );
  XNOR U633 ( .A(n579), .B(n577), .Z(n559) );
  XOR U634 ( .A(n576), .B(n559), .Z(n567) );
  XOR U635 ( .A(n561), .B(n562), .Z(n628) );
  NANDN U636 ( .A(n855), .B(o[6]), .Z(n560) );
  NANDN U637 ( .A(n628), .B(n560), .Z(n623) );
  ANDN U638 ( .B(n562), .A(n561), .Z(n563) );
  ANDN U639 ( .B(n623), .A(n563), .Z(n571) );
  ANDN U640 ( .B(n565), .A(n564), .Z(n569) );
  NOR U641 ( .A(n567), .B(n566), .Z(n568) );
  OR U642 ( .A(n569), .B(n568), .Z(n570) );
  XNOR U643 ( .A(n571), .B(n570), .Z(n572) );
  XNOR U644 ( .A(n573), .B(n572), .Z(n574) );
  XOR U645 ( .A(n575), .B(n574), .Z(n583) );
  NAND U646 ( .A(n577), .B(n576), .Z(n581) );
  XOR U647 ( .A(n577), .B(n576), .Z(n578) );
  NANDN U648 ( .A(n579), .B(n578), .Z(n580) );
  NAND U649 ( .A(n581), .B(n580), .Z(n582) );
  XNOR U650 ( .A(n583), .B(n582), .Z(n584) );
  NANDN U651 ( .A(n849), .B(n584), .Z(n585) );
  NOR U652 ( .A(n414), .B(n586), .Z(n853) );
  NAND U653 ( .A(n853), .B(\stack[1][7] ), .Z(n588) );
  ANDN U654 ( .B(x[7]), .A(n845), .Z(n587) );
  ANDN U655 ( .B(n588), .A(n587), .Z(n589) );
  NANDN U656 ( .A(n590), .B(n589), .Z(n596) );
  ANDN U657 ( .B(opcode[1]), .A(n414), .Z(n850) );
  AND U658 ( .A(n850), .B(\stack[1][7] ), .Z(n593) );
  XOR U659 ( .A(n415), .B(opcode[2]), .Z(n592) );
  XOR U660 ( .A(n414), .B(opcode[1]), .Z(n591) );
  AND U661 ( .A(n592), .B(n591), .Z(n846) );
  OR U662 ( .A(n593), .B(n846), .Z(n594) );
  NAND U663 ( .A(n594), .B(o[7]), .Z(n595) );
  NANDN U664 ( .A(n596), .B(n595), .Z(n277) );
  NANDN U665 ( .A(n845), .B(\stack[6][6] ), .Z(n598) );
  NANDN U666 ( .A(n838), .B(\stack[7][6] ), .Z(n597) );
  NAND U667 ( .A(n598), .B(n597), .Z(n278) );
  NANDN U668 ( .A(n845), .B(\stack[5][6] ), .Z(n600) );
  NANDN U669 ( .A(n839), .B(\stack[7][6] ), .Z(n599) );
  AND U670 ( .A(n600), .B(n599), .Z(n602) );
  NANDN U671 ( .A(n842), .B(\stack[6][6] ), .Z(n601) );
  NAND U672 ( .A(n602), .B(n601), .Z(n279) );
  NANDN U673 ( .A(n845), .B(\stack[4][6] ), .Z(n604) );
  NANDN U674 ( .A(n839), .B(\stack[6][6] ), .Z(n603) );
  AND U675 ( .A(n604), .B(n603), .Z(n606) );
  NANDN U676 ( .A(n842), .B(\stack[5][6] ), .Z(n605) );
  NAND U677 ( .A(n606), .B(n605), .Z(n280) );
  NANDN U678 ( .A(n845), .B(\stack[3][6] ), .Z(n608) );
  NANDN U679 ( .A(n839), .B(\stack[5][6] ), .Z(n607) );
  AND U680 ( .A(n608), .B(n607), .Z(n610) );
  NANDN U681 ( .A(n842), .B(\stack[4][6] ), .Z(n609) );
  NAND U682 ( .A(n610), .B(n609), .Z(n281) );
  NANDN U683 ( .A(n845), .B(\stack[2][6] ), .Z(n612) );
  NANDN U684 ( .A(n839), .B(\stack[4][6] ), .Z(n611) );
  AND U685 ( .A(n612), .B(n611), .Z(n614) );
  NANDN U686 ( .A(n842), .B(\stack[3][6] ), .Z(n613) );
  NAND U687 ( .A(n614), .B(n613), .Z(n282) );
  NANDN U688 ( .A(n845), .B(\stack[1][6] ), .Z(n616) );
  NANDN U689 ( .A(n839), .B(\stack[3][6] ), .Z(n615) );
  AND U690 ( .A(n616), .B(n615), .Z(n618) );
  NANDN U691 ( .A(n842), .B(\stack[2][6] ), .Z(n617) );
  NAND U692 ( .A(n618), .B(n617), .Z(n283) );
  NANDN U693 ( .A(n845), .B(o[6]), .Z(n620) );
  NANDN U694 ( .A(n839), .B(\stack[2][6] ), .Z(n619) );
  AND U695 ( .A(n620), .B(n619), .Z(n622) );
  NANDN U696 ( .A(n842), .B(\stack[1][6] ), .Z(n621) );
  NAND U697 ( .A(n622), .B(n621), .Z(n284) );
  OR U698 ( .A(n623), .B(n849), .Z(n624) );
  NANDN U699 ( .A(n845), .B(x[6]), .Z(n626) );
  NAND U700 ( .A(n853), .B(\stack[1][6] ), .Z(n625) );
  AND U701 ( .A(n626), .B(n625), .Z(n634) );
  AND U702 ( .A(\stack[1][0] ), .B(n627), .Z(n827) );
  NAND U703 ( .A(n628), .B(n827), .Z(n630) );
  NAND U704 ( .A(n850), .B(\stack[1][6] ), .Z(n629) );
  AND U705 ( .A(n630), .B(n629), .Z(n631) );
  NANDN U706 ( .A(n846), .B(n631), .Z(n632) );
  NAND U707 ( .A(n632), .B(o[6]), .Z(n633) );
  AND U708 ( .A(n634), .B(n633), .Z(n635) );
  NAND U709 ( .A(n636), .B(n635), .Z(n285) );
  NANDN U710 ( .A(n845), .B(\stack[6][5] ), .Z(n638) );
  NANDN U711 ( .A(n838), .B(\stack[7][5] ), .Z(n637) );
  NAND U712 ( .A(n638), .B(n637), .Z(n286) );
  NANDN U713 ( .A(n845), .B(\stack[5][5] ), .Z(n640) );
  NANDN U714 ( .A(n839), .B(\stack[7][5] ), .Z(n639) );
  AND U715 ( .A(n640), .B(n639), .Z(n642) );
  NANDN U716 ( .A(n842), .B(\stack[6][5] ), .Z(n641) );
  NAND U717 ( .A(n642), .B(n641), .Z(n287) );
  NANDN U718 ( .A(n845), .B(\stack[4][5] ), .Z(n644) );
  NANDN U719 ( .A(n839), .B(\stack[6][5] ), .Z(n643) );
  AND U720 ( .A(n644), .B(n643), .Z(n646) );
  NANDN U721 ( .A(n842), .B(\stack[5][5] ), .Z(n645) );
  NAND U722 ( .A(n646), .B(n645), .Z(n288) );
  NANDN U723 ( .A(n845), .B(\stack[3][5] ), .Z(n648) );
  NANDN U724 ( .A(n839), .B(\stack[5][5] ), .Z(n647) );
  AND U725 ( .A(n648), .B(n647), .Z(n650) );
  NANDN U726 ( .A(n842), .B(\stack[4][5] ), .Z(n649) );
  NAND U727 ( .A(n650), .B(n649), .Z(n289) );
  NANDN U728 ( .A(n845), .B(\stack[2][5] ), .Z(n652) );
  NANDN U729 ( .A(n839), .B(\stack[4][5] ), .Z(n651) );
  AND U730 ( .A(n652), .B(n651), .Z(n654) );
  NANDN U731 ( .A(n842), .B(\stack[3][5] ), .Z(n653) );
  NAND U732 ( .A(n654), .B(n653), .Z(n290) );
  NANDN U733 ( .A(n845), .B(\stack[1][5] ), .Z(n656) );
  NANDN U734 ( .A(n839), .B(\stack[3][5] ), .Z(n655) );
  AND U735 ( .A(n656), .B(n655), .Z(n658) );
  NANDN U736 ( .A(n842), .B(\stack[2][5] ), .Z(n657) );
  NAND U737 ( .A(n658), .B(n657), .Z(n291) );
  NANDN U738 ( .A(n845), .B(o[5]), .Z(n660) );
  NANDN U739 ( .A(n839), .B(\stack[2][5] ), .Z(n659) );
  AND U740 ( .A(n660), .B(n659), .Z(n662) );
  NANDN U741 ( .A(n842), .B(\stack[1][5] ), .Z(n661) );
  NAND U742 ( .A(n662), .B(n661), .Z(n292) );
  NANDN U743 ( .A(n845), .B(x[5]), .Z(n664) );
  NAND U744 ( .A(n853), .B(\stack[1][5] ), .Z(n663) );
  NAND U745 ( .A(n664), .B(n663), .Z(n669) );
  XOR U746 ( .A(n666), .B(n665), .Z(n667) );
  NANDN U747 ( .A(n849), .B(n667), .Z(n668) );
  NANDN U748 ( .A(n669), .B(n668), .Z(n674) );
  NAND U749 ( .A(n850), .B(\stack[1][5] ), .Z(n670) );
  NANDN U750 ( .A(n846), .B(n670), .Z(n671) );
  AND U751 ( .A(o[5]), .B(n671), .Z(n672) );
  NANDN U752 ( .A(n674), .B(n673), .Z(n293) );
  NANDN U753 ( .A(n845), .B(\stack[6][4] ), .Z(n676) );
  NANDN U754 ( .A(n838), .B(\stack[7][4] ), .Z(n675) );
  NAND U755 ( .A(n676), .B(n675), .Z(n294) );
  NANDN U756 ( .A(n845), .B(\stack[5][4] ), .Z(n678) );
  NANDN U757 ( .A(n839), .B(\stack[7][4] ), .Z(n677) );
  AND U758 ( .A(n678), .B(n677), .Z(n680) );
  NANDN U759 ( .A(n842), .B(\stack[6][4] ), .Z(n679) );
  NAND U760 ( .A(n680), .B(n679), .Z(n295) );
  NANDN U761 ( .A(n845), .B(\stack[4][4] ), .Z(n682) );
  NANDN U762 ( .A(n839), .B(\stack[6][4] ), .Z(n681) );
  AND U763 ( .A(n682), .B(n681), .Z(n684) );
  NANDN U764 ( .A(n842), .B(\stack[5][4] ), .Z(n683) );
  NAND U765 ( .A(n684), .B(n683), .Z(n296) );
  NANDN U766 ( .A(n845), .B(\stack[3][4] ), .Z(n686) );
  NANDN U767 ( .A(n839), .B(\stack[5][4] ), .Z(n685) );
  AND U768 ( .A(n686), .B(n685), .Z(n688) );
  NANDN U769 ( .A(n842), .B(\stack[4][4] ), .Z(n687) );
  NAND U770 ( .A(n688), .B(n687), .Z(n297) );
  NANDN U771 ( .A(n845), .B(\stack[2][4] ), .Z(n690) );
  NANDN U772 ( .A(n839), .B(\stack[4][4] ), .Z(n689) );
  AND U773 ( .A(n690), .B(n689), .Z(n692) );
  NANDN U774 ( .A(n842), .B(\stack[3][4] ), .Z(n691) );
  NAND U775 ( .A(n692), .B(n691), .Z(n298) );
  NANDN U776 ( .A(n706), .B(n838), .Z(n694) );
  NANDN U777 ( .A(n839), .B(\stack[3][4] ), .Z(n693) );
  AND U778 ( .A(n694), .B(n693), .Z(n696) );
  NANDN U779 ( .A(n842), .B(\stack[2][4] ), .Z(n695) );
  NAND U780 ( .A(n696), .B(n695), .Z(n299) );
  NANDN U781 ( .A(n845), .B(o[4]), .Z(n698) );
  NANDN U782 ( .A(n839), .B(\stack[2][4] ), .Z(n697) );
  AND U783 ( .A(n698), .B(n697), .Z(n700) );
  OR U784 ( .A(n842), .B(n706), .Z(n699) );
  NAND U785 ( .A(n700), .B(n699), .Z(n300) );
  OR U786 ( .A(n701), .B(n849), .Z(n702) );
  NANDN U787 ( .A(n845), .B(x[4]), .Z(n704) );
  NANDN U788 ( .A(n706), .B(n853), .Z(n703) );
  AND U789 ( .A(n704), .B(n703), .Z(n712) );
  NAND U790 ( .A(n827), .B(n705), .Z(n708) );
  NANDN U791 ( .A(n706), .B(n850), .Z(n707) );
  AND U792 ( .A(n708), .B(n707), .Z(n709) );
  NANDN U793 ( .A(n846), .B(n709), .Z(n710) );
  NAND U794 ( .A(n710), .B(o[4]), .Z(n711) );
  AND U795 ( .A(n712), .B(n711), .Z(n713) );
  NAND U796 ( .A(n714), .B(n713), .Z(n301) );
  NANDN U797 ( .A(n845), .B(\stack[6][3] ), .Z(n716) );
  NANDN U798 ( .A(n838), .B(\stack[7][3] ), .Z(n715) );
  NAND U799 ( .A(n716), .B(n715), .Z(n302) );
  NANDN U800 ( .A(n845), .B(\stack[5][3] ), .Z(n718) );
  NANDN U801 ( .A(n839), .B(\stack[7][3] ), .Z(n717) );
  AND U802 ( .A(n718), .B(n717), .Z(n720) );
  NANDN U803 ( .A(n842), .B(\stack[6][3] ), .Z(n719) );
  NAND U804 ( .A(n720), .B(n719), .Z(n303) );
  NANDN U805 ( .A(n845), .B(\stack[4][3] ), .Z(n722) );
  NANDN U806 ( .A(n839), .B(\stack[6][3] ), .Z(n721) );
  AND U807 ( .A(n722), .B(n721), .Z(n724) );
  NANDN U808 ( .A(n842), .B(\stack[5][3] ), .Z(n723) );
  NAND U809 ( .A(n724), .B(n723), .Z(n304) );
  NANDN U810 ( .A(n845), .B(\stack[3][3] ), .Z(n726) );
  NANDN U811 ( .A(n839), .B(\stack[5][3] ), .Z(n725) );
  AND U812 ( .A(n726), .B(n725), .Z(n728) );
  NANDN U813 ( .A(n842), .B(\stack[4][3] ), .Z(n727) );
  NAND U814 ( .A(n728), .B(n727), .Z(n305) );
  NANDN U815 ( .A(n845), .B(\stack[2][3] ), .Z(n730) );
  NANDN U816 ( .A(n839), .B(\stack[4][3] ), .Z(n729) );
  AND U817 ( .A(n730), .B(n729), .Z(n732) );
  NANDN U818 ( .A(n842), .B(\stack[3][3] ), .Z(n731) );
  NAND U819 ( .A(n732), .B(n731), .Z(n306) );
  NANDN U820 ( .A(n741), .B(n838), .Z(n734) );
  NANDN U821 ( .A(n839), .B(\stack[3][3] ), .Z(n733) );
  AND U822 ( .A(n734), .B(n733), .Z(n736) );
  NANDN U823 ( .A(n842), .B(\stack[2][3] ), .Z(n735) );
  NAND U824 ( .A(n736), .B(n735), .Z(n307) );
  IV U825 ( .A(o[3]), .Z(n753) );
  NANDN U826 ( .A(n753), .B(n838), .Z(n738) );
  NANDN U827 ( .A(n839), .B(\stack[2][3] ), .Z(n737) );
  AND U828 ( .A(n738), .B(n737), .Z(n740) );
  OR U829 ( .A(n842), .B(n741), .Z(n739) );
  NAND U830 ( .A(n740), .B(n739), .Z(n308) );
  NANDN U831 ( .A(n741), .B(n853), .Z(n742) );
  XOR U832 ( .A(n744), .B(n743), .Z(n745) );
  NANDN U833 ( .A(n849), .B(n745), .Z(n746) );
  AND U834 ( .A(n747), .B(n746), .Z(n752) );
  NANDN U835 ( .A(n845), .B(x[3]), .Z(n750) );
  NAND U836 ( .A(n850), .B(n748), .Z(n749) );
  AND U837 ( .A(n750), .B(n749), .Z(n751) );
  AND U838 ( .A(n752), .B(n751), .Z(n755) );
  NANDN U839 ( .A(n753), .B(n846), .Z(n754) );
  NAND U840 ( .A(n755), .B(n754), .Z(n309) );
  NANDN U841 ( .A(n845), .B(\stack[6][2] ), .Z(n757) );
  NANDN U842 ( .A(n838), .B(\stack[7][2] ), .Z(n756) );
  NAND U843 ( .A(n757), .B(n756), .Z(n310) );
  NANDN U844 ( .A(n845), .B(\stack[5][2] ), .Z(n759) );
  NANDN U845 ( .A(n839), .B(\stack[7][2] ), .Z(n758) );
  AND U846 ( .A(n759), .B(n758), .Z(n761) );
  NANDN U847 ( .A(n842), .B(\stack[6][2] ), .Z(n760) );
  NAND U848 ( .A(n761), .B(n760), .Z(n311) );
  NANDN U849 ( .A(n845), .B(\stack[4][2] ), .Z(n763) );
  NANDN U850 ( .A(n839), .B(\stack[6][2] ), .Z(n762) );
  AND U851 ( .A(n763), .B(n762), .Z(n765) );
  NANDN U852 ( .A(n842), .B(\stack[5][2] ), .Z(n764) );
  NAND U853 ( .A(n765), .B(n764), .Z(n312) );
  NANDN U854 ( .A(n845), .B(\stack[3][2] ), .Z(n767) );
  NANDN U855 ( .A(n839), .B(\stack[5][2] ), .Z(n766) );
  AND U856 ( .A(n767), .B(n766), .Z(n769) );
  NANDN U857 ( .A(n842), .B(\stack[4][2] ), .Z(n768) );
  NAND U858 ( .A(n769), .B(n768), .Z(n313) );
  NANDN U859 ( .A(n845), .B(\stack[2][2] ), .Z(n771) );
  NANDN U860 ( .A(n839), .B(\stack[4][2] ), .Z(n770) );
  AND U861 ( .A(n771), .B(n770), .Z(n773) );
  NANDN U862 ( .A(n842), .B(\stack[3][2] ), .Z(n772) );
  NAND U863 ( .A(n773), .B(n772), .Z(n314) );
  NANDN U864 ( .A(n785), .B(n838), .Z(n775) );
  NANDN U865 ( .A(n839), .B(\stack[3][2] ), .Z(n774) );
  AND U866 ( .A(n775), .B(n774), .Z(n777) );
  NANDN U867 ( .A(n842), .B(\stack[2][2] ), .Z(n776) );
  NAND U868 ( .A(n777), .B(n776), .Z(n315) );
  NANDN U869 ( .A(n789), .B(n838), .Z(n779) );
  NANDN U870 ( .A(n839), .B(\stack[2][2] ), .Z(n778) );
  AND U871 ( .A(n779), .B(n778), .Z(n781) );
  OR U872 ( .A(n842), .B(n785), .Z(n780) );
  NAND U873 ( .A(n781), .B(n780), .Z(n316) );
  NANDN U874 ( .A(n845), .B(x[2]), .Z(n784) );
  NAND U875 ( .A(n850), .B(n782), .Z(n783) );
  NAND U876 ( .A(n784), .B(n783), .Z(n788) );
  NANDN U877 ( .A(n785), .B(n853), .Z(n786) );
  NOR U878 ( .A(n788), .B(n787), .Z(n791) );
  NANDN U879 ( .A(n789), .B(n846), .Z(n790) );
  NAND U880 ( .A(n791), .B(n790), .Z(n796) );
  XNOR U881 ( .A(n793), .B(n792), .Z(n794) );
  NANDN U882 ( .A(n849), .B(n794), .Z(n795) );
  NANDN U883 ( .A(n796), .B(n795), .Z(n317) );
  NANDN U884 ( .A(n845), .B(\stack[6][1] ), .Z(n798) );
  NANDN U885 ( .A(n838), .B(\stack[7][1] ), .Z(n797) );
  NAND U886 ( .A(n798), .B(n797), .Z(n318) );
  NANDN U887 ( .A(n845), .B(\stack[5][1] ), .Z(n800) );
  NANDN U888 ( .A(n839), .B(\stack[7][1] ), .Z(n799) );
  AND U889 ( .A(n800), .B(n799), .Z(n802) );
  NANDN U890 ( .A(n842), .B(\stack[6][1] ), .Z(n801) );
  NAND U891 ( .A(n802), .B(n801), .Z(n319) );
  NANDN U892 ( .A(n845), .B(\stack[4][1] ), .Z(n804) );
  NANDN U893 ( .A(n839), .B(\stack[6][1] ), .Z(n803) );
  AND U894 ( .A(n804), .B(n803), .Z(n806) );
  NANDN U895 ( .A(n842), .B(\stack[5][1] ), .Z(n805) );
  NAND U896 ( .A(n806), .B(n805), .Z(n320) );
  NANDN U897 ( .A(n845), .B(\stack[3][1] ), .Z(n808) );
  NANDN U898 ( .A(n839), .B(\stack[5][1] ), .Z(n807) );
  AND U899 ( .A(n808), .B(n807), .Z(n810) );
  NANDN U900 ( .A(n842), .B(\stack[4][1] ), .Z(n809) );
  NAND U901 ( .A(n810), .B(n809), .Z(n321) );
  NANDN U902 ( .A(n845), .B(\stack[2][1] ), .Z(n812) );
  NANDN U903 ( .A(n839), .B(\stack[4][1] ), .Z(n811) );
  AND U904 ( .A(n812), .B(n811), .Z(n814) );
  NANDN U905 ( .A(n842), .B(\stack[3][1] ), .Z(n813) );
  NAND U906 ( .A(n814), .B(n813), .Z(n322) );
  NANDN U907 ( .A(n845), .B(\stack[1][1] ), .Z(n816) );
  NANDN U908 ( .A(n839), .B(\stack[3][1] ), .Z(n815) );
  AND U909 ( .A(n816), .B(n815), .Z(n818) );
  NANDN U910 ( .A(n842), .B(\stack[2][1] ), .Z(n817) );
  NAND U911 ( .A(n818), .B(n817), .Z(n323) );
  NANDN U912 ( .A(n845), .B(o[1]), .Z(n820) );
  NANDN U913 ( .A(n839), .B(\stack[2][1] ), .Z(n819) );
  AND U914 ( .A(n820), .B(n819), .Z(n822) );
  NANDN U915 ( .A(n842), .B(\stack[1][1] ), .Z(n821) );
  NAND U916 ( .A(n822), .B(n821), .Z(n324) );
  ANDN U917 ( .B(n828), .A(n823), .Z(n824) );
  NANDN U918 ( .A(n849), .B(n824), .Z(n826) );
  NAND U919 ( .A(\stack[1][1] ), .B(n853), .Z(n825) );
  AND U920 ( .A(n826), .B(n825), .Z(n834) );
  NANDN U921 ( .A(n828), .B(n827), .Z(n830) );
  NAND U922 ( .A(\stack[1][1] ), .B(n850), .Z(n829) );
  AND U923 ( .A(n830), .B(n829), .Z(n831) );
  NANDN U924 ( .A(n846), .B(n831), .Z(n832) );
  NAND U925 ( .A(n832), .B(o[1]), .Z(n833) );
  AND U926 ( .A(n834), .B(n833), .Z(n837) );
  NANDN U927 ( .A(n845), .B(x[1]), .Z(n835) );
  NAND U928 ( .A(n837), .B(n836), .Z(n325) );
  NANDN U929 ( .A(n852), .B(n838), .Z(n841) );
  NANDN U930 ( .A(n839), .B(\stack[2][0] ), .Z(n840) );
  AND U931 ( .A(n841), .B(n840), .Z(n844) );
  OR U932 ( .A(n842), .B(n855), .Z(n843) );
  NAND U933 ( .A(n844), .B(n843), .Z(n326) );
  NANDN U934 ( .A(n845), .B(x[0]), .Z(n848) );
  NANDN U935 ( .A(n852), .B(n846), .Z(n847) );
  AND U936 ( .A(n848), .B(n847), .Z(n859) );
  NANDN U937 ( .A(n850), .B(n849), .Z(n851) );
  NANDN U938 ( .A(n852), .B(n851), .Z(n854) );
  ANDN U939 ( .B(n854), .A(n853), .Z(n856) );
  OR U940 ( .A(n856), .B(n855), .Z(n857) );
  NAND U941 ( .A(n859), .B(n858), .Z(n327) );
endmodule

