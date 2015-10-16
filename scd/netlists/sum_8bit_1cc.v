
module sum_N8_CC1 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   \add_58/carry[7] , \add_58/carry[6] , \add_58/carry[5] ,
         \add_58/carry[4] , \add_58/carry[3] , \add_58/carry[2] ,
         \add_58/carry[1] ;

  FADDER \add_58/U1_0  ( .CIN(g_input[0]), .IN0(e_input[0]), .IN1(1'b0), 
        .COUT(\add_58/carry[1] ), .SUM(o[0]) );
  FADDER \add_58/U1_1  ( .CIN(g_input[1]), .IN0(e_input[1]), .IN1(
        \add_58/carry[1] ), .COUT(\add_58/carry[2] ), .SUM(o[1]) );
  FADDER \add_58/U1_2  ( .CIN(g_input[2]), .IN0(e_input[2]), .IN1(
        \add_58/carry[2] ), .COUT(\add_58/carry[3] ), .SUM(o[2]) );
  FADDER \add_58/U1_3  ( .CIN(g_input[3]), .IN0(e_input[3]), .IN1(
        \add_58/carry[3] ), .COUT(\add_58/carry[4] ), .SUM(o[3]) );
  FADDER \add_58/U1_4  ( .CIN(g_input[4]), .IN0(e_input[4]), .IN1(
        \add_58/carry[4] ), .COUT(\add_58/carry[5] ), .SUM(o[4]) );
  FADDER \add_58/U1_5  ( .CIN(g_input[5]), .IN0(e_input[5]), .IN1(
        \add_58/carry[5] ), .COUT(\add_58/carry[6] ), .SUM(o[5]) );
  FADDER \add_58/U1_6  ( .CIN(g_input[6]), .IN0(e_input[6]), .IN1(
        \add_58/carry[6] ), .COUT(\add_58/carry[7] ), .SUM(o[6]) );
  FADDER \add_58/U1_7  ( .CIN(g_input[7]), .IN0(e_input[7]), .IN1(
        \add_58/carry[7] ), .SUM(o[7]) );
endmodule

