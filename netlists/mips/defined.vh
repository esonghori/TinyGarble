// defined.vh
`ifndef _defined_vh_
`define _defined_vh_

`define  ALU_NOTHING             4'b0000
`define  ALU_ADD                 4'b0001
`define  ALU_SUBTRACT            4'b0010
`define  ALU_LESS_THAN           4'b0011
`define  ALU_LESS_THAN_SIGNED    4'b0100
`define  ALU_OR                  4'b0101
`define  ALU_AND                 4'b0110
`define  ALU_XOR                 4'b0111
`define  ALU_NOR                 4'b1000

`define  SHIFT_NOTHING          2'b00
`define  SHIFT_LEFT_UNSIGNED    2'b01
`define  SHIFT_RIGHT_SIGNED     2'b11
`define  SHIFT_RIGHT_UNSIGNED   2'b10

`define  MULT_NOTHING         4'b0000
`define  MULT_READ_LO         4'b0001
`define  MULT_READ_HI         4'b0010
`define  MULT_WRITE_LO        4'b0011
`define  MULT_WRITE_HI        4'b0100
`define  MULT_MULT            4'b0101
`define  MULT_SIGNED_MULT     4'b0110
`define  MULT_DIVIDE          4'b0111
`define  MULT_SIGNED_DIVIDE   4'b1000

`define  A_FROM_REG_SOURCE   2'b00
`define  A_FROM_IMM10_6      2'b01
`define  A_FROM_PC           2'b10

`define  B_FROM_REG_TARGET   2'b00
`define  B_FROM_IMM          2'b01
`define  B_FROM_SIGNED_IMM   2'b10
`define  B_FROM_IMMX4        2'b11

`define  C_FROM_NULL         3'b000
`define  C_FROM_ALU          3'b001
`define  C_FROM_SHIFT        3'b001
`define  C_FROM_MULT         3'b001 
`define  C_FROM_MEMORY       3'b010
`define  C_FROM_PC           3'b011
`define  C_FROM_PC_PLUS4     3'b100
`define  C_FROM_IMM_SHIFT16  3'b101
`define  C_FROM_REG_SOURCEN  3'b110
  
`define  BRANCH_LTZ   3'b000
`define  BRANCH_LEZ   3'b001
`define  BRANCH_EQ    3'b010
`define  BRANCH_NE    3'b011
`define  BRANCH_GEZ   3'b100
`define  BRANCH_GTZ   3'b101
`define  BRANCH_YES   3'b110
`define  BRANCH_NO    3'b111
  
`define  FROM_INC4         2'b00
`define  FROM_OPCODE25_0   2'b01
`define  FROM_BRANCH       2'b10
`define  FROM_LBRANCH      2'b11
  
`define  MEM_FETCH     4'b0000
`define  MEM_READ32    4'b0100
`define  MEM_WRITE32   4'b0101
`define  MEM_READ16    4'b1000
`define  MEM_READ16S   4'b1010
`define  MEM_WRITE16   4'b1001
`define  MEM_READ8     4'b1100
`define  MEM_READ8S    4'b1110
`define  MEM_WRITE8    4'b1101

`endif //_defined_vh_