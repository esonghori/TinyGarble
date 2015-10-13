`include "../defined.vh"

module Inst_Mem
#
(
    parameter   W = 32,
    parameter   L = 6
)
(
	inst_mem_in_wire,
    pc,
    opcode
);

localparam  N = 2**L;


// Interface
input 	[31:2]		pc;
output  [W-1:0]  	opcode;

input 	[N*W-1:0] 	inst_mem_in_wire;

//initialization
wire    [W-1:0]   inst_mem_in  [0:N-1];
genvar g;
generate
for (g=0;g<N;g=g+1)
begin:MEM_INIT
    assign inst_mem_in[g] = inst_mem_in_wire[(g+1)*W-1:g*W];
end
endgenerate

assign  opcode = inst_mem_in[pc[L+3:2]];  //TODO add DFF instead of MUX

endmodule
