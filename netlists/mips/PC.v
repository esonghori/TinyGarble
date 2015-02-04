// UCA 2010
//=========================================================
// Programer counter
//=========================================================

module PC
#(
    parameter W=32
)
(
    clk,
    rst,
    pc_in,
    pc_out
);

// Interface
input           clk;
input           rst;
input   [W-1:0] pc_in;
output  [W-1:0] pc_out;

// Wire/Reg
reg     [W-1:0] pc_out;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        pc_out <= 32'b0;
    end
    else
    begin
        pc_out <= pc_in;
    end
end

endmodule
