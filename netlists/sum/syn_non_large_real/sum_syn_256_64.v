
module sum_N256_CC64 ( clk, rst, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [3:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, \ADD_/c[3] , \ADD_/c[2] , \ADD_/c[1] ,
         \ADD_/FAINST[0].FA_/n3 , \ADD_/FAINST[0].FA_/n2 ,
         \ADD_/FAINST[0].FA_/n1 , \ADD_/FAINST[3].FA_/n3 ,
         \ADD_/FAINST[3].FA_/n2 , \ADD_/FAINST[3].FA_/n1 ,
         \ADD_/FAINST[2].FA_/n3 , \ADD_/FAINST[2].FA_/n2 ,
         \ADD_/FAINST[2].FA_/n1 , \ADD_/FAINST[1].FA_/n3 ,
         \ADD_/FAINST[1].FA_/n2 , \ADD_/FAINST[1].FA_/n1 ;

  DFF carry_on_reg ( .D(carry_on_d), .CLK(clk), .RST(rst), .Q(carry_on) );
  XOR \ADD_/FAINST[0].FA_/U5  ( .A(\ADD_/FAINST[0].FA_/n3 ), .B(carry_on), .Z(
        \ADD_/c[1] ) );
  XOR \ADD_/FAINST[0].FA_/U4  ( .A(\ADD_/FAINST[0].FA_/n1 ), .B(b[0]), .Z(c[0]) );
  AND \ADD_/FAINST[0].FA_/U3  ( .A(\ADD_/FAINST[0].FA_/n1 ), .B(
        \ADD_/FAINST[0].FA_/n2 ), .Z(\ADD_/FAINST[0].FA_/n3 ) );
  XOR \ADD_/FAINST[0].FA_/U2  ( .A(b[0]), .B(carry_on), .Z(
        \ADD_/FAINST[0].FA_/n2 ) );
  XOR \ADD_/FAINST[0].FA_/U1  ( .A(a[0]), .B(carry_on), .Z(
        \ADD_/FAINST[0].FA_/n1 ) );
  XOR \ADD_/FAINST[3].FA_/U5  ( .A(\ADD_/FAINST[3].FA_/n3 ), .B(\ADD_/c[3] ), 
        .Z(carry_on_d) );
  XOR \ADD_/FAINST[3].FA_/U4  ( .A(\ADD_/FAINST[3].FA_/n1 ), .B(b[3]), .Z(c[3]) );
  AND \ADD_/FAINST[3].FA_/U3  ( .A(\ADD_/FAINST[3].FA_/n1 ), .B(
        \ADD_/FAINST[3].FA_/n2 ), .Z(\ADD_/FAINST[3].FA_/n3 ) );
  XOR \ADD_/FAINST[3].FA_/U2  ( .A(b[3]), .B(\ADD_/c[3] ), .Z(
        \ADD_/FAINST[3].FA_/n2 ) );
  XOR \ADD_/FAINST[3].FA_/U1  ( .A(a[3]), .B(\ADD_/c[3] ), .Z(
        \ADD_/FAINST[3].FA_/n1 ) );
  XOR \ADD_/FAINST[2].FA_/U5  ( .A(\ADD_/FAINST[2].FA_/n3 ), .B(\ADD_/c[2] ), 
        .Z(\ADD_/c[3] ) );
  XOR \ADD_/FAINST[2].FA_/U4  ( .A(\ADD_/FAINST[2].FA_/n1 ), .B(b[2]), .Z(c[2]) );
  AND \ADD_/FAINST[2].FA_/U3  ( .A(\ADD_/FAINST[2].FA_/n1 ), .B(
        \ADD_/FAINST[2].FA_/n2 ), .Z(\ADD_/FAINST[2].FA_/n3 ) );
  XOR \ADD_/FAINST[2].FA_/U2  ( .A(b[2]), .B(\ADD_/c[2] ), .Z(
        \ADD_/FAINST[2].FA_/n2 ) );
  XOR \ADD_/FAINST[2].FA_/U1  ( .A(a[2]), .B(\ADD_/c[2] ), .Z(
        \ADD_/FAINST[2].FA_/n1 ) );
  XOR \ADD_/FAINST[1].FA_/U5  ( .A(\ADD_/FAINST[1].FA_/n3 ), .B(\ADD_/c[1] ), 
        .Z(\ADD_/c[2] ) );
  XOR \ADD_/FAINST[1].FA_/U4  ( .A(\ADD_/FAINST[1].FA_/n1 ), .B(b[1]), .Z(c[1]) );
  AND \ADD_/FAINST[1].FA_/U3  ( .A(\ADD_/FAINST[1].FA_/n1 ), .B(
        \ADD_/FAINST[1].FA_/n2 ), .Z(\ADD_/FAINST[1].FA_/n3 ) );
  XOR \ADD_/FAINST[1].FA_/U2  ( .A(b[1]), .B(\ADD_/c[1] ), .Z(
        \ADD_/FAINST[1].FA_/n2 ) );
  XOR \ADD_/FAINST[1].FA_/U1  ( .A(a[1]), .B(\ADD_/c[1] ), .Z(
        \ADD_/FAINST[1].FA_/n1 ) );
endmodule

