
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
         \C3/DATA5_5 , \C3/DATA5_6 , \C3/DATA5_7 , n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, \C1/Z_0 , \U1/RSOP_16/C3/Z_7 ,
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
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851;

  DFF \stack_reg[0][0]  ( .D(n325), .CLK(clk), .RST(rst), .Q(o[0]) );
  DFF \stack_reg[1][0]  ( .D(n324), .CLK(clk), .RST(rst), .Q(\stack[1][0] ) );
  DFF \stack_reg[0][1]  ( .D(n323), .CLK(clk), .RST(rst), .Q(o[1]) );
  DFF \stack_reg[1][1]  ( .D(n322), .CLK(clk), .RST(rst), .Q(\stack[1][1] ) );
  DFF \stack_reg[2][1]  ( .D(n321), .CLK(clk), .RST(rst), .Q(\stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n320), .CLK(clk), .RST(rst), .Q(\stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n319), .CLK(clk), .RST(rst), .Q(\stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n318), .CLK(clk), .RST(rst), .Q(\stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n317), .CLK(clk), .RST(rst), .Q(\stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n316), .CLK(clk), .RST(rst), .Q(\stack[7][1] ) );
  DFF \stack_reg[0][2]  ( .D(n315), .CLK(clk), .RST(rst), .Q(o[2]) );
  DFF \stack_reg[1][2]  ( .D(n314), .CLK(clk), .RST(rst), .Q(\stack[1][2] ) );
  DFF \stack_reg[2][2]  ( .D(n313), .CLK(clk), .RST(rst), .Q(\stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n312), .CLK(clk), .RST(rst), .Q(\stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n311), .CLK(clk), .RST(rst), .Q(\stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n310), .CLK(clk), .RST(rst), .Q(\stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n309), .CLK(clk), .RST(rst), .Q(\stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n308), .CLK(clk), .RST(rst), .Q(\stack[7][2] ) );
  DFF \stack_reg[0][3]  ( .D(n307), .CLK(clk), .RST(rst), .Q(o[3]) );
  DFF \stack_reg[1][3]  ( .D(n306), .CLK(clk), .RST(rst), .Q(\stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n305), .CLK(clk), .RST(rst), .Q(\stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n304), .CLK(clk), .RST(rst), .Q(\stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n303), .CLK(clk), .RST(rst), .Q(\stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n302), .CLK(clk), .RST(rst), .Q(\stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n301), .CLK(clk), .RST(rst), .Q(\stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n300), .CLK(clk), .RST(rst), .Q(\stack[7][3] ) );
  DFF \stack_reg[0][4]  ( .D(n299), .CLK(clk), .RST(rst), .Q(o[4]) );
  DFF \stack_reg[1][4]  ( .D(n298), .CLK(clk), .RST(rst), .Q(\stack[1][4] ) );
  DFF \stack_reg[2][4]  ( .D(n297), .CLK(clk), .RST(rst), .Q(\stack[2][4] ) );
  DFF \stack_reg[3][4]  ( .D(n296), .CLK(clk), .RST(rst), .Q(\stack[3][4] ) );
  DFF \stack_reg[4][4]  ( .D(n295), .CLK(clk), .RST(rst), .Q(\stack[4][4] ) );
  DFF \stack_reg[5][4]  ( .D(n294), .CLK(clk), .RST(rst), .Q(\stack[5][4] ) );
  DFF \stack_reg[6][4]  ( .D(n293), .CLK(clk), .RST(rst), .Q(\stack[6][4] ) );
  DFF \stack_reg[7][4]  ( .D(n292), .CLK(clk), .RST(rst), .Q(\stack[7][4] ) );
  DFF \stack_reg[0][5]  ( .D(n291), .CLK(clk), .RST(rst), .Q(o[5]) );
  DFF \stack_reg[1][5]  ( .D(n290), .CLK(clk), .RST(rst), .Q(\stack[1][5] ) );
  DFF \stack_reg[2][5]  ( .D(n289), .CLK(clk), .RST(rst), .Q(\stack[2][5] ) );
  DFF \stack_reg[3][5]  ( .D(n288), .CLK(clk), .RST(rst), .Q(\stack[3][5] ) );
  DFF \stack_reg[4][5]  ( .D(n287), .CLK(clk), .RST(rst), .Q(\stack[4][5] ) );
  DFF \stack_reg[5][5]  ( .D(n286), .CLK(clk), .RST(rst), .Q(\stack[5][5] ) );
  DFF \stack_reg[6][5]  ( .D(n285), .CLK(clk), .RST(rst), .Q(\stack[6][5] ) );
  DFF \stack_reg[7][5]  ( .D(n284), .CLK(clk), .RST(rst), .Q(\stack[7][5] ) );
  DFF \stack_reg[0][6]  ( .D(n283), .CLK(clk), .RST(rst), .Q(o[6]) );
  DFF \stack_reg[1][6]  ( .D(n282), .CLK(clk), .RST(rst), .Q(\stack[1][6] ) );
  DFF \stack_reg[2][6]  ( .D(n281), .CLK(clk), .RST(rst), .Q(\stack[2][6] ) );
  DFF \stack_reg[3][6]  ( .D(n280), .CLK(clk), .RST(rst), .Q(\stack[3][6] ) );
  DFF \stack_reg[4][6]  ( .D(n279), .CLK(clk), .RST(rst), .Q(\stack[4][6] ) );
  DFF \stack_reg[5][6]  ( .D(n278), .CLK(clk), .RST(rst), .Q(\stack[5][6] ) );
  DFF \stack_reg[6][6]  ( .D(n277), .CLK(clk), .RST(rst), .Q(\stack[6][6] ) );
  DFF \stack_reg[7][6]  ( .D(n276), .CLK(clk), .RST(rst), .Q(\stack[7][6] ) );
  DFF \stack_reg[0][7]  ( .D(n275), .CLK(clk), .RST(rst), .Q(o[7]) );
  DFF \stack_reg[1][7]  ( .D(n274), .CLK(clk), .RST(rst), .Q(\stack[1][7] ) );
  DFF \stack_reg[2][7]  ( .D(n273), .CLK(clk), .RST(rst), .Q(\stack[2][7] ) );
  DFF \stack_reg[3][7]  ( .D(n272), .CLK(clk), .RST(rst), .Q(\stack[3][7] ) );
  DFF \stack_reg[4][7]  ( .D(n271), .CLK(clk), .RST(rst), .Q(\stack[4][7] ) );
  DFF \stack_reg[5][7]  ( .D(n270), .CLK(clk), .RST(rst), .Q(\stack[5][7] ) );
  DFF \stack_reg[6][7]  ( .D(n269), .CLK(clk), .RST(rst), .Q(\stack[6][7] ) );
  DFF \stack_reg[7][7]  ( .D(n268), .CLK(clk), .RST(rst), .Q(\stack[7][7] ) );
  DFF \stack_reg[2][0]  ( .D(n267), .CLK(clk), .RST(rst), .Q(\stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n266), .CLK(clk), .RST(rst), .Q(\stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n265), .CLK(clk), .RST(rst), .Q(\stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n264), .CLK(clk), .RST(rst), .Q(\stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n263), .CLK(clk), .RST(rst), .Q(\stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n262), .CLK(clk), .RST(rst), .Q(\stack[7][0] ) );
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
  NAND U379 ( .A(n558), .B(n556), .Z(n378) );
  XOR U380 ( .A(n558), .B(n556), .Z(n379) );
  NANDN U381 ( .A(n555), .B(n379), .Z(n380) );
  NAND U382 ( .A(n378), .B(n380), .Z(n561) );
  NAND U383 ( .A(n535), .B(n538), .Z(n381) );
  XOR U384 ( .A(n535), .B(n538), .Z(n382) );
  NAND U385 ( .A(n382), .B(n536), .Z(n383) );
  NAND U386 ( .A(n381), .B(n383), .Z(n544) );
  XOR U387 ( .A(n525), .B(n521), .Z(n384) );
  NANDN U388 ( .A(n523), .B(n384), .Z(n385) );
  NAND U389 ( .A(n525), .B(n521), .Z(n386) );
  AND U390 ( .A(n385), .B(n386), .Z(n504) );
  XOR U391 ( .A(n577), .B(n579), .Z(n387) );
  NAND U392 ( .A(n387), .B(n576), .Z(n388) );
  NAND U393 ( .A(n577), .B(n579), .Z(n389) );
  AND U394 ( .A(n388), .B(n389), .Z(n545) );
  XNOR U395 ( .A(n542), .B(n543), .Z(n390) );
  XNOR U396 ( .A(n544), .B(n390), .Z(n579) );
  NAND U397 ( .A(n564), .B(n562), .Z(n391) );
  XOR U398 ( .A(n564), .B(n562), .Z(n392) );
  NAND U399 ( .A(n392), .B(n561), .Z(n393) );
  NAND U400 ( .A(n391), .B(n393), .Z(n572) );
  XOR U401 ( .A(n569), .B(n570), .Z(n666) );
  AND U402 ( .A(n506), .B(n505), .Z(n394) );
  XNOR U403 ( .A(n512), .B(n511), .Z(n395) );
  XNOR U404 ( .A(n394), .B(n395), .Z(n396) );
  AND U405 ( .A(\stack[1][3] ), .B(o[4]), .Z(n397) );
  XNOR U406 ( .A(n498), .B(n497), .Z(n398) );
  XNOR U407 ( .A(n397), .B(n398), .Z(n399) );
  AND U408 ( .A(o[5]), .B(\stack[1][2] ), .Z(n400) );
  XNOR U409 ( .A(n396), .B(n399), .Z(n401) );
  XNOR U410 ( .A(n400), .B(n401), .Z(n402) );
  NANDN U411 ( .A(n513), .B(n515), .Z(n403) );
  XNOR U412 ( .A(n513), .B(n515), .Z(n404) );
  NAND U413 ( .A(n514), .B(n404), .Z(n405) );
  AND U414 ( .A(n403), .B(n405), .Z(n406) );
  XNOR U415 ( .A(n402), .B(n406), .Z(n407) );
  NAND U416 ( .A(n542), .B(n543), .Z(n408) );
  XOR U417 ( .A(n542), .B(n543), .Z(n409) );
  NAND U418 ( .A(n544), .B(n409), .Z(n410) );
  AND U419 ( .A(n408), .B(n410), .Z(n411) );
  XNOR U420 ( .A(n407), .B(n411), .Z(n546) );
  XOR U421 ( .A(n553), .B(n554), .Z(n748) );
  XNOR U422 ( .A(n526), .B(n527), .Z(n542) );
  XOR U423 ( .A(n528), .B(n529), .Z(n558) );
  XOR U424 ( .A(n572), .B(n573), .Z(n412) );
  XNOR U425 ( .A(n571), .B(n412), .Z(n665) );
  XOR U426 ( .A(n547), .B(n548), .Z(n787) );
  NOR U427 ( .A(opcode[1]), .B(n445), .Z(n833) );
  ANDN U428 ( .B(opcode[0]), .A(opcode[2]), .Z(n445) );
  NOR U429 ( .A(opcode[0]), .B(opcode[2]), .Z(n413) );
  NAND U430 ( .A(opcode[1]), .B(n413), .Z(n435) );
  NANDN U431 ( .A(opcode[1]), .B(n445), .Z(n414) );
  NAND U432 ( .A(n435), .B(n414), .Z(n430) );
  AND U433 ( .A(o[7]), .B(n430), .Z(\U1/RSOP_16/C2/Z_7 ) );
  AND U434 ( .A(o[6]), .B(n430), .Z(\U1/RSOP_16/C2/Z_6 ) );
  AND U435 ( .A(o[5]), .B(n430), .Z(\U1/RSOP_16/C2/Z_5 ) );
  AND U436 ( .A(o[4]), .B(n430), .Z(\U1/RSOP_16/C2/Z_4 ) );
  AND U437 ( .A(o[3]), .B(n430), .Z(\U1/RSOP_16/C2/Z_3 ) );
  AND U438 ( .A(o[2]), .B(n430), .Z(\U1/RSOP_16/C2/Z_2 ) );
  AND U439 ( .A(o[1]), .B(n430), .Z(\U1/RSOP_16/C2/Z_1 ) );
  AND U440 ( .A(o[0]), .B(n430), .Z(\U1/RSOP_16/C2/Z_0 ) );
  ANDN U441 ( .B(opcode[2]), .A(opcode[1]), .Z(n415) );
  AND U442 ( .A(opcode[0]), .B(n415), .Z(n433) );
  NAND U443 ( .A(n433), .B(o[7]), .Z(n417) );
  NAND U444 ( .A(\stack[1][7] ), .B(n430), .Z(n416) );
  NAND U445 ( .A(n417), .B(n416), .Z(\U1/RSOP_16/C3/Z_7 ) );
  NAND U446 ( .A(n433), .B(o[6]), .Z(n419) );
  NAND U447 ( .A(\stack[1][6] ), .B(n430), .Z(n418) );
  NAND U448 ( .A(n419), .B(n418), .Z(\U1/RSOP_16/C3/Z_6 ) );
  NAND U449 ( .A(n433), .B(o[5]), .Z(n421) );
  NAND U450 ( .A(\stack[1][5] ), .B(n430), .Z(n420) );
  NAND U451 ( .A(n421), .B(n420), .Z(\U1/RSOP_16/C3/Z_5 ) );
  NAND U452 ( .A(n433), .B(o[4]), .Z(n423) );
  NAND U453 ( .A(\stack[1][4] ), .B(n430), .Z(n422) );
  NAND U454 ( .A(n423), .B(n422), .Z(\U1/RSOP_16/C3/Z_4 ) );
  NAND U455 ( .A(n433), .B(o[3]), .Z(n425) );
  NAND U456 ( .A(\stack[1][3] ), .B(n430), .Z(n424) );
  NAND U457 ( .A(n425), .B(n424), .Z(\U1/RSOP_16/C3/Z_3 ) );
  NAND U458 ( .A(n433), .B(o[2]), .Z(n427) );
  NAND U459 ( .A(\stack[1][2] ), .B(n430), .Z(n426) );
  NAND U460 ( .A(n427), .B(n426), .Z(\U1/RSOP_16/C3/Z_2 ) );
  NAND U461 ( .A(n433), .B(o[1]), .Z(n429) );
  NAND U462 ( .A(\stack[1][1] ), .B(n430), .Z(n428) );
  NAND U463 ( .A(n429), .B(n428), .Z(\U1/RSOP_16/C3/Z_1 ) );
  NAND U464 ( .A(n433), .B(o[0]), .Z(n432) );
  NAND U465 ( .A(\stack[1][0] ), .B(n430), .Z(n431) );
  NAND U466 ( .A(n432), .B(n431), .Z(\U1/RSOP_16/C3/Z_0 ) );
  NANDN U467 ( .A(n433), .B(n435), .Z(\C1/Z_0 ) );
  NANDN U468 ( .A(opcode[1]), .B(opcode[0]), .Z(n434) );
  NAND U469 ( .A(n435), .B(n434), .Z(n443) );
  NAND U470 ( .A(\C3/DATA5_7 ), .B(n443), .Z(n436) );
  ANDN U471 ( .B(n436), .A(n595), .Z(n596) );
  NAND U472 ( .A(\C3/DATA5_6 ), .B(n443), .Z(n437) );
  ANDN U473 ( .B(n437), .A(n634), .Z(n635) );
  NAND U474 ( .A(\C3/DATA5_5 ), .B(n443), .Z(n438) );
  ANDN U475 ( .B(n438), .A(n672), .Z(n673) );
  NAND U476 ( .A(\C3/DATA5_4 ), .B(n443), .Z(n439) );
  ANDN U477 ( .B(n439), .A(n704), .Z(n705) );
  NAND U478 ( .A(\C3/DATA5_3 ), .B(n443), .Z(n440) );
  AND U479 ( .A(n743), .B(n440), .Z(n744) );
  NAND U480 ( .A(\C3/DATA5_2 ), .B(n443), .Z(n441) );
  AND U481 ( .A(n782), .B(n441), .Z(n783) );
  NAND U482 ( .A(\C3/DATA5_1 ), .B(n443), .Z(n442) );
  AND U483 ( .A(n830), .B(n442), .Z(n831) );
  NAND U484 ( .A(\C3/DATA5_0 ), .B(n443), .Z(n444) );
  AND U485 ( .A(n849), .B(n444), .Z(n850) );
  ANDN U486 ( .B(opcode[2]), .A(opcode[1]), .Z(n446) );
  ANDN U487 ( .B(n446), .A(opcode[0]), .Z(n839) );
  NAND U488 ( .A(\stack[6][0] ), .B(n839), .Z(n448) );
  NANDN U489 ( .A(n839), .B(\stack[7][0] ), .Z(n447) );
  NAND U490 ( .A(n448), .B(n447), .Z(n262) );
  NAND U491 ( .A(\stack[5][0] ), .B(n839), .Z(n450) );
  NANDN U492 ( .A(n833), .B(\stack[7][0] ), .Z(n449) );
  AND U493 ( .A(n450), .B(n449), .Z(n452) );
  ANDN U494 ( .B(n833), .A(n839), .Z(n836) );
  NAND U495 ( .A(n836), .B(\stack[6][0] ), .Z(n451) );
  NAND U496 ( .A(n452), .B(n451), .Z(n263) );
  NAND U497 ( .A(\stack[4][0] ), .B(n839), .Z(n454) );
  NANDN U498 ( .A(n833), .B(\stack[6][0] ), .Z(n453) );
  AND U499 ( .A(n454), .B(n453), .Z(n456) );
  NAND U500 ( .A(n836), .B(\stack[5][0] ), .Z(n455) );
  NAND U501 ( .A(n456), .B(n455), .Z(n264) );
  NAND U502 ( .A(\stack[3][0] ), .B(n839), .Z(n458) );
  NANDN U503 ( .A(n833), .B(\stack[5][0] ), .Z(n457) );
  AND U504 ( .A(n458), .B(n457), .Z(n460) );
  NAND U505 ( .A(n836), .B(\stack[4][0] ), .Z(n459) );
  NAND U506 ( .A(n460), .B(n459), .Z(n265) );
  NAND U507 ( .A(\stack[2][0] ), .B(n839), .Z(n462) );
  NANDN U508 ( .A(n833), .B(\stack[4][0] ), .Z(n461) );
  AND U509 ( .A(n462), .B(n461), .Z(n464) );
  NAND U510 ( .A(n836), .B(\stack[3][0] ), .Z(n463) );
  NAND U511 ( .A(n464), .B(n463), .Z(n266) );
  NAND U512 ( .A(n839), .B(\stack[1][0] ), .Z(n466) );
  NANDN U513 ( .A(n833), .B(\stack[3][0] ), .Z(n465) );
  AND U514 ( .A(n466), .B(n465), .Z(n468) );
  NAND U515 ( .A(n836), .B(\stack[2][0] ), .Z(n467) );
  NAND U516 ( .A(n468), .B(n467), .Z(n267) );
  NAND U517 ( .A(\stack[6][7] ), .B(n839), .Z(n470) );
  NANDN U518 ( .A(n839), .B(\stack[7][7] ), .Z(n469) );
  NAND U519 ( .A(n470), .B(n469), .Z(n268) );
  NAND U520 ( .A(\stack[5][7] ), .B(n839), .Z(n472) );
  NANDN U521 ( .A(n833), .B(\stack[7][7] ), .Z(n471) );
  AND U522 ( .A(n472), .B(n471), .Z(n474) );
  NAND U523 ( .A(n836), .B(\stack[6][7] ), .Z(n473) );
  NAND U524 ( .A(n474), .B(n473), .Z(n269) );
  NAND U525 ( .A(\stack[4][7] ), .B(n839), .Z(n476) );
  NANDN U526 ( .A(n833), .B(\stack[6][7] ), .Z(n475) );
  AND U527 ( .A(n476), .B(n475), .Z(n478) );
  NAND U528 ( .A(n836), .B(\stack[5][7] ), .Z(n477) );
  NAND U529 ( .A(n478), .B(n477), .Z(n270) );
  NAND U530 ( .A(\stack[3][7] ), .B(n839), .Z(n480) );
  NANDN U531 ( .A(n833), .B(\stack[5][7] ), .Z(n479) );
  AND U532 ( .A(n480), .B(n479), .Z(n482) );
  NAND U533 ( .A(n836), .B(\stack[4][7] ), .Z(n481) );
  NAND U534 ( .A(n482), .B(n481), .Z(n271) );
  NAND U535 ( .A(\stack[2][7] ), .B(n839), .Z(n484) );
  NANDN U536 ( .A(n833), .B(\stack[4][7] ), .Z(n483) );
  AND U537 ( .A(n484), .B(n483), .Z(n486) );
  NAND U538 ( .A(n836), .B(\stack[3][7] ), .Z(n485) );
  NAND U539 ( .A(n486), .B(n485), .Z(n272) );
  NAND U540 ( .A(n839), .B(\stack[1][7] ), .Z(n488) );
  NANDN U541 ( .A(n833), .B(\stack[3][7] ), .Z(n487) );
  AND U542 ( .A(n488), .B(n487), .Z(n490) );
  NAND U543 ( .A(n836), .B(\stack[2][7] ), .Z(n489) );
  NAND U544 ( .A(n490), .B(n489), .Z(n273) );
  NAND U545 ( .A(n839), .B(o[7]), .Z(n492) );
  NANDN U546 ( .A(n833), .B(\stack[2][7] ), .Z(n491) );
  AND U547 ( .A(n492), .B(n491), .Z(n494) );
  NAND U548 ( .A(\stack[1][7] ), .B(n836), .Z(n493) );
  NAND U549 ( .A(n494), .B(n493), .Z(n274) );
  AND U550 ( .A(n839), .B(x[7]), .Z(n590) );
  NAND U551 ( .A(n445), .B(opcode[1]), .Z(n843) );
  AND U552 ( .A(o[1]), .B(\stack[1][5] ), .Z(n500) );
  AND U553 ( .A(o[0]), .B(\stack[1][6] ), .Z(n499) );
  AND U554 ( .A(n500), .B(n499), .Z(n498) );
  AND U555 ( .A(\stack[1][6] ), .B(o[1]), .Z(n496) );
  NAND U556 ( .A(o[0]), .B(\stack[1][7] ), .Z(n495) );
  XNOR U557 ( .A(n496), .B(n495), .Z(n497) );
  NAND U558 ( .A(o[2]), .B(\stack[1][4] ), .Z(n513) );
  AND U559 ( .A(o[1]), .B(\stack[1][4] ), .Z(n503) );
  AND U560 ( .A(o[0]), .B(\stack[1][5] ), .Z(n502) );
  AND U561 ( .A(n503), .B(n502), .Z(n514) );
  XOR U562 ( .A(n500), .B(n499), .Z(n515) );
  XNOR U563 ( .A(n514), .B(n515), .Z(n501) );
  XNOR U564 ( .A(n513), .B(n501), .Z(n526) );
  NAND U565 ( .A(o[3]), .B(\stack[1][3] ), .Z(n740) );
  XNOR U566 ( .A(n503), .B(n502), .Z(n521) );
  NAND U567 ( .A(o[2]), .B(\stack[1][3] ), .Z(n525) );
  AND U568 ( .A(o[1]), .B(\stack[1][3] ), .Z(n517) );
  AND U569 ( .A(o[0]), .B(\stack[1][4] ), .Z(n516) );
  AND U570 ( .A(n517), .B(n516), .Z(n523) );
  XNOR U571 ( .A(n740), .B(n504), .Z(n527) );
  NAND U572 ( .A(n526), .B(n527), .Z(n506) );
  NANDN U573 ( .A(n504), .B(n740), .Z(n505) );
  AND U574 ( .A(\stack[1][4] ), .B(o[3]), .Z(n508) );
  NAND U575 ( .A(o[6]), .B(\stack[1][1] ), .Z(n507) );
  XNOR U576 ( .A(n508), .B(n507), .Z(n512) );
  AND U577 ( .A(\stack[1][5] ), .B(o[2]), .Z(n510) );
  NAND U578 ( .A(\stack[1][0] ), .B(o[7]), .Z(n509) );
  XNOR U579 ( .A(n510), .B(n509), .Z(n511) );
  AND U580 ( .A(o[2]), .B(\stack[1][2] ), .Z(n530) );
  IV U581 ( .A(n530), .Z(n779) );
  XNOR U582 ( .A(n517), .B(n516), .Z(n533) );
  NAND U583 ( .A(n779), .B(n533), .Z(n520) );
  AND U584 ( .A(o[0]), .B(\stack[1][3] ), .Z(n529) );
  AND U585 ( .A(o[1]), .B(\stack[1][2] ), .Z(n528) );
  AND U586 ( .A(n529), .B(n528), .Z(n531) );
  NOR U587 ( .A(n779), .B(n533), .Z(n518) );
  OR U588 ( .A(n531), .B(n518), .Z(n519) );
  AND U589 ( .A(n520), .B(n519), .Z(n536) );
  AND U590 ( .A(\stack[1][2] ), .B(o[3]), .Z(n535) );
  IV U591 ( .A(n521), .Z(n522) );
  XNOR U592 ( .A(n523), .B(n522), .Z(n524) );
  XOR U593 ( .A(n525), .B(n524), .Z(n538) );
  AND U594 ( .A(\stack[1][2] ), .B(o[4]), .Z(n543) );
  NAND U595 ( .A(\stack[1][1] ), .B(o[2]), .Z(n555) );
  AND U596 ( .A(o[0]), .B(\stack[1][2] ), .Z(n550) );
  AND U597 ( .A(o[1]), .B(\stack[1][1] ), .Z(n549) );
  AND U598 ( .A(n550), .B(n549), .Z(n556) );
  XNOR U599 ( .A(n531), .B(n530), .Z(n532) );
  XOR U600 ( .A(n533), .B(n532), .Z(n564) );
  AND U601 ( .A(\stack[1][1] ), .B(o[3]), .Z(n562) );
  AND U602 ( .A(\stack[1][1] ), .B(o[4]), .Z(n573) );
  IV U603 ( .A(n573), .Z(n534) );
  NANDN U604 ( .A(n572), .B(n534), .Z(n541) );
  AND U605 ( .A(n572), .B(n573), .Z(n539) );
  XNOR U606 ( .A(n536), .B(n535), .Z(n537) );
  XNOR U607 ( .A(n538), .B(n537), .Z(n571) );
  OR U608 ( .A(n539), .B(n571), .Z(n540) );
  AND U609 ( .A(n541), .B(n540), .Z(n576) );
  AND U610 ( .A(\stack[1][1] ), .B(o[5]), .Z(n577) );
  XNOR U611 ( .A(n546), .B(n545), .Z(n585) );
  AND U612 ( .A(\stack[1][0] ), .B(o[1]), .Z(n818) );
  AND U613 ( .A(o[0]), .B(\stack[1][1] ), .Z(n822) );
  NAND U614 ( .A(n818), .B(n822), .Z(n547) );
  NAND U615 ( .A(\stack[1][0] ), .B(o[2]), .Z(n548) );
  NAND U616 ( .A(n547), .B(n548), .Z(n552) );
  XNOR U617 ( .A(n550), .B(n549), .Z(n788) );
  NAND U618 ( .A(n787), .B(n788), .Z(n551) );
  NAND U619 ( .A(n552), .B(n551), .Z(n553) );
  NAND U620 ( .A(\stack[1][0] ), .B(o[3]), .Z(n554) );
  NAND U621 ( .A(n553), .B(n554), .Z(n560) );
  XOR U622 ( .A(n556), .B(n555), .Z(n557) );
  XOR U623 ( .A(n558), .B(n557), .Z(n749) );
  NAND U624 ( .A(n748), .B(n749), .Z(n559) );
  NAND U625 ( .A(n560), .B(n559), .Z(n567) );
  XNOR U626 ( .A(n562), .B(n561), .Z(n563) );
  XOR U627 ( .A(n564), .B(n563), .Z(n566) );
  XOR U628 ( .A(n567), .B(n566), .Z(n707) );
  NAND U629 ( .A(o[4]), .B(\stack[1][0] ), .Z(n565) );
  AND U630 ( .A(n707), .B(n565), .Z(n703) );
  NAND U631 ( .A(n567), .B(n566), .Z(n568) );
  NANDN U632 ( .A(n703), .B(n568), .Z(n569) );
  NAND U633 ( .A(\stack[1][0] ), .B(o[5]), .Z(n570) );
  NAND U634 ( .A(n569), .B(n570), .Z(n575) );
  NAND U635 ( .A(n666), .B(n665), .Z(n574) );
  NAND U636 ( .A(n575), .B(n574), .Z(n582) );
  XNOR U637 ( .A(n577), .B(n576), .Z(n578) );
  XOR U638 ( .A(n579), .B(n578), .Z(n581) );
  XOR U639 ( .A(n582), .B(n581), .Z(n626) );
  NAND U640 ( .A(o[6]), .B(\stack[1][0] ), .Z(n580) );
  AND U641 ( .A(n626), .B(n580), .Z(n633) );
  AND U642 ( .A(n582), .B(n581), .Z(n583) );
  OR U643 ( .A(n633), .B(n583), .Z(n584) );
  XNOR U644 ( .A(n585), .B(n584), .Z(n586) );
  NANDN U645 ( .A(n843), .B(n586), .Z(n588) );
  AND U646 ( .A(opcode[1]), .B(opcode[2]), .Z(n844) );
  AND U647 ( .A(opcode[0]), .B(n844), .Z(n846) );
  NAND U648 ( .A(n846), .B(\stack[1][7] ), .Z(n587) );
  AND U649 ( .A(n588), .B(n587), .Z(n589) );
  NANDN U650 ( .A(n590), .B(n589), .Z(n597) );
  XNOR U651 ( .A(opcode[2]), .B(opcode[0]), .Z(n592) );
  XNOR U652 ( .A(opcode[0]), .B(opcode[1]), .Z(n591) );
  NAND U653 ( .A(n592), .B(n591), .Z(n840) );
  NAND U654 ( .A(\stack[1][7] ), .B(n844), .Z(n593) );
  NAND U655 ( .A(n840), .B(n593), .Z(n594) );
  AND U656 ( .A(o[7]), .B(n594), .Z(n595) );
  NANDN U657 ( .A(n597), .B(n596), .Z(n275) );
  NAND U658 ( .A(\stack[6][6] ), .B(n839), .Z(n599) );
  NANDN U659 ( .A(n839), .B(\stack[7][6] ), .Z(n598) );
  NAND U660 ( .A(n599), .B(n598), .Z(n276) );
  NAND U661 ( .A(\stack[5][6] ), .B(n839), .Z(n601) );
  NANDN U662 ( .A(n833), .B(\stack[7][6] ), .Z(n600) );
  AND U663 ( .A(n601), .B(n600), .Z(n603) );
  NAND U664 ( .A(n836), .B(\stack[6][6] ), .Z(n602) );
  NAND U665 ( .A(n603), .B(n602), .Z(n277) );
  NAND U666 ( .A(\stack[4][6] ), .B(n839), .Z(n605) );
  NANDN U667 ( .A(n833), .B(\stack[6][6] ), .Z(n604) );
  AND U668 ( .A(n605), .B(n604), .Z(n607) );
  NAND U669 ( .A(n836), .B(\stack[5][6] ), .Z(n606) );
  NAND U670 ( .A(n607), .B(n606), .Z(n278) );
  NAND U671 ( .A(\stack[3][6] ), .B(n839), .Z(n609) );
  NANDN U672 ( .A(n833), .B(\stack[5][6] ), .Z(n608) );
  AND U673 ( .A(n609), .B(n608), .Z(n611) );
  NAND U674 ( .A(n836), .B(\stack[4][6] ), .Z(n610) );
  NAND U675 ( .A(n611), .B(n610), .Z(n279) );
  NAND U676 ( .A(\stack[2][6] ), .B(n839), .Z(n613) );
  NANDN U677 ( .A(n833), .B(\stack[4][6] ), .Z(n612) );
  AND U678 ( .A(n613), .B(n612), .Z(n615) );
  NAND U679 ( .A(n836), .B(\stack[3][6] ), .Z(n614) );
  NAND U680 ( .A(n615), .B(n614), .Z(n280) );
  NAND U681 ( .A(n839), .B(\stack[1][6] ), .Z(n617) );
  NANDN U682 ( .A(n833), .B(\stack[3][6] ), .Z(n616) );
  AND U683 ( .A(n617), .B(n616), .Z(n619) );
  NAND U684 ( .A(n836), .B(\stack[2][6] ), .Z(n618) );
  NAND U685 ( .A(n619), .B(n618), .Z(n281) );
  NAND U686 ( .A(n839), .B(o[6]), .Z(n621) );
  NANDN U687 ( .A(n833), .B(\stack[2][6] ), .Z(n620) );
  AND U688 ( .A(n621), .B(n620), .Z(n623) );
  NAND U689 ( .A(\stack[1][6] ), .B(n836), .Z(n622) );
  NAND U690 ( .A(n623), .B(n622), .Z(n282) );
  NAND U691 ( .A(x[6]), .B(n839), .Z(n625) );
  NAND U692 ( .A(\stack[1][6] ), .B(n846), .Z(n624) );
  NAND U693 ( .A(n625), .B(n624), .Z(n632) );
  NANDN U694 ( .A(n843), .B(\stack[1][0] ), .Z(n823) );
  OR U695 ( .A(n823), .B(n626), .Z(n628) );
  NAND U696 ( .A(\stack[1][6] ), .B(n844), .Z(n627) );
  AND U697 ( .A(n628), .B(n627), .Z(n629) );
  NAND U698 ( .A(n840), .B(n629), .Z(n630) );
  NAND U699 ( .A(o[6]), .B(n630), .Z(n631) );
  NANDN U700 ( .A(n632), .B(n631), .Z(n636) );
  ANDN U701 ( .B(n633), .A(n843), .Z(n634) );
  NANDN U702 ( .A(n636), .B(n635), .Z(n283) );
  NAND U703 ( .A(\stack[6][5] ), .B(n839), .Z(n638) );
  NANDN U704 ( .A(n839), .B(\stack[7][5] ), .Z(n637) );
  NAND U705 ( .A(n638), .B(n637), .Z(n284) );
  NAND U706 ( .A(\stack[5][5] ), .B(n839), .Z(n640) );
  NANDN U707 ( .A(n833), .B(\stack[7][5] ), .Z(n639) );
  AND U708 ( .A(n640), .B(n639), .Z(n642) );
  NAND U709 ( .A(n836), .B(\stack[6][5] ), .Z(n641) );
  NAND U710 ( .A(n642), .B(n641), .Z(n285) );
  NAND U711 ( .A(\stack[4][5] ), .B(n839), .Z(n644) );
  NANDN U712 ( .A(n833), .B(\stack[6][5] ), .Z(n643) );
  AND U713 ( .A(n644), .B(n643), .Z(n646) );
  NAND U714 ( .A(n836), .B(\stack[5][5] ), .Z(n645) );
  NAND U715 ( .A(n646), .B(n645), .Z(n286) );
  NAND U716 ( .A(\stack[3][5] ), .B(n839), .Z(n648) );
  NANDN U717 ( .A(n833), .B(\stack[5][5] ), .Z(n647) );
  AND U718 ( .A(n648), .B(n647), .Z(n650) );
  NAND U719 ( .A(n836), .B(\stack[4][5] ), .Z(n649) );
  NAND U720 ( .A(n650), .B(n649), .Z(n287) );
  NAND U721 ( .A(\stack[2][5] ), .B(n839), .Z(n652) );
  NANDN U722 ( .A(n833), .B(\stack[4][5] ), .Z(n651) );
  AND U723 ( .A(n652), .B(n651), .Z(n654) );
  NAND U724 ( .A(n836), .B(\stack[3][5] ), .Z(n653) );
  NAND U725 ( .A(n654), .B(n653), .Z(n288) );
  NAND U726 ( .A(n839), .B(\stack[1][5] ), .Z(n656) );
  NANDN U727 ( .A(n833), .B(\stack[3][5] ), .Z(n655) );
  AND U728 ( .A(n656), .B(n655), .Z(n658) );
  NAND U729 ( .A(n836), .B(\stack[2][5] ), .Z(n657) );
  NAND U730 ( .A(n658), .B(n657), .Z(n289) );
  NAND U731 ( .A(n839), .B(o[5]), .Z(n660) );
  NANDN U732 ( .A(n833), .B(\stack[2][5] ), .Z(n659) );
  AND U733 ( .A(n660), .B(n659), .Z(n662) );
  NAND U734 ( .A(\stack[1][5] ), .B(n836), .Z(n661) );
  NAND U735 ( .A(n662), .B(n661), .Z(n290) );
  NAND U736 ( .A(x[5]), .B(n839), .Z(n664) );
  NAND U737 ( .A(\stack[1][5] ), .B(n846), .Z(n663) );
  NAND U738 ( .A(n664), .B(n663), .Z(n669) );
  XNOR U739 ( .A(n666), .B(n665), .Z(n667) );
  NANDN U740 ( .A(n843), .B(n667), .Z(n668) );
  NANDN U741 ( .A(n669), .B(n668), .Z(n674) );
  NAND U742 ( .A(\stack[1][5] ), .B(n844), .Z(n670) );
  NAND U743 ( .A(n840), .B(n670), .Z(n671) );
  AND U744 ( .A(o[5]), .B(n671), .Z(n672) );
  NANDN U745 ( .A(n674), .B(n673), .Z(n291) );
  NAND U746 ( .A(\stack[6][4] ), .B(n839), .Z(n676) );
  NANDN U747 ( .A(n839), .B(\stack[7][4] ), .Z(n675) );
  NAND U748 ( .A(n676), .B(n675), .Z(n292) );
  NAND U749 ( .A(\stack[5][4] ), .B(n839), .Z(n678) );
  NANDN U750 ( .A(n833), .B(\stack[7][4] ), .Z(n677) );
  AND U751 ( .A(n678), .B(n677), .Z(n680) );
  NAND U752 ( .A(n836), .B(\stack[6][4] ), .Z(n679) );
  NAND U753 ( .A(n680), .B(n679), .Z(n293) );
  NAND U754 ( .A(\stack[4][4] ), .B(n839), .Z(n682) );
  NANDN U755 ( .A(n833), .B(\stack[6][4] ), .Z(n681) );
  AND U756 ( .A(n682), .B(n681), .Z(n684) );
  NAND U757 ( .A(n836), .B(\stack[5][4] ), .Z(n683) );
  NAND U758 ( .A(n684), .B(n683), .Z(n294) );
  NAND U759 ( .A(\stack[3][4] ), .B(n839), .Z(n686) );
  NANDN U760 ( .A(n833), .B(\stack[5][4] ), .Z(n685) );
  AND U761 ( .A(n686), .B(n685), .Z(n688) );
  NAND U762 ( .A(n836), .B(\stack[4][4] ), .Z(n687) );
  NAND U763 ( .A(n688), .B(n687), .Z(n295) );
  NAND U764 ( .A(\stack[2][4] ), .B(n839), .Z(n690) );
  NANDN U765 ( .A(n833), .B(\stack[4][4] ), .Z(n689) );
  AND U766 ( .A(n690), .B(n689), .Z(n692) );
  NAND U767 ( .A(n836), .B(\stack[3][4] ), .Z(n691) );
  NAND U768 ( .A(n692), .B(n691), .Z(n296) );
  NAND U769 ( .A(n839), .B(\stack[1][4] ), .Z(n694) );
  NANDN U770 ( .A(n833), .B(\stack[3][4] ), .Z(n693) );
  AND U771 ( .A(n694), .B(n693), .Z(n696) );
  NAND U772 ( .A(n836), .B(\stack[2][4] ), .Z(n695) );
  NAND U773 ( .A(n696), .B(n695), .Z(n297) );
  NAND U774 ( .A(n839), .B(o[4]), .Z(n698) );
  NANDN U775 ( .A(n833), .B(\stack[2][4] ), .Z(n697) );
  AND U776 ( .A(n698), .B(n697), .Z(n700) );
  NAND U777 ( .A(\stack[1][4] ), .B(n836), .Z(n699) );
  NAND U778 ( .A(n700), .B(n699), .Z(n298) );
  NAND U779 ( .A(x[4]), .B(n839), .Z(n702) );
  NAND U780 ( .A(\stack[1][4] ), .B(n846), .Z(n701) );
  NAND U781 ( .A(n702), .B(n701), .Z(n706) );
  ANDN U782 ( .B(n703), .A(n843), .Z(n704) );
  NANDN U783 ( .A(n706), .B(n705), .Z(n713) );
  OR U784 ( .A(n823), .B(n707), .Z(n709) );
  NAND U785 ( .A(\stack[1][4] ), .B(n844), .Z(n708) );
  AND U786 ( .A(n709), .B(n708), .Z(n710) );
  NAND U787 ( .A(n840), .B(n710), .Z(n711) );
  NAND U788 ( .A(o[4]), .B(n711), .Z(n712) );
  NANDN U789 ( .A(n713), .B(n712), .Z(n299) );
  NAND U790 ( .A(\stack[6][3] ), .B(n839), .Z(n715) );
  NANDN U791 ( .A(n839), .B(\stack[7][3] ), .Z(n714) );
  NAND U792 ( .A(n715), .B(n714), .Z(n300) );
  NAND U793 ( .A(\stack[5][3] ), .B(n839), .Z(n717) );
  NANDN U794 ( .A(n833), .B(\stack[7][3] ), .Z(n716) );
  AND U795 ( .A(n717), .B(n716), .Z(n719) );
  NAND U796 ( .A(n836), .B(\stack[6][3] ), .Z(n718) );
  NAND U797 ( .A(n719), .B(n718), .Z(n301) );
  NAND U798 ( .A(\stack[4][3] ), .B(n839), .Z(n721) );
  NANDN U799 ( .A(n833), .B(\stack[6][3] ), .Z(n720) );
  AND U800 ( .A(n721), .B(n720), .Z(n723) );
  NAND U801 ( .A(n836), .B(\stack[5][3] ), .Z(n722) );
  NAND U802 ( .A(n723), .B(n722), .Z(n302) );
  NAND U803 ( .A(\stack[3][3] ), .B(n839), .Z(n725) );
  NANDN U804 ( .A(n833), .B(\stack[5][3] ), .Z(n724) );
  AND U805 ( .A(n725), .B(n724), .Z(n727) );
  NAND U806 ( .A(n836), .B(\stack[4][3] ), .Z(n726) );
  NAND U807 ( .A(n727), .B(n726), .Z(n303) );
  NAND U808 ( .A(\stack[2][3] ), .B(n839), .Z(n729) );
  NANDN U809 ( .A(n833), .B(\stack[4][3] ), .Z(n728) );
  AND U810 ( .A(n729), .B(n728), .Z(n731) );
  NAND U811 ( .A(n836), .B(\stack[3][3] ), .Z(n730) );
  NAND U812 ( .A(n731), .B(n730), .Z(n304) );
  NAND U813 ( .A(n839), .B(\stack[1][3] ), .Z(n733) );
  NANDN U814 ( .A(n833), .B(\stack[3][3] ), .Z(n732) );
  AND U815 ( .A(n733), .B(n732), .Z(n735) );
  NAND U816 ( .A(n836), .B(\stack[2][3] ), .Z(n734) );
  NAND U817 ( .A(n735), .B(n734), .Z(n305) );
  NAND U818 ( .A(n839), .B(o[3]), .Z(n737) );
  NANDN U819 ( .A(n833), .B(\stack[2][3] ), .Z(n736) );
  AND U820 ( .A(n737), .B(n736), .Z(n739) );
  NAND U821 ( .A(\stack[1][3] ), .B(n836), .Z(n738) );
  NAND U822 ( .A(n739), .B(n738), .Z(n306) );
  NAND U823 ( .A(x[3]), .B(n839), .Z(n742) );
  NANDN U824 ( .A(n740), .B(n844), .Z(n741) );
  AND U825 ( .A(n742), .B(n741), .Z(n745) );
  NAND U826 ( .A(n846), .B(\stack[1][3] ), .Z(n743) );
  AND U827 ( .A(n745), .B(n744), .Z(n747) );
  NANDN U828 ( .A(n840), .B(o[3]), .Z(n746) );
  AND U829 ( .A(n747), .B(n746), .Z(n752) );
  XNOR U830 ( .A(n749), .B(n748), .Z(n750) );
  NANDN U831 ( .A(n843), .B(n750), .Z(n751) );
  NAND U832 ( .A(n752), .B(n751), .Z(n307) );
  NAND U833 ( .A(\stack[6][2] ), .B(n839), .Z(n754) );
  NANDN U834 ( .A(n839), .B(\stack[7][2] ), .Z(n753) );
  NAND U835 ( .A(n754), .B(n753), .Z(n308) );
  NAND U836 ( .A(\stack[5][2] ), .B(n839), .Z(n756) );
  NANDN U837 ( .A(n833), .B(\stack[7][2] ), .Z(n755) );
  AND U838 ( .A(n756), .B(n755), .Z(n758) );
  NAND U839 ( .A(n836), .B(\stack[6][2] ), .Z(n757) );
  NAND U840 ( .A(n758), .B(n757), .Z(n309) );
  NAND U841 ( .A(\stack[4][2] ), .B(n839), .Z(n760) );
  NANDN U842 ( .A(n833), .B(\stack[6][2] ), .Z(n759) );
  AND U843 ( .A(n760), .B(n759), .Z(n762) );
  NAND U844 ( .A(n836), .B(\stack[5][2] ), .Z(n761) );
  NAND U845 ( .A(n762), .B(n761), .Z(n310) );
  NAND U846 ( .A(\stack[3][2] ), .B(n839), .Z(n764) );
  NANDN U847 ( .A(n833), .B(\stack[5][2] ), .Z(n763) );
  AND U848 ( .A(n764), .B(n763), .Z(n766) );
  NAND U849 ( .A(n836), .B(\stack[4][2] ), .Z(n765) );
  NAND U850 ( .A(n766), .B(n765), .Z(n311) );
  NAND U851 ( .A(\stack[2][2] ), .B(n839), .Z(n768) );
  NANDN U852 ( .A(n833), .B(\stack[4][2] ), .Z(n767) );
  AND U853 ( .A(n768), .B(n767), .Z(n770) );
  NAND U854 ( .A(n836), .B(\stack[3][2] ), .Z(n769) );
  NAND U855 ( .A(n770), .B(n769), .Z(n312) );
  NAND U856 ( .A(n839), .B(\stack[1][2] ), .Z(n772) );
  NANDN U857 ( .A(n833), .B(\stack[3][2] ), .Z(n771) );
  AND U858 ( .A(n772), .B(n771), .Z(n774) );
  NAND U859 ( .A(n836), .B(\stack[2][2] ), .Z(n773) );
  NAND U860 ( .A(n774), .B(n773), .Z(n313) );
  NAND U861 ( .A(n839), .B(o[2]), .Z(n776) );
  NANDN U862 ( .A(n833), .B(\stack[2][2] ), .Z(n775) );
  AND U863 ( .A(n776), .B(n775), .Z(n778) );
  NAND U864 ( .A(\stack[1][2] ), .B(n836), .Z(n777) );
  NAND U865 ( .A(n778), .B(n777), .Z(n314) );
  NAND U866 ( .A(x[2]), .B(n839), .Z(n781) );
  NANDN U867 ( .A(n779), .B(n844), .Z(n780) );
  AND U868 ( .A(n781), .B(n780), .Z(n784) );
  NAND U869 ( .A(n846), .B(\stack[1][2] ), .Z(n782) );
  AND U870 ( .A(n784), .B(n783), .Z(n786) );
  NANDN U871 ( .A(n840), .B(o[2]), .Z(n785) );
  AND U872 ( .A(n786), .B(n785), .Z(n791) );
  XNOR U873 ( .A(n788), .B(n787), .Z(n789) );
  NANDN U874 ( .A(n843), .B(n789), .Z(n790) );
  NAND U875 ( .A(n791), .B(n790), .Z(n315) );
  NAND U876 ( .A(\stack[6][1] ), .B(n839), .Z(n793) );
  NANDN U877 ( .A(n839), .B(\stack[7][1] ), .Z(n792) );
  NAND U878 ( .A(n793), .B(n792), .Z(n316) );
  NAND U879 ( .A(\stack[5][1] ), .B(n839), .Z(n795) );
  NANDN U880 ( .A(n833), .B(\stack[7][1] ), .Z(n794) );
  AND U881 ( .A(n795), .B(n794), .Z(n797) );
  NAND U882 ( .A(n836), .B(\stack[6][1] ), .Z(n796) );
  NAND U883 ( .A(n797), .B(n796), .Z(n317) );
  NAND U884 ( .A(\stack[4][1] ), .B(n839), .Z(n799) );
  NANDN U885 ( .A(n833), .B(\stack[6][1] ), .Z(n798) );
  AND U886 ( .A(n799), .B(n798), .Z(n801) );
  NAND U887 ( .A(n836), .B(\stack[5][1] ), .Z(n800) );
  NAND U888 ( .A(n801), .B(n800), .Z(n318) );
  NAND U889 ( .A(\stack[3][1] ), .B(n839), .Z(n803) );
  NANDN U890 ( .A(n833), .B(\stack[5][1] ), .Z(n802) );
  AND U891 ( .A(n803), .B(n802), .Z(n805) );
  NAND U892 ( .A(n836), .B(\stack[4][1] ), .Z(n804) );
  NAND U893 ( .A(n805), .B(n804), .Z(n319) );
  NAND U894 ( .A(\stack[2][1] ), .B(n839), .Z(n807) );
  NANDN U895 ( .A(n833), .B(\stack[4][1] ), .Z(n806) );
  AND U896 ( .A(n807), .B(n806), .Z(n809) );
  NAND U897 ( .A(n836), .B(\stack[3][1] ), .Z(n808) );
  NAND U898 ( .A(n809), .B(n808), .Z(n320) );
  NAND U899 ( .A(n839), .B(\stack[1][1] ), .Z(n811) );
  NANDN U900 ( .A(n833), .B(\stack[3][1] ), .Z(n810) );
  AND U901 ( .A(n811), .B(n810), .Z(n813) );
  NAND U902 ( .A(n836), .B(\stack[2][1] ), .Z(n812) );
  NAND U903 ( .A(n813), .B(n812), .Z(n321) );
  NAND U904 ( .A(n839), .B(o[1]), .Z(n815) );
  NANDN U905 ( .A(n833), .B(\stack[2][1] ), .Z(n814) );
  AND U906 ( .A(n815), .B(n814), .Z(n817) );
  NAND U907 ( .A(\stack[1][1] ), .B(n836), .Z(n816) );
  NAND U908 ( .A(n817), .B(n816), .Z(n322) );
  NANDN U909 ( .A(n818), .B(n822), .Z(n819) );
  OR U910 ( .A(n843), .B(n819), .Z(n821) );
  NAND U911 ( .A(\stack[1][1] ), .B(n846), .Z(n820) );
  AND U912 ( .A(n821), .B(n820), .Z(n829) );
  OR U913 ( .A(n823), .B(n822), .Z(n825) );
  NAND U914 ( .A(\stack[1][1] ), .B(n844), .Z(n824) );
  AND U915 ( .A(n825), .B(n824), .Z(n826) );
  NAND U916 ( .A(n826), .B(n840), .Z(n827) );
  NAND U917 ( .A(o[1]), .B(n827), .Z(n828) );
  AND U918 ( .A(n829), .B(n828), .Z(n832) );
  NAND U919 ( .A(x[1]), .B(n839), .Z(n830) );
  NAND U920 ( .A(n832), .B(n831), .Z(n323) );
  NAND U921 ( .A(n839), .B(o[0]), .Z(n835) );
  NANDN U922 ( .A(n833), .B(\stack[2][0] ), .Z(n834) );
  AND U923 ( .A(n835), .B(n834), .Z(n838) );
  NAND U924 ( .A(\stack[1][0] ), .B(n836), .Z(n837) );
  NAND U925 ( .A(n838), .B(n837), .Z(n324) );
  NAND U926 ( .A(x[0]), .B(n839), .Z(n842) );
  NANDN U927 ( .A(n840), .B(o[0]), .Z(n841) );
  AND U928 ( .A(n842), .B(n841), .Z(n851) );
  NANDN U929 ( .A(n844), .B(n843), .Z(n845) );
  NAND U930 ( .A(o[0]), .B(n845), .Z(n847) );
  ANDN U931 ( .B(n847), .A(n846), .Z(n848) );
  NANDN U932 ( .A(n848), .B(\stack[1][0] ), .Z(n849) );
  NAND U933 ( .A(n851), .B(n850), .Z(n325) );
endmodule

