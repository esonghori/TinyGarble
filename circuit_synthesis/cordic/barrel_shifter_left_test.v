`include "cordic.vh"

module barrel_shifter_left_test();

  localparam N = 16;
  localparam LOG_N = $clog2(N);

  reg  [N-1:0] a;
  reg  [LOG_N:0] shift;
  wire [N-1:0] o;

  barrel_shifter_left
  #(
    .N(N)
  )
  _barrel_shifter_left_
  (
    .a(a),
    .shift(shift),
    .o(o)
  );

  initial begin
    a = 16'hAAAA;
    shift = 5'h00;
    #10
    shift = 5'h01;
    #10
    shift = 5'h02;
    #10
    shift = 5'h0F;
    #10
    shift = 5'h10;
    #10
    $stop;
  end

endmodule