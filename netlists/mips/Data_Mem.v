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


    reg     [W-1:0]     data_out;
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
                memory[i] <= data_mem_in[i];          
            end
        end
        else if (mem_source == `MEM_WRITE32)
        begin
            memory[addr[L+1:2]] <= data_in;
        end
        else if (mem_source == `MEM_WRITE16)
        begin
            if(addr[1]==1'b0)
                memory[addr[L+1:2]][15:0] <= data_in[15:0];
            else if (addr[1]==1'b1)
                memory[addr[L+1:2]][31:16] <= data_in[15:0];
        end
        else if (mem_source == `MEM_WRITE8)
        begin
            if(addr[1:0]==2'b00)
                memory[addr[L+1:2]][7:0] <= data_in[7:0];
            else if(addr[1:0]==2'b01)
                memory[addr[L+1:2]][15:8] <= data_in[7:0];
            else if(addr[1:0]==2'b10)
                memory[addr[L+1:2]][23:16] <= data_in[7:0];
            else if(addr[1:0]==2'b11)
                memory[addr[L+1:2]][31:24] <= data_in[7:0];
        end
    end


    always@(*)
    begin
        data_out <= 32'b0;
        case(mem_source)
        `MEM_READ32 :
        begin
            data_out <= memory[addr[L+1:2]];
        end
        `MEM_READ16 :
        begin     
            if(addr[1]==1'b0)
                data_out <= {16'b0, memory[addr[L+1:2]][15:0]};
            else if (addr[1]==1'b1)
                data_out <= {16'b0, memory[addr[L+1:2]][31:16]};
        end
        `MEM_READ16S:
        begin
            if(addr[1]==1'b0)
                data_out <= {{16{memory[addr[L+1:2]][15]}}, memory[addr[L+1:2]][15:0]};
            else if (addr[1]==1'b1)
                data_out <= {{16{memory[addr[L+1:2]][16]}}, memory[addr[L+1:2]][31:16]};
        end
        `MEM_READ8  :
        begin
            if(addr[1:0]==2'b00)
                data_out <= {24'b0, memory[addr[L+1:2]][7:0]};
            else if(addr[1:0]==2'b01)
                data_out <= {24'b0, memory[addr[L+1:2]][15:8]};
            else if(addr[1:0]==2'b10)
                data_out <= {24'b0, memory[addr[L+1:2]][23:16]};
            else if(addr[1:0]==2'b11)
                data_out <= {24'b0, memory[addr[L+1:2]][31:24]};
        end
        `MEM_READ8S :
        begin
            if(addr[1:0]==2'b00)
                data_out <= {{24{memory[addr[L+1:2]][7]}}, memory[addr[L+1:2]][7:0]};
            else if(addr[1:0]==2'b01)
                data_out <= {{24{memory[addr[L+1:2]][7]}}, memory[addr[L+1:2]][15:8]};
            else if(addr[1:0]==2'b10)
                data_out <= {{24{memory[addr[L+1:2]][7]}}, memory[addr[L+1:2]][23:16]};
            else if(addr[1:0]==2'b11)
                data_out <= {{24{memory[addr[L+1:2]][7]}}, memory[addr[L+1:2]][31:24]};
        end
        default:
            data_out <= 32'b0;
        endcase
    end

endmodule
