`include "../defined.vh"

module Inst_Mem
#
(
    parameter   W = 32,
    parameter   L = 6
)
(
  clk,
  rst,
	inst_mem_in_wire,
  pc,
  opcode
);

localparam  N = 2**L;

input clk;
input rst;
// Interface
input 	[31:2]		pc;
output  [W-1:0]  	opcode;

input 	[N*W-1:0] 	inst_mem_in_wire;

reg [W-1:0]   inst_mem_reg  [0:N-1];

//initialization
wire    [W-1:0]   inst_mem_in  [0:N-1];
genvar g;
generate
for (g=0;g<N;g=g+1)
begin:MEM_INIT
    assign inst_mem_in[g] = inst_mem_in_wire[(g+1)*W-1:g*W];
end
endgenerate

assign  opcode = inst_mem_reg[pc[L+3:2]];  

integer i;
always @(posedge clk or posedge rst) begin
  if (rst) begin
    for (i = 0; i < N; i = i + 1) begin
        inst_mem_reg[i] <= inst_mem_in[i];
    end
  end
  else begin
    for (i = 0; i < N; i = i + 1) begin
      inst_mem_reg[i] <= inst_mem_reg[i];
    end
  end
end


endmodule
