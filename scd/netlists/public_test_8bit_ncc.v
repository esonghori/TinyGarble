
module public_test ( clk, rst, p_init, g_init, e_init, p_input, g_input, 
        e_input, o );
  input [7:0] p_init;
  input [15:0] g_init;
  input [31:0] e_init;
  input [31:0] p_input;
  input [15:0] g_input;
  input [7:0] e_input;
  output [31:0] o;
  input clk, rst;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [7:0] reg_1;
  wire   [15:0] reg_2;
  wire   [31:0] reg_3;
  wire   [31:0] o3;
  assign o[31] = o3[31];
  assign o[30] = o3[30];
  assign o[29] = o3[29];
  assign o[28] = o3[28];
  assign o[27] = o3[27];
  assign o[26] = o3[26];
  assign o[25] = o3[25];
  assign o[24] = o3[24];
  assign o[23] = o3[23];
  assign o[22] = o3[22];
  assign o[21] = o3[21];
  assign o[20] = o3[20];
  assign o[19] = o3[19];
  assign o[18] = o3[18];
  assign o[17] = o3[17];
  assign o[16] = o3[16];

  DFF \reg_2_reg[15]  ( .D(N8), .CLK(clk), .RST(rst), .I(g_init[15]), .Q(
        reg_2[15]) );
  DFF \reg_2_reg[14]  ( .D(N9), .CLK(clk), .RST(rst), .I(g_init[14]), .Q(
        reg_2[14]) );
  DFF \reg_2_reg[13]  ( .D(N10), .CLK(clk), .RST(rst), .I(g_init[13]), .Q(
        reg_2[13]) );
  DFF \reg_2_reg[12]  ( .D(N11), .CLK(clk), .RST(rst), .I(g_init[12]), .Q(
        reg_2[12]) );
  DFF \reg_2_reg[11]  ( .D(N12), .CLK(clk), .RST(rst), .I(g_init[11]), .Q(
        reg_2[11]) );
  DFF \reg_2_reg[10]  ( .D(N13), .CLK(clk), .RST(rst), .I(g_init[10]), .Q(
        reg_2[10]) );
  DFF \reg_2_reg[9]  ( .D(N14), .CLK(clk), .RST(rst), .I(g_init[9]), .Q(
        reg_2[9]) );
  DFF \reg_2_reg[8]  ( .D(N15), .CLK(clk), .RST(rst), .I(g_init[8]), .Q(
        reg_2[8]) );
  DFF \reg_2_reg[7]  ( .D(N16), .CLK(clk), .RST(rst), .I(g_init[7]), .Q(
        reg_2[7]) );
  DFF \reg_2_reg[6]  ( .D(N17), .CLK(clk), .RST(rst), .I(g_init[6]), .Q(
        reg_2[6]) );
  DFF \reg_2_reg[5]  ( .D(N18), .CLK(clk), .RST(rst), .I(g_init[5]), .Q(
        reg_2[5]) );
  DFF \reg_2_reg[4]  ( .D(N19), .CLK(clk), .RST(rst), .I(g_init[4]), .Q(
        reg_2[4]) );
  DFF \reg_2_reg[3]  ( .D(N20), .CLK(clk), .RST(rst), .I(g_init[3]), .Q(
        reg_2[3]) );
  DFF \reg_2_reg[2]  ( .D(N21), .CLK(clk), .RST(rst), .I(g_init[2]), .Q(
        reg_2[2]) );
  DFF \reg_2_reg[1]  ( .D(N22), .CLK(clk), .RST(rst), .I(g_init[1]), .Q(
        reg_2[1]) );
  DFF \reg_2_reg[0]  ( .D(N23), .CLK(clk), .RST(rst), .I(g_init[0]), .Q(
        reg_2[0]) );
  DFF \reg_3_reg[31]  ( .D(o3[31]), .CLK(clk), .RST(rst), .I(e_init[31]), .Q(
        reg_3[31]) );
  DFF \reg_3_reg[30]  ( .D(o3[30]), .CLK(clk), .RST(rst), .I(e_init[30]), .Q(
        reg_3[30]) );
  DFF \reg_3_reg[29]  ( .D(o3[29]), .CLK(clk), .RST(rst), .I(e_init[29]), .Q(
        reg_3[29]) );
  DFF \reg_3_reg[28]  ( .D(o3[28]), .CLK(clk), .RST(rst), .I(e_init[28]), .Q(
        reg_3[28]) );
  DFF \reg_3_reg[27]  ( .D(o3[27]), .CLK(clk), .RST(rst), .I(e_init[27]), .Q(
        reg_3[27]) );
  DFF \reg_3_reg[26]  ( .D(o3[26]), .CLK(clk), .RST(rst), .I(e_init[26]), .Q(
        reg_3[26]) );
  DFF \reg_3_reg[25]  ( .D(o3[25]), .CLK(clk), .RST(rst), .I(e_init[25]), .Q(
        reg_3[25]) );
  DFF \reg_3_reg[24]  ( .D(o3[24]), .CLK(clk), .RST(rst), .I(e_init[24]), .Q(
        reg_3[24]) );
  DFF \reg_3_reg[23]  ( .D(o3[23]), .CLK(clk), .RST(rst), .I(e_init[23]), .Q(
        reg_3[23]) );
  DFF \reg_3_reg[22]  ( .D(o3[22]), .CLK(clk), .RST(rst), .I(e_init[22]), .Q(
        reg_3[22]) );
  DFF \reg_3_reg[21]  ( .D(o3[21]), .CLK(clk), .RST(rst), .I(e_init[21]), .Q(
        reg_3[21]) );
  DFF \reg_3_reg[20]  ( .D(o3[20]), .CLK(clk), .RST(rst), .I(e_init[20]), .Q(
        reg_3[20]) );
  DFF \reg_3_reg[19]  ( .D(o3[19]), .CLK(clk), .RST(rst), .I(e_init[19]), .Q(
        reg_3[19]) );
  DFF \reg_3_reg[18]  ( .D(o3[18]), .CLK(clk), .RST(rst), .I(e_init[18]), .Q(
        reg_3[18]) );
  DFF \reg_3_reg[17]  ( .D(o3[17]), .CLK(clk), .RST(rst), .I(e_init[17]), .Q(
        reg_3[17]) );
  DFF \reg_3_reg[16]  ( .D(o3[16]), .CLK(clk), .RST(rst), .I(e_init[16]), .Q(
        reg_3[16]) );
  DFF \reg_3_reg[15]  ( .D(N40), .CLK(clk), .RST(rst), .I(e_init[15]), .Q(
        reg_3[15]) );
  DFF \reg_3_reg[14]  ( .D(N41), .CLK(clk), .RST(rst), .I(e_init[14]), .Q(
        reg_3[14]) );
  DFF \reg_3_reg[13]  ( .D(N42), .CLK(clk), .RST(rst), .I(e_init[13]), .Q(
        reg_3[13]) );
  DFF \reg_3_reg[12]  ( .D(N43), .CLK(clk), .RST(rst), .I(e_init[12]), .Q(
        reg_3[12]) );
  DFF \reg_3_reg[11]  ( .D(N44), .CLK(clk), .RST(rst), .I(e_init[11]), .Q(
        reg_3[11]) );
  DFF \reg_3_reg[10]  ( .D(N45), .CLK(clk), .RST(rst), .I(e_init[10]), .Q(
        reg_3[10]) );
  DFF \reg_3_reg[9]  ( .D(N46), .CLK(clk), .RST(rst), .I(e_init[9]), .Q(
        reg_3[9]) );
  DFF \reg_3_reg[8]  ( .D(N47), .CLK(clk), .RST(rst), .I(e_init[8]), .Q(
        reg_3[8]) );
  DFF \reg_3_reg[7]  ( .D(N48), .CLK(clk), .RST(rst), .I(e_init[7]), .Q(
        reg_3[7]) );
  DFF \reg_3_reg[6]  ( .D(N49), .CLK(clk), .RST(rst), .I(e_init[6]), .Q(
        reg_3[6]) );
  DFF \reg_3_reg[5]  ( .D(N50), .CLK(clk), .RST(rst), .I(e_init[5]), .Q(
        reg_3[5]) );
  DFF \reg_3_reg[4]  ( .D(N51), .CLK(clk), .RST(rst), .I(e_init[4]), .Q(
        reg_3[4]) );
  DFF \reg_3_reg[3]  ( .D(N52), .CLK(clk), .RST(rst), .I(e_init[3]), .Q(
        reg_3[3]) );
  DFF \reg_3_reg[2]  ( .D(N53), .CLK(clk), .RST(rst), .I(e_init[2]), .Q(
        reg_3[2]) );
  DFF \reg_3_reg[1]  ( .D(N54), .CLK(clk), .RST(rst), .I(e_init[1]), .Q(
        reg_3[1]) );
  DFF \reg_3_reg[0]  ( .D(N55), .CLK(clk), .RST(rst), .I(e_init[0]), .Q(
        reg_3[0]) );
  DFF \reg_1_reg[7]  ( .D(N0), .CLK(clk), .RST(rst), .I(p_init[7]), .Q(
        reg_1[7]) );
  DFF \reg_1_reg[6]  ( .D(N1), .CLK(clk), .RST(rst), .I(p_init[6]), .Q(
        reg_1[6]) );
  DFF \reg_1_reg[5]  ( .D(N2), .CLK(clk), .RST(rst), .I(p_init[5]), .Q(
        reg_1[5]) );
  DFF \reg_1_reg[4]  ( .D(N3), .CLK(clk), .RST(rst), .I(p_init[4]), .Q(
        reg_1[4]) );
  DFF \reg_1_reg[3]  ( .D(N4), .CLK(clk), .RST(rst), .I(p_init[3]), .Q(
        reg_1[3]) );
  DFF \reg_1_reg[2]  ( .D(N5), .CLK(clk), .RST(rst), .I(p_init[2]), .Q(
        reg_1[2]) );
  DFF \reg_1_reg[1]  ( .D(N6), .CLK(clk), .RST(rst), .I(p_init[1]), .Q(
        reg_1[1]) );
  DFF \reg_1_reg[0]  ( .D(N7), .CLK(clk), .RST(rst), .I(p_init[0]), .Q(
        reg_1[0]) );
  XOR U59 ( .A(reg_2[15]), .B(reg_3[15]), .Z(n48) );
  XOR U60 ( .A(p_input[15]), .B(g_input[15]), .Z(n47) );
  XOR U61 ( .A(n48), .B(n47), .Z(o[15]) );
  XOR U62 ( .A(reg_2[14]), .B(reg_3[14]), .Z(n46) );
  XOR U63 ( .A(p_input[14]), .B(g_input[14]), .Z(n45) );
  XOR U64 ( .A(n46), .B(n45), .Z(o[14]) );
  XOR U65 ( .A(reg_2[13]), .B(reg_3[13]), .Z(n44) );
  XOR U66 ( .A(p_input[13]), .B(g_input[13]), .Z(n43) );
  XOR U67 ( .A(n44), .B(n43), .Z(o[13]) );
  XOR U68 ( .A(reg_2[12]), .B(reg_3[12]), .Z(n42) );
  XOR U69 ( .A(p_input[12]), .B(g_input[12]), .Z(n41) );
  XOR U70 ( .A(n42), .B(n41), .Z(o[12]) );
  XOR U71 ( .A(reg_2[11]), .B(reg_3[11]), .Z(n40) );
  XOR U72 ( .A(p_input[11]), .B(g_input[11]), .Z(n39) );
  XOR U73 ( .A(n40), .B(n39), .Z(o[11]) );
  XOR U74 ( .A(reg_2[10]), .B(reg_3[10]), .Z(n38) );
  XOR U75 ( .A(p_input[10]), .B(g_input[10]), .Z(n37) );
  XOR U76 ( .A(n38), .B(n37), .Z(o[10]) );
  XOR U77 ( .A(reg_2[9]), .B(reg_3[9]), .Z(n36) );
  XOR U78 ( .A(p_input[9]), .B(g_input[9]), .Z(n35) );
  XOR U79 ( .A(n36), .B(n35), .Z(o[9]) );
  XOR U80 ( .A(reg_2[8]), .B(reg_3[8]), .Z(n34) );
  XOR U81 ( .A(p_input[8]), .B(g_input[8]), .Z(n33) );
  XOR U82 ( .A(n34), .B(n33), .Z(o[8]) );
  XOR U83 ( .A(reg_2[7]), .B(reg_3[7]), .Z(n32) );
  XOR U84 ( .A(reg_1[7]), .B(p_input[7]), .Z(n31) );
  XOR U85 ( .A(g_input[7]), .B(e_input[7]), .Z(n30) );
  XOR U86 ( .A(n32), .B(n31), .Z(n29) );
  XOR U87 ( .A(n30), .B(n29), .Z(o[7]) );
  XOR U88 ( .A(reg_2[6]), .B(reg_3[6]), .Z(n28) );
  XOR U89 ( .A(reg_1[6]), .B(p_input[6]), .Z(n27) );
  XOR U90 ( .A(g_input[6]), .B(e_input[6]), .Z(n26) );
  XOR U91 ( .A(n28), .B(n27), .Z(n25) );
  XOR U92 ( .A(n26), .B(n25), .Z(o[6]) );
  XOR U93 ( .A(reg_2[5]), .B(reg_3[5]), .Z(n24) );
  XOR U94 ( .A(reg_1[5]), .B(p_input[5]), .Z(n23) );
  XOR U95 ( .A(g_input[5]), .B(e_input[5]), .Z(n22) );
  XOR U96 ( .A(n24), .B(n23), .Z(n21) );
  XOR U97 ( .A(n22), .B(n21), .Z(o[5]) );
  XOR U98 ( .A(reg_2[4]), .B(reg_3[4]), .Z(n20) );
  XOR U99 ( .A(reg_1[4]), .B(p_input[4]), .Z(n19) );
  XOR U100 ( .A(g_input[4]), .B(e_input[4]), .Z(n18) );
  XOR U101 ( .A(n20), .B(n19), .Z(n17) );
  XOR U102 ( .A(n18), .B(n17), .Z(o[4]) );
  XOR U103 ( .A(reg_2[3]), .B(reg_3[3]), .Z(n16) );
  XOR U104 ( .A(reg_1[3]), .B(p_input[3]), .Z(n15) );
  XOR U105 ( .A(g_input[3]), .B(e_input[3]), .Z(n14) );
  XOR U106 ( .A(n16), .B(n15), .Z(n13) );
  XOR U107 ( .A(n14), .B(n13), .Z(o[3]) );
  XOR U108 ( .A(reg_2[2]), .B(reg_3[2]), .Z(n12) );
  XOR U109 ( .A(reg_1[2]), .B(p_input[2]), .Z(n11) );
  XOR U110 ( .A(g_input[2]), .B(e_input[2]), .Z(n10) );
  XOR U111 ( .A(n12), .B(n11), .Z(n9) );
  XOR U112 ( .A(n10), .B(n9), .Z(o[2]) );
  XOR U113 ( .A(reg_2[1]), .B(reg_3[1]), .Z(n8) );
  XOR U114 ( .A(reg_1[1]), .B(p_input[1]), .Z(n7) );
  XOR U115 ( .A(g_input[1]), .B(e_input[1]), .Z(n6) );
  XOR U116 ( .A(n8), .B(n7), .Z(n5) );
  XOR U117 ( .A(n6), .B(n5), .Z(o[1]) );
  XOR U118 ( .A(reg_2[0]), .B(reg_3[0]), .Z(n4) );
  XOR U119 ( .A(reg_1[0]), .B(p_input[0]), .Z(n3) );
  XOR U120 ( .A(g_input[0]), .B(e_input[0]), .Z(n2) );
  XOR U121 ( .A(n4), .B(n3), .Z(n1) );
  XOR U122 ( .A(n2), .B(n1), .Z(o[0]) );
  XOR U123 ( .A(reg_3[31]), .B(p_input[31]), .Z(o3[31]) );
  XOR U124 ( .A(reg_3[30]), .B(p_input[30]), .Z(o3[30]) );
  XOR U125 ( .A(reg_3[29]), .B(p_input[29]), .Z(o3[29]) );
  XOR U126 ( .A(reg_3[28]), .B(p_input[28]), .Z(o3[28]) );
  XOR U127 ( .A(reg_3[27]), .B(p_input[27]), .Z(o3[27]) );
  XOR U128 ( .A(reg_3[26]), .B(p_input[26]), .Z(o3[26]) );
  XOR U129 ( .A(reg_3[25]), .B(p_input[25]), .Z(o3[25]) );
  XOR U130 ( .A(reg_3[24]), .B(p_input[24]), .Z(o3[24]) );
  XOR U131 ( .A(reg_3[23]), .B(p_input[23]), .Z(o3[23]) );
  XOR U132 ( .A(reg_3[22]), .B(p_input[22]), .Z(o3[22]) );
  XOR U133 ( .A(reg_3[21]), .B(p_input[21]), .Z(o3[21]) );
  XOR U134 ( .A(reg_3[20]), .B(p_input[20]), .Z(o3[20]) );
  XOR U135 ( .A(reg_3[19]), .B(p_input[19]), .Z(o3[19]) );
  XOR U136 ( .A(reg_3[18]), .B(p_input[18]), .Z(o3[18]) );
  XOR U137 ( .A(reg_3[17]), .B(p_input[17]), .Z(o3[17]) );
  XOR U138 ( .A(reg_3[16]), .B(p_input[16]), .Z(o3[16]) );
  XOR U139 ( .A(reg_2[14]), .B(g_input[14]), .Z(N9) );
  XOR U140 ( .A(reg_2[15]), .B(g_input[15]), .Z(N8) );
  XOR U141 ( .A(reg_1[0]), .B(e_input[0]), .Z(N7) );
  XOR U142 ( .A(reg_1[1]), .B(e_input[1]), .Z(N6) );
  XOR U143 ( .A(reg_3[0]), .B(p_input[0]), .Z(N55) );
  XOR U144 ( .A(reg_3[1]), .B(p_input[1]), .Z(N54) );
  XOR U145 ( .A(reg_3[2]), .B(p_input[2]), .Z(N53) );
  XOR U146 ( .A(reg_3[3]), .B(p_input[3]), .Z(N52) );
  XOR U147 ( .A(reg_3[4]), .B(p_input[4]), .Z(N51) );
  XOR U148 ( .A(reg_3[5]), .B(p_input[5]), .Z(N50) );
  XOR U149 ( .A(reg_1[2]), .B(e_input[2]), .Z(N5) );
  XOR U150 ( .A(reg_3[6]), .B(p_input[6]), .Z(N49) );
  XOR U151 ( .A(reg_3[7]), .B(p_input[7]), .Z(N48) );
  XOR U152 ( .A(reg_3[8]), .B(p_input[8]), .Z(N47) );
  XOR U153 ( .A(reg_3[9]), .B(p_input[9]), .Z(N46) );
  XOR U154 ( .A(reg_3[10]), .B(p_input[10]), .Z(N45) );
  XOR U155 ( .A(reg_3[11]), .B(p_input[11]), .Z(N44) );
  XOR U156 ( .A(reg_3[12]), .B(p_input[12]), .Z(N43) );
  XOR U157 ( .A(reg_3[13]), .B(p_input[13]), .Z(N42) );
  XOR U158 ( .A(reg_3[14]), .B(p_input[14]), .Z(N41) );
  XOR U159 ( .A(reg_3[15]), .B(p_input[15]), .Z(N40) );
  XOR U160 ( .A(reg_1[3]), .B(e_input[3]), .Z(N4) );
  XOR U161 ( .A(reg_1[4]), .B(e_input[4]), .Z(N3) );
  XOR U162 ( .A(reg_2[0]), .B(g_input[0]), .Z(N23) );
  XOR U163 ( .A(reg_2[1]), .B(g_input[1]), .Z(N22) );
  XOR U164 ( .A(reg_2[2]), .B(g_input[2]), .Z(N21) );
  XOR U165 ( .A(reg_2[3]), .B(g_input[3]), .Z(N20) );
  XOR U166 ( .A(reg_1[5]), .B(e_input[5]), .Z(N2) );
  XOR U167 ( .A(reg_2[4]), .B(g_input[4]), .Z(N19) );
  XOR U168 ( .A(reg_2[5]), .B(g_input[5]), .Z(N18) );
  XOR U169 ( .A(reg_2[6]), .B(g_input[6]), .Z(N17) );
  XOR U170 ( .A(reg_2[7]), .B(g_input[7]), .Z(N16) );
  XOR U171 ( .A(reg_2[8]), .B(g_input[8]), .Z(N15) );
  XOR U172 ( .A(reg_2[9]), .B(g_input[9]), .Z(N14) );
  XOR U173 ( .A(reg_2[10]), .B(g_input[10]), .Z(N13) );
  XOR U174 ( .A(reg_2[11]), .B(g_input[11]), .Z(N12) );
  XOR U175 ( .A(reg_2[12]), .B(g_input[12]), .Z(N11) );
  XOR U176 ( .A(reg_2[13]), .B(g_input[13]), .Z(N10) );
  XOR U177 ( .A(reg_1[6]), .B(e_input[6]), .Z(N1) );
  XOR U178 ( .A(reg_1[7]), .B(e_input[7]), .Z(N0) );
endmodule

