module a23_mem
#
(
  // mem size in words (32bit)
  parameter CODE_MEM_SIZE  = 64  ,   //Code:    0x00000000
  parameter G_MEM_SIZE     = 64  ,   //AdrGarbler: 0x01000000
  parameter E_MEM_SIZE     = 64  ,   //AdrEvaluator:   0x02000000
  parameter OUT_MEM_SIZE   = 64  ,   //AdrOut:   0x03000000
  parameter STACK_MEM_SIZE = 64      //AdrStack:  0x04000000
)
(
input                           i_clk,
input                           i_rst,

input  [CODE_MEM_SIZE*32-1:0]   p_init,
input  [G_MEM_SIZE   *32-1:0]   g_init,
input  [E_MEM_SIZE   *32-1:0]   e_init,
output [OUT_MEM_SIZE *32-1:0]   o,

input   [31:0]                  i_m_address,
input   [31:0]                  i_m_write,
input                           i_m_write_en,
input   [3:0]                   i_m_byte_enable,
output  [31:0]                  o_m_read
);

reg [7:0]  p_mem     [4*CODE_MEM_SIZE-1:0];
reg [7:0]  g_mem     [4*G_MEM_SIZE-1:0];
reg [7:0]  e_mem     [4*E_MEM_SIZE-1:0];
reg [7:0]  out_mem   [4*OUT_MEM_SIZE-1:0];
reg [7:0]  stack_mem [4*STACK_MEM_SIZE-1:0];

genvar gi;


// instruction memory
wire [7:0]  p_init_byte [4*CODE_MEM_SIZE-1:0];
wire [7:0]  g_init_byte [4*G_MEM_SIZE-1:0];
wire [7:0]  e_init_byte [4*E_MEM_SIZE-1:0];
generate
  for (gi = 0; gi < 4*CODE_MEM_SIZE; gi = gi + 1) begin:code_gen
    assign p_init_byte[gi] = p_init[8*(gi+1)-1:8*gi];
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


wire [23:0] trunc_m_address;
assign trunc_m_address = {i_m_address[23:2], 2'b0};

assign  o_m_read =  (i_m_address[31:24] == 8'h00) ? {p_mem[trunc_m_address+3], p_mem[trunc_m_address+2], p_mem[trunc_m_address+1], p_mem[trunc_m_address]}  ://Code:  0x00000000
                    (i_m_address[31:24] == 8'h01) ? {g_mem[trunc_m_address+3], g_mem[trunc_m_address+2], g_mem[trunc_m_address+1], g_mem[trunc_m_address]}  ://AdrGarbler: 0x01000000
                    (i_m_address[31:24] == 8'h02) ? {e_mem[trunc_m_address+3], e_mem[trunc_m_address+2], e_mem[trunc_m_address+1], e_mem[trunc_m_address]}  ://AdrEvaluator:   0x02000000
                    (i_m_address[31:24] == 8'h03) ? {out_mem[trunc_m_address+3], out_mem[trunc_m_address+2], out_mem[trunc_m_address+1], out_mem[trunc_m_address]}  ://AdrOut:   0x03000000
                    (i_m_address[31:24] == 8'h04) ? {stack_mem[trunc_m_address+3], stack_mem[trunc_m_address+2], stack_mem[trunc_m_address+1], stack_mem[trunc_m_address]}  ://AdrStack:  0x04000000
                                                     32'b0;

integer i;
always @(posedge i_clk or posedge i_rst) begin
  if (i_rst) begin
    for(i=0;i<4*CODE_MEM_SIZE;i=i+1) begin
      p_mem[i] <= p_init_byte[i];
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
    for(i=0;i<4*CODE_MEM_SIZE;i=i+1) begin
      p_mem[i] <= p_mem[i];
    end
    for(i=0;i<4*G_MEM_SIZE;i=i+1) begin
      g_mem[i] <= g_mem[i];
    end
    for(i=0;i<4*E_MEM_SIZE;i=i+1) begin
      e_mem[i] <= e_mem[i];
    end
    for(i=0;i<4*OUT_MEM_SIZE;i=i+1) begin
      out_mem[i] <= out_mem[i];
    end
    for(i=0;i<4*STACK_MEM_SIZE;i=i+1) begin
      stack_mem[i] <= stack_mem[i];
    end
    if (i_m_write_en) begin // AdrGarbler and AdrEvaluator are const
      if(i_m_address[31:24] == 8'h00) begin //Code: 0x00000000
        case(i_m_byte_enable)
        4'b1111: begin
          p_mem[trunc_m_address+3] <= i_m_write[31:24];
          p_mem[trunc_m_address+2] <= i_m_write[23:16];
          p_mem[trunc_m_address+1] <= i_m_write[15:8];
          p_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0001: begin
          p_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0010: begin
          p_mem[trunc_m_address+1] <= i_m_write[7:0];
        end
        4'b0100: begin
          p_mem[trunc_m_address+2] <= i_m_write[7:0];
        end
        4'b1000: begin
          p_mem[trunc_m_address+3] <= i_m_write[7:0];
        end
        endcase
      end else if(i_m_address[31:24] == 8'h03) begin //AdrOut: 0x03000000
        case(i_m_byte_enable)
        4'b1111: begin
          out_mem[trunc_m_address+3] <= i_m_write[31:24];
          out_mem[trunc_m_address+2] <= i_m_write[23:16];
          out_mem[trunc_m_address+1] <= i_m_write[15:8];
          out_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0001: begin
          out_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0010: begin
          out_mem[trunc_m_address+1] <= i_m_write[7:0];
        end
        4'b0100: begin
          out_mem[trunc_m_address+2] <= i_m_write[7:0];
        end
        4'b1000: begin
          out_mem[trunc_m_address+3] <= i_m_write[7:0];
        end
        endcase
      end else if (i_m_address[31:24] == 8'h04) begin //AdrStack: 0x04000000
        case(i_m_byte_enable)
        4'b1111: begin
          stack_mem[trunc_m_address+3] <= i_m_write[31:24];
          stack_mem[trunc_m_address+2] <= i_m_write[23:16];
          stack_mem[trunc_m_address+1] <= i_m_write[15:8];
          stack_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0001: begin
          stack_mem[trunc_m_address+0] <= i_m_write[7:0];
        end
        4'b0010: begin
          stack_mem[trunc_m_address+1] <= i_m_write[7:0];
        end
        4'b0100: begin
          stack_mem[trunc_m_address+2] <= i_m_write[7:0];
        end
        4'b1000: begin
          stack_mem[trunc_m_address+3] <= i_m_write[7:0];
        end
        endcase
      end
    end
  end
end


endmodule

