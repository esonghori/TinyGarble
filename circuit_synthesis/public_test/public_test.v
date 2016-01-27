`timescale 1ns / 1ps
// synopsys_ template
module public_test
#(
  parameter N=8
)
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
  
  input  [N-1:0] p_init;
  input  [N-1:0] g_init;
  input  [N-1:0] e_init;

  input  [N-1:0] p_input;
  input  [N-1:0] g_input;
  input  [N-1:0] e_input;
  output [N-1:0] o;
  

  reg [N-1:0] p_reg;
  reg [N-1:0] g_reg;
  reg [N-1:0] e_reg;
  

  always@(posedge clk or posedge rst)
  begin
    if(rst) begin
      p_reg <= p_init;
      g_reg <= g_init;
      e_reg <= e_init;
    end else begin
      p_reg <= p_input ^ p_reg;
      g_reg <= g_input ^ g_reg;
      e_reg <= e_input ^ e_reg;
    end
  end

  assign o = ((p_input ^ p_reg)^ (g_input ^ g_reg))^(e_input ^ e_reg);

endmodule

