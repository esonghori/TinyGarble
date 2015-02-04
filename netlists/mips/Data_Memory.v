// UCA 2010
//=========================================================
// Data memory
//=========================================================

//REMOVED BYTE ADDRESSABILITY

module Data_Memory
#
(
    parameter   W = 32,
    parameter   L = 6
)
(
    clk,
    rst,
    mem_init,
    mem_out,
    addr,
    data_in,
    MemRead,
    MemWrite,
    data_out
);

localparam  N = 2**L;


// Interface
input               clk;
input               rst;
input   [W*N-1:0]   mem_init;
output  [W*N-1:0]   mem_out;
input   [L+1:0]     addr;
input   [W-1:0]     data_in;
input               MemRead;
input               MemWrite;
output  [W-1:0]     data_out;


reg     [W-1:0]     memory  [0:N-1];


genvar g;
// initialization
wire    [W-1:0]     mem_init_wire  [0:N-1];
generate
for (g = 0; g < N; g = g + 1)
begin:MEM_INIT
    assign mem_init_wire[g] = mem_init[(g+1)*W-1:g*W];
end
endgenerate


//mem output
generate
for (g = 0; g < N; g = g + 1)
begin:MEM_OUT
    assign mem_out[(g+1)*W-1:g*W] = memory[g];
end
endgenerate



integer i;
// Write Data      
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        for(i=0;i<N;i=i+1)
        begin
            memory[i] <=  mem_init_wire[i]; //TODO: why doesn't it work!?          
        end
    end
    else if (MemWrite)
    begin
        memory[addr>>2] <= data_in;
        /*
        memory[addr+3] <= data_in[4*W-1:3*W];
        memory[addr+2] <= data_in[3*W-1:2*W];
        memory[addr+1] <= data_in[2*W-1:1*W];
        memory[addr+0] <= data_in[1*W-1:0*W];
        */
    end
end

// Read Data      
//assign  data_out = {memory[addr+3], memory[addr+2], memory[addr+1], memory[addr + 0]};//(MemRead) ? {memory[addr+3], memory[addr+2], memory[addr+1], memory[addr + 0]} : {4*W{1'b0}}; //Required extera 32 AND
assign  data_out = memory[addr>>2];//(MemRead) ? {memory[addr+3], memory[addr+2], memory[addr+1], memory[addr + 0]} : {4*W{1'b0}}; //Required extera 32 AND

endmodule
