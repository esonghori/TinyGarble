// UCA 2010
//=========================================================
// MIPS general purpose registers
//=========================================================

module Register_File(
    clk,
    rst,
    Rs_addr,
    Rt_addr,
    Rd_addr, 
    Rd_data,
    RegWrite, 
    Rs_data, 
    Rt_data 
);

parameter W = 32;
parameter L = 5;
localparam N = 2**L;

// Interface
input           clk;
input           rst;
input   [L-1:0] Rs_addr;
input   [L-1:0] Rt_addr;
input   [L-1:0] Rd_addr;
input   [W-1:0] Rd_data;
input           RegWrite;
output  [W-1:0] Rs_data; 
output  [W-1:0] Rt_data;

// Register file has 32 32-bit registers
reg     [W-1:0] register    [0:N-1];

// Read Data      
assign  Rs_data = register[Rs_addr]; //(Rs_addr == {L{1'b0}}) ? {W{1'b0}} : register[Rs_addr]; //Reqired extera AND
assign  Rt_data = register[Rt_addr]; //(Rt_addr == {L{1'b0}}) ? {W{1'b0}} : register[Rt_addr]; //Reqired extera AND

integer i;
// Write Data   
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        for(i=0;i<N;i=i+1)
        begin
            register[i] <= {W{1'b0}};                
        end        
    end
    else if(RegWrite && (Rd_addr != {L{1'b0}}))
    begin
        register[Rd_addr] <= Rd_data;
    end
end
   
endmodule 
