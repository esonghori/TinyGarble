/* Netlist produced by Yosys 0.68 from circuit_synthesis/sum/sum.v with
 * N=8, CC=8, using circuit_synthesis/lib/asic_cell_yosys_extended.lib.
 * Checked in verbatim as a regression test for the two things a current
 * Yosys emits that older Synopsys netlists never did:
 *   - a constant spelled 1'h0 rather than 1'b0, on the DFF I pin,
 *   - a DFF that only has an I pin because dfflibmap ran.
 * It is a 1-bit-per-cycle adder: over 8 clock cycles o = g_input + e_input.
 */
module sum(clk, rst, g_input, e_input, o);
  input clk;
  wire clk;
  input rst;
  wire rst;
  input [0:0] g_input;
  wire [0:0] g_input;
  input [0:0] e_input;
  wire [0:0] e_input;
  output [0:0] o;
  wire [0:0] o;
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [0:0] \genblk2.ADD_.C[0] ;
  wire [0:0] \genblk2.ADD_.C[1] ;
  XOR _05_ (
    .A(g_input),
    .B(\genblk2.ADD_.C[0] ),
    .Z(_02_)
  );
  XNOR _06_ (
    .A(e_input),
    .B(\genblk2.ADD_.C[0] ),
    .Z(_03_)
  );
  ANDN _07_ (
    .A(_02_),
    .B(_03_),
    .Z(_04_)
  );
  XOR _08_ (
    .A(_04_),
    .B(\genblk2.ADD_.C[0] ),
    .Z(\genblk2.ADD_.C[1] )
  );
  IV _09_ (
    .A(e_input),
    .Z(_00_)
  );
  XNOR _10_ (
    .A(g_input),
    .B(\genblk2.ADD_.C[0] ),
    .Z(_01_)
  );
  XOR _11_ (
    .A(_01_),
    .B(_00_),
    .Z(o)
  );
  DFF _12_ (
    .CLK(clk),
    .D(\genblk2.ADD_.C[1] ),
    .I(1'h0),
    .Q(\genblk2.ADD_.C[0] ),
    .RST(rst)
  );
endmodule
