`timescale 1ns / 1ps
// synopsys template


module aes_11cc
(
  clk,
  rst,
  g_init,
  e_init,
  o
);

  localparam            CC = 10;
  localparam            NR = 10;
  input                 clk;
  input                 rst;
  input   [127:0]       g_init; // key
  input   [127:0]       e_init; // message
  output  [127:0]       o;


  reg     [127:0]          key;
  reg     [127:0]          msg;
  reg     [3:0]            counter;

  wire    [127:0]          nextKey;
  wire    [127:0]          add_round_key_input;
  wire    [127:0]          add_round_key_out;
  wire    [127:0]          sub_byte_out;
  wire    [127:0]          shift_row_out;
  wire    [127:0]          mix_col_out;

  KeyExpansionSeq e( .key(key), .counter(counter), .nextKey(nextKey));


  always @(posedge clk or posedge rst) begin
    if (rst) begin
      key <= g_init;
      msg <= e_init;
      counter <= 0;
    end else begin
      msg <= add_round_key_out;
      counter <= counter + 1;
      key <= nextKey;
    end
  end

  reg [1:0] addr_sel;

  always @(*) begin
    if(counter==0) begin
      addr_sel = 2'b00;
    end else if (counter<10) begin
      addr_sel = 2'b01;
    end else begin
      addr_sel = 2'b11;
    end
  end

  assign add_round_key_input = (addr_sel == 2'b0) ? msg :
                               (addr_sel == 2'b1) ? mix_col_out:
                                                    shift_row_out;


  SubBytes b(.x(msg), .z(sub_byte_out));

  ShiftRows c(.x(sub_byte_out), .z(shift_row_out));

  MixColumns d(.x(shift_row_out), .z(mix_col_out));

  AddRoundKey a(.x(add_round_key_input), .y(key), .z(add_round_key_out));
  

  assign  o = add_round_key_out;


endmodule
