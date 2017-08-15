module a23_gc_main
#(
  // mem size in words (32bit)
  parameter CODE_MEM_SIZE  = 64  ,   //Code:    0x00000000
  parameter G_MEM_SIZE     = 64  ,   //AdrGarbler: 0x01000000
  parameter E_MEM_SIZE     = 64  ,   //AdrEvaluator:   0x02000000
  parameter OUT_MEM_SIZE   = 64  ,   //AdrOut:   0x03000000
  parameter STACK_MEM_SIZE = 64      //AdrStack:  0x04000000
)
(
  input                           clk,
  input                           rst,
  input  [CODE_MEM_SIZE*32-1:0]   p_init,
  input  [G_MEM_SIZE   *32-1:0]   g_init,
  input  [E_MEM_SIZE   *32-1:0]   e_init,
  output [OUT_MEM_SIZE *32-1:0]   o,
  output                          terminate
);

wire   [31:0]             m_address;
wire   [31:0]             m_write;
wire                      m_write_en;
wire   [3:0]              m_byte_enable;
wire   [31:0]             m_read;

a23_core u_a23_core
(
  .i_clk             (clk               ),
  .i_rst             (rst               ),
  .o_m_address       (m_address         ),
  .o_m_write         (m_write           ),
  .o_m_write_en      (m_write_en        ),
  .o_m_byte_enable   (m_byte_enable     ),
  .i_m_read          (m_read            ),
  .terminate         (terminate         )
);

a23_mem
#(
  .CODE_MEM_SIZE     (CODE_MEM_SIZE),
  .G_MEM_SIZE        (G_MEM_SIZE),
  .E_MEM_SIZE        (E_MEM_SIZE),
  .OUT_MEM_SIZE      (OUT_MEM_SIZE),
  .STACK_MEM_SIZE    (STACK_MEM_SIZE)
)
u_a23_mem
(
  .i_clk              (clk              ),
  .i_rst              (rst              ),

  .p_init             (p_init           ),
  .g_init             (g_init           ),
  .e_init             (e_init           ),
  .o                  (o                ),

  .i_m_address        (m_address        ),
  .i_m_write          (m_write          ),
  .i_m_write_en       (m_write_en       ),
  .i_m_byte_enable    (m_byte_enable    ),
  .o_m_read           (m_read           )
);




endmodule