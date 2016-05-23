
module mult_N16_CC16 ( clk, rst, g_input, e_input, o );
  input [15:0] g_input;
  input [0:0] e_input;
  output [31:0] o;
  input clk, rst;
  wire   \add_42/carry[31] , \add_42/carry[30] , \add_42/carry[29] ,
         \add_42/carry[28] , \add_42/carry[27] , \add_42/carry[26] ,
         \add_42/carry[25] , \add_42/carry[24] , \add_42/carry[23] ,
         \add_42/carry[22] , \add_42/carry[21] , \add_42/carry[20] ,
         \add_42/carry[19] , \add_42/carry[18] , \add_42/carry[17] ,
         \add_42/carry[16] , n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49;
  wire   [31:0] sreg;
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
  assign o[31] = \add_42/carry[31] ;

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
  DFF \sreg_reg[14]  ( .D(o[15]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[14])
         );
  DFF \sreg_reg[15]  ( .D(o[16]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[15])
         );
  DFF \sreg_reg[16]  ( .D(o[17]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[16])
         );
  DFF \sreg_reg[17]  ( .D(o[18]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[17])
         );
  DFF \sreg_reg[18]  ( .D(o[19]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[18])
         );
  DFF \sreg_reg[19]  ( .D(o[20]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[19])
         );
  DFF \sreg_reg[20]  ( .D(o[21]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[20])
         );
  DFF \sreg_reg[21]  ( .D(o[22]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[21])
         );
  DFF \sreg_reg[22]  ( .D(o[23]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[22])
         );
  DFF \sreg_reg[23]  ( .D(o[24]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[23])
         );
  DFF \sreg_reg[24]  ( .D(o[25]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[24])
         );
  DFF \sreg_reg[25]  ( .D(o[26]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[25])
         );
  DFF \sreg_reg[26]  ( .D(o[27]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[26])
         );
  DFF \sreg_reg[27]  ( .D(o[28]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[27])
         );
  DFF \sreg_reg[28]  ( .D(o[29]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[28])
         );
  DFF \sreg_reg[29]  ( .D(o[30]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[29])
         );
  DFF \sreg_reg[30]  ( .D(\add_42/carry[31] ), .CLK(clk), .RST(rst), .I(1'b0), 
        .Q(sreg[30]) );
  FADDER \add_42/U1_16  ( .CIN(sreg[16]), .IN0(n48), .IN1(\add_42/carry[16] ), 
        .COUT(\add_42/carry[17] ), .SUM(o[16]) );
  FADDER \add_42/U1_17  ( .CIN(sreg[17]), .IN0(n47), .IN1(\add_42/carry[17] ), 
        .COUT(\add_42/carry[18] ), .SUM(o[17]) );
  FADDER \add_42/U1_18  ( .CIN(sreg[18]), .IN0(n46), .IN1(\add_42/carry[18] ), 
        .COUT(\add_42/carry[19] ), .SUM(o[18]) );
  FADDER \add_42/U1_19  ( .CIN(sreg[19]), .IN0(n45), .IN1(\add_42/carry[19] ), 
        .COUT(\add_42/carry[20] ), .SUM(o[19]) );
  FADDER \add_42/U1_20  ( .CIN(sreg[20]), .IN0(n44), .IN1(\add_42/carry[20] ), 
        .COUT(\add_42/carry[21] ), .SUM(o[20]) );
  FADDER \add_42/U1_21  ( .CIN(sreg[21]), .IN0(n43), .IN1(\add_42/carry[21] ), 
        .COUT(\add_42/carry[22] ), .SUM(o[21]) );
  FADDER \add_42/U1_22  ( .CIN(sreg[22]), .IN0(n42), .IN1(\add_42/carry[22] ), 
        .COUT(\add_42/carry[23] ), .SUM(o[22]) );
  FADDER \add_42/U1_23  ( .CIN(sreg[23]), .IN0(n41), .IN1(\add_42/carry[23] ), 
        .COUT(\add_42/carry[24] ), .SUM(o[23]) );
  FADDER \add_42/U1_24  ( .CIN(sreg[24]), .IN0(n40), .IN1(\add_42/carry[24] ), 
        .COUT(\add_42/carry[25] ), .SUM(o[24]) );
  FADDER \add_42/U1_25  ( .CIN(sreg[25]), .IN0(n39), .IN1(\add_42/carry[25] ), 
        .COUT(\add_42/carry[26] ), .SUM(o[25]) );
  FADDER \add_42/U1_26  ( .CIN(sreg[26]), .IN0(n38), .IN1(\add_42/carry[26] ), 
        .COUT(\add_42/carry[27] ), .SUM(o[26]) );
  FADDER \add_42/U1_27  ( .CIN(sreg[27]), .IN0(n37), .IN1(\add_42/carry[27] ), 
        .COUT(\add_42/carry[28] ), .SUM(o[27]) );
  FADDER \add_42/U1_28  ( .CIN(sreg[28]), .IN0(n36), .IN1(\add_42/carry[28] ), 
        .COUT(\add_42/carry[29] ), .SUM(o[28]) );
  FADDER \add_42/U1_29  ( .CIN(sreg[29]), .IN0(n35), .IN1(\add_42/carry[29] ), 
        .COUT(\add_42/carry[30] ), .SUM(o[29]) );
  FADDER \add_42/U1_30  ( .CIN(sreg[30]), .IN0(n34), .IN1(\add_42/carry[30] ), 
        .COUT(\add_42/carry[31] ), .SUM(o[30]) );
  AND U37 ( .A(sreg[15]), .B(n49), .Z(\add_42/carry[16] ) );
  XOR U38 ( .A(n49), .B(sreg[15]), .Z(o[15]) );
  AND U39 ( .A(g_input[15]), .B(e_input[0]), .Z(n34) );
  AND U40 ( .A(g_input[14]), .B(e_input[0]), .Z(n35) );
  AND U41 ( .A(g_input[13]), .B(e_input[0]), .Z(n36) );
  AND U42 ( .A(g_input[12]), .B(e_input[0]), .Z(n37) );
  AND U43 ( .A(g_input[11]), .B(e_input[0]), .Z(n38) );
  AND U44 ( .A(g_input[10]), .B(e_input[0]), .Z(n39) );
  AND U45 ( .A(g_input[9]), .B(e_input[0]), .Z(n40) );
  AND U46 ( .A(g_input[8]), .B(e_input[0]), .Z(n41) );
  AND U47 ( .A(g_input[7]), .B(e_input[0]), .Z(n42) );
  AND U48 ( .A(g_input[6]), .B(e_input[0]), .Z(n43) );
  AND U49 ( .A(g_input[5]), .B(e_input[0]), .Z(n44) );
  AND U50 ( .A(g_input[4]), .B(e_input[0]), .Z(n45) );
  AND U51 ( .A(g_input[3]), .B(e_input[0]), .Z(n46) );
  AND U52 ( .A(g_input[2]), .B(e_input[0]), .Z(n47) );
  AND U53 ( .A(g_input[1]), .B(e_input[0]), .Z(n48) );
  AND U54 ( .A(g_input[0]), .B(e_input[0]), .Z(n49) );
endmodule

