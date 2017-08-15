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
  input  [N-1:0] e_input;
  output [N-1:0] o;

//   input  [N/CC-1:0] e_input;
//   output [2*N-1:0] o;
  
//   reg [2*N-1:0] sreg;
//   wire [2*N-1:0] swire;

//   wire [N+N/CC-1:0] clocal;

//   assign clocal = g_input*e_input;

  wire [2*N-1:0] o_large;
  assign o = o_large[N-1:0];

  MULT 
  #(
    .N(N), 
    .M(N/CC)
  ) u_MULT ( 
    .A(g_input),
    .B(e_input),
    .O(o_large)
  );  



//   generate
//   if(CC>1) begin:g1
//     assign swire  = sreg + {clocal,{(N-N/CC){1'b0}}};
//   end 
//   endgenerate

//   generate
//   if(CC>1) begin:g2
//     always@(posedge clk or posedge rst) begin
//       if(rst) begin
//         sreg <= 'b0;
//       end else begin
//         sreg <= {{N/CC{1'b0}},swire[2*N-1:N/CC]};     
//       end
//     end
//   end
//   endgenerate

//   generate 
//   if(CC>1) begin :g3
//     assign o = swire;
//   end else begin :g4
//     assign o = clocal;
//   end
//   endgenerate
endmodule
