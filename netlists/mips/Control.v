module Control(
    opcode,
    RegDst,
    Branch,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite
);

  input [5:0]  opcode;
  output 	RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  output [2:0] ALUOp;
  reg [9:0] 	out;

  assign RegDst = out[9];
  assign Branch = out[8];
  assign MemRead = out[7];
  assign MemtoReg = out[6];
  assign MemWrite = out[5];
  assign ALUSrc = out[4];
  assign RegWrite = out[3];
  assign ALUOp = out[2:0];

  always @(opcode)
  begin
    out = 10'b0; 
    case(opcode)
    6'b000000: //R-type
      out = 10'b1000001100;
    6'b001000: //addi
      out = 10'b0000011010;
    6'b001100: //andi
      out = 10'b0000011000;
    6'b001101: //ori
      out = 10'b0000011001;
    6'b101011: //sw
      out = 10'b0000110010;
    6'b100011: //lw
      out = 10'b0011011010;
    6'b000100: //beq
      out = 10'b0100000011;
    endcase // case (opcode)
  end
endmodule
