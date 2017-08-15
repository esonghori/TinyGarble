`timescale 1ns / 1ps
// synopsys_ template
module public_test
( 
  clk,
  rst,
  p_init,
  g_init,
  e_init,
  p_input,
  g_input,
  e_input,
  o
);
  
  input clk, rst;
  
  input  [7:0]  p_init;
  input  [15:0] g_init;
  input  [31:0] e_init;

  input  [31:0] p_input;
  input  [15:0] g_input;
  input  [7:0]  e_input;
  output [31:0] o;
  

  reg [7:0]  reg_1;
  reg [15:0] reg_2;
  reg [31:0] reg_3;
  
  wire [31:0] o1;
  wire [31:0] o2;
  wire [31:0] o3;

  always@(posedge clk or posedge rst)
  begin
    if(rst) begin
      reg_1 <= p_init;
      reg_2 <= g_init;
      reg_3 <= e_init;
    end else begin
      reg_1 <= e_input ^ reg_1;
      reg_2 <= g_input ^ reg_2;
      reg_3 <= p_input ^ reg_3;
    end
  end

  assign o1 = {24'b0, e_input ^ reg_1};
  assign o2 = {16'b0, g_input ^ reg_2};
  assign o3 = p_input ^ reg_3;
  assign o  = o1 ^ o2 ^ o3;

endmodule

