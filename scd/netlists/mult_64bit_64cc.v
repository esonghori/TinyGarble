
module mult_N64_CC64 ( clk, rst, g_input, e_input, o );
  input [63:0] g_input;
  input [0:0] e_input;
  output [127:0] o;
  input clk, rst;
  wire   \add_42/carry[127] , \add_42/carry[126] , \add_42/carry[125] ,
         \add_42/carry[124] , \add_42/carry[123] , \add_42/carry[122] ,
         \add_42/carry[121] , \add_42/carry[120] , \add_42/carry[119] ,
         \add_42/carry[118] , \add_42/carry[117] , \add_42/carry[116] ,
         \add_42/carry[115] , \add_42/carry[114] , \add_42/carry[113] ,
         \add_42/carry[112] , \add_42/carry[111] , \add_42/carry[110] ,
         \add_42/carry[109] , \add_42/carry[108] , \add_42/carry[107] ,
         \add_42/carry[106] , \add_42/carry[105] , \add_42/carry[104] ,
         \add_42/carry[103] , \add_42/carry[102] , \add_42/carry[101] ,
         \add_42/carry[100] , \add_42/carry[99] , \add_42/carry[98] ,
         \add_42/carry[97] , \add_42/carry[96] , \add_42/carry[95] ,
         \add_42/carry[94] , \add_42/carry[93] , \add_42/carry[92] ,
         \add_42/carry[91] , \add_42/carry[90] , \add_42/carry[89] ,
         \add_42/carry[88] , \add_42/carry[87] , \add_42/carry[86] ,
         \add_42/carry[85] , \add_42/carry[84] , \add_42/carry[83] ,
         \add_42/carry[82] , \add_42/carry[81] , \add_42/carry[80] ,
         \add_42/carry[79] , \add_42/carry[78] , \add_42/carry[77] ,
         \add_42/carry[76] , \add_42/carry[75] , \add_42/carry[74] ,
         \add_42/carry[73] , \add_42/carry[72] , \add_42/carry[71] ,
         \add_42/carry[70] , \add_42/carry[69] , \add_42/carry[68] ,
         \add_42/carry[67] , \add_42/carry[66] , \add_42/carry[65] ,
         \add_42/carry[64] , n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193;
  wire   [127:0] sreg;
  assign o[62] = sreg[62];
  assign o[61] = sreg[61];
  assign o[60] = sreg[60];
  assign o[59] = sreg[59];
  assign o[58] = sreg[58];
  assign o[57] = sreg[57];
  assign o[56] = sreg[56];
  assign o[55] = sreg[55];
  assign o[54] = sreg[54];
  assign o[53] = sreg[53];
  assign o[52] = sreg[52];
  assign o[51] = sreg[51];
  assign o[50] = sreg[50];
  assign o[49] = sreg[49];
  assign o[48] = sreg[48];
  assign o[47] = sreg[47];
  assign o[46] = sreg[46];
  assign o[45] = sreg[45];
  assign o[44] = sreg[44];
  assign o[43] = sreg[43];
  assign o[42] = sreg[42];
  assign o[41] = sreg[41];
  assign o[40] = sreg[40];
  assign o[39] = sreg[39];
  assign o[38] = sreg[38];
  assign o[37] = sreg[37];
  assign o[36] = sreg[36];
  assign o[35] = sreg[35];
  assign o[34] = sreg[34];
  assign o[33] = sreg[33];
  assign o[32] = sreg[32];
  assign o[31] = sreg[31];
  assign o[30] = sreg[30];
  assign o[29] = sreg[29];
  assign o[28] = sreg[28];
  assign o[27] = sreg[27];
  assign o[26] = sreg[26];
  assign o[25] = sreg[25];
  assign o[24] = sreg[24];
  assign o[23] = sreg[23];
  assign o[22] = sreg[22];
  assign o[21] = sreg[21];
  assign o[20] = sreg[20];
  assign o[19] = sreg[19];
  assign o[18] = sreg[18];
  assign o[17] = sreg[17];
  assign o[16] = sreg[16];
  assign o[15] = sreg[15];
  assign o[14] = sreg[14];
  assign o[13] = sreg[13];
  assign o[12] = sreg[12];
  assign o[11] = sreg[11];
  assign o[10] = sreg[10];
  assign o[9] = sreg[9];
  assign o[8] = sreg[8];
  assign o[7] = sreg[7];
  assign o[6] = sreg[6];
  assign o[5] = sreg[5];
  assign o[4] = sreg[4];
  assign o[3] = sreg[3];
  assign o[2] = sreg[2];
  assign o[1] = sreg[1];
  assign o[127] = \add_42/carry[127] ;

  DFF \sreg_reg[0]  ( .D(sreg[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[0]) );
  DFF \sreg_reg[1]  ( .D(sreg[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[1])
         );
  DFF \sreg_reg[2]  ( .D(sreg[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[2])
         );
  DFF \sreg_reg[3]  ( .D(sreg[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[3])
         );
  DFF \sreg_reg[4]  ( .D(sreg[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[4])
         );
  DFF \sreg_reg[5]  ( .D(sreg[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[5])
         );
  DFF \sreg_reg[6]  ( .D(sreg[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[6])
         );
  DFF \sreg_reg[7]  ( .D(sreg[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[7])
         );
  DFF \sreg_reg[8]  ( .D(sreg[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[8])
         );
  DFF \sreg_reg[9]  ( .D(sreg[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[9]) );
  DFF \sreg_reg[10]  ( .D(sreg[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[10]) );
  DFF \sreg_reg[11]  ( .D(sreg[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[11]) );
  DFF \sreg_reg[12]  ( .D(sreg[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[12]) );
  DFF \sreg_reg[13]  ( .D(sreg[14]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[13]) );
  DFF \sreg_reg[14]  ( .D(sreg[15]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[14]) );
  DFF \sreg_reg[15]  ( .D(sreg[16]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[15]) );
  DFF \sreg_reg[16]  ( .D(sreg[17]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[16]) );
  DFF \sreg_reg[17]  ( .D(sreg[18]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[17]) );
  DFF \sreg_reg[18]  ( .D(sreg[19]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[18]) );
  DFF \sreg_reg[19]  ( .D(sreg[20]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[19]) );
  DFF \sreg_reg[20]  ( .D(sreg[21]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[20]) );
  DFF \sreg_reg[21]  ( .D(sreg[22]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[21]) );
  DFF \sreg_reg[22]  ( .D(sreg[23]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[22]) );
  DFF \sreg_reg[23]  ( .D(sreg[24]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[23]) );
  DFF \sreg_reg[24]  ( .D(sreg[25]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[24]) );
  DFF \sreg_reg[25]  ( .D(sreg[26]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[25]) );
  DFF \sreg_reg[26]  ( .D(sreg[27]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[26]) );
  DFF \sreg_reg[27]  ( .D(sreg[28]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[27]) );
  DFF \sreg_reg[28]  ( .D(sreg[29]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[28]) );
  DFF \sreg_reg[29]  ( .D(sreg[30]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[29]) );
  DFF \sreg_reg[30]  ( .D(sreg[31]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[30]) );
  DFF \sreg_reg[31]  ( .D(sreg[32]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[31]) );
  DFF \sreg_reg[32]  ( .D(sreg[33]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[32]) );
  DFF \sreg_reg[33]  ( .D(sreg[34]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[33]) );
  DFF \sreg_reg[34]  ( .D(sreg[35]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[34]) );
  DFF \sreg_reg[35]  ( .D(sreg[36]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[35]) );
  DFF \sreg_reg[36]  ( .D(sreg[37]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[36]) );
  DFF \sreg_reg[37]  ( .D(sreg[38]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[37]) );
  DFF \sreg_reg[38]  ( .D(sreg[39]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[38]) );
  DFF \sreg_reg[39]  ( .D(sreg[40]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[39]) );
  DFF \sreg_reg[40]  ( .D(sreg[41]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[40]) );
  DFF \sreg_reg[41]  ( .D(sreg[42]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[41]) );
  DFF \sreg_reg[42]  ( .D(sreg[43]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[42]) );
  DFF \sreg_reg[43]  ( .D(sreg[44]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[43]) );
  DFF \sreg_reg[44]  ( .D(sreg[45]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[44]) );
  DFF \sreg_reg[45]  ( .D(sreg[46]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[45]) );
  DFF \sreg_reg[46]  ( .D(sreg[47]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[46]) );
  DFF \sreg_reg[47]  ( .D(sreg[48]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[47]) );
  DFF \sreg_reg[48]  ( .D(sreg[49]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[48]) );
  DFF \sreg_reg[49]  ( .D(sreg[50]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[49]) );
  DFF \sreg_reg[50]  ( .D(sreg[51]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[50]) );
  DFF \sreg_reg[51]  ( .D(sreg[52]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[51]) );
  DFF \sreg_reg[52]  ( .D(sreg[53]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[52]) );
  DFF \sreg_reg[53]  ( .D(sreg[54]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[53]) );
  DFF \sreg_reg[54]  ( .D(sreg[55]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[54]) );
  DFF \sreg_reg[55]  ( .D(sreg[56]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[55]) );
  DFF \sreg_reg[56]  ( .D(sreg[57]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[56]) );
  DFF \sreg_reg[57]  ( .D(sreg[58]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[57]) );
  DFF \sreg_reg[58]  ( .D(sreg[59]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[58]) );
  DFF \sreg_reg[59]  ( .D(sreg[60]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[59]) );
  DFF \sreg_reg[60]  ( .D(sreg[61]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[60]) );
  DFF \sreg_reg[61]  ( .D(sreg[62]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[61]) );
  DFF \sreg_reg[62]  ( .D(o[63]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[62])
         );
  DFF \sreg_reg[63]  ( .D(o[64]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[63])
         );
  DFF \sreg_reg[64]  ( .D(o[65]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[64])
         );
  DFF \sreg_reg[65]  ( .D(o[66]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[65])
         );
  DFF \sreg_reg[66]  ( .D(o[67]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[66])
         );
  DFF \sreg_reg[67]  ( .D(o[68]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[67])
         );
  DFF \sreg_reg[68]  ( .D(o[69]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[68])
         );
  DFF \sreg_reg[69]  ( .D(o[70]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[69])
         );
  DFF \sreg_reg[70]  ( .D(o[71]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[70])
         );
  DFF \sreg_reg[71]  ( .D(o[72]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[71])
         );
  DFF \sreg_reg[72]  ( .D(o[73]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[72])
         );
  DFF \sreg_reg[73]  ( .D(o[74]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[73])
         );
  DFF \sreg_reg[74]  ( .D(o[75]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[74])
         );
  DFF \sreg_reg[75]  ( .D(o[76]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[75])
         );
  DFF \sreg_reg[76]  ( .D(o[77]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[76])
         );
  DFF \sreg_reg[77]  ( .D(o[78]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[77])
         );
  DFF \sreg_reg[78]  ( .D(o[79]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[78])
         );
  DFF \sreg_reg[79]  ( .D(o[80]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[79])
         );
  DFF \sreg_reg[80]  ( .D(o[81]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[80])
         );
  DFF \sreg_reg[81]  ( .D(o[82]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[81])
         );
  DFF \sreg_reg[82]  ( .D(o[83]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[82])
         );
  DFF \sreg_reg[83]  ( .D(o[84]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[83])
         );
  DFF \sreg_reg[84]  ( .D(o[85]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[84])
         );
  DFF \sreg_reg[85]  ( .D(o[86]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[85])
         );
  DFF \sreg_reg[86]  ( .D(o[87]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[86])
         );
  DFF \sreg_reg[87]  ( .D(o[88]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[87])
         );
  DFF \sreg_reg[88]  ( .D(o[89]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[88])
         );
  DFF \sreg_reg[89]  ( .D(o[90]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[89])
         );
  DFF \sreg_reg[90]  ( .D(o[91]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[90])
         );
  DFF \sreg_reg[91]  ( .D(o[92]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[91])
         );
  DFF \sreg_reg[92]  ( .D(o[93]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[92])
         );
  DFF \sreg_reg[93]  ( .D(o[94]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[93])
         );
  DFF \sreg_reg[94]  ( .D(o[95]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[94])
         );
  DFF \sreg_reg[95]  ( .D(o[96]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[95])
         );
  DFF \sreg_reg[96]  ( .D(o[97]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[96])
         );
  DFF \sreg_reg[97]  ( .D(o[98]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[97])
         );
  DFF \sreg_reg[98]  ( .D(o[99]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[98])
         );
  DFF \sreg_reg[99]  ( .D(o[100]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[99]) );
  DFF \sreg_reg[100]  ( .D(o[101]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[100]) );
  DFF \sreg_reg[101]  ( .D(o[102]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[101]) );
  DFF \sreg_reg[102]  ( .D(o[103]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[102]) );
  DFF \sreg_reg[103]  ( .D(o[104]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[103]) );
  DFF \sreg_reg[104]  ( .D(o[105]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[104]) );
  DFF \sreg_reg[105]  ( .D(o[106]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[105]) );
  DFF \sreg_reg[106]  ( .D(o[107]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[106]) );
  DFF \sreg_reg[107]  ( .D(o[108]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[107]) );
  DFF \sreg_reg[108]  ( .D(o[109]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[108]) );
  DFF \sreg_reg[109]  ( .D(o[110]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[109]) );
  DFF \sreg_reg[110]  ( .D(o[111]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[110]) );
  DFF \sreg_reg[111]  ( .D(o[112]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[111]) );
  DFF \sreg_reg[112]  ( .D(o[113]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[112]) );
  DFF \sreg_reg[113]  ( .D(o[114]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[113]) );
  DFF \sreg_reg[114]  ( .D(o[115]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[114]) );
  DFF \sreg_reg[115]  ( .D(o[116]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[115]) );
  DFF \sreg_reg[116]  ( .D(o[117]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[116]) );
  DFF \sreg_reg[117]  ( .D(o[118]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[117]) );
  DFF \sreg_reg[118]  ( .D(o[119]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[118]) );
  DFF \sreg_reg[119]  ( .D(o[120]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[119]) );
  DFF \sreg_reg[120]  ( .D(o[121]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[120]) );
  DFF \sreg_reg[121]  ( .D(o[122]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[121]) );
  DFF \sreg_reg[122]  ( .D(o[123]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[122]) );
  DFF \sreg_reg[123]  ( .D(o[124]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[123]) );
  DFF \sreg_reg[124]  ( .D(o[125]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[124]) );
  DFF \sreg_reg[125]  ( .D(o[126]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        sreg[125]) );
  DFF \sreg_reg[126]  ( .D(\add_42/carry[127] ), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[126]) );
  FADDER \add_42/U1_64  ( .CIN(sreg[64]), .IN0(n192), .IN1(\add_42/carry[64] ), 
        .COUT(\add_42/carry[65] ), .SUM(o[64]) );
  FADDER \add_42/U1_65  ( .CIN(sreg[65]), .IN0(n191), .IN1(\add_42/carry[65] ), 
        .COUT(\add_42/carry[66] ), .SUM(o[65]) );
  FADDER \add_42/U1_66  ( .CIN(sreg[66]), .IN0(n190), .IN1(\add_42/carry[66] ), 
        .COUT(\add_42/carry[67] ), .SUM(o[66]) );
  FADDER \add_42/U1_67  ( .CIN(sreg[67]), .IN0(n189), .IN1(\add_42/carry[67] ), 
        .COUT(\add_42/carry[68] ), .SUM(o[67]) );
  FADDER \add_42/U1_68  ( .CIN(sreg[68]), .IN0(n188), .IN1(\add_42/carry[68] ), 
        .COUT(\add_42/carry[69] ), .SUM(o[68]) );
  FADDER \add_42/U1_69  ( .CIN(sreg[69]), .IN0(n187), .IN1(\add_42/carry[69] ), 
        .COUT(\add_42/carry[70] ), .SUM(o[69]) );
  FADDER \add_42/U1_70  ( .CIN(sreg[70]), .IN0(n186), .IN1(\add_42/carry[70] ), 
        .COUT(\add_42/carry[71] ), .SUM(o[70]) );
  FADDER \add_42/U1_71  ( .CIN(sreg[71]), .IN0(n185), .IN1(\add_42/carry[71] ), 
        .COUT(\add_42/carry[72] ), .SUM(o[71]) );
  FADDER \add_42/U1_72  ( .CIN(sreg[72]), .IN0(n184), .IN1(\add_42/carry[72] ), 
        .COUT(\add_42/carry[73] ), .SUM(o[72]) );
  FADDER \add_42/U1_73  ( .CIN(sreg[73]), .IN0(n183), .IN1(\add_42/carry[73] ), 
        .COUT(\add_42/carry[74] ), .SUM(o[73]) );
  FADDER \add_42/U1_74  ( .CIN(sreg[74]), .IN0(n182), .IN1(\add_42/carry[74] ), 
        .COUT(\add_42/carry[75] ), .SUM(o[74]) );
  FADDER \add_42/U1_75  ( .CIN(sreg[75]), .IN0(n181), .IN1(\add_42/carry[75] ), 
        .COUT(\add_42/carry[76] ), .SUM(o[75]) );
  FADDER \add_42/U1_76  ( .CIN(sreg[76]), .IN0(n180), .IN1(\add_42/carry[76] ), 
        .COUT(\add_42/carry[77] ), .SUM(o[76]) );
  FADDER \add_42/U1_77  ( .CIN(sreg[77]), .IN0(n179), .IN1(\add_42/carry[77] ), 
        .COUT(\add_42/carry[78] ), .SUM(o[77]) );
  FADDER \add_42/U1_78  ( .CIN(sreg[78]), .IN0(n178), .IN1(\add_42/carry[78] ), 
        .COUT(\add_42/carry[79] ), .SUM(o[78]) );
  FADDER \add_42/U1_79  ( .CIN(sreg[79]), .IN0(n177), .IN1(\add_42/carry[79] ), 
        .COUT(\add_42/carry[80] ), .SUM(o[79]) );
  FADDER \add_42/U1_80  ( .CIN(sreg[80]), .IN0(n176), .IN1(\add_42/carry[80] ), 
        .COUT(\add_42/carry[81] ), .SUM(o[80]) );
  FADDER \add_42/U1_81  ( .CIN(sreg[81]), .IN0(n175), .IN1(\add_42/carry[81] ), 
        .COUT(\add_42/carry[82] ), .SUM(o[81]) );
  FADDER \add_42/U1_82  ( .CIN(sreg[82]), .IN0(n174), .IN1(\add_42/carry[82] ), 
        .COUT(\add_42/carry[83] ), .SUM(o[82]) );
  FADDER \add_42/U1_83  ( .CIN(sreg[83]), .IN0(n173), .IN1(\add_42/carry[83] ), 
        .COUT(\add_42/carry[84] ), .SUM(o[83]) );
  FADDER \add_42/U1_84  ( .CIN(sreg[84]), .IN0(n172), .IN1(\add_42/carry[84] ), 
        .COUT(\add_42/carry[85] ), .SUM(o[84]) );
  FADDER \add_42/U1_85  ( .CIN(sreg[85]), .IN0(n171), .IN1(\add_42/carry[85] ), 
        .COUT(\add_42/carry[86] ), .SUM(o[85]) );
  FADDER \add_42/U1_86  ( .CIN(sreg[86]), .IN0(n170), .IN1(\add_42/carry[86] ), 
        .COUT(\add_42/carry[87] ), .SUM(o[86]) );
  FADDER \add_42/U1_87  ( .CIN(sreg[87]), .IN0(n169), .IN1(\add_42/carry[87] ), 
        .COUT(\add_42/carry[88] ), .SUM(o[87]) );
  FADDER \add_42/U1_88  ( .CIN(sreg[88]), .IN0(n168), .IN1(\add_42/carry[88] ), 
        .COUT(\add_42/carry[89] ), .SUM(o[88]) );
  FADDER \add_42/U1_89  ( .CIN(sreg[89]), .IN0(n167), .IN1(\add_42/carry[89] ), 
        .COUT(\add_42/carry[90] ), .SUM(o[89]) );
  FADDER \add_42/U1_90  ( .CIN(sreg[90]), .IN0(n166), .IN1(\add_42/carry[90] ), 
        .COUT(\add_42/carry[91] ), .SUM(o[90]) );
  FADDER \add_42/U1_91  ( .CIN(sreg[91]), .IN0(n165), .IN1(\add_42/carry[91] ), 
        .COUT(\add_42/carry[92] ), .SUM(o[91]) );
  FADDER \add_42/U1_92  ( .CIN(sreg[92]), .IN0(n164), .IN1(\add_42/carry[92] ), 
        .COUT(\add_42/carry[93] ), .SUM(o[92]) );
  FADDER \add_42/U1_93  ( .CIN(sreg[93]), .IN0(n163), .IN1(\add_42/carry[93] ), 
        .COUT(\add_42/carry[94] ), .SUM(o[93]) );
  FADDER \add_42/U1_94  ( .CIN(sreg[94]), .IN0(n162), .IN1(\add_42/carry[94] ), 
        .COUT(\add_42/carry[95] ), .SUM(o[94]) );
  FADDER \add_42/U1_95  ( .CIN(sreg[95]), .IN0(n161), .IN1(\add_42/carry[95] ), 
        .COUT(\add_42/carry[96] ), .SUM(o[95]) );
  FADDER \add_42/U1_96  ( .CIN(sreg[96]), .IN0(n160), .IN1(\add_42/carry[96] ), 
        .COUT(\add_42/carry[97] ), .SUM(o[96]) );
  FADDER \add_42/U1_97  ( .CIN(sreg[97]), .IN0(n159), .IN1(\add_42/carry[97] ), 
        .COUT(\add_42/carry[98] ), .SUM(o[97]) );
  FADDER \add_42/U1_98  ( .CIN(sreg[98]), .IN0(n158), .IN1(\add_42/carry[98] ), 
        .COUT(\add_42/carry[99] ), .SUM(o[98]) );
  FADDER \add_42/U1_99  ( .CIN(sreg[99]), .IN0(n157), .IN1(\add_42/carry[99] ), 
        .COUT(\add_42/carry[100] ), .SUM(o[99]) );
  FADDER \add_42/U1_100  ( .CIN(sreg[100]), .IN0(n156), .IN1(
        \add_42/carry[100] ), .COUT(\add_42/carry[101] ), .SUM(o[100]) );
  FADDER \add_42/U1_101  ( .CIN(sreg[101]), .IN0(n155), .IN1(
        \add_42/carry[101] ), .COUT(\add_42/carry[102] ), .SUM(o[101]) );
  FADDER \add_42/U1_102  ( .CIN(sreg[102]), .IN0(n154), .IN1(
        \add_42/carry[102] ), .COUT(\add_42/carry[103] ), .SUM(o[102]) );
  FADDER \add_42/U1_103  ( .CIN(sreg[103]), .IN0(n153), .IN1(
        \add_42/carry[103] ), .COUT(\add_42/carry[104] ), .SUM(o[103]) );
  FADDER \add_42/U1_104  ( .CIN(sreg[104]), .IN0(n152), .IN1(
        \add_42/carry[104] ), .COUT(\add_42/carry[105] ), .SUM(o[104]) );
  FADDER \add_42/U1_105  ( .CIN(sreg[105]), .IN0(n151), .IN1(
        \add_42/carry[105] ), .COUT(\add_42/carry[106] ), .SUM(o[105]) );
  FADDER \add_42/U1_106  ( .CIN(sreg[106]), .IN0(n150), .IN1(
        \add_42/carry[106] ), .COUT(\add_42/carry[107] ), .SUM(o[106]) );
  FADDER \add_42/U1_107  ( .CIN(sreg[107]), .IN0(n149), .IN1(
        \add_42/carry[107] ), .COUT(\add_42/carry[108] ), .SUM(o[107]) );
  FADDER \add_42/U1_108  ( .CIN(sreg[108]), .IN0(n148), .IN1(
        \add_42/carry[108] ), .COUT(\add_42/carry[109] ), .SUM(o[108]) );
  FADDER \add_42/U1_109  ( .CIN(sreg[109]), .IN0(n147), .IN1(
        \add_42/carry[109] ), .COUT(\add_42/carry[110] ), .SUM(o[109]) );
  FADDER \add_42/U1_110  ( .CIN(sreg[110]), .IN0(n146), .IN1(
        \add_42/carry[110] ), .COUT(\add_42/carry[111] ), .SUM(o[110]) );
  FADDER \add_42/U1_111  ( .CIN(sreg[111]), .IN0(n145), .IN1(
        \add_42/carry[111] ), .COUT(\add_42/carry[112] ), .SUM(o[111]) );
  FADDER \add_42/U1_112  ( .CIN(sreg[112]), .IN0(n144), .IN1(
        \add_42/carry[112] ), .COUT(\add_42/carry[113] ), .SUM(o[112]) );
  FADDER \add_42/U1_113  ( .CIN(sreg[113]), .IN0(n143), .IN1(
        \add_42/carry[113] ), .COUT(\add_42/carry[114] ), .SUM(o[113]) );
  FADDER \add_42/U1_114  ( .CIN(sreg[114]), .IN0(n142), .IN1(
        \add_42/carry[114] ), .COUT(\add_42/carry[115] ), .SUM(o[114]) );
  FADDER \add_42/U1_115  ( .CIN(sreg[115]), .IN0(n141), .IN1(
        \add_42/carry[115] ), .COUT(\add_42/carry[116] ), .SUM(o[115]) );
  FADDER \add_42/U1_116  ( .CIN(sreg[116]), .IN0(n140), .IN1(
        \add_42/carry[116] ), .COUT(\add_42/carry[117] ), .SUM(o[116]) );
  FADDER \add_42/U1_117  ( .CIN(sreg[117]), .IN0(n139), .IN1(
        \add_42/carry[117] ), .COUT(\add_42/carry[118] ), .SUM(o[117]) );
  FADDER \add_42/U1_118  ( .CIN(sreg[118]), .IN0(n138), .IN1(
        \add_42/carry[118] ), .COUT(\add_42/carry[119] ), .SUM(o[118]) );
  FADDER \add_42/U1_119  ( .CIN(sreg[119]), .IN0(n137), .IN1(
        \add_42/carry[119] ), .COUT(\add_42/carry[120] ), .SUM(o[119]) );
  FADDER \add_42/U1_120  ( .CIN(sreg[120]), .IN0(n136), .IN1(
        \add_42/carry[120] ), .COUT(\add_42/carry[121] ), .SUM(o[120]) );
  FADDER \add_42/U1_121  ( .CIN(sreg[121]), .IN0(n135), .IN1(
        \add_42/carry[121] ), .COUT(\add_42/carry[122] ), .SUM(o[121]) );
  FADDER \add_42/U1_122  ( .CIN(sreg[122]), .IN0(n134), .IN1(
        \add_42/carry[122] ), .COUT(\add_42/carry[123] ), .SUM(o[122]) );
  FADDER \add_42/U1_123  ( .CIN(sreg[123]), .IN0(n133), .IN1(
        \add_42/carry[123] ), .COUT(\add_42/carry[124] ), .SUM(o[123]) );
  FADDER \add_42/U1_124  ( .CIN(sreg[124]), .IN0(n132), .IN1(
        \add_42/carry[124] ), .COUT(\add_42/carry[125] ), .SUM(o[124]) );
  FADDER \add_42/U1_125  ( .CIN(sreg[125]), .IN0(n131), .IN1(
        \add_42/carry[125] ), .COUT(\add_42/carry[126] ), .SUM(o[125]) );
  FADDER \add_42/U1_126  ( .CIN(sreg[126]), .IN0(n130), .IN1(
        \add_42/carry[126] ), .COUT(\add_42/carry[127] ), .SUM(o[126]) );
  AND U133 ( .A(sreg[63]), .B(n193), .Z(\add_42/carry[64] ) );
  XOR U134 ( .A(n193), .B(sreg[63]), .Z(o[63]) );
  AND U135 ( .A(g_input[63]), .B(e_input[0]), .Z(n130) );
  AND U136 ( .A(g_input[62]), .B(e_input[0]), .Z(n131) );
  AND U137 ( .A(g_input[61]), .B(e_input[0]), .Z(n132) );
  AND U138 ( .A(g_input[60]), .B(e_input[0]), .Z(n133) );
  AND U139 ( .A(g_input[59]), .B(e_input[0]), .Z(n134) );
  AND U140 ( .A(g_input[58]), .B(e_input[0]), .Z(n135) );
  AND U141 ( .A(g_input[57]), .B(e_input[0]), .Z(n136) );
  AND U142 ( .A(g_input[56]), .B(e_input[0]), .Z(n137) );
  AND U143 ( .A(g_input[55]), .B(e_input[0]), .Z(n138) );
  AND U144 ( .A(g_input[54]), .B(e_input[0]), .Z(n139) );
  AND U145 ( .A(g_input[53]), .B(e_input[0]), .Z(n140) );
  AND U146 ( .A(g_input[52]), .B(e_input[0]), .Z(n141) );
  AND U147 ( .A(g_input[51]), .B(e_input[0]), .Z(n142) );
  AND U148 ( .A(g_input[50]), .B(e_input[0]), .Z(n143) );
  AND U149 ( .A(g_input[49]), .B(e_input[0]), .Z(n144) );
  AND U150 ( .A(g_input[48]), .B(e_input[0]), .Z(n145) );
  AND U151 ( .A(g_input[47]), .B(e_input[0]), .Z(n146) );
  AND U152 ( .A(g_input[46]), .B(e_input[0]), .Z(n147) );
  AND U153 ( .A(g_input[45]), .B(e_input[0]), .Z(n148) );
  AND U154 ( .A(g_input[44]), .B(e_input[0]), .Z(n149) );
  AND U155 ( .A(g_input[43]), .B(e_input[0]), .Z(n150) );
  AND U156 ( .A(g_input[42]), .B(e_input[0]), .Z(n151) );
  AND U157 ( .A(g_input[41]), .B(e_input[0]), .Z(n152) );
  AND U158 ( .A(g_input[40]), .B(e_input[0]), .Z(n153) );
  AND U159 ( .A(g_input[39]), .B(e_input[0]), .Z(n154) );
  AND U160 ( .A(g_input[38]), .B(e_input[0]), .Z(n155) );
  AND U161 ( .A(g_input[37]), .B(e_input[0]), .Z(n156) );
  AND U162 ( .A(g_input[36]), .B(e_input[0]), .Z(n157) );
  AND U163 ( .A(g_input[35]), .B(e_input[0]), .Z(n158) );
  AND U164 ( .A(g_input[34]), .B(e_input[0]), .Z(n159) );
  AND U165 ( .A(g_input[33]), .B(e_input[0]), .Z(n160) );
  AND U166 ( .A(g_input[32]), .B(e_input[0]), .Z(n161) );
  AND U167 ( .A(g_input[31]), .B(e_input[0]), .Z(n162) );
  AND U168 ( .A(g_input[30]), .B(e_input[0]), .Z(n163) );
  AND U169 ( .A(g_input[29]), .B(e_input[0]), .Z(n164) );
  AND U170 ( .A(g_input[28]), .B(e_input[0]), .Z(n165) );
  AND U171 ( .A(g_input[27]), .B(e_input[0]), .Z(n166) );
  AND U172 ( .A(g_input[26]), .B(e_input[0]), .Z(n167) );
  AND U173 ( .A(g_input[25]), .B(e_input[0]), .Z(n168) );
  AND U174 ( .A(g_input[24]), .B(e_input[0]), .Z(n169) );
  AND U175 ( .A(g_input[23]), .B(e_input[0]), .Z(n170) );
  AND U176 ( .A(g_input[22]), .B(e_input[0]), .Z(n171) );
  AND U177 ( .A(g_input[21]), .B(e_input[0]), .Z(n172) );
  AND U178 ( .A(g_input[20]), .B(e_input[0]), .Z(n173) );
  AND U179 ( .A(g_input[19]), .B(e_input[0]), .Z(n174) );
  AND U180 ( .A(g_input[18]), .B(e_input[0]), .Z(n175) );
  AND U181 ( .A(g_input[17]), .B(e_input[0]), .Z(n176) );
  AND U182 ( .A(g_input[16]), .B(e_input[0]), .Z(n177) );
  AND U183 ( .A(g_input[15]), .B(e_input[0]), .Z(n178) );
  AND U184 ( .A(g_input[14]), .B(e_input[0]), .Z(n179) );
  AND U185 ( .A(g_input[13]), .B(e_input[0]), .Z(n180) );
  AND U186 ( .A(g_input[12]), .B(e_input[0]), .Z(n181) );
  AND U187 ( .A(g_input[11]), .B(e_input[0]), .Z(n182) );
  AND U188 ( .A(g_input[10]), .B(e_input[0]), .Z(n183) );
  AND U189 ( .A(g_input[9]), .B(e_input[0]), .Z(n184) );
  AND U190 ( .A(g_input[8]), .B(e_input[0]), .Z(n185) );
  AND U191 ( .A(g_input[7]), .B(e_input[0]), .Z(n186) );
  AND U192 ( .A(g_input[6]), .B(e_input[0]), .Z(n187) );
  AND U193 ( .A(g_input[5]), .B(e_input[0]), .Z(n188) );
  AND U194 ( .A(g_input[4]), .B(e_input[0]), .Z(n189) );
  AND U195 ( .A(g_input[3]), .B(e_input[0]), .Z(n190) );
  AND U196 ( .A(g_input[2]), .B(e_input[0]), .Z(n191) );
  AND U197 ( .A(g_input[1]), .B(e_input[0]), .Z(n192) );
  AND U198 ( .A(g_input[0]), .B(e_input[0]), .Z(n193) );
endmodule

