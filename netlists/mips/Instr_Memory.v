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
	instructions_init,
    addr,
    instr
);

localparam  N = 2**L;


// Interface
input   [L+1:0]  addr;
output  [W-1:0]  instr;

input [N*W-1:0] instructions_init;

//initialization
wire    [W-1:0]   instructions_init_wire  [0:N-1];
genvar g;
generate
for (g=0;g<N;g=g+1)
begin:MEM_INIT
    assign instructions_init_wire[g] = instructions_init[(g+1)*W-1:g*W];
end
endgenerate


// Instruction memory is byte-addressable, instructions are word-aligned
// Instruction memory with 256 32-bit words
// Instruction address range: 0x0000 ~ 0x03FC

assign  instr = instructions_init_wire[addr>>2];  

endmodule
