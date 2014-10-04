
module mux_2x1 ( s, w, f );
  input s;  //selector
  input [1:0] w;
  output f;
  wire   n0, n1, n2, n3;
  
  XOR U0 ( .A(w[0]), .B(w[1]), .Z(n0) );
  IV U1 ( .A(n0), .Z(n1) );
  IV U2 ( .A(s), .Z(n2) );
  NOR U3 ( .A(n1), .B(n2), .Z(n3) );
  XOR U4 ( .A(w[0]), .B(n3), .Z(f) );
  
endmodule

