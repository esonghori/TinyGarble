
module mult_N32_CC32 ( clk, rst, g_input, e_input, o );
  input [31:0] g_input;
  input [0:0] e_input;
  output [63:0] o;
  input clk, rst;
  wire   \add_42/carry[63] , \add_42/carry[62] , \add_42/carry[61] ,
         \add_42/carry[60] , \add_42/carry[59] , \add_42/carry[58] ,
         \add_42/carry[57] , \add_42/carry[56] , \add_42/carry[55] ,
         \add_42/carry[54] , \add_42/carry[53] , \add_42/carry[52] ,
         \add_42/carry[51] , \add_42/carry[50] , \add_42/carry[49] ,
         \add_42/carry[48] , \add_42/carry[47] , \add_42/carry[46] ,
         \add_42/carry[45] , \add_42/carry[44] , \add_42/carry[43] ,
         \add_42/carry[42] , \add_42/carry[41] , \add_42/carry[40] ,
         \add_42/carry[39] , \add_42/carry[38] , \add_42/carry[37] ,
         \add_42/carry[36] , \add_42/carry[35] , \add_42/carry[34] ,
         \add_42/carry[33] , \add_42/carry[32] , n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97;
  wire   [63:0] sreg;
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
  assign o[63] = \add_42/carry[63] ;

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
  DFF \sreg_reg[30]  ( .D(o[31]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[30])
         );
  DFF \sreg_reg[31]  ( .D(o[32]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[31])
         );
  DFF \sreg_reg[32]  ( .D(o[33]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[32])
         );
  DFF \sreg_reg[33]  ( .D(o[34]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[33])
         );
  DFF \sreg_reg[34]  ( .D(o[35]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[34])
         );
  DFF \sreg_reg[35]  ( .D(o[36]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[35])
         );
  DFF \sreg_reg[36]  ( .D(o[37]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[36])
         );
  DFF \sreg_reg[37]  ( .D(o[38]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[37])
         );
  DFF \sreg_reg[38]  ( .D(o[39]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[38])
         );
  DFF \sreg_reg[39]  ( .D(o[40]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[39])
         );
  DFF \sreg_reg[40]  ( .D(o[41]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[40])
         );
  DFF \sreg_reg[41]  ( .D(o[42]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[41])
         );
  DFF \sreg_reg[42]  ( .D(o[43]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[42])
         );
  DFF \sreg_reg[43]  ( .D(o[44]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[43])
         );
  DFF \sreg_reg[44]  ( .D(o[45]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[44])
         );
  DFF \sreg_reg[45]  ( .D(o[46]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[45])
         );
  DFF \sreg_reg[46]  ( .D(o[47]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[46])
         );
  DFF \sreg_reg[47]  ( .D(o[48]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[47])
         );
  DFF \sreg_reg[48]  ( .D(o[49]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[48])
         );
  DFF \sreg_reg[49]  ( .D(o[50]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[49])
         );
  DFF \sreg_reg[50]  ( .D(o[51]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[50])
         );
  DFF \sreg_reg[51]  ( .D(o[52]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[51])
         );
  DFF \sreg_reg[52]  ( .D(o[53]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[52])
         );
  DFF \sreg_reg[53]  ( .D(o[54]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[53])
         );
  DFF \sreg_reg[54]  ( .D(o[55]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[54])
         );
  DFF \sreg_reg[55]  ( .D(o[56]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[55])
         );
  DFF \sreg_reg[56]  ( .D(o[57]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[56])
         );
  DFF \sreg_reg[57]  ( .D(o[58]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[57])
         );
  DFF \sreg_reg[58]  ( .D(o[59]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[58])
         );
  DFF \sreg_reg[59]  ( .D(o[60]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[59])
         );
  DFF \sreg_reg[60]  ( .D(o[61]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[60])
         );
  DFF \sreg_reg[61]  ( .D(o[62]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[61])
         );
  DFF \sreg_reg[62]  ( .D(\add_42/carry[63] ), .CLK(clk), .RST(rst), .I(1'b0), 
        .Q(sreg[62]) );
  FADDER \add_42/U1_32  ( .CIN(sreg[32]), .IN0(n96), .IN1(\add_42/carry[32] ), 
        .COUT(\add_42/carry[33] ), .SUM(o[32]) );
  FADDER \add_42/U1_33  ( .CIN(sreg[33]), .IN0(n95), .IN1(\add_42/carry[33] ), 
        .COUT(\add_42/carry[34] ), .SUM(o[33]) );
  FADDER \add_42/U1_34  ( .CIN(sreg[34]), .IN0(n94), .IN1(\add_42/carry[34] ), 
        .COUT(\add_42/carry[35] ), .SUM(o[34]) );
  FADDER \add_42/U1_35  ( .CIN(sreg[35]), .IN0(n93), .IN1(\add_42/carry[35] ), 
        .COUT(\add_42/carry[36] ), .SUM(o[35]) );
  FADDER \add_42/U1_36  ( .CIN(sreg[36]), .IN0(n92), .IN1(\add_42/carry[36] ), 
        .COUT(\add_42/carry[37] ), .SUM(o[36]) );
  FADDER \add_42/U1_37  ( .CIN(sreg[37]), .IN0(n91), .IN1(\add_42/carry[37] ), 
        .COUT(\add_42/carry[38] ), .SUM(o[37]) );
  FADDER \add_42/U1_38  ( .CIN(sreg[38]), .IN0(n90), .IN1(\add_42/carry[38] ), 
        .COUT(\add_42/carry[39] ), .SUM(o[38]) );
  FADDER \add_42/U1_39  ( .CIN(sreg[39]), .IN0(n89), .IN1(\add_42/carry[39] ), 
        .COUT(\add_42/carry[40] ), .SUM(o[39]) );
  FADDER \add_42/U1_40  ( .CIN(sreg[40]), .IN0(n88), .IN1(\add_42/carry[40] ), 
        .COUT(\add_42/carry[41] ), .SUM(o[40]) );
  FADDER \add_42/U1_41  ( .CIN(sreg[41]), .IN0(n87), .IN1(\add_42/carry[41] ), 
        .COUT(\add_42/carry[42] ), .SUM(o[41]) );
  FADDER \add_42/U1_42  ( .CIN(sreg[42]), .IN0(n86), .IN1(\add_42/carry[42] ), 
        .COUT(\add_42/carry[43] ), .SUM(o[42]) );
  FADDER \add_42/U1_43  ( .CIN(sreg[43]), .IN0(n85), .IN1(\add_42/carry[43] ), 
        .COUT(\add_42/carry[44] ), .SUM(o[43]) );
  FADDER \add_42/U1_44  ( .CIN(sreg[44]), .IN0(n84), .IN1(\add_42/carry[44] ), 
        .COUT(\add_42/carry[45] ), .SUM(o[44]) );
  FADDER \add_42/U1_45  ( .CIN(sreg[45]), .IN0(n83), .IN1(\add_42/carry[45] ), 
        .COUT(\add_42/carry[46] ), .SUM(o[45]) );
  FADDER \add_42/U1_46  ( .CIN(sreg[46]), .IN0(n82), .IN1(\add_42/carry[46] ), 
        .COUT(\add_42/carry[47] ), .SUM(o[46]) );
  FADDER \add_42/U1_47  ( .CIN(sreg[47]), .IN0(n81), .IN1(\add_42/carry[47] ), 
        .COUT(\add_42/carry[48] ), .SUM(o[47]) );
  FADDER \add_42/U1_48  ( .CIN(sreg[48]), .IN0(n80), .IN1(\add_42/carry[48] ), 
        .COUT(\add_42/carry[49] ), .SUM(o[48]) );
  FADDER \add_42/U1_49  ( .CIN(sreg[49]), .IN0(n79), .IN1(\add_42/carry[49] ), 
        .COUT(\add_42/carry[50] ), .SUM(o[49]) );
  FADDER \add_42/U1_50  ( .CIN(sreg[50]), .IN0(n78), .IN1(\add_42/carry[50] ), 
        .COUT(\add_42/carry[51] ), .SUM(o[50]) );
  FADDER \add_42/U1_51  ( .CIN(sreg[51]), .IN0(n77), .IN1(\add_42/carry[51] ), 
        .COUT(\add_42/carry[52] ), .SUM(o[51]) );
  FADDER \add_42/U1_52  ( .CIN(sreg[52]), .IN0(n76), .IN1(\add_42/carry[52] ), 
        .COUT(\add_42/carry[53] ), .SUM(o[52]) );
  FADDER \add_42/U1_53  ( .CIN(sreg[53]), .IN0(n75), .IN1(\add_42/carry[53] ), 
        .COUT(\add_42/carry[54] ), .SUM(o[53]) );
  FADDER \add_42/U1_54  ( .CIN(sreg[54]), .IN0(n74), .IN1(\add_42/carry[54] ), 
        .COUT(\add_42/carry[55] ), .SUM(o[54]) );
  FADDER \add_42/U1_55  ( .CIN(sreg[55]), .IN0(n73), .IN1(\add_42/carry[55] ), 
        .COUT(\add_42/carry[56] ), .SUM(o[55]) );
  FADDER \add_42/U1_56  ( .CIN(sreg[56]), .IN0(n72), .IN1(\add_42/carry[56] ), 
        .COUT(\add_42/carry[57] ), .SUM(o[56]) );
  FADDER \add_42/U1_57  ( .CIN(sreg[57]), .IN0(n71), .IN1(\add_42/carry[57] ), 
        .COUT(\add_42/carry[58] ), .SUM(o[57]) );
  FADDER \add_42/U1_58  ( .CIN(sreg[58]), .IN0(n70), .IN1(\add_42/carry[58] ), 
        .COUT(\add_42/carry[59] ), .SUM(o[58]) );
  FADDER \add_42/U1_59  ( .CIN(sreg[59]), .IN0(n69), .IN1(\add_42/carry[59] ), 
        .COUT(\add_42/carry[60] ), .SUM(o[59]) );
  FADDER \add_42/U1_60  ( .CIN(sreg[60]), .IN0(n68), .IN1(\add_42/carry[60] ), 
        .COUT(\add_42/carry[61] ), .SUM(o[60]) );
  FADDER \add_42/U1_61  ( .CIN(sreg[61]), .IN0(n67), .IN1(\add_42/carry[61] ), 
        .COUT(\add_42/carry[62] ), .SUM(o[61]) );
  FADDER \add_42/U1_62  ( .CIN(sreg[62]), .IN0(n66), .IN1(\add_42/carry[62] ), 
        .COUT(\add_42/carry[63] ), .SUM(o[62]) );
  AND U69 ( .A(sreg[31]), .B(n97), .Z(\add_42/carry[32] ) );
  XOR U70 ( .A(n97), .B(sreg[31]), .Z(o[31]) );
  AND U71 ( .A(g_input[31]), .B(e_input[0]), .Z(n66) );
  AND U72 ( .A(g_input[30]), .B(e_input[0]), .Z(n67) );
  AND U73 ( .A(g_input[29]), .B(e_input[0]), .Z(n68) );
  AND U74 ( .A(g_input[28]), .B(e_input[0]), .Z(n69) );
  AND U75 ( .A(g_input[27]), .B(e_input[0]), .Z(n70) );
  AND U76 ( .A(g_input[26]), .B(e_input[0]), .Z(n71) );
  AND U77 ( .A(g_input[25]), .B(e_input[0]), .Z(n72) );
  AND U78 ( .A(g_input[24]), .B(e_input[0]), .Z(n73) );
  AND U79 ( .A(g_input[23]), .B(e_input[0]), .Z(n74) );
  AND U80 ( .A(g_input[22]), .B(e_input[0]), .Z(n75) );
  AND U81 ( .A(g_input[21]), .B(e_input[0]), .Z(n76) );
  AND U82 ( .A(g_input[20]), .B(e_input[0]), .Z(n77) );
  AND U83 ( .A(g_input[19]), .B(e_input[0]), .Z(n78) );
  AND U84 ( .A(g_input[18]), .B(e_input[0]), .Z(n79) );
  AND U85 ( .A(g_input[17]), .B(e_input[0]), .Z(n80) );
  AND U86 ( .A(g_input[16]), .B(e_input[0]), .Z(n81) );
  AND U87 ( .A(g_input[15]), .B(e_input[0]), .Z(n82) );
  AND U88 ( .A(g_input[14]), .B(e_input[0]), .Z(n83) );
  AND U89 ( .A(g_input[13]), .B(e_input[0]), .Z(n84) );
  AND U90 ( .A(g_input[12]), .B(e_input[0]), .Z(n85) );
  AND U91 ( .A(g_input[11]), .B(e_input[0]), .Z(n86) );
  AND U92 ( .A(g_input[10]), .B(e_input[0]), .Z(n87) );
  AND U93 ( .A(g_input[9]), .B(e_input[0]), .Z(n88) );
  AND U94 ( .A(g_input[8]), .B(e_input[0]), .Z(n89) );
  AND U95 ( .A(g_input[7]), .B(e_input[0]), .Z(n90) );
  AND U96 ( .A(g_input[6]), .B(e_input[0]), .Z(n91) );
  AND U97 ( .A(g_input[5]), .B(e_input[0]), .Z(n92) );
  AND U98 ( .A(g_input[4]), .B(e_input[0]), .Z(n93) );
  AND U99 ( .A(g_input[3]), .B(e_input[0]), .Z(n94) );
  AND U100 ( .A(g_input[2]), .B(e_input[0]), .Z(n95) );
  AND U101 ( .A(g_input[1]), .B(e_input[0]), .Z(n96) );
  AND U102 ( .A(g_input[0]), .B(e_input[0]), .Z(n97) );
endmodule

