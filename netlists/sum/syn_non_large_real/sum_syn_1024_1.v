
module sum_N1024_CC1 ( clk, rst, a, b, c );
  input [1023:0] a;
  input [1023:0] b;
  output [1023:0] c;
  input clk, rst;

  tri   \*Logic0* ;
  tri   [1023:0] a;
  tri   [1023:0] b;
  tri   [1023:0] c;

  ADD ADD_ ( .a(a), .b(b), .ci(1'b0), .s(c) );
endmodule

