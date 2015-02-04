/* =============================================================================
 *
 * Name           : ALU_Control.v
 * Author         : Hakki Caner Kirmizi
 * Date           : 2010-5-1
 * Description    : A module that implements an ALU Control unit which gets two
 *					inputs (funct, ALUOp) and generates the 3-bit ALUCtrl signal
 *					We have to support these instruction:
 *					add, sub, and, or, slt, addi, andi, ori, lw, sw, beq
 * References	  : http://www.sdsc.edu/~allans/cs141/L8.pdf
 * 
 * Generating ALU Signals:
 * -----------------------
 * ALUOp		Function		ALUCtrl		Instr. Opcode
 * -----		--------		-------		-------------
 * 010			xxxxxx			010			lw, sw, addi (same as add)
 * 011			xxxxxx			110			beq (same as sub)
 * 000                  xxxxxx                  000                     andi (same as and)
 * 001                  xxxxxx                  001                     ori (same as or)
 * 100			100000			010			add
 * 100			100010			110			sub
 * 100			100100			000			and
 * 100			100101			001			or
 * 100			101010			111			slt
 * 
 * 
 * Note: Adding ‘addi, andi, ori’ does not require any changes in the given 
 * ALU because they are already covered in their R-format counterparts. However, 
 * we assume that 6-bit function code which is input to the ALU control circuit 
 * will be correctly generated at the main control circuit.
 * 
 * CCode (10/5/2(SUN)): we need to extend ALUOp to 3-bits since andi & ori 
 *                      doesn't have funct field in their instructions.
 *
 * =============================================================================
*/

module ALU_Control
(
	funct,
	ALUOp,
	ALUCtrl
);
   
   input [5:0]	funct;		// 6-bit represents instruction's 'address' part
   input [2:0] 	ALUOp;		// 3-bit comes from Control
   output [3:0] ALUCtrl;	// 4-bit control signal represents the operation type, e.g. add, or etc..
   
   reg [3:0] 	ALUCtrl;
      
   always @(*)
   begin
		ALUCtrl = 4'b0000;
		case(ALUOp)
		3'b010:
			ALUCtrl = 4'b0010;
		3'b011:
			ALUCtrl = 4'b0110;
		3'b000:
			ALUCtrl = 4'b0000;
		3'b001:
			ALUCtrl = 4'b0001;
		3'b100:
			case(funct)
			6'b100000:
				ALUCtrl = 4'b0010;
			6'b100010:
				ALUCtrl = 4'b0110;
			6'b100100:
				ALUCtrl = 4'b0000;
			6'b100101:
				ALUCtrl = 4'b0001;
			6'b101010:
				ALUCtrl = 4'b0111;
			endcase // case (funct)
		endcase // case (ALUOp)
   end
endmodule