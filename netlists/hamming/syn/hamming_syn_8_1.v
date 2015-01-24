
module hamming_N8_CC1 ( clk, rst, x, y, o );
  input [7:0] x;
  input [7:0] y;
  output [3:0] o;
  input clk, rst;
  wire   n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66;

  XOR U38 ( .A(n40), .B(n41), .Z(n46) );
  NOR U39 ( .A(n34), .B(n35), .Z(o[3]) );
  NAND U40 ( .A(n36), .B(n37), .Z(o[2]) );
  OR U41 ( .A(n38), .B(n34), .Z(n37) );
  IV U42 ( .A(n39), .Z(n34) );
  OR U43 ( .A(n35), .B(n39), .Z(n36) );
  NOR U44 ( .A(n40), .B(n41), .Z(n39) );
  ANDN U45 ( .B(n42), .A(n38), .Z(n35) );
  NOR U46 ( .A(n43), .B(n44), .Z(n38) );
  NAND U47 ( .A(n45), .B(n46), .Z(n42) );
  XOR U48 ( .A(n43), .B(n44), .Z(o[1]) );
  XNOR U49 ( .A(n45), .B(n46), .Z(n44) );
  AND U50 ( .A(n47), .B(n48), .Z(n41) );
  OR U51 ( .A(n49), .B(n50), .Z(n48) );
  OR U52 ( .A(n51), .B(n52), .Z(n47) );
  AND U53 ( .A(n53), .B(n54), .Z(n40) );
  OR U54 ( .A(n55), .B(n56), .Z(n54) );
  OR U55 ( .A(n57), .B(n58), .Z(n53) );
  NAND U56 ( .A(n59), .B(n60), .Z(n45) );
  OR U57 ( .A(n61), .B(n62), .Z(n60) );
  OR U58 ( .A(n63), .B(n64), .Z(n59) );
  NAND U59 ( .A(n65), .B(n66), .Z(n43) );
  XOR U60 ( .A(n66), .B(n65), .Z(o[0]) );
  XOR U61 ( .A(n52), .B(n51), .Z(n65) );
  XNOR U62 ( .A(n49), .B(n50), .Z(n51) );
  XNOR U63 ( .A(y[7]), .B(x[7]), .Z(n50) );
  XNOR U64 ( .A(n57), .B(n58), .Z(n49) );
  XNOR U65 ( .A(y[0]), .B(x[0]), .Z(n58) );
  XNOR U66 ( .A(n55), .B(n56), .Z(n57) );
  XNOR U67 ( .A(y[2]), .B(x[2]), .Z(n56) );
  XNOR U68 ( .A(y[1]), .B(x[1]), .Z(n55) );
  XNOR U69 ( .A(y[6]), .B(x[6]), .Z(n52) );
  XOR U70 ( .A(n64), .B(n63), .Z(n66) );
  XNOR U71 ( .A(y[3]), .B(x[3]), .Z(n63) );
  XNOR U72 ( .A(n61), .B(n62), .Z(n64) );
  XNOR U73 ( .A(y[4]), .B(x[4]), .Z(n62) );
  XNOR U74 ( .A(y[5]), .B(x[5]), .Z(n61) );
endmodule

