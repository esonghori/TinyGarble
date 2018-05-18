`timescale 1ns / 1ps
`include "cordic.vh"

// synopsys_ template
module alpha_table
#( 
  parameter DEC  = 2,
  parameter FRAC = 14,
  parameter MOD = `MOD_CIR // MOD = {`MOD_CIR=1,`MOD_LIN=0,`MOD_HYP=-1}
)
(
  iter,
  alphai
);

  localparam L = DEC + FRAC;
  localparam ITER = FRAC + 1;
  localparam LOG_ITER = $clog2(ITER); 

  input [LOG_ITER-1:0] iter;
  output reg [L-1:0] alphai;


  generate
    if(L== 16) begin: L_16
      if(MOD == `MOD_CIR) begin:CIR
        always @(*) begin
          case(iter)
          0:  alphai = 16'b0011001001000100;
          1:  alphai = 16'b0001110110101100;
          2:  alphai = 16'b0000111110101110;
          3:  alphai = 16'b0000011111110101;
          4:  alphai = 16'b0000001111111111;
          5:  alphai = 16'b0000001000000000;
          6:  alphai = 16'b0000000100000000;
          7:  alphai = 16'b0000000010000000;
          8:  alphai = 16'b0000000001000000;
          9:  alphai = 16'b0000000000100000;
          10: alphai = 16'b0000000000010000;
          11: alphai = 16'b0000000000001000;
          12: alphai = 16'b0000000000000100;
          13: alphai = 16'b0000000000000010;
          14: alphai = 16'b0000000000000001;
          default: alphai = 16'b0;
          endcase
        end
      end else if (MOD == `MOD_LIN) begin:LIN
        always @(*) begin
          case(iter)
          0:  alphai = 16'b0100000000000000;
          1:  alphai = 16'b0010000000000000;
          2:  alphai = 16'b0001000000000000;
          3:  alphai = 16'b0000100000000000;
          4:  alphai = 16'b0000010000000000;
          5:  alphai = 16'b0000001000000000;
          6:  alphai = 16'b0000000100000000;
          7:  alphai = 16'b0000000010000000;
          8:  alphai = 16'b0000000001000000;
          9:  alphai = 16'b0000000000100000;
          10: alphai = 16'b0000000000010000;
          11: alphai = 16'b0000000000001000;
          12: alphai = 16'b0000000000000100;
          13: alphai = 16'b0000000000000010;
          14: alphai = 16'b0000000000000001;
          default: alphai = 16'b0;
          endcase
        end
      end else begin:HYP //if (MOD == `MOD_HYP)
        always @(*) begin
          case(iter)
          0:  alphai = 16'b0010001100101000;
          1:  alphai = 16'b0001000001011001;
          2:  alphai = 16'b0000100000001011;
          3:  alphai = 16'b0000010000000001;
          4:  alphai = 16'b0000001000000000;
          5:  alphai = 16'b0000000100000000;
          6:  alphai = 16'b0000000010000000;
          7:  alphai = 16'b0000000001000000;
          8:  alphai = 16'b0000000000100000;
          9:  alphai = 16'b0000000000010000;
          10: alphai = 16'b0000000000001000;
          11: alphai = 16'b0000000000000100;
          12: alphai = 16'b0000000000000010;
          13: alphai = 16'b0000000000000001;
          14: alphai = 16'b0000000000000001;
          default: alphai = 16'b0;
          endcase
        end
      end
      end else if (L==32) begin:L_32
      always @(*) begin
          case(iter)
          00:  alphai = 32'h3243F6A8;
          01:  alphai = 32'h1DAC6705;
          02:  alphai = 32'h0FADBAFC;
          03:  alphai = 32'h07F56EA6;
          04:  alphai = 32'h03FEAB76;
          05:  alphai = 32'h01FFD55B;
          06:  alphai = 32'h00FFFAAA;
          07:  alphai = 32'h007FFF55;
          08:  alphai = 32'h003FFFEA;
          09:  alphai = 32'h001FFFFD;
          10:  alphai = 32'h000FFFFF;
          11:  alphai = 32'h0007FFFF;
          12:  alphai = 32'h0003FFFF;
          13:  alphai = 32'h0001FFFF;
          14:  alphai = 32'h0000FFFF;
          15:  alphai = 32'h00007FFF;
          16:  alphai = 32'h00003FFF;
          17:  alphai = 32'h00001FFF;
          18:  alphai = 32'h00000FFF;
          19:  alphai = 32'h000007FF;
          20:  alphai = 32'h000003FF;
          21:  alphai = 32'h000001FF;
          22:  alphai = 32'h000000FF;
          23:  alphai = 32'h0000007F;
          24:  alphai = 32'h0000003F;
          25:  alphai = 32'h0000001F;
          26:  alphai = 32'h0000000F;
          27:  alphai = 32'h00000008;
          28:  alphai = 32'h00000004;
          29:  alphai = 32'h00000002;
          30:  alphai = 32'h00000001;
          31:  alphai = 32'h00000000;
          default: alphai = 32'b0;
          endcase
        end
      end else if (MOD == `MOD_LIN) begin:LIN
        always @(*) begin
          case(iter)
          00:  alphai = 32'h80000000;
          01:  alphai = 32'h40000000;
          02:  alphai = 32'h20000000;
          03:  alphai = 32'h10000000;
          04:  alphai = 32'h08000000;
          05:  alphai = 32'h04000000;
          06:  alphai = 32'h02000000;
          07:  alphai = 32'h01000000;
          08:  alphai = 32'h00800000;
          09:  alphai = 32'h00400000;
          10:  alphai = 32'h00200000;
          11:  alphai = 32'h00100000;
          12:  alphai = 32'h00080000;
          13:  alphai = 32'h00040000;
          14:  alphai = 32'h00020000;
          15:  alphai = 32'h00010000;
          16:  alphai = 32'h00008000;
          17:  alphai = 32'h00004000;
          18:  alphai = 32'h00002000;
          19:  alphai = 32'h00001000;
          20:  alphai = 32'h00000800;
          21:  alphai = 32'h00000400;
          22:  alphai = 32'h00000200;
          23:  alphai = 32'h00000100;
          24:  alphai = 32'h00000080;
          25:  alphai = 32'h00000040;
          26:  alphai = 32'h00000020;
          27:  alphai = 32'h00000010;
          28:  alphai = 32'h00000008;
          29:  alphai = 32'h00000004;
          30:  alphai = 32'h00000002;
          31:  alphai = 32'h00000001;
          default: alphai = 32'b0;
          endcase
        end
      end else begin:HYP //if (MOD == `MOD_HYP)
        always @(*) begin
          case(iter)
          // TODO: hyper table is not correct
          00:  alphai = 32'h80000000;
          01:  alphai = 32'h40000000;
          02:  alphai = 32'h20000000;
          03:  alphai = 32'h10000000;
          04:  alphai = 32'h08000000;
          05:  alphai = 32'h04000000;
          06:  alphai = 32'h02000000;
          07:  alphai = 32'h01000000;
          08:  alphai = 32'h00800000;
          09:  alphai = 32'h00400000;
          10:  alphai = 32'h00200000;
          11:  alphai = 32'h00100000;
          12:  alphai = 32'h00080000;
          13:  alphai = 32'h00040000;
          14:  alphai = 32'h00020000;
          15:  alphai = 32'h00010000;
          16:  alphai = 32'h00008000;
          17:  alphai = 32'h00004000;
          18:  alphai = 32'h00002000;
          19:  alphai = 32'h00001000;
          20:  alphai = 32'h00000800;
          21:  alphai = 32'h00000400;
          22:  alphai = 32'h00000200;
          23:  alphai = 32'h00000100;
          24:  alphai = 32'h00000080;
          25:  alphai = 32'h00000040;
          26:  alphai = 32'h00000020;
          27:  alphai = 32'h00000010;
          28:  alphai = 32'h00000008;
          29:  alphai = 32'h00000004;
          30:  alphai = 32'h00000002;
          31:  alphai = 32'h00000001;
          default: alphai = 16'b0;
          endcase
        end
      end
  endgenerate


  /*reg [L-1:0] mem [ITER-1:0];
  generate
    if(MOD == `MOD_CIR) begin:CIR
      initial begin
        $readmemb("tables/circular.txt", mem); 
      end
    end else if (MOD == `MOD_LIN) begin:LIN
      initial begin
        $readmemb("tables/linear.txt", mem); 
      end
    end else begin:HYP //if (MOD == `MOD_HYP)
      initial begin
        $readmemb("tables/hyperbolic.txt", mem); 
      end
    end
  endgenerate
  assign alphai = (iter<ITER)?mem[iter]:0;*/

endmodule
