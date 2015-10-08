
module sum_N4_CC4 ( clk, rst, g_init, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [0:0] o;
  input clk, rst, g_init;
  wire   carry_on, carry_on_d, n1;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(g_init), .Q(
        carry_on) );
  MUX U3 ( .IN0(carry_on), .IN1(e_input[0]), .SEL(n1), .F(carry_on_d) );
  XOR U4 ( .A(e_input[0]), .B(n1), .Z(o[0]) );
  XOR U5 ( .A(carry_on), .B(g_input[0]), .Z(n1) );
endmodule

