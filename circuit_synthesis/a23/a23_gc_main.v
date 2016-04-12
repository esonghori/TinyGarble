
module a23_gc_main
#
(
  // mem size in words (32bit)
  parameter CODE_MEM_SIZE  = 64  ,   //_start:       0x00000000
  parameter G_MEM_SIZE     = 64  ,   //AdrGarbler:   0x01000000
  parameter E_MEM_SIZE     = 64  ,   //AdrEvaluator: 0x02000000
  parameter OUT_MEM_SIZE   = 64  ,   //AdrOut:       0x03000000
  parameter STACK_MEM_SIZE = 1024    //AdrStack:     0x04001000
)
(
  input                           clk,
  input                           rst,
  input  [CODE_MEM_SIZE*32-1:0]   p_init,
  input  [G_MEM_SIZE   *32-1:0]   g_init,
  input  [E_MEM_SIZE   *32-1:0]   e_init,
  output [OUT_MEM_SIZE *32-1:0]   o
);

wire   [31:0]             o_dm_address;
wire   [31:0]             o_dm_write;
wire                      o_dm_write_en;
wire   [3:0]              o_dm_byte_enable;
wire   [31:0]              i_dm_read;        

wire   [31:0]             o_im_address;
wire   [31:0]              i_im_read;


reg [31:0] p_mem     [CODE_MEM_SIZE-1:0];
reg [7:0]  g_mem     [4*G_MEM_SIZE-1:0];
reg [7:0]  e_mem     [4*E_MEM_SIZE-1:0];
reg [7:0]  out_mem   [4*OUT_MEM_SIZE-1:0];
reg [7:0]  stack_mem [4*STACK_MEM_SIZE-1:0];

genvar gi;

a23_core u_a23_core
(
  .i_clk             (clk               ),
  .i_rst             (rst               ),
  .o_dm_address      (o_dm_address      ),       
  .o_dm_write        (o_dm_write        ),     
  .o_dm_write_en     (o_dm_write_en     ),        
  .o_dm_byte_enable  (o_dm_byte_enable  ),           
  .i_dm_read         (i_dm_read         ),    
  .o_im_address      (o_im_address      ),       
  .i_im_read         (i_im_read         )   
);

// instruction memory
wire [31:0] p_init_word [CODE_MEM_SIZE-1:0];
wire [7:0] g_init_byte [4*G_MEM_SIZE-1:0];
wire [7:0] e_init_byte [4*E_MEM_SIZE-1:0];
generate
  for (gi = 0; gi < CODE_MEM_SIZE; gi = gi + 1) begin:code_gen
    assign p_init_word[gi] = p_init[32*(gi+1)-1:32*gi];
  end
  for (gi = 0; gi < 4*G_MEM_SIZE; gi = gi + 1)begin: g_gen
    assign g_init_byte[gi] = g_init[8*(gi+1)-1:8*gi];
  end
  for (gi = 0; gi < 4*E_MEM_SIZE; gi = gi + 1)begin: e_gen
    assign e_init_byte[gi] = e_init[8*(gi+1)-1:8*gi];
  end
  for (gi = 0; gi < 4*OUT_MEM_SIZE; gi = gi + 1) begin:out_gen
    assign o[8*(gi+1)-1:8*gi] = out_mem[gi];
  end
endgenerate


wire [23:0] trunc_dm_address;
wire [23:0] trunc_im_address;
assign trunc_dm_address = o_dm_address[23:0];
assign trunc_im_address = o_im_address[23:0];

assign i_im_read = (o_im_address[31:24] == 8'h00) ? p_mem[trunc_im_address[23:2]]     : //_start:    0x00000000
                                                    32'b0; // NOP AND r0,r0,r0

assign  i_dm_read = (o_dm_address[31:24] == 8'h01) ? {g_mem[trunc_dm_address+3], g_mem[trunc_dm_address+2], g_mem[trunc_dm_address+1], g_mem[trunc_dm_address]}  ://AdrAliceX: 0x01000000
                    (o_dm_address[31:24] == 8'h02) ? {e_mem[trunc_dm_address+3], e_mem[trunc_dm_address+2], e_mem[trunc_dm_address+1], e_mem[trunc_dm_address]}  ://AdrBobY:   0x02000000
                    (o_dm_address[31:24] == 8'h03) ? {out_mem[trunc_dm_address+3], out_mem[trunc_dm_address+2], out_mem[trunc_dm_address+1], out_mem[trunc_dm_address]}  ://AdrOutZ:   0x03000000
                    (o_dm_address[31:24] == 8'h04) ? {stack_mem[trunc_dm_address+3], stack_mem[trunc_dm_address+2], stack_mem[trunc_dm_address+1], stack_mem[trunc_dm_address]}  ://AdrStack:  0x04000000
                    (o_dm_address[31:24] == 8'h00) ? p_mem[trunc_dm_address[23:2]]: //TODO: what about reading one byte?
                                                     32'b0;

integer i;
always @(posedge clk or posedge rst) begin
  if (rst) begin
    for(i=0;i<CODE_MEM_SIZE;i=i+1) begin
      p_mem[i] <= p_init_word[i];
    end
    for(i=0;i<4*G_MEM_SIZE;i=i+1) begin
      g_mem[i] <= g_init_byte[i];
    end
    for(i=0;i<4*E_MEM_SIZE;i=i+1) begin
      e_mem[i] <= e_init_byte[i];
    end
    for(i=0;i<4*OUT_MEM_SIZE;i=i+1) begin
      out_mem[i] <= 8'b0;
    end
    for(i=0;i<4*STACK_MEM_SIZE;i=i+1) begin
      stack_mem[i] <= 8'b0;
    end
  end else begin
    for(i=0;i<CODE_MEM_SIZE;i=i+1) begin
      p_mem[i] <= p_mem[i];
    end
    for(i=0;i<4*G_MEM_SIZE;i=i+1) begin
      g_mem[i] <= g_mem[i];
    end
    for(i=0;i<4*E_MEM_SIZE;i=i+1) begin
      e_mem[i] <= e_mem[i];
    end
    if (o_dm_write_en) begin
      if(o_dm_address[31:24] == 8'h03) begin //AdrOutZ:   0x03000000
        case(o_dm_byte_enable)
        4'b1111: begin
          out_mem[trunc_dm_address+3] <= o_dm_write[31:24];
          out_mem[trunc_dm_address+2] <= o_dm_write[23:16];
          out_mem[trunc_dm_address+1] <= o_dm_write[15:8];
          out_mem[trunc_dm_address+0] <= o_dm_write[7:0];
        end 
        4'b0001, 4'b0010, 4'b0100, 4'b1000: out_mem[trunc_dm_address] <= o_dm_write[7:0];
        endcase
      end else if (o_dm_address[31:24] == 8'h04) begin //AdrStack:  0x04000000
        case(o_dm_byte_enable)
        4'b1111: begin
          stack_mem[trunc_dm_address+3] <= o_dm_write[31:24];
          stack_mem[trunc_dm_address+2] <= o_dm_write[23:16];
          stack_mem[trunc_dm_address+1] <= o_dm_write[15:8];
          stack_mem[trunc_dm_address+0] <= o_dm_write[7:0];
        end 
        4'b0001, 4'b0010, 4'b0100, 4'b1000: stack_mem[trunc_dm_address] <= o_dm_write[7:0];
        endcase 
      end
    end
  end
end


endmodule