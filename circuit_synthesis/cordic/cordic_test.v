`include "cordic.vh"

module cordic_test();

  localparam DEC = 2;
  localparam FRAC = 14;
  localparam MOD = `MOD_CIR;
  localparam DIR = `DIR_ROT;
  localparam L = DEC + FRAC;

  reg clk;
  reg rst;
  reg  [L-1:0] x;
  reg  [L-1:0] y;
  reg  [L-1:0] z;
  wire [L-1:0] a;
  wire [L-1:0] b;
  wire [L-1:0] c;
  wire done;

  cordic
  #(
    .DEC(DEC),
    .FRAC(FRAC),
    .MOD(MOD),
    .DIR(DIR)
  )
  _cordic_
  (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y),
    .z(z),
    .a(a),
    .b(b),
    .c(c),
    .done(done)
  );

  always 
    #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    x = 16'h4000; // 1
    y = 0;
    z = 16'h2182; // 30 deg
    #10
    rst = 0;
    wait(done==1) 
    #5
    $stop;
  end

endmodule
