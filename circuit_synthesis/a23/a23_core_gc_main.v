module a23_core_gc_main
(
  input           clk,
  input           rst,
  input  [31:0]   g_input,
  input  [31:0]   e_input,
  output [100:0]  o
);

wire   [31:0]             dm_address;
wire   [31:0]             dm_write;
wire                      dm_write_en;
wire   [3:0]              dm_byte_enable;
wire   [31:0]             dm_read;
wire   [31:0]             im_address;
wire   [31:0]             im_read;

a23_core u_a23_core
(
  .i_clk             (clk             ),
  .i_rst             (rst             ),
  .o_dm_address      (dm_address      ),
  .o_dm_write        (dm_write        ),
  .o_dm_write_en     (dm_write_en     ),
  .o_dm_byte_enable  (dm_byte_enable  ),
  .i_dm_read         (dm_read         ),
  .o_im_address      (im_address      ),
  .i_im_read         (im_read         )
);

assign o = {dm_address, dm_write, dm_write_en, dm_byte_enable, im_address};

assign dm_read = g_input;
assign im_read = e_input;

endmodule