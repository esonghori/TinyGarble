module test4 ( clk, rst, g_input, e_input, o );
  input [15:0] g_input;
  input e_input;
  output [7:0] o;
  input clk, rst;

  MUX U1 ( .IN0(g_input[0]), .IN1(g_input[8]), .SEL(e_input), .F(o[0]) );
  MUX U2 ( .IN0(g_input[1]), .IN1(g_input[9]), .SEL(e_input), .F(o[1]) );
  MUX U3 ( .IN0(g_input[2]), .IN1(g_input[10]), .SEL(e_input), .F(o[2]) );
  MUX U4 ( .IN0(g_input[3]), .IN1(g_input[11]), .SEL(e_input), .F(o[3]) );
  MUX U5 ( .IN0(g_input[4]), .IN1(g_input[12]), .SEL(e_input), .F(o[4]) );
  MUX U6 ( .IN0(g_input[5]), .IN1(g_input[13]), .SEL(e_input), .F(o[5]) );
  MUX U7 ( .IN0(g_input[6]), .IN1(g_input[14]), .SEL(e_input), .F(o[6]) );
  MUX U8 ( .IN0(g_input[7]), .IN1(g_input[15]), .SEL(e_input), .F(o[7]) );
endmodule