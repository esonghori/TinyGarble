`timescale 1ns / 1ps

// synopsys_ template
module SHIFT_RIGHT
#(
  parameter N=16
)
(
  a,
  shift_amount,
  o
);

  localparam LOG_N = $clog2(N);

  input [N-1:0] a;
  input [LOG_N:0] shift_amount;
  output [N-1:0] o;


  wire [N-1:0] ai[LOG_N+1:0];

  assign ai[0] = a;

  genvar i;
  generate
    for (i = 0; i < LOG_N+1; i = i + 1) begin: ASSIGN
      assign ai[i+1] = (shift_amount[i])?(ai[i]<<2**i):(ai[i]);
    end
  endgenerate

  assign o = ai[LOG_N+1];

endmodule
