
module hamming_N128_CC1 ( clk, rst, x, y, o );
  input [127:0] x;
  input [127:0] y;
  output [7:0] o;
  input clk, rst;

  assign o[0] = 1'b0;
  assign o[1] = 1'b0;
  assign o[2] = 1'b0;
  assign o[3] = 1'b0;
  assign o[4] = 1'b0;
  assign o[5] = 1'b0;
  assign o[6] = 1'b0;
  assign o[7] = 1'b0;

endmodule

