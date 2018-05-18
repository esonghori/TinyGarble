`timescale 1ns / 1ps
`include "cordic.vh"

// synopsys_ template
module cordic
#(
  parameter DEC = 2,  // decimal points
  parameter FRAC = 14, // fraction points
  parameter MOD = `MOD_CIR, // MOD = {`MOD_CIR=1,`MOD_LIN=0,`MOD_HYP=-1}
  parameter DIR = `DIR_ROT //  DIR = {`DIR_ROT=0, `DIR_VEC=1}
)
(
  clk,
  rst,
  g_init,
  e_init,
  o,
  terminate
);
  
  localparam L = DEC + FRAC;
  localparam ITER = FRAC + 1;
  localparam LOG_ITER = $clog2(ITER);

  input clk;
  input rst;
  input [2*L-1:0] g_init; // {x, y}
  input [L-1:0] e_init; // {z}
  output [3*L-1:0] o;
  output terminate;

  wire  [L-1:0] a;
  wire  [L-1:0] b;
  wire  [L-1:0] c;
  wire          done;

  assign terminate = done;
  assign o = {a, b, c};

  reg  [L-1:0] xi;
  reg  [L-1:0] yi;
  reg  [L-1:0] zi;
  reg  [L-1:0] xd;
  reg  [L-1:0] yd;
  reg  [L-1:0] zd;
  wire [L-1:0] xs;
  wire [L-1:0] ys;
  wire [L-1:0] xi_next;
  wire [L-1:0] yi_next;
  wire [L-1:0] zi_next;

  reg  [LOG_ITER:0] iter;

  wire [L-1:0] alphai;
  wire di;
  wire [1:0] mu;



  alpha_table
  #( 
    .DEC(DEC),
    .FRAC(FRAC),
    .MOD(MOD)
  )
  _alpha_table
  (
    .iter(iter[LOG_ITER-1:0]),
    .alphai(alphai)
  );

  generate
    if(DIR==`DIR_ROT) begin :ROT
      assign di = zi[L-1];
    end else begin :VEC// if(DIR==`DIR_VEC)
      assign di = xi[L-1]&yi[L-1];
    end
  endgenerate
  

  // assign xs = (xi>>iter);
  // assign ys = (yi>>iter);

  barrel_shifter_left
  #(
    .N(L)
  )
  _barrel_shifter_left_1
  (
    .a(xi),
    .shift(iter),
    .o(xs)
  );

  barrel_shifter_left
  #(
    .N(L)
  )
  _barrel_shifter_left_2
  (
    .a(yi),
    .shift(iter),
    .o(ys)
  );

  always @(*) begin
    if(di==0) begin // di == +1
      yd = xs;
      zd = -alphai;
      if(MOD==`MOD_HYP) begin
        xd = ys;
      end else if(MOD==`MOD_LIN) begin
        xd = 0;
      end else begin //(MOD==`MOD_CIR)
        xd = -ys;
      end
    end else begin // di == -1
      yd = -xs;
      zd = alphai;
      if(MOD==`MOD_HYP) begin
        xd = -ys;
      end else if(MOD==`MOD_LIN) begin
        xd = 0;
      end else begin //(MOD==`MOD_CIR)
        xd = ys;
      end
    end
  end

  /*
  assign xi_next = xi + xd;
  assign yi_next = yi + yd;
  assign zi_next = zi + zd;
  */


  ADD
  #(
    .N(L)
  )
  _ADD_1
  ( 
    .A(xi),
    .B(xd),
    .CI(1'b0),
    .S(xi_next)
  );

  ADD
  #(
    .N(L)
  )
  _ADD_2
  ( 
    .A(yi),
    .B(yd),
    .CI(1'b0),
    .S(yi_next)
  );

  ADD
  #(
    .N(L)
  )
  _ADD_3
  ( 
    .A(zi),
    .B(zd),
    .CI(1'b0),
    .S(zi_next)
  );

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      xi <= g_init[2*L-1:L];
      yi <= g_init[L-1:0];
      zi <= e_init;
      iter <= 0;
    end else begin
      if(iter < ITER) begin
        iter <= iter + 1;
        xi <= xi_next;
        yi <= yi_next;
        zi <= zi_next;
      end
    end
  end

  assign a = xi;
  assign b = yi;
  assign c = zi;


  assign done = (iter == ITER);

endmodule
