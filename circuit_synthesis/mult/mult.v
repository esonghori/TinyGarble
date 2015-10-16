`timescale 1ns / 1ps

module mult
#(
  parameter N=128,
  parameter CC=1
)
( 
  clk,
  rst,
  g_input,
  e_input,
  o
);
  input  clk;
  input  rst;
  input  [N-1:0] g_input;
  input  [N/CC-1:0] e_input;
  output [2*N-1:0] o;
  
  reg [2*N-1:0] sreg;
  wire [2*N-1:0] swire;

  wire [N+N/CC-1:0] clocal;

  assign clocal = g_input*e_input;
  //MULT



  generate
  if(CC>1)
    assign swire  = sreg + {clocal,{(N-N/CC){1'b0}}};
  endgenerate

  generate
  if(CC>1)
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        sreg <= 'b0;
      end
      else
      begin
        sreg <= {{N/CC{1'b0}},swire[2*N-1:N/CC]};     
      end
    end
  endgenerate

  generate 
  if(CC>1)
    assign o = swire;
  else
    assign o = clocal;
  endgenerate
endmodule
