
module compare_N16384_CC16384 ( clk, rst, g_input, e_input, o );
  input [0:0] g_input;
  input [0:0] e_input;
  input clk, rst;
  output o;
  wire   ci, n3;

  DFF ci_reg ( .D(o), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  MUX U5 ( .IN0(g_input[0]), .IN1(ci), .SEL(n3), .F(o) );
  XOR U6 ( .A(e_input[0]), .B(ci), .Z(n3) );
endmodule

