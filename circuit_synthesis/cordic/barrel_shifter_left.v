`timescale 1ns / 1ps
`include "cordic.vh"

// synopsys_ template
module barrel_shifter_left
#(
  parameter N=16
)
(
  a,
  shift,
  o
);

  localparam LOG_N = $clog2(N);

  input [N-1:0] a;
  input [LOG_N:0] shift;
  output [N-1:0] o;


  wire [N-1:0] ai[LOG_N+1:0];

  assign ai[0] = a;

  genvar i;
  generate
    for (i = 0; i < LOG_N+1; i = i + 1) begin: ASSIGN
      assign ai[i+1] = (shift[i])?(ai[i]>>2**i):(ai[i]);
    end
  endgenerate

  assign o = ai[LOG_N+1];

endmodule
