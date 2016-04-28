
module mult_N8_CC8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [0:0] e_input;
  output [15:0] o;
  input clk, rst;
  wire   \add_42/carry[15] , \add_42/carry[14] , \add_42/carry[13] ,
         \add_42/carry[12] , \add_42/carry[11] , \add_42/carry[10] ,
         \add_42/carry[9] , \add_42/carry[8] , n18, n19, n20, n21, n22, n23,
         n24, n25;
  wire   [15:0] sreg;
  assign o[6] = sreg[6];
  assign o[5] = sreg[5];
  assign o[4] = sreg[4];
  assign o[3] = sreg[3];
  assign o[2] = sreg[2];
  assign o[1] = sreg[1];
  assign o[15] = \add_42/carry[15] ;

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
  DFF \sreg_reg[6]  ( .D(o[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[6]) );
  DFF \sreg_reg[7]  ( .D(o[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[7]) );
  DFF \sreg_reg[8]  ( .D(o[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[8]) );
  DFF \sreg_reg[9]  ( .D(o[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[9])
         );
  DFF \sreg_reg[10]  ( .D(o[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[10])
         );
  DFF \sreg_reg[11]  ( .D(o[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[11])
         );
  DFF \sreg_reg[12]  ( .D(o[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[12])
         );
  DFF \sreg_reg[13]  ( .D(o[14]), .CLK(clk), .RST(rst), .I(1'b0), .Q(sreg[13])
         );
  DFF \sreg_reg[14]  ( .D(\add_42/carry[15] ), .CLK(clk), .RST(rst), .I(1'b0), 
        .Q(sreg[14]) );
  FADDER \add_42/U1_8  ( .CIN(sreg[8]), .IN0(n24), .IN1(\add_42/carry[8] ), 
        .COUT(\add_42/carry[9] ), .SUM(o[8]) );
  FADDER \add_42/U1_9  ( .CIN(sreg[9]), .IN0(n23), .IN1(\add_42/carry[9] ), 
        .COUT(\add_42/carry[10] ), .SUM(o[9]) );
  FADDER \add_42/U1_10  ( .CIN(sreg[10]), .IN0(n22), .IN1(\add_42/carry[10] ), 
        .COUT(\add_42/carry[11] ), .SUM(o[10]) );
  FADDER \add_42/U1_11  ( .CIN(sreg[11]), .IN0(n21), .IN1(\add_42/carry[11] ), 
        .COUT(\add_42/carry[12] ), .SUM(o[11]) );
  FADDER \add_42/U1_12  ( .CIN(sreg[12]), .IN0(n20), .IN1(\add_42/carry[12] ), 
        .COUT(\add_42/carry[13] ), .SUM(o[12]) );
  FADDER \add_42/U1_13  ( .CIN(sreg[13]), .IN0(n19), .IN1(\add_42/carry[13] ), 
        .COUT(\add_42/carry[14] ), .SUM(o[13]) );
  FADDER \add_42/U1_14  ( .CIN(sreg[14]), .IN0(n18), .IN1(\add_42/carry[14] ), 
        .COUT(\add_42/carry[15] ), .SUM(o[14]) );
  AND U21 ( .A(sreg[7]), .B(n25), .Z(\add_42/carry[8] ) );
  XOR U22 ( .A(n25), .B(sreg[7]), .Z(o[7]) );
  AND U23 ( .A(g_input[7]), .B(e_input[0]), .Z(n18) );
  AND U24 ( .A(g_input[6]), .B(e_input[0]), .Z(n19) );
  AND U25 ( .A(g_input[5]), .B(e_input[0]), .Z(n20) );
  AND U26 ( .A(g_input[4]), .B(e_input[0]), .Z(n21) );
  AND U27 ( .A(g_input[3]), .B(e_input[0]), .Z(n22) );
  AND U28 ( .A(g_input[2]), .B(e_input[0]), .Z(n23) );
  AND U29 ( .A(g_input[1]), .B(e_input[0]), .Z(n24) );
  AND U30 ( .A(g_input[0]), .B(e_input[0]), .Z(n25) );
endmodule

