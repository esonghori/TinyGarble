`timescale 1ns / 1ps
// synopsys template

module aes_testbench();

  localparam CC = 1;

  wire clk;
  wire rst;

  wire [127:0] g_input;
  wire [127:0] e_input;
  wire [127:0] o;

  aes_1cc utt_aes_comb
  (
    .clk(clk),
    .rst(rst),
    .g_input(g_input),
    .e_input(e_input),
    .o(o)
  );

  assign clk = 0;
  assign rst = 0;
  assign g_input = 128'h00000000000000000000000000000000;
  assign e_input = 128'h00000000000000000000000000000000;


  initial begin
    #5
    $stop;
  end

endmodule


module aes_testbench_seq();

  localparam CC = 1;

  reg clk;
  reg rst;

  wire [127:0] g_init;
  wire [127:0] e_init;
  wire [127:0] o;

  aes_11cc utt_aes_seq
  (
    .clk(clk),
    .rst(rst),
    .g_init(g_init),
    .e_init(e_init),
    .o(o)
  );


  assign g_init = 128'h00000000000000000000000000000000;
  assign e_init = 128'h00000000000000000000000000000000;

  integer i;
  initial begin
    clk =1;
    rst =1;
    #3
    rst =0;
    for(i=0;i<11;i=i+1) begin
      @(posedge clk);
    end
    $stop;
  end

  always #5 clk = ~clk;

endmodule