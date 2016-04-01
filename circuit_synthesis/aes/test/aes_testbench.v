`timescale 1ns / 1ps
// synopsys template

module aes_testbench();

localparam CC = 1;

wire clk;
wire rst;

wire [127:0] g_input;
wire [127:0] e_input;
wire [127:0] o;

aes_comb utt_aes_comb
(
  .clk(clk),
  .rst(rst),
  .g_input(g_input),
  .e_input(e_input),
  .o(o)
);

assign clk = 0;
assign rst = 0;
assign g_input = 128'h98677fafd6adb70c59e8d947c971150f;
assign e_input = 128'h00000000000000000000000000000000;

wire [127:0] x;
wire [127:0] z;

initial begin
  #5
  $stop;
end



endmodule
