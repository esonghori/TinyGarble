`timescale 1ns / 1ps
// synopsys template

module MUX
( 
  IN0, 
  IN1,
  SEL, 
  F 
);

  input IN0, IN1, SEL;
  output F;

  assign F  = (~SEL&IN0)|(SEL&IN1);

endmodule

module HADDER
( 
  IN0, 
  IN1,
  SUM, 
  COUT 
);

  input IN0, IN1;
  output SUM, COUT;

  assign SUM  = IN0^IN1;
  assign COUT = IN0&IN1;

endmodule

module FADDER
( 
  IN0, 
  IN1, 
  CIN, 
  COUT, 
  SUM 
);

  input IN0, IN1, CIN;
  output COUT, SUM;

  assign SUM  = IN0^IN1^CIN;
  assign COUT = ((CIN&IN0)|(CIN&IN1)|(IN0&IN1));

endmodule

module AND
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = A&B;

endmodule

module ANDN
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = A&~B;

endmodule

module NAND
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = ~(A&B);

endmodule

module NANDN
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = ~(A&~B);

endmodule

module OR
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = A|B;

endmodule

module ORN
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = A|~B;

endmodule

module NOR
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = ~(A|B);

endmodule

module NORN
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = ~(A|~B);

endmodule

module XOR
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = A^B;

endmodule

module XNOR
( 
  A, 
  B,
  Z
);

  input A, B;
  output Z;

  assign Z = ~(A^B);

endmodule

module IV
( 
  A,
  Z
);

  input A;
  output Z;

  assign Z = ~A;

endmodule


module DFF
( 
  CLK,
  RST,
  D,
  I, 
  Q
);

  input CLK, RST, D, I;
  output Q;

  reg Q;

  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      Q <= I;
    end else begin
      Q <= D;
    end
  end

endmodule
