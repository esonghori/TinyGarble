`timescale 1ns / 1ps

module a23_testbench();

localparam CODE_MEM_SIZE  = 64; //_start:    0x00000000
localparam G_MEM_SIZE     = 64; //AdrAliceX: 0x01000000
localparam E_MEM_SIZE     = 64; //AdrBobY:   0x02000000
localparam OUT_MEM_SIZE   = 64; //AdrOutZ:   0x03000000
localparam STACK_MEM_SIZE = 64; //AdrStack:  0x04000100
localparam TEST_NAME      = "sum";

reg                            clk;
reg                            rst;
wire  [CODE_MEM_SIZE*32-1:0]   p_init;
wire  [G_MEM_SIZE   *32-1:0]   g_init;
wire  [E_MEM_SIZE   *32-1:0]   e_init;
wire  [OUT_MEM_SIZE *32-1:0]   o;
wire                           terminate;

genvar i;
integer cc;

a23_gc_main_CODE_MEM_SIZE64_G_MEM_SIZE64_E_MEM_SIZE64_OUT_MEM_SIZE64_STACK_MEM_SIZE64
// a23_gc_main
// #
// (
//   .CODE_MEM_SIZE   ( CODE_MEM_SIZE  ),
//   .G_MEM_SIZE      ( G_MEM_SIZE     ),
//   .E_MEM_SIZE      ( E_MEM_SIZE     ),
//   .OUT_MEM_SIZE    ( OUT_MEM_SIZE   ),
//   .STACK_MEM_SIZE  ( STACK_MEM_SIZE )
// )
u_a23_gc_main
(
  .clk       ( clk       ),
  .rst       ( rst       ),
  .p_init    ( p_init    ),
  .g_init    ( g_init    ),
  .e_init    ( e_init    ),
  .o         ( o         ),
  .terminate ( terminate )
);

reg  [31:0] p_init_reg  [CODE_MEM_SIZE  -1:0];
reg  [31:0] g_init_reg  [G_MEM_SIZE     -1:0];
reg  [31:0] e_init_reg  [E_MEM_SIZE     -1:0];
reg  [31:0] o_word_wire [OUT_MEM_SIZE   -1:0];

generate
  for (i = 0; i < CODE_MEM_SIZE; i = i + 1)begin: code_gen
    assign p_init[32*(i+1)-1:32*i] = p_init_reg[i];
  end
  for (i = 0; i < G_MEM_SIZE; i = i + 1)begin: g_gen
    assign g_init[32*(i+1)-1:32*i] = g_init_reg[i];
  end
  for (i = 0; i < E_MEM_SIZE; i = i + 1)begin: e_gen
    assign e_init[32*(i+1)-1:32*i] = e_init_reg[i];
  end
  for (i = 0; i < OUT_MEM_SIZE; i = i + 1)begin: o_gen
    always@* o_word_wire[i] = o[32*(i+1)-1:32*i];
  end
endgenerate

initial
begin
  clk = 0;
  rst = 1;
  cc = 0;

  $readmemh($sformatf("../../../a23/%s/p.txt", TEST_NAME),      p_init_reg);
  $readmemh($sformatf("../../../a23/%s/test/g.txt", TEST_NAME), g_init_reg);
  $readmemh($sformatf("../../../a23/%s/test/e.txt", TEST_NAME), e_init_reg);
  #28
  rst = 0;
  while (~terminate) begin
    @(posedge clk);
    cc = cc +1;
  end
  $writememh("./o.txt.out", o_word_wire);
  $display("Terminate at %dcc\n", cc);
  $stop;
end

always  #5  clk=~clk;




endmodule
