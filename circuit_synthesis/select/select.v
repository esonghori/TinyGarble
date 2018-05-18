`timescale 1ps / 1ps

module select
#(
  parameter M  =128,
  parameter W  =7
)
(
  clk,
  rst,
  read_adr,
  read_data,
  write_adr,
  write_data,
  write_en,
  write_adr2,
  write_data2,
  write_en2,
  write_adr3,
  write_data3,
  write_en3
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);

  input clk,rst;

  input [logM-1:0] read_adr;
  output [W-1:0] read_data;
  input [logM-1:0] write_adr;
  input [W-1:0] write_data;
  input write_en;
  input [logM-1:0] write_adr2;
  input [W-1:0] write_data2;
  input write_en2;
  input [logM-1:0] write_adr3;
  input [W-1:0] write_data3;
  input write_en3;

  reg [W-1:0] mem_matrix [M-1:0];

  integer i;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for(i=0;i<M;i=i+1) begin
        mem_matrix[i] <= 0;
      end
    end else if(write_en) begin
      mem_matrix[write_adr] <= write_data;
    end else if(write_en2) begin
      mem_matrix[write_adr2] <= write_data2;
    end else if(write_en3) begin
      mem_matrix[write_adr3] <= write_data3;
    end

  end

  assign read_data = mem_matrix[read_adr];

endmodule
