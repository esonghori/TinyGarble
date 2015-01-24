
module sum_N16384_CC1 ( clk, rst, a, b, c );
  input [16383:0] a;
  input [16383:0] b;
  output [16383:0] c;
  input clk, rst;

  tri   \*Logic0* ;
  tri   [16383:0] a;
  tri   [16383:0] b;
  tri   [16383:0] c;

  ADD ADD_ ( .A(a), .B(b), .CI(1'b0), .S(c) );
endmodule

