
module sum ( clk, rst, g_init, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  output [0:0] o;
  input clk, rst, g_init;
  wire   carry_on, carry_on_d, n1;

  DFF DU1 ( .D(carry_on_d), .CLK(clk), .RST(rst), .I(g_init), .Q(carry_on) );
  FADDER U1  ( .CIN(carry_on), .IN0(g_input), .IN1(e_input), .COUT(carry_on_d), .SUM(o) );
endmodule

