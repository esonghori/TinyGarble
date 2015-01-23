
module sum_N128_CC8 ( clk, rst, a, b, c );
  input [15:0] a;
  input [15:0] b;
  output [15:0] c;
  input clk, rst;
  wire   carry_on, carry_on_d, \ADD_/c[15] , \ADD_/c[14] , \ADD_/c[13] ,
         \ADD_/c[12] , \ADD_/c[11] , \ADD_/c[10] , \ADD_/c[9] , \ADD_/c[8] ,
         \ADD_/c[7] , \ADD_/c[6] , \ADD_/c[5] , \ADD_/c[4] , \ADD_/c[3] ,
         \ADD_/c[2] , \ADD_/c[1] , \ADD_/FAINST[0].FA_/n3 ,
         \ADD_/FAINST[0].FA_/n2 , \ADD_/FAINST[0].FA_/n1 ,
         \ADD_/FAINST[15].FA_/n3 , \ADD_/FAINST[15].FA_/n2 ,
         \ADD_/FAINST[15].FA_/n1 , \ADD_/FAINST[14].FA_/n3 ,
         \ADD_/FAINST[14].FA_/n2 , \ADD_/FAINST[14].FA_/n1 ,
         \ADD_/FAINST[13].FA_/n3 , \ADD_/FAINST[13].FA_/n2 ,
         \ADD_/FAINST[13].FA_/n1 , \ADD_/FAINST[12].FA_/n3 ,
         \ADD_/FAINST[12].FA_/n2 , \ADD_/FAINST[12].FA_/n1 ,
         \ADD_/FAINST[11].FA_/n3 , \ADD_/FAINST[11].FA_/n2 ,
         \ADD_/FAINST[11].FA_/n1 , \ADD_/FAINST[10].FA_/n3 ,
         \ADD_/FAINST[10].FA_/n2 , \ADD_/FAINST[10].FA_/n1 ,
         \ADD_/FAINST[9].FA_/n3 , \ADD_/FAINST[9].FA_/n2 ,
         \ADD_/FAINST[9].FA_/n1 , \ADD_/FAINST[8].FA_/n3 ,
         \ADD_/FAINST[8].FA_/n2 , \ADD_/FAINST[8].FA_/n1 ,
         \ADD_/FAINST[7].FA_/n3 , \ADD_/FAINST[7].FA_/n2 ,
         \ADD_/FAINST[7].FA_/n1 , \ADD_/FAINST[6].FA_/n3 ,
         \ADD_/FAINST[6].FA_/n2 , \ADD_/FAINST[6].FA_/n1 ,
         \ADD_/FAINST[5].FA_/n3 , \ADD_/FAINST[5].FA_/n2 ,
         \ADD_/FAINST[5].FA_/n1 , \ADD_/FAINST[4].FA_/n3 ,
         \ADD_/FAINST[4].FA_/n2 , \ADD_/FAINST[4].FA_/n1 ,
         \ADD_/FAINST[3].FA_/n3 , \ADD_/FAINST[3].FA_/n2 ,
         \ADD_/FAINST[3].FA_/n1 , \ADD_/FAINST[2].FA_/n3 ,
         \ADD_/FAINST[2].FA_/n2 , \ADD_/FAINST[2].FA_/n1 ,
         \ADD_/FAINST[1].FA_/n3 , \ADD_/FAINST[1].FA_/n2 ,
         \ADD_/FAINST[1].FA_/n1 ;

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
  XOR \ADD_/FAINST[15].FA_/U5  ( .A(\ADD_/FAINST[15].FA_/n3 ), .B(\ADD_/c[15] ), .Z(carry_on_d) );
  XOR \ADD_/FAINST[15].FA_/U4  ( .A(\ADD_/FAINST[15].FA_/n1 ), .B(b[15]), .Z(
        c[15]) );
  AND \ADD_/FAINST[15].FA_/U3  ( .A(\ADD_/FAINST[15].FA_/n1 ), .B(
        \ADD_/FAINST[15].FA_/n2 ), .Z(\ADD_/FAINST[15].FA_/n3 ) );
  XOR \ADD_/FAINST[15].FA_/U2  ( .A(b[15]), .B(\ADD_/c[15] ), .Z(
        \ADD_/FAINST[15].FA_/n2 ) );
  XOR \ADD_/FAINST[15].FA_/U1  ( .A(a[15]), .B(\ADD_/c[15] ), .Z(
        \ADD_/FAINST[15].FA_/n1 ) );
  XOR \ADD_/FAINST[14].FA_/U5  ( .A(\ADD_/FAINST[14].FA_/n3 ), .B(\ADD_/c[14] ), .Z(\ADD_/c[15] ) );
  XOR \ADD_/FAINST[14].FA_/U4  ( .A(\ADD_/FAINST[14].FA_/n1 ), .B(b[14]), .Z(
        c[14]) );
  AND \ADD_/FAINST[14].FA_/U3  ( .A(\ADD_/FAINST[14].FA_/n1 ), .B(
        \ADD_/FAINST[14].FA_/n2 ), .Z(\ADD_/FAINST[14].FA_/n3 ) );
  XOR \ADD_/FAINST[14].FA_/U2  ( .A(b[14]), .B(\ADD_/c[14] ), .Z(
        \ADD_/FAINST[14].FA_/n2 ) );
  XOR \ADD_/FAINST[14].FA_/U1  ( .A(a[14]), .B(\ADD_/c[14] ), .Z(
        \ADD_/FAINST[14].FA_/n1 ) );
  XOR \ADD_/FAINST[13].FA_/U5  ( .A(\ADD_/FAINST[13].FA_/n3 ), .B(\ADD_/c[13] ), .Z(\ADD_/c[14] ) );
  XOR \ADD_/FAINST[13].FA_/U4  ( .A(\ADD_/FAINST[13].FA_/n1 ), .B(b[13]), .Z(
        c[13]) );
  AND \ADD_/FAINST[13].FA_/U3  ( .A(\ADD_/FAINST[13].FA_/n1 ), .B(
        \ADD_/FAINST[13].FA_/n2 ), .Z(\ADD_/FAINST[13].FA_/n3 ) );
  XOR \ADD_/FAINST[13].FA_/U2  ( .A(b[13]), .B(\ADD_/c[13] ), .Z(
        \ADD_/FAINST[13].FA_/n2 ) );
  XOR \ADD_/FAINST[13].FA_/U1  ( .A(a[13]), .B(\ADD_/c[13] ), .Z(
        \ADD_/FAINST[13].FA_/n1 ) );
  XOR \ADD_/FAINST[12].FA_/U5  ( .A(\ADD_/FAINST[12].FA_/n3 ), .B(\ADD_/c[12] ), .Z(\ADD_/c[13] ) );
  XOR \ADD_/FAINST[12].FA_/U4  ( .A(\ADD_/FAINST[12].FA_/n1 ), .B(b[12]), .Z(
        c[12]) );
  AND \ADD_/FAINST[12].FA_/U3  ( .A(\ADD_/FAINST[12].FA_/n1 ), .B(
        \ADD_/FAINST[12].FA_/n2 ), .Z(\ADD_/FAINST[12].FA_/n3 ) );
  XOR \ADD_/FAINST[12].FA_/U2  ( .A(b[12]), .B(\ADD_/c[12] ), .Z(
        \ADD_/FAINST[12].FA_/n2 ) );
  XOR \ADD_/FAINST[12].FA_/U1  ( .A(a[12]), .B(\ADD_/c[12] ), .Z(
        \ADD_/FAINST[12].FA_/n1 ) );
  XOR \ADD_/FAINST[11].FA_/U5  ( .A(\ADD_/FAINST[11].FA_/n3 ), .B(\ADD_/c[11] ), .Z(\ADD_/c[12] ) );
  XOR \ADD_/FAINST[11].FA_/U4  ( .A(\ADD_/FAINST[11].FA_/n1 ), .B(b[11]), .Z(
        c[11]) );
  AND \ADD_/FAINST[11].FA_/U3  ( .A(\ADD_/FAINST[11].FA_/n1 ), .B(
        \ADD_/FAINST[11].FA_/n2 ), .Z(\ADD_/FAINST[11].FA_/n3 ) );
  XOR \ADD_/FAINST[11].FA_/U2  ( .A(b[11]), .B(\ADD_/c[11] ), .Z(
        \ADD_/FAINST[11].FA_/n2 ) );
  XOR \ADD_/FAINST[11].FA_/U1  ( .A(a[11]), .B(\ADD_/c[11] ), .Z(
        \ADD_/FAINST[11].FA_/n1 ) );
  XOR \ADD_/FAINST[10].FA_/U5  ( .A(\ADD_/FAINST[10].FA_/n3 ), .B(\ADD_/c[10] ), .Z(\ADD_/c[11] ) );
  XOR \ADD_/FAINST[10].FA_/U4  ( .A(\ADD_/FAINST[10].FA_/n1 ), .B(b[10]), .Z(
        c[10]) );
  AND \ADD_/FAINST[10].FA_/U3  ( .A(\ADD_/FAINST[10].FA_/n1 ), .B(
        \ADD_/FAINST[10].FA_/n2 ), .Z(\ADD_/FAINST[10].FA_/n3 ) );
  XOR \ADD_/FAINST[10].FA_/U2  ( .A(b[10]), .B(\ADD_/c[10] ), .Z(
        \ADD_/FAINST[10].FA_/n2 ) );
  XOR \ADD_/FAINST[10].FA_/U1  ( .A(a[10]), .B(\ADD_/c[10] ), .Z(
        \ADD_/FAINST[10].FA_/n1 ) );
  XOR \ADD_/FAINST[9].FA_/U5  ( .A(\ADD_/FAINST[9].FA_/n3 ), .B(\ADD_/c[9] ), 
        .Z(\ADD_/c[10] ) );
  XOR \ADD_/FAINST[9].FA_/U4  ( .A(\ADD_/FAINST[9].FA_/n1 ), .B(b[9]), .Z(c[9]) );
  AND \ADD_/FAINST[9].FA_/U3  ( .A(\ADD_/FAINST[9].FA_/n1 ), .B(
        \ADD_/FAINST[9].FA_/n2 ), .Z(\ADD_/FAINST[9].FA_/n3 ) );
  XOR \ADD_/FAINST[9].FA_/U2  ( .A(b[9]), .B(\ADD_/c[9] ), .Z(
        \ADD_/FAINST[9].FA_/n2 ) );
  XOR \ADD_/FAINST[9].FA_/U1  ( .A(a[9]), .B(\ADD_/c[9] ), .Z(
        \ADD_/FAINST[9].FA_/n1 ) );
  XOR \ADD_/FAINST[8].FA_/U5  ( .A(\ADD_/FAINST[8].FA_/n3 ), .B(\ADD_/c[8] ), 
        .Z(\ADD_/c[9] ) );
  XOR \ADD_/FAINST[8].FA_/U4  ( .A(\ADD_/FAINST[8].FA_/n1 ), .B(b[8]), .Z(c[8]) );
  AND \ADD_/FAINST[8].FA_/U3  ( .A(\ADD_/FAINST[8].FA_/n1 ), .B(
        \ADD_/FAINST[8].FA_/n2 ), .Z(\ADD_/FAINST[8].FA_/n3 ) );
  XOR \ADD_/FAINST[8].FA_/U2  ( .A(b[8]), .B(\ADD_/c[8] ), .Z(
        \ADD_/FAINST[8].FA_/n2 ) );
  XOR \ADD_/FAINST[8].FA_/U1  ( .A(a[8]), .B(\ADD_/c[8] ), .Z(
        \ADD_/FAINST[8].FA_/n1 ) );
  XOR \ADD_/FAINST[7].FA_/U5  ( .A(\ADD_/FAINST[7].FA_/n3 ), .B(\ADD_/c[7] ), 
        .Z(\ADD_/c[8] ) );
  XOR \ADD_/FAINST[7].FA_/U4  ( .A(\ADD_/FAINST[7].FA_/n1 ), .B(b[7]), .Z(c[7]) );
  AND \ADD_/FAINST[7].FA_/U3  ( .A(\ADD_/FAINST[7].FA_/n1 ), .B(
        \ADD_/FAINST[7].FA_/n2 ), .Z(\ADD_/FAINST[7].FA_/n3 ) );
  XOR \ADD_/FAINST[7].FA_/U2  ( .A(b[7]), .B(\ADD_/c[7] ), .Z(
        \ADD_/FAINST[7].FA_/n2 ) );
  XOR \ADD_/FAINST[7].FA_/U1  ( .A(a[7]), .B(\ADD_/c[7] ), .Z(
        \ADD_/FAINST[7].FA_/n1 ) );
  XOR \ADD_/FAINST[6].FA_/U5  ( .A(\ADD_/FAINST[6].FA_/n3 ), .B(\ADD_/c[6] ), 
        .Z(\ADD_/c[7] ) );
  XOR \ADD_/FAINST[6].FA_/U4  ( .A(\ADD_/FAINST[6].FA_/n1 ), .B(b[6]), .Z(c[6]) );
  AND \ADD_/FAINST[6].FA_/U3  ( .A(\ADD_/FAINST[6].FA_/n1 ), .B(
        \ADD_/FAINST[6].FA_/n2 ), .Z(\ADD_/FAINST[6].FA_/n3 ) );
  XOR \ADD_/FAINST[6].FA_/U2  ( .A(b[6]), .B(\ADD_/c[6] ), .Z(
        \ADD_/FAINST[6].FA_/n2 ) );
  XOR \ADD_/FAINST[6].FA_/U1  ( .A(a[6]), .B(\ADD_/c[6] ), .Z(
        \ADD_/FAINST[6].FA_/n1 ) );
  XOR \ADD_/FAINST[5].FA_/U5  ( .A(\ADD_/FAINST[5].FA_/n3 ), .B(\ADD_/c[5] ), 
        .Z(\ADD_/c[6] ) );
  XOR \ADD_/FAINST[5].FA_/U4  ( .A(\ADD_/FAINST[5].FA_/n1 ), .B(b[5]), .Z(c[5]) );
  AND \ADD_/FAINST[5].FA_/U3  ( .A(\ADD_/FAINST[5].FA_/n1 ), .B(
        \ADD_/FAINST[5].FA_/n2 ), .Z(\ADD_/FAINST[5].FA_/n3 ) );
  XOR \ADD_/FAINST[5].FA_/U2  ( .A(b[5]), .B(\ADD_/c[5] ), .Z(
        \ADD_/FAINST[5].FA_/n2 ) );
  XOR \ADD_/FAINST[5].FA_/U1  ( .A(a[5]), .B(\ADD_/c[5] ), .Z(
        \ADD_/FAINST[5].FA_/n1 ) );
  XOR \ADD_/FAINST[4].FA_/U5  ( .A(\ADD_/FAINST[4].FA_/n3 ), .B(\ADD_/c[4] ), 
        .Z(\ADD_/c[5] ) );
  XOR \ADD_/FAINST[4].FA_/U4  ( .A(\ADD_/FAINST[4].FA_/n1 ), .B(b[4]), .Z(c[4]) );
  AND \ADD_/FAINST[4].FA_/U3  ( .A(\ADD_/FAINST[4].FA_/n1 ), .B(
        \ADD_/FAINST[4].FA_/n2 ), .Z(\ADD_/FAINST[4].FA_/n3 ) );
  XOR \ADD_/FAINST[4].FA_/U2  ( .A(b[4]), .B(\ADD_/c[4] ), .Z(
        \ADD_/FAINST[4].FA_/n2 ) );
  XOR \ADD_/FAINST[4].FA_/U1  ( .A(a[4]), .B(\ADD_/c[4] ), .Z(
        \ADD_/FAINST[4].FA_/n1 ) );
  XOR \ADD_/FAINST[3].FA_/U5  ( .A(\ADD_/FAINST[3].FA_/n3 ), .B(\ADD_/c[3] ), 
        .Z(\ADD_/c[4] ) );
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

