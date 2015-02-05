// UCA 2010
//=========================================================
// Data memory
//=========================================================

//REMOVED BYTE ADDRESSABILITY

`include "../defined.vh"


module Data_Mem
#
(
    parameter   W = 32,
    parameter   L = 6
)
(
    clk,
    rst,
    data_mem_in_wire,
    data_mem_out_wire,
    mem_source,
    addr,
    data_in,
    data_out
);

    localparam  N = 2**L;


    // Interface
    input               clk;
    input               rst;
    input   [W*N-1:0]   data_mem_in_wire;
    output  [W*N-1:0]   data_mem_out_wire;
    input   [3:0]       mem_source;
    input   [31:0]      addr;
    input   [W-1:0]     data_in;
    output  [W-1:0]     data_out;


    reg     [W-1:0]     memory  [0:N-1];


    genvar g;
    // initialization
    wire    [W-1:0]     data_mem_in  [0:N-1];
    generate
    for (g = 0; g < N; g = g + 1)
    begin:MEM_IN_WIRE
        assign data_mem_in[g] = data_mem_in_wire[(g+1)*W-1:g*W];
    end
    endgenerate


    //mem output
    generate
    for (g = 0; g < N; g = g + 1)
    begin:MEM_OUT_WIRE
        assign data_mem_out_wire[(g+1)*W-1:g*W] = memory[g];
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
                memory[i] <=  data_mem_in[i]; //TODO: why doesn't it work!?          
            end
        end
        else if (mem_source == `MEM_WRITE32 || mem_source == `MEM_WRITE16 || mem_source == `MEM_WRITE8)
        begin
            memory[addr[L+1:2]] <= data_in;

        end
    end

    assign  data_out = memory[addr[L+1:2]];//TODO check

endmodule
