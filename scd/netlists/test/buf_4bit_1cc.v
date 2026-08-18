/* Regression netlist for BUF cell support (issue #27).
 *
 * o[0] = g_input[0] & e_input[0], routed through a chain of BUF cells that is
 *        listed in reverse dependency order on purpose.
 * o[1] = g_input[1] & e_input[1], through a single BUF.
 * o[2] = ~(g_input[2] & e_input[2]), an IV for contrast.
 * o[3] = g_input[3] & e_input[3], through a single BUF.
 *
 * BUF cells are wire aliases, so none of them should turn into a gate:
 * the resulting scd must have exactly 5 gates (4 AND + 1 IV).
 * Note the BUFs use the .Y output pin, the other cells use .Z.
 */
module buf_4bit_1cc ( clk, rst, g_input, e_input, o );
  input [3:0] g_input;
  input [3:0] e_input;
  output [3:0] o;
  input clk, rst;
  wire n0, n1, n2, n3, b0, b1, c0;

  BUF U_b2 ( .A(b1), .Y(c0) );
  BUF U_b1 ( .A(b0), .Y(b1) );
  BUF U_b0 ( .A(n0), .Y(b0) );

  AND U0 ( .A(g_input[0]), .B(e_input[0]), .Z(n0) );
  AND U1 ( .A(g_input[1]), .B(e_input[1]), .Z(n1) );
  AND U2 ( .A(g_input[2]), .B(e_input[2]), .Z(n2) );
  AND U3 ( .A(g_input[3]), .B(e_input[3]), .Z(n3) );

  BUF U_o0 ( .A(c0), .Y(o[0]) );
  BUF U_o1 ( .A(n1), .Y(o[1]) );
  IV  U_o2 ( .A(n2), .Z(o[2]) );
  BUF U_o3 ( .A(n3), .Y(o[3]) );
endmodule
