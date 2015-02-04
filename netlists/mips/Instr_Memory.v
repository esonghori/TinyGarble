// UCA 2010
//=========================================================
// Instruction memory (read-only)
//=========================================================

module Instr_Memory
#
(
    parameter   W = 32,
    parameter   L = 6
)
(
	inst_mem_in_wire,
    addr,
    instr
);

localparam  N = 2**L;


// Interface
input   [L+1:0]  addr;
output  [W-1:0]  instr;

input [N*W-1:0] inst_mem_in_wire;

//initialization
wire    [W-1:0]   inst_mem_in  [0:N-1];
genvar g;
generate
for (g=0;g<N;g=g+1)
begin:MEM_INIT
    assign inst_mem_in[g] = inst_mem_in_wire[(g+1)*W-1:g*W];
end
endgenerate


// Instruction memory is byte-addressable, instructions are word-aligned
// Instruction memory with 256 32-bit words
// Instruction address range: 0x0000 ~ 0x03FC

assign  instr = inst_mem_in[addr>>2];  

endmodule
