`timescale 1ns / 1ps
// synopsys_ template
module non_secret_test
#(
  parameter N=8
)
( 
  clk,
  rst,
  g_input,
  e_input,
  o
);
  input clk, rst;
  input  [N-1:0] g_input;
  input  [N-1:0] e_input;
  output [N-1:0] o;
  
  reg sel;
  wire [N-1:0] o_add;
  wire [N-1:0] o_sub;


  always @(posedge clk or posedge rst) begin
    if (rst) begin
      sel <= 1'b0;
    end else begin
      sel <= ~sel;
    end
  end

  //assign o = (sel)?(g_input+e_input):(g_input-e_input);

  ADD 
  #(
    .N(N)
  )
  _ADD 
  (
    .A(g_input),
    .B(e_input),
    .CI(1'b0),
    .S(o_add)
  );

  SUB 
  #(
    .N(N)
  )
  _SUB 
  (
    .A(g_input),
    .B(e_input),
    .S(o_sub)
  );

  MUX 
  #(
    .N(N)
  )
  _MUX 
  (
    .A(o_add),
    .B(o_sub),
    .S(sel),
    .O(o)
  );


endmodule

