
module FA_1 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
endmodule


module FA_2 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_3 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_4 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_5 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_6 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_7 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_8 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_9 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_10 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_11 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_12 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_13 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_14 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_15 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_16 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_17 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_18 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_19 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_20 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_21 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_22 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_23 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_24 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_25 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_26 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_27 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_28 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_29 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_30 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_31 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_1 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;


  FA_31 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_30 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_29 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_28 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_27 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_26 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_25 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_24 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_23 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_22 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_21 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_20 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_19 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_18 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_17 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_16 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_15 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_14 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_13 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_12 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_11 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_10 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_9 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_8 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_7 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_6 \FAINST[26].FA_  ( .A(1'b0), .B(B[26]), .CI(1'b0), .S(S[26]) );
  FA_5 \FAINST[27].FA_  ( .A(1'b0), .B(B[27]), .CI(1'b0), .S(S[27]) );
  FA_4 \FAINST[28].FA_  ( .A(1'b0), .B(B[28]), .CI(1'b0), .S(S[28]) );
  FA_3 \FAINST[29].FA_  ( .A(1'b0), .B(B[29]), .CI(1'b0), .S(S[29]) );
  FA_2 \FAINST[30].FA_  ( .A(1'b0), .B(B[30]), .CI(1'b0), .S(S[30]) );
  FA_1 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(1'b0), .S(S[31]) );
endmodule


module FA_33 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_34 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_35 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_36 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_37 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_38 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_39 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_40 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_41 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_42 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_43 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_44 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_45 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_46 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_47 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_48 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_49 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_50 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_51 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_52 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_53 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_54 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_55 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_56 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_57 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_58 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_59 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_60 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_61 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_62 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_63 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_2 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;
  wire   \C[31] ;

  FA_63 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_62 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_61 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_60 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_59 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_58 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_57 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_56 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_55 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_54 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_53 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_52 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_51 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_50 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_49 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_48 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_47 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_46 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_45 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_44 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_43 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_42 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_41 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_40 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_39 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_38 \FAINST[26].FA_  ( .A(1'b0), .B(B[26]), .CI(1'b0), .S(S[26]) );
  FA_37 \FAINST[27].FA_  ( .A(1'b0), .B(B[27]), .CI(1'b0), .S(S[27]) );
  FA_36 \FAINST[28].FA_  ( .A(1'b0), .B(B[28]), .CI(1'b0), .S(S[28]) );
  FA_35 \FAINST[29].FA_  ( .A(1'b0), .B(B[29]), .CI(1'b0), .S(S[29]) );
  FA_34 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(1'b0), .S(S[30]), .CO(
        \C[31] ) );
  FA_33 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(\C[31] ), .S(S[31]) );
endmodule


module FA_65 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_66 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_67 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_68 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_69 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_70 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_71 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_72 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_73 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_74 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_75 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_76 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_77 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_78 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_79 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_80 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_81 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_82 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_83 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_84 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_85 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_86 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_87 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_88 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_89 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_90 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_91 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_92 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_93 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_94 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_95 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_3 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_95 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_94 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_93 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_92 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_91 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_90 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_89 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_88 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_87 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_86 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_85 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_84 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_83 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_82 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_81 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_80 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_79 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_78 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_77 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_76 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_75 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_74 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_73 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_72 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_71 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_70 \FAINST[26].FA_  ( .A(1'b0), .B(B[26]), .CI(1'b0), .S(S[26]) );
  FA_69 \FAINST[27].FA_  ( .A(1'b0), .B(B[27]), .CI(1'b0), .S(S[27]) );
  FA_68 \FAINST[28].FA_  ( .A(1'b0), .B(B[28]), .CI(1'b0), .S(S[28]) );
  FA_67 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(1'b0), .S(S[29]), .CO(
        C[30]) );
  FA_66 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_65 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_97 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_98 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_99 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_100 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_101 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_102 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_103 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_104 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_105 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_106 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_107 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_108 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_109 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_110 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_111 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_112 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_113 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_114 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_115 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_116 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_117 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_118 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_119 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_120 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_121 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_122 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_123 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_124 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_125 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_126 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_127 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_4 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_127 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_126 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_125 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_124 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_123 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_122 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_121 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_120 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_119 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_118 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_117 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_116 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_115 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_114 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_113 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_112 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_111 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_110 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_109 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_108 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_107 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_106 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_105 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_104 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_103 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_102 \FAINST[26].FA_  ( .A(1'b0), .B(B[26]), .CI(1'b0), .S(S[26]) );
  FA_101 \FAINST[27].FA_  ( .A(1'b0), .B(B[27]), .CI(1'b0), .S(S[27]) );
  FA_100 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(1'b0), .S(S[28]), .CO(
        C[29]) );
  FA_99 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_98 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_97 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_129 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_130 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_131 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_132 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_133 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_134 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_135 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_136 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_137 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_138 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_139 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_140 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_141 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_142 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_143 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_144 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_145 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_146 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_147 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_148 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_149 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_150 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_151 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_152 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_153 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_154 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_155 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_156 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_157 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_158 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_159 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_5 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_159 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_158 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_157 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_156 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_155 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_154 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_153 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_152 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_151 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_150 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_149 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_148 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_147 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_146 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_145 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_144 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_143 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_142 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_141 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_140 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_139 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_138 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_137 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_136 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_135 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_134 \FAINST[26].FA_  ( .A(1'b0), .B(B[26]), .CI(1'b0), .S(S[26]) );
  FA_133 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(1'b0), .S(S[27]), .CO(
        C[28]) );
  FA_132 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_131 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_130 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_129 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_161 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_162 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_163 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_164 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_165 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_166 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_167 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_168 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_169 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_170 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_171 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_172 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_173 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_174 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_175 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_176 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_177 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_178 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_179 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_180 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_181 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_182 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_183 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_184 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_185 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_186 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_187 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_188 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_189 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_190 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_191 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_6 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_191 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_190 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_189 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_188 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_187 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_186 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_185 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_184 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_183 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_182 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_181 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_180 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_179 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_178 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_177 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_176 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_175 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_174 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_173 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_172 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_171 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_170 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_169 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_168 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_167 \FAINST[25].FA_  ( .A(1'b0), .B(B[25]), .CI(1'b0), .S(S[25]) );
  FA_166 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(1'b0), .S(S[26]), .CO(
        C[27]) );
  FA_165 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_164 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_163 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_162 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_161 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_193 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_194 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_195 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_196 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_197 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_198 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_199 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_200 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_201 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_202 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_203 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_204 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_205 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_206 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_207 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_208 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_209 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_210 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_211 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_212 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_213 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_214 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_215 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_216 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_217 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_218 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_219 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_220 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_221 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_222 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_223 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_7 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_223 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_222 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_221 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_220 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_219 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_218 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_217 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_216 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_215 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_214 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_213 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_212 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_211 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_210 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_209 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_208 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_207 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_206 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_205 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_204 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_203 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_202 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_201 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_200 \FAINST[24].FA_  ( .A(1'b0), .B(B[24]), .CI(1'b0), .S(S[24]) );
  FA_199 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(1'b0), .S(S[25]), .CO(
        C[26]) );
  FA_198 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_197 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_196 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_195 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_194 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_193 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_225 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_226 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_227 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_228 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_229 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_230 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_231 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_232 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_233 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_234 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_235 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_236 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_237 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_238 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_239 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_240 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_241 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_242 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_243 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_244 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_245 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_246 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_247 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_248 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_249 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_250 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_251 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_252 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_253 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_254 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_255 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_8 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_255 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_254 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_253 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_252 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_251 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_250 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_249 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_248 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_247 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_246 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_245 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_244 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_243 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_242 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_241 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_240 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_239 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_238 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_237 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_236 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_235 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_234 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_233 \FAINST[23].FA_  ( .A(1'b0), .B(B[23]), .CI(1'b0), .S(S[23]) );
  FA_232 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(1'b0), .S(S[24]), .CO(
        C[25]) );
  FA_231 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_230 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_229 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_228 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_227 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_226 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_225 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_257 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_258 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_259 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_260 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_261 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_262 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_263 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_264 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_265 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_266 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_267 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_268 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_269 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_270 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_271 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_272 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_273 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_274 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_275 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_276 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_277 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_278 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_279 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_280 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_281 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_282 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_283 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_284 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_285 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_286 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_287 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_9 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_287 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_286 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_285 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_284 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_283 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_282 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_281 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_280 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_279 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_278 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_277 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_276 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_275 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_274 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_273 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_272 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_271 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_270 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_269 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_268 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_267 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_266 \FAINST[22].FA_  ( .A(1'b0), .B(B[22]), .CI(1'b0), .S(S[22]) );
  FA_265 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(1'b0), .S(S[23]), .CO(
        C[24]) );
  FA_264 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_263 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_262 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_261 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_260 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_259 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_258 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_257 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_289 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_290 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_291 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_292 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_293 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_294 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_295 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_296 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_297 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_298 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_299 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_300 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_301 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_302 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_303 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_304 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_305 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_306 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_307 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_308 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_309 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_310 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_311 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_312 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_313 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_314 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_315 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_316 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_317 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_318 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_319 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_10 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_319 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_318 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_317 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_316 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_315 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_314 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_313 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_312 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_311 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_310 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_309 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_308 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_307 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_306 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_305 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_304 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_303 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_302 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_301 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_300 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_299 \FAINST[21].FA_  ( .A(1'b0), .B(B[21]), .CI(1'b0), .S(S[21]) );
  FA_298 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(1'b0), .S(S[22]), .CO(
        C[23]) );
  FA_297 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_296 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_295 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_294 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_293 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_292 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_291 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_290 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_289 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_321 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_322 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_323 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_324 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_325 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_326 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_327 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_328 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_329 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_330 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_331 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_332 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_333 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_334 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_335 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_336 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_337 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_338 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_339 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_340 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_341 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_342 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_343 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_344 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_345 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_346 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_347 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_348 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_349 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_350 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_351 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_11 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_351 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_350 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_349 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_348 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_347 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_346 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_345 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_344 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_343 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_342 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_341 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_340 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_339 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_338 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_337 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_336 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_335 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_334 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_333 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_332 \FAINST[20].FA_  ( .A(1'b0), .B(B[20]), .CI(1'b0), .S(S[20]) );
  FA_331 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(1'b0), .S(S[21]), .CO(
        C[22]) );
  FA_330 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_329 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_328 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_327 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_326 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_325 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_324 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_323 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_322 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_321 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_353 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_354 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_355 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_356 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_357 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_358 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_359 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_360 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_361 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_362 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_363 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_364 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_365 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_366 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_367 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_368 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_369 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_370 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_371 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_372 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_373 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_374 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_375 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_376 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_377 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_378 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_379 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_380 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_381 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_382 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_383 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_12 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_383 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_382 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_381 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_380 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_379 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_378 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_377 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_376 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_375 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_374 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_373 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_372 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_371 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_370 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_369 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_368 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_367 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_366 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_365 \FAINST[19].FA_  ( .A(1'b0), .B(B[19]), .CI(1'b0), .S(S[19]) );
  FA_364 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(1'b0), .S(S[20]), .CO(
        C[21]) );
  FA_363 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_362 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_361 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_360 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_359 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_358 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_357 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_356 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_355 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_354 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_353 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_385 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_386 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_387 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_388 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_389 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_390 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_391 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_392 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_393 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_394 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_395 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_396 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_397 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_398 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_399 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_400 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_401 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_402 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_403 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_404 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_405 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_406 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_407 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_408 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_409 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_410 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_411 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_412 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_413 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_414 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_415 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_13 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_415 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_414 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_413 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_412 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_411 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_410 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_409 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_408 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_407 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_406 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_405 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_404 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_403 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_402 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_401 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_400 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_399 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_398 \FAINST[18].FA_  ( .A(1'b0), .B(B[18]), .CI(1'b0), .S(S[18]) );
  FA_397 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(1'b0), .S(S[19]), .CO(
        C[20]) );
  FA_396 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_395 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_394 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_393 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_392 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_391 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_390 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_389 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_388 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_387 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_386 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_385 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_417 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_418 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_419 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_420 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_421 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_422 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_423 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_424 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_425 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_426 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_427 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_428 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_429 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_430 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_431 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_432 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_433 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_434 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_435 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_436 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_437 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_438 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_439 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_440 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_441 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_442 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_443 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_444 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_445 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_446 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_447 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_14 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_447 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_446 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_445 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_444 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_443 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_442 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_441 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_440 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_439 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_438 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_437 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_436 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_435 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_434 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_433 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_432 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_431 \FAINST[17].FA_  ( .A(1'b0), .B(B[17]), .CI(1'b0), .S(S[17]) );
  FA_430 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(1'b0), .S(S[18]), .CO(
        C[19]) );
  FA_429 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_428 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_427 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_426 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_425 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_424 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_423 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_422 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_421 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_420 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_419 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_418 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_417 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_449 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_450 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_451 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_452 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_453 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_454 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_455 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_456 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_457 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_458 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_459 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_460 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_461 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_462 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_463 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_464 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_465 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_466 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_467 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_468 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_469 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_470 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_471 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_472 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_473 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_474 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_475 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_476 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_477 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_478 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_479 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_15 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_479 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_478 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_477 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_476 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_475 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_474 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_473 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_472 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_471 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_470 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_469 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_468 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_467 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_466 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_465 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_464 \FAINST[16].FA_  ( .A(1'b0), .B(B[16]), .CI(1'b0), .S(S[16]) );
  FA_463 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(1'b0), .S(S[17]), .CO(
        C[18]) );
  FA_462 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_461 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_460 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_459 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_458 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_457 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_456 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_455 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_454 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_453 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_452 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_451 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_450 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_449 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_481 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_482 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_483 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_484 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_485 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_486 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_487 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_488 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_489 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_490 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_491 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_492 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_493 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_494 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_495 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_496 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_497 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_498 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_499 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_500 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_501 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_502 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_503 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_504 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_505 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_506 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_507 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_508 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_509 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_510 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_511 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_16 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_511 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_510 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_509 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_508 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_507 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_506 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_505 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_504 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_503 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_502 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_501 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_500 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_499 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_498 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_497 \FAINST[15].FA_  ( .A(1'b0), .B(B[15]), .CI(1'b0), .S(S[15]) );
  FA_496 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(1'b0), .S(S[16]), .CO(
        C[17]) );
  FA_495 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_494 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_493 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_492 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_491 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_490 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_489 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_488 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_487 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_486 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_485 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_484 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_483 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_482 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_481 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_513 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_514 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_515 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_516 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_517 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_518 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_519 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_520 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_521 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_522 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_523 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_524 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_525 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_526 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_527 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_528 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_529 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_530 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_531 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_532 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_533 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_534 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_535 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_536 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_537 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_538 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_539 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_540 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_541 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_542 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_543 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_17 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_543 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_542 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_541 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_540 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_539 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_538 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_537 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_536 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_535 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_534 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_533 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_532 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_531 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_530 \FAINST[14].FA_  ( .A(1'b0), .B(B[14]), .CI(1'b0), .S(S[14]) );
  FA_529 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(1'b0), .S(S[15]), .CO(
        C[16]) );
  FA_528 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_527 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_526 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_525 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_524 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_523 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_522 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_521 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_520 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_519 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_518 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_517 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_516 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_515 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_514 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_513 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_545 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_546 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_547 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_548 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_549 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_550 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_551 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_552 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_553 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_554 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_555 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_556 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_557 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_558 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_559 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_560 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_561 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_562 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_563 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_564 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_565 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_566 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_567 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_568 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_569 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_570 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_571 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_572 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_573 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_574 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_575 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_18 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_575 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_574 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_573 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_572 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_571 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_570 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_569 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_568 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_567 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_566 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_565 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_564 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_563 \FAINST[13].FA_  ( .A(1'b0), .B(B[13]), .CI(1'b0), .S(S[13]) );
  FA_562 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(1'b0), .S(S[14]), .CO(
        C[15]) );
  FA_561 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_560 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_559 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_558 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_557 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_556 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_555 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_554 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_553 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_552 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_551 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_550 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_549 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_548 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_547 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_546 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_545 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_577 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_578 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_579 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_580 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_581 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_582 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_583 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_584 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_585 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_586 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_587 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_588 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_589 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_590 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_591 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_592 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_593 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_594 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_595 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_596 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_597 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_598 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_599 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_600 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_601 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_602 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_603 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_604 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_605 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_606 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_607 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_19 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_607 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_606 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_605 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_604 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_603 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_602 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_601 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_600 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_599 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_598 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_597 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_596 \FAINST[12].FA_  ( .A(1'b0), .B(B[12]), .CI(1'b0), .S(S[12]) );
  FA_595 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(1'b0), .S(S[13]), .CO(
        C[14]) );
  FA_594 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_593 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_592 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_591 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_590 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_589 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_588 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_587 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_586 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_585 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_584 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_583 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_582 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_581 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_580 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_579 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_578 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_577 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_609 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_610 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_611 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_612 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_613 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_614 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_615 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_616 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_617 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_618 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_619 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_620 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_621 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_622 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_623 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_624 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_625 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_626 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_627 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_628 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_629 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_630 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_631 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_632 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_633 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_634 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_635 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_636 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_637 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_638 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_639 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_20 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_639 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_638 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_637 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_636 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_635 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_634 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_633 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_632 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_631 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_630 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_629 \FAINST[11].FA_  ( .A(1'b0), .B(B[11]), .CI(1'b0), .S(S[11]) );
  FA_628 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(1'b0), .S(S[12]), .CO(
        C[13]) );
  FA_627 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_626 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_625 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_624 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_623 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_622 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_621 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_620 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_619 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_618 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_617 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_616 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_615 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_614 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_613 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_612 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_611 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_610 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_609 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_641 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_642 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_643 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_644 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_645 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_646 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_647 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_648 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_649 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_650 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_651 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_652 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_653 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_654 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_655 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_656 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_657 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_658 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_659 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_660 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_661 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_662 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_663 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_664 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_665 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_666 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_667 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_668 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_669 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_670 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_671 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_21 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_671 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_670 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_669 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_668 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_667 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_666 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_665 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_664 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_663 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_662 \FAINST[10].FA_  ( .A(1'b0), .B(B[10]), .CI(1'b0), .S(S[10]) );
  FA_661 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(1'b0), .S(S[11]), .CO(
        C[12]) );
  FA_660 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_659 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_658 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_657 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_656 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_655 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_654 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_653 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_652 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_651 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_650 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_649 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_648 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_647 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_646 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_645 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_644 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_643 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_642 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_641 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_673 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_674 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_675 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_676 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_677 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_678 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_679 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_680 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_681 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_682 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_683 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_684 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_685 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_686 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_687 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_688 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_689 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_690 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_691 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_692 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_693 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_694 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_695 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_696 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_697 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_698 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_699 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_700 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_701 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_702 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_703 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_22 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_703 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_702 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_701 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_700 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_699 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_698 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_697 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_696 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_695 \FAINST[9].FA_  ( .A(1'b0), .B(B[9]), .CI(1'b0), .S(S[9]) );
  FA_694 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(1'b0), .S(S[10]), .CO(
        C[11]) );
  FA_693 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_692 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_691 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_690 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_689 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_688 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_687 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_686 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_685 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_684 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_683 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_682 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_681 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_680 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_679 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_678 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_677 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_676 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_675 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_674 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_673 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_705 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_706 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_707 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_708 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_709 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_710 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_711 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_712 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_713 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_714 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_715 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_716 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_717 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_718 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_719 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_720 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_721 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_722 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_723 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_724 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_725 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_726 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_727 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_728 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_729 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_730 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_731 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_732 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_733 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_734 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_735 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_23 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_735 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_734 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_733 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_732 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_731 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_730 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_729 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_728 \FAINST[8].FA_  ( .A(1'b0), .B(B[8]), .CI(1'b0), .S(S[8]) );
  FA_727 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(1'b0), .S(S[9]), .CO(C[10])
         );
  FA_726 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_725 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_724 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_723 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_722 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_721 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_720 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_719 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_718 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_717 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_716 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_715 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_714 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_713 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_712 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_711 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_710 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_709 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_708 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_707 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_706 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_705 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_737 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_738 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_739 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_740 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_741 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_742 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_743 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_744 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_745 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_746 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_747 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_748 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_749 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_750 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_751 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_752 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_753 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_754 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_755 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_756 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_757 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_758 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_759 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_760 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_761 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_762 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_763 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_764 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_765 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_766 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_767 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_24 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_767 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_766 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_765 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_764 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_763 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_762 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_761 \FAINST[7].FA_  ( .A(1'b0), .B(B[7]), .CI(1'b0), .S(S[7]) );
  FA_760 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(1'b0), .S(S[8]), .CO(C[9])
         );
  FA_759 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_758 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_757 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_756 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_755 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_754 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_753 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_752 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_751 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_750 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_749 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_748 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_747 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_746 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_745 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_744 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_743 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_742 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_741 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_740 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_739 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_738 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_737 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_769 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_770 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_771 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_772 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_773 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_774 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_775 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_776 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_777 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_778 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_779 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_780 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_781 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_782 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_783 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_784 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_785 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_786 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_787 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_788 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_789 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_790 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_791 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_792 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_793 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_794 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_795 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_796 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_797 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_798 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_799 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_25 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_799 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_798 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_797 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_796 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_795 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_794 \FAINST[6].FA_  ( .A(1'b0), .B(B[6]), .CI(1'b0), .S(S[6]) );
  FA_793 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(1'b0), .S(S[7]), .CO(C[8])
         );
  FA_792 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_791 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_790 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_789 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_788 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_787 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_786 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_785 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_784 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_783 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_782 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_781 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_780 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_779 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_778 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_777 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_776 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_775 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_774 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_773 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_772 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_771 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_770 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_769 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_801 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_802 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_803 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_804 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_805 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_806 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_807 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_808 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_809 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_810 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_811 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_812 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_813 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_814 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_815 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_816 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_817 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_818 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_819 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_820 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_821 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_822 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_823 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_824 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_825 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_826 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_827 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_828 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_829 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_830 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_831 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_26 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_831 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_830 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_829 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_828 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_827 \FAINST[5].FA_  ( .A(1'b0), .B(B[5]), .CI(1'b0), .S(S[5]) );
  FA_826 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(1'b0), .S(S[6]), .CO(C[7])
         );
  FA_825 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_824 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_823 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_822 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_821 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_820 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_819 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_818 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_817 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_816 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_815 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_814 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_813 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_812 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_811 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_810 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_809 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_808 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_807 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_806 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_805 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_804 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_803 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_802 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_801 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_833 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_834 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_835 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_836 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_837 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_838 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_839 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_840 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_841 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_842 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_843 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_844 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_845 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_846 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_847 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_848 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_849 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_850 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_851 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_852 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_853 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_854 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_855 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_856 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_857 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_858 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_859 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_860 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_861 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_862 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_863 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_27 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_863 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_862 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_861 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_860 \FAINST[4].FA_  ( .A(1'b0), .B(B[4]), .CI(1'b0), .S(S[4]) );
  FA_859 \FAINST[5].FA_  ( .A(A[5]), .B(B[5]), .CI(1'b0), .S(S[5]), .CO(C[6])
         );
  FA_858 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(C[6]), .S(S[6]), .CO(C[7])
         );
  FA_857 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_856 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_855 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_854 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_853 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_852 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_851 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_850 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_849 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_848 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_847 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_846 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_845 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_844 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_843 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_842 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_841 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_840 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_839 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_838 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_837 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_836 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_835 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_834 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_833 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_865 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_866 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_867 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_868 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_869 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_870 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_871 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_872 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_873 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_874 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_875 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_876 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_877 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_878 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_879 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_880 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_881 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_882 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_883 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_884 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_885 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_886 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_887 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_888 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_889 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_890 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_891 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_892 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_893 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_894 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_895 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_28 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_895 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_894 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_893 \FAINST[3].FA_  ( .A(1'b0), .B(B[3]), .CI(1'b0), .S(S[3]) );
  FA_892 \FAINST[4].FA_  ( .A(A[4]), .B(B[4]), .CI(1'b0), .S(S[4]), .CO(C[5])
         );
  FA_891 \FAINST[5].FA_  ( .A(A[5]), .B(B[5]), .CI(C[5]), .S(S[5]), .CO(C[6])
         );
  FA_890 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(C[6]), .S(S[6]), .CO(C[7])
         );
  FA_889 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_888 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_887 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_886 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_885 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_884 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_883 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_882 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_881 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_880 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_879 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_878 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_877 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_876 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_875 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_874 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_873 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_872 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_871 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_870 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_869 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_868 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_867 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_866 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_865 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_897 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_898 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_899 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_900 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_901 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_902 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_903 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_904 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_905 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_906 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_907 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_908 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_909 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_910 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_911 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_912 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_913 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_914 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_915 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_916 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_917 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_918 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_919 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_920 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_921 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_922 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_923 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_924 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_925 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_926 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module FA_927 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_29 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_927 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_926 \FAINST[2].FA_  ( .A(1'b0), .B(B[2]), .CI(1'b0), .S(S[2]) );
  FA_925 \FAINST[3].FA_  ( .A(A[3]), .B(B[3]), .CI(1'b0), .S(S[3]), .CO(C[4])
         );
  FA_924 \FAINST[4].FA_  ( .A(A[4]), .B(B[4]), .CI(C[4]), .S(S[4]), .CO(C[5])
         );
  FA_923 \FAINST[5].FA_  ( .A(A[5]), .B(B[5]), .CI(C[5]), .S(S[5]), .CO(C[6])
         );
  FA_922 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(C[6]), .S(S[6]), .CO(C[7])
         );
  FA_921 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_920 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_919 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_918 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_917 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_916 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_915 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_914 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_913 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_912 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_911 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_910 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_909 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_908 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_907 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_906 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_905 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_904 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_903 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_902 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_901 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_900 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_899 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_898 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_897 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_929 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_930 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_931 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_932 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_933 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_934 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_935 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_936 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_937 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_938 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_939 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_940 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_941 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_942 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_943 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_944 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_945 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_946 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_947 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_948 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_949 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_950 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_951 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_952 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_953 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_954 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_955 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_956 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_957 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_958 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module FA_959 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   B;
  assign S = B;

endmodule


module ADD_N32_30 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_959 \FAINST[1].FA_  ( .A(1'b0), .B(B[1]), .CI(1'b0), .S(S[1]) );
  FA_958 \FAINST[2].FA_  ( .A(A[2]), .B(B[2]), .CI(1'b0), .S(S[2]), .CO(C[3])
         );
  FA_957 \FAINST[3].FA_  ( .A(A[3]), .B(B[3]), .CI(C[3]), .S(S[3]), .CO(C[4])
         );
  FA_956 \FAINST[4].FA_  ( .A(A[4]), .B(B[4]), .CI(C[4]), .S(S[4]), .CO(C[5])
         );
  FA_955 \FAINST[5].FA_  ( .A(A[5]), .B(B[5]), .CI(C[5]), .S(S[5]), .CO(C[6])
         );
  FA_954 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(C[6]), .S(S[6]), .CO(C[7])
         );
  FA_953 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_952 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_951 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10])
         );
  FA_950 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_949 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_948 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_947 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_946 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_945 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_944 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_943 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_942 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_941 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_940 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_939 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_938 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_937 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_936 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_935 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_934 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_933 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_932 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_931 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_930 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_929 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module FA_961 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_962 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_963 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_964 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_965 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_966 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_967 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_968 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_969 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_970 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_971 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_972 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_973 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_974 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_975 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_976 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_977 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_978 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_979 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_980 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_981 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_982 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_983 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_984 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_985 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_986 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_987 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_988 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_989 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_990 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module FA_991 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   A;
  assign S = A;

endmodule


module ADD_N32_31 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;


  FA_991 \FAINST[1].FA_  ( .A(A[1]), .B(1'b0), .CI(1'b0), .S(S[1]) );
  FA_990 \FAINST[2].FA_  ( .A(A[2]), .B(1'b0), .CI(1'b0), .S(S[2]) );
  FA_989 \FAINST[3].FA_  ( .A(A[3]), .B(1'b0), .CI(1'b0), .S(S[3]) );
  FA_988 \FAINST[4].FA_  ( .A(A[4]), .B(1'b0), .CI(1'b0), .S(S[4]) );
  FA_987 \FAINST[5].FA_  ( .A(A[5]), .B(1'b0), .CI(1'b0), .S(S[5]) );
  FA_986 \FAINST[6].FA_  ( .A(A[6]), .B(1'b0), .CI(1'b0), .S(S[6]) );
  FA_985 \FAINST[7].FA_  ( .A(A[7]), .B(1'b0), .CI(1'b0), .S(S[7]) );
  FA_984 \FAINST[8].FA_  ( .A(A[8]), .B(1'b0), .CI(1'b0), .S(S[8]) );
  FA_983 \FAINST[9].FA_  ( .A(A[9]), .B(1'b0), .CI(1'b0), .S(S[9]) );
  FA_982 \FAINST[10].FA_  ( .A(A[10]), .B(1'b0), .CI(1'b0), .S(S[10]) );
  FA_981 \FAINST[11].FA_  ( .A(A[11]), .B(1'b0), .CI(1'b0), .S(S[11]) );
  FA_980 \FAINST[12].FA_  ( .A(A[12]), .B(1'b0), .CI(1'b0), .S(S[12]) );
  FA_979 \FAINST[13].FA_  ( .A(A[13]), .B(1'b0), .CI(1'b0), .S(S[13]) );
  FA_978 \FAINST[14].FA_  ( .A(A[14]), .B(1'b0), .CI(1'b0), .S(S[14]) );
  FA_977 \FAINST[15].FA_  ( .A(A[15]), .B(1'b0), .CI(1'b0), .S(S[15]) );
  FA_976 \FAINST[16].FA_  ( .A(A[16]), .B(1'b0), .CI(1'b0), .S(S[16]) );
  FA_975 \FAINST[17].FA_  ( .A(A[17]), .B(1'b0), .CI(1'b0), .S(S[17]) );
  FA_974 \FAINST[18].FA_  ( .A(A[18]), .B(1'b0), .CI(1'b0), .S(S[18]) );
  FA_973 \FAINST[19].FA_  ( .A(A[19]), .B(1'b0), .CI(1'b0), .S(S[19]) );
  FA_972 \FAINST[20].FA_  ( .A(A[20]), .B(1'b0), .CI(1'b0), .S(S[20]) );
  FA_971 \FAINST[21].FA_  ( .A(A[21]), .B(1'b0), .CI(1'b0), .S(S[21]) );
  FA_970 \FAINST[22].FA_  ( .A(A[22]), .B(1'b0), .CI(1'b0), .S(S[22]) );
  FA_969 \FAINST[23].FA_  ( .A(A[23]), .B(1'b0), .CI(1'b0), .S(S[23]) );
  FA_968 \FAINST[24].FA_  ( .A(A[24]), .B(1'b0), .CI(1'b0), .S(S[24]) );
  FA_967 \FAINST[25].FA_  ( .A(A[25]), .B(1'b0), .CI(1'b0), .S(S[25]) );
  FA_966 \FAINST[26].FA_  ( .A(A[26]), .B(1'b0), .CI(1'b0), .S(S[26]) );
  FA_965 \FAINST[27].FA_  ( .A(A[27]), .B(1'b0), .CI(1'b0), .S(S[27]) );
  FA_964 \FAINST[28].FA_  ( .A(A[28]), .B(1'b0), .CI(1'b0), .S(S[28]) );
  FA_963 \FAINST[29].FA_  ( .A(A[29]), .B(1'b0), .CI(1'b0), .S(S[29]) );
  FA_962 \FAINST[30].FA_  ( .A(A[30]), .B(1'b0), .CI(1'b0), .S(S[30]) );
  FA_961 \FAINST[31].FA_  ( .A(A[31]), .B(1'b0), .CI(1'b0), .S(S[31]) );
endmodule


module MULT_N32 ( A, B, O );
  input [31:0] A;
  input [31:0] B;
  output [31:0] O;
  wire   \w[31][31] , \w[31][30] , \w[31][29] , \w[31][28] , \w[31][27] ,
         \w[31][26] , \w[31][25] , \w[31][24] , \w[31][23] , \w[31][22] ,
         \w[31][21] , \w[31][20] , \w[31][19] , \w[31][18] , \w[31][17] ,
         \w[31][16] , \w[31][15] , \w[31][14] , \w[31][13] , \w[31][12] ,
         \w[31][11] , \w[31][10] , \w[31][9] , \w[31][8] , \w[31][7] ,
         \w[31][6] , \w[31][5] , \w[31][4] , \w[31][3] , \w[31][2] ,
         \w[31][1] , \w[30][31] , \w[30][30] , \w[30][29] , \w[30][28] ,
         \w[30][27] , \w[30][26] , \w[30][25] , \w[30][24] , \w[30][23] ,
         \w[30][22] , \w[30][21] , \w[30][20] , \w[30][19] , \w[30][18] ,
         \w[30][17] , \w[30][16] , \w[30][15] , \w[30][14] , \w[30][13] ,
         \w[30][12] , \w[30][11] , \w[30][10] , \w[30][9] , \w[30][8] ,
         \w[30][7] , \w[30][6] , \w[30][5] , \w[30][4] , \w[30][3] ,
         \w[30][2] , \w[30][1] , \w[29][31] , \w[29][30] , \w[29][29] ,
         \w[29][28] , \w[29][27] , \w[29][26] , \w[29][25] , \w[29][24] ,
         \w[29][23] , \w[29][22] , \w[29][21] , \w[29][20] , \w[29][19] ,
         \w[29][18] , \w[29][17] , \w[29][16] , \w[29][15] , \w[29][14] ,
         \w[29][13] , \w[29][12] , \w[29][11] , \w[29][10] , \w[29][9] ,
         \w[29][8] , \w[29][7] , \w[29][6] , \w[29][5] , \w[29][4] ,
         \w[29][3] , \w[29][2] , \w[29][1] , \w[28][31] , \w[28][30] ,
         \w[28][29] , \w[28][28] , \w[28][27] , \w[28][26] , \w[28][25] ,
         \w[28][24] , \w[28][23] , \w[28][22] , \w[28][21] , \w[28][20] ,
         \w[28][19] , \w[28][18] , \w[28][17] , \w[28][16] , \w[28][15] ,
         \w[28][14] , \w[28][13] , \w[28][12] , \w[28][11] , \w[28][10] ,
         \w[28][9] , \w[28][8] , \w[28][7] , \w[28][6] , \w[28][5] ,
         \w[28][4] , \w[28][3] , \w[28][2] , \w[28][1] , \w[27][31] ,
         \w[27][30] , \w[27][29] , \w[27][28] , \w[27][27] , \w[27][26] ,
         \w[27][25] , \w[27][24] , \w[27][23] , \w[27][22] , \w[27][21] ,
         \w[27][20] , \w[27][19] , \w[27][18] , \w[27][17] , \w[27][16] ,
         \w[27][15] , \w[27][14] , \w[27][13] , \w[27][12] , \w[27][11] ,
         \w[27][10] , \w[27][9] , \w[27][8] , \w[27][7] , \w[27][6] ,
         \w[27][5] , \w[27][4] , \w[27][3] , \w[27][2] , \w[27][1] ,
         \w[26][31] , \w[26][30] , \w[26][29] , \w[26][28] , \w[26][27] ,
         \w[26][26] , \w[26][25] , \w[26][24] , \w[26][23] , \w[26][22] ,
         \w[26][21] , \w[26][20] , \w[26][19] , \w[26][18] , \w[26][17] ,
         \w[26][16] , \w[26][15] , \w[26][14] , \w[26][13] , \w[26][12] ,
         \w[26][11] , \w[26][10] , \w[26][9] , \w[26][8] , \w[26][7] ,
         \w[26][6] , \w[26][5] , \w[26][4] , \w[26][3] , \w[26][2] ,
         \w[26][1] , \w[25][31] , \w[25][30] , \w[25][29] , \w[25][28] ,
         \w[25][27] , \w[25][26] , \w[25][25] , \w[25][24] , \w[25][23] ,
         \w[25][22] , \w[25][21] , \w[25][20] , \w[25][19] , \w[25][18] ,
         \w[25][17] , \w[25][16] , \w[25][15] , \w[25][14] , \w[25][13] ,
         \w[25][12] , \w[25][11] , \w[25][10] , \w[25][9] , \w[25][8] ,
         \w[25][7] , \w[25][6] , \w[25][5] , \w[25][4] , \w[25][3] ,
         \w[25][2] , \w[25][1] , \w[24][31] , \w[24][30] , \w[24][29] ,
         \w[24][28] , \w[24][27] , \w[24][26] , \w[24][25] , \w[24][24] ,
         \w[24][23] , \w[24][22] , \w[24][21] , \w[24][20] , \w[24][19] ,
         \w[24][18] , \w[24][17] , \w[24][16] , \w[24][15] , \w[24][14] ,
         \w[24][13] , \w[24][12] , \w[24][11] , \w[24][10] , \w[24][9] ,
         \w[24][8] , \w[24][7] , \w[24][6] , \w[24][5] , \w[24][4] ,
         \w[24][3] , \w[24][2] , \w[24][1] , \w[23][31] , \w[23][30] ,
         \w[23][29] , \w[23][28] , \w[23][27] , \w[23][26] , \w[23][25] ,
         \w[23][24] , \w[23][23] , \w[23][22] , \w[23][21] , \w[23][20] ,
         \w[23][19] , \w[23][18] , \w[23][17] , \w[23][16] , \w[23][15] ,
         \w[23][14] , \w[23][13] , \w[23][12] , \w[23][11] , \w[23][10] ,
         \w[23][9] , \w[23][8] , \w[23][7] , \w[23][6] , \w[23][5] ,
         \w[23][4] , \w[23][3] , \w[23][2] , \w[23][1] , \w[22][31] ,
         \w[22][30] , \w[22][29] , \w[22][28] , \w[22][27] , \w[22][26] ,
         \w[22][25] , \w[22][24] , \w[22][23] , \w[22][22] , \w[22][21] ,
         \w[22][20] , \w[22][19] , \w[22][18] , \w[22][17] , \w[22][16] ,
         \w[22][15] , \w[22][14] , \w[22][13] , \w[22][12] , \w[22][11] ,
         \w[22][10] , \w[22][9] , \w[22][8] , \w[22][7] , \w[22][6] ,
         \w[22][5] , \w[22][4] , \w[22][3] , \w[22][2] , \w[22][1] ,
         \w[21][31] , \w[21][30] , \w[21][29] , \w[21][28] , \w[21][27] ,
         \w[21][26] , \w[21][25] , \w[21][24] , \w[21][23] , \w[21][22] ,
         \w[21][21] , \w[21][20] , \w[21][19] , \w[21][18] , \w[21][17] ,
         \w[21][16] , \w[21][15] , \w[21][14] , \w[21][13] , \w[21][12] ,
         \w[21][11] , \w[21][10] , \w[21][9] , \w[21][8] , \w[21][7] ,
         \w[21][6] , \w[21][5] , \w[21][4] , \w[21][3] , \w[21][2] ,
         \w[21][1] , \w[20][31] , \w[20][30] , \w[20][29] , \w[20][28] ,
         \w[20][27] , \w[20][26] , \w[20][25] , \w[20][24] , \w[20][23] ,
         \w[20][22] , \w[20][21] , \w[20][20] , \w[20][19] , \w[20][18] ,
         \w[20][17] , \w[20][16] , \w[20][15] , \w[20][14] , \w[20][13] ,
         \w[20][12] , \w[20][11] , \w[20][10] , \w[20][9] , \w[20][8] ,
         \w[20][7] , \w[20][6] , \w[20][5] , \w[20][4] , \w[20][3] ,
         \w[20][2] , \w[20][1] , \w[19][31] , \w[19][30] , \w[19][29] ,
         \w[19][28] , \w[19][27] , \w[19][26] , \w[19][25] , \w[19][24] ,
         \w[19][23] , \w[19][22] , \w[19][21] , \w[19][20] , \w[19][19] ,
         \w[19][18] , \w[19][17] , \w[19][16] , \w[19][15] , \w[19][14] ,
         \w[19][13] , \w[19][12] , \w[19][11] , \w[19][10] , \w[19][9] ,
         \w[19][8] , \w[19][7] , \w[19][6] , \w[19][5] , \w[19][4] ,
         \w[19][3] , \w[19][2] , \w[19][1] , \w[18][31] , \w[18][30] ,
         \w[18][29] , \w[18][28] , \w[18][27] , \w[18][26] , \w[18][25] ,
         \w[18][24] , \w[18][23] , \w[18][22] , \w[18][21] , \w[18][20] ,
         \w[18][19] , \w[18][18] , \w[18][17] , \w[18][16] , \w[18][15] ,
         \w[18][14] , \w[18][13] , \w[18][12] , \w[18][11] , \w[18][10] ,
         \w[18][9] , \w[18][8] , \w[18][7] , \w[18][6] , \w[18][5] ,
         \w[18][4] , \w[18][3] , \w[18][2] , \w[18][1] , \w[17][31] ,
         \w[17][30] , \w[17][29] , \w[17][28] , \w[17][27] , \w[17][26] ,
         \w[17][25] , \w[17][24] , \w[17][23] , \w[17][22] , \w[17][21] ,
         \w[17][20] , \w[17][19] , \w[17][18] , \w[17][17] , \w[17][16] ,
         \w[17][15] , \w[17][14] , \w[17][13] , \w[17][12] , \w[17][11] ,
         \w[17][10] , \w[17][9] , \w[17][8] , \w[17][7] , \w[17][6] ,
         \w[17][5] , \w[17][4] , \w[17][3] , \w[17][2] , \w[17][1] ,
         \w[16][31] , \w[16][30] , \w[16][29] , \w[16][28] , \w[16][27] ,
         \w[16][26] , \w[16][25] , \w[16][24] , \w[16][23] , \w[16][22] ,
         \w[16][21] , \w[16][20] , \w[16][19] , \w[16][18] , \w[16][17] ,
         \w[16][16] , \w[16][15] , \w[16][14] , \w[16][13] , \w[16][12] ,
         \w[16][11] , \w[16][10] , \w[16][9] , \w[16][8] , \w[16][7] ,
         \w[16][6] , \w[16][5] , \w[16][4] , \w[16][3] , \w[16][2] ,
         \w[16][1] , \w[15][31] , \w[15][30] , \w[15][29] , \w[15][28] ,
         \w[15][27] , \w[15][26] , \w[15][25] , \w[15][24] , \w[15][23] ,
         \w[15][22] , \w[15][21] , \w[15][20] , \w[15][19] , \w[15][18] ,
         \w[15][17] , \w[15][16] , \w[15][15] , \w[15][14] , \w[15][13] ,
         \w[15][12] , \w[15][11] , \w[15][10] , \w[15][9] , \w[15][8] ,
         \w[15][7] , \w[15][6] , \w[15][5] , \w[15][4] , \w[15][3] ,
         \w[15][2] , \w[15][1] , \w[14][31] , \w[14][30] , \w[14][29] ,
         \w[14][28] , \w[14][27] , \w[14][26] , \w[14][25] , \w[14][24] ,
         \w[14][23] , \w[14][22] , \w[14][21] , \w[14][20] , \w[14][19] ,
         \w[14][18] , \w[14][17] , \w[14][16] , \w[14][15] , \w[14][14] ,
         \w[14][13] , \w[14][12] , \w[14][11] , \w[14][10] , \w[14][9] ,
         \w[14][8] , \w[14][7] , \w[14][6] , \w[14][5] , \w[14][4] ,
         \w[14][3] , \w[14][2] , \w[14][1] , \w[13][31] , \w[13][30] ,
         \w[13][29] , \w[13][28] , \w[13][27] , \w[13][26] , \w[13][25] ,
         \w[13][24] , \w[13][23] , \w[13][22] , \w[13][21] , \w[13][20] ,
         \w[13][19] , \w[13][18] , \w[13][17] , \w[13][16] , \w[13][15] ,
         \w[13][14] , \w[13][13] , \w[13][12] , \w[13][11] , \w[13][10] ,
         \w[13][9] , \w[13][8] , \w[13][7] , \w[13][6] , \w[13][5] ,
         \w[13][4] , \w[13][3] , \w[13][2] , \w[13][1] , \w[12][31] ,
         \w[12][30] , \w[12][29] , \w[12][28] , \w[12][27] , \w[12][26] ,
         \w[12][25] , \w[12][24] , \w[12][23] , \w[12][22] , \w[12][21] ,
         \w[12][20] , \w[12][19] , \w[12][18] , \w[12][17] , \w[12][16] ,
         \w[12][15] , \w[12][14] , \w[12][13] , \w[12][12] , \w[12][11] ,
         \w[12][10] , \w[12][9] , \w[12][8] , \w[12][7] , \w[12][6] ,
         \w[12][5] , \w[12][4] , \w[12][3] , \w[12][2] , \w[12][1] ,
         \w[11][31] , \w[11][30] , \w[11][29] , \w[11][28] , \w[11][27] ,
         \w[11][26] , \w[11][25] , \w[11][24] , \w[11][23] , \w[11][22] ,
         \w[11][21] , \w[11][20] , \w[11][19] , \w[11][18] , \w[11][17] ,
         \w[11][16] , \w[11][15] , \w[11][14] , \w[11][13] , \w[11][12] ,
         \w[11][11] , \w[11][10] , \w[11][9] , \w[11][8] , \w[11][7] ,
         \w[11][6] , \w[11][5] , \w[11][4] , \w[11][3] , \w[11][2] ,
         \w[11][1] , \w[10][31] , \w[10][30] , \w[10][29] , \w[10][28] ,
         \w[10][27] , \w[10][26] , \w[10][25] , \w[10][24] , \w[10][23] ,
         \w[10][22] , \w[10][21] , \w[10][20] , \w[10][19] , \w[10][18] ,
         \w[10][17] , \w[10][16] , \w[10][15] , \w[10][14] , \w[10][13] ,
         \w[10][12] , \w[10][11] , \w[10][10] , \w[10][9] , \w[10][8] ,
         \w[10][7] , \w[10][6] , \w[10][5] , \w[10][4] , \w[10][3] ,
         \w[10][2] , \w[10][1] , \w[9][31] , \w[9][30] , \w[9][29] ,
         \w[9][28] , \w[9][27] , \w[9][26] , \w[9][25] , \w[9][24] ,
         \w[9][23] , \w[9][22] , \w[9][21] , \w[9][20] , \w[9][19] ,
         \w[9][18] , \w[9][17] , \w[9][16] , \w[9][15] , \w[9][14] ,
         \w[9][13] , \w[9][12] , \w[9][11] , \w[9][10] , \w[9][9] , \w[9][8] ,
         \w[9][7] , \w[9][6] , \w[9][5] , \w[9][4] , \w[9][3] , \w[9][2] ,
         \w[9][1] , \w[8][31] , \w[8][30] , \w[8][29] , \w[8][28] , \w[8][27] ,
         \w[8][26] , \w[8][25] , \w[8][24] , \w[8][23] , \w[8][22] ,
         \w[8][21] , \w[8][20] , \w[8][19] , \w[8][18] , \w[8][17] ,
         \w[8][16] , \w[8][15] , \w[8][14] , \w[8][13] , \w[8][12] ,
         \w[8][11] , \w[8][10] , \w[8][9] , \w[8][8] , \w[8][7] , \w[8][6] ,
         \w[8][5] , \w[8][4] , \w[8][3] , \w[8][2] , \w[8][1] , \w[7][31] ,
         \w[7][30] , \w[7][29] , \w[7][28] , \w[7][27] , \w[7][26] ,
         \w[7][25] , \w[7][24] , \w[7][23] , \w[7][22] , \w[7][21] ,
         \w[7][20] , \w[7][19] , \w[7][18] , \w[7][17] , \w[7][16] ,
         \w[7][15] , \w[7][14] , \w[7][13] , \w[7][12] , \w[7][11] ,
         \w[7][10] , \w[7][9] , \w[7][8] , \w[7][7] , \w[7][6] , \w[7][5] ,
         \w[7][4] , \w[7][3] , \w[7][2] , \w[7][1] , \w[6][31] , \w[6][30] ,
         \w[6][29] , \w[6][28] , \w[6][27] , \w[6][26] , \w[6][25] ,
         \w[6][24] , \w[6][23] , \w[6][22] , \w[6][21] , \w[6][20] ,
         \w[6][19] , \w[6][18] , \w[6][17] , \w[6][16] , \w[6][15] ,
         \w[6][14] , \w[6][13] , \w[6][12] , \w[6][11] , \w[6][10] , \w[6][9] ,
         \w[6][8] , \w[6][7] , \w[6][6] , \w[6][5] , \w[6][4] , \w[6][3] ,
         \w[6][2] , \w[6][1] , \w[5][31] , \w[5][30] , \w[5][29] , \w[5][28] ,
         \w[5][27] , \w[5][26] , \w[5][25] , \w[5][24] , \w[5][23] ,
         \w[5][22] , \w[5][21] , \w[5][20] , \w[5][19] , \w[5][18] ,
         \w[5][17] , \w[5][16] , \w[5][15] , \w[5][14] , \w[5][13] ,
         \w[5][12] , \w[5][11] , \w[5][10] , \w[5][9] , \w[5][8] , \w[5][7] ,
         \w[5][6] , \w[5][5] , \w[5][4] , \w[5][3] , \w[5][2] , \w[5][1] ,
         \w[4][31] , \w[4][30] , \w[4][29] , \w[4][28] , \w[4][27] ,
         \w[4][26] , \w[4][25] , \w[4][24] , \w[4][23] , \w[4][22] ,
         \w[4][21] , \w[4][20] , \w[4][19] , \w[4][18] , \w[4][17] ,
         \w[4][16] , \w[4][15] , \w[4][14] , \w[4][13] , \w[4][12] ,
         \w[4][11] , \w[4][10] , \w[4][9] , \w[4][8] , \w[4][7] , \w[4][6] ,
         \w[4][5] , \w[4][4] , \w[4][3] , \w[4][2] , \w[4][1] , \w[3][31] ,
         \w[3][30] , \w[3][29] , \w[3][28] , \w[3][27] , \w[3][26] ,
         \w[3][25] , \w[3][24] , \w[3][23] , \w[3][22] , \w[3][21] ,
         \w[3][20] , \w[3][19] , \w[3][18] , \w[3][17] , \w[3][16] ,
         \w[3][15] , \w[3][14] , \w[3][13] , \w[3][12] , \w[3][11] ,
         \w[3][10] , \w[3][9] , \w[3][8] , \w[3][7] , \w[3][6] , \w[3][5] ,
         \w[3][4] , \w[3][3] , \w[3][2] , \w[3][1] , \w[2][31] , \w[2][30] ,
         \w[2][29] , \w[2][28] , \w[2][27] , \w[2][26] , \w[2][25] ,
         \w[2][24] , \w[2][23] , \w[2][22] , \w[2][21] , \w[2][20] ,
         \w[2][19] , \w[2][18] , \w[2][17] , \w[2][16] , \w[2][15] ,
         \w[2][14] , \w[2][13] , \w[2][12] , \w[2][11] , \w[2][10] , \w[2][9] ,
         \w[2][8] , \w[2][7] , \w[2][6] , \w[2][5] , \w[2][4] , \w[2][3] ,
         \w[2][2] , \w[2][1] , \_0_net_[31] , \_0_net_[30] , \_0_net_[29] ,
         \_0_net_[28] , \_0_net_[27] , \_0_net_[26] , \_0_net_[25] ,
         \_0_net_[24] , \_0_net_[23] , \_0_net_[22] , \_0_net_[21] ,
         \_0_net_[20] , \_0_net_[19] , \_0_net_[18] , \_0_net_[17] ,
         \_0_net_[16] , \_0_net_[15] , \_0_net_[14] , \_0_net_[13] ,
         \_0_net_[12] , \_0_net_[11] , \_0_net_[10] , \_0_net_[9] ,
         \_0_net_[8] , \_0_net_[7] , \_0_net_[6] , \_0_net_[5] , \_0_net_[4] ,
         \_0_net_[3] , \_0_net_[2] , \_0_net_[1] , \_2_net_[31] ,
         \_2_net_[30] , \_2_net_[29] , \_2_net_[28] , \_2_net_[27] ,
         \_2_net_[26] , \_2_net_[25] , \_2_net_[24] , \_2_net_[23] ,
         \_2_net_[22] , \_2_net_[21] , \_2_net_[20] , \_2_net_[19] ,
         \_2_net_[18] , \_2_net_[17] , \_2_net_[16] , \_2_net_[15] ,
         \_2_net_[14] , \_2_net_[13] , \_2_net_[12] , \_2_net_[11] ,
         \_2_net_[10] , \_2_net_[9] , \_2_net_[8] , \_2_net_[7] , \_2_net_[6] ,
         \_2_net_[5] , \_2_net_[4] , \_2_net_[3] , \_2_net_[2] , \_4_net_[31] ,
         \_4_net_[30] , \_4_net_[29] , \_4_net_[28] , \_4_net_[27] ,
         \_4_net_[26] , \_4_net_[25] , \_4_net_[24] , \_4_net_[23] ,
         \_4_net_[22] , \_4_net_[21] , \_4_net_[20] , \_4_net_[19] ,
         \_4_net_[18] , \_4_net_[17] , \_4_net_[16] , \_4_net_[15] ,
         \_4_net_[14] , \_4_net_[13] , \_4_net_[12] , \_4_net_[11] ,
         \_4_net_[10] , \_4_net_[9] , \_4_net_[8] , \_4_net_[7] , \_4_net_[6] ,
         \_4_net_[5] , \_4_net_[4] , \_4_net_[3] , \_6_net_[31] ,
         \_6_net_[30] , \_6_net_[29] , \_6_net_[28] , \_6_net_[27] ,
         \_6_net_[26] , \_6_net_[25] , \_6_net_[24] , \_6_net_[23] ,
         \_6_net_[22] , \_6_net_[21] , \_6_net_[20] , \_6_net_[19] ,
         \_6_net_[18] , \_6_net_[17] , \_6_net_[16] , \_6_net_[15] ,
         \_6_net_[14] , \_6_net_[13] , \_6_net_[12] , \_6_net_[11] ,
         \_6_net_[10] , \_6_net_[9] , \_6_net_[8] , \_6_net_[7] , \_6_net_[6] ,
         \_6_net_[5] , \_6_net_[4] , \_8_net_[31] , \_8_net_[30] ,
         \_8_net_[29] , \_8_net_[28] , \_8_net_[27] , \_8_net_[26] ,
         \_8_net_[25] , \_8_net_[24] , \_8_net_[23] , \_8_net_[22] ,
         \_8_net_[21] , \_8_net_[20] , \_8_net_[19] , \_8_net_[18] ,
         \_8_net_[17] , \_8_net_[16] , \_8_net_[15] , \_8_net_[14] ,
         \_8_net_[13] , \_8_net_[12] , \_8_net_[11] , \_8_net_[10] ,
         \_8_net_[9] , \_8_net_[8] , \_8_net_[7] , \_8_net_[6] , \_8_net_[5] ,
         \_10_net_[31] , \_10_net_[30] , \_10_net_[29] , \_10_net_[28] ,
         \_10_net_[27] , \_10_net_[26] , \_10_net_[25] , \_10_net_[24] ,
         \_10_net_[23] , \_10_net_[22] , \_10_net_[21] , \_10_net_[20] ,
         \_10_net_[19] , \_10_net_[18] , \_10_net_[17] , \_10_net_[16] ,
         \_10_net_[15] , \_10_net_[14] , \_10_net_[13] , \_10_net_[12] ,
         \_10_net_[11] , \_10_net_[10] , \_10_net_[9] , \_10_net_[8] ,
         \_10_net_[7] , \_10_net_[6] , \_12_net_[31] , \_12_net_[30] ,
         \_12_net_[29] , \_12_net_[28] , \_12_net_[27] , \_12_net_[26] ,
         \_12_net_[25] , \_12_net_[24] , \_12_net_[23] , \_12_net_[22] ,
         \_12_net_[21] , \_12_net_[20] , \_12_net_[19] , \_12_net_[18] ,
         \_12_net_[17] , \_12_net_[16] , \_12_net_[15] , \_12_net_[14] ,
         \_12_net_[13] , \_12_net_[12] , \_12_net_[11] , \_12_net_[10] ,
         \_12_net_[9] , \_12_net_[8] , \_12_net_[7] , \_14_net_[31] ,
         \_14_net_[30] , \_14_net_[29] , \_14_net_[28] , \_14_net_[27] ,
         \_14_net_[26] , \_14_net_[25] , \_14_net_[24] , \_14_net_[23] ,
         \_14_net_[22] , \_14_net_[21] , \_14_net_[20] , \_14_net_[19] ,
         \_14_net_[18] , \_14_net_[17] , \_14_net_[16] , \_14_net_[15] ,
         \_14_net_[14] , \_14_net_[13] , \_14_net_[12] , \_14_net_[11] ,
         \_14_net_[10] , \_14_net_[9] , \_14_net_[8] , \_16_net_[31] ,
         \_16_net_[30] , \_16_net_[29] , \_16_net_[28] , \_16_net_[27] ,
         \_16_net_[26] , \_16_net_[25] , \_16_net_[24] , \_16_net_[23] ,
         \_16_net_[22] , \_16_net_[21] , \_16_net_[20] , \_16_net_[19] ,
         \_16_net_[18] , \_16_net_[17] , \_16_net_[16] , \_16_net_[15] ,
         \_16_net_[14] , \_16_net_[13] , \_16_net_[12] , \_16_net_[11] ,
         \_16_net_[10] , \_16_net_[9] , \_18_net_[31] , \_18_net_[30] ,
         \_18_net_[29] , \_18_net_[28] , \_18_net_[27] , \_18_net_[26] ,
         \_18_net_[25] , \_18_net_[24] , \_18_net_[23] , \_18_net_[22] ,
         \_18_net_[21] , \_18_net_[20] , \_18_net_[19] , \_18_net_[18] ,
         \_18_net_[17] , \_18_net_[16] , \_18_net_[15] , \_18_net_[14] ,
         \_18_net_[13] , \_18_net_[12] , \_18_net_[11] , \_18_net_[10] ,
         \_20_net_[31] , \_20_net_[30] , \_20_net_[29] , \_20_net_[28] ,
         \_20_net_[27] , \_20_net_[26] , \_20_net_[25] , \_20_net_[24] ,
         \_20_net_[23] , \_20_net_[22] , \_20_net_[21] , \_20_net_[20] ,
         \_20_net_[19] , \_20_net_[18] , \_20_net_[17] , \_20_net_[16] ,
         \_20_net_[15] , \_20_net_[14] , \_20_net_[13] , \_20_net_[12] ,
         \_20_net_[11] , \_22_net_[31] , \_22_net_[30] , \_22_net_[29] ,
         \_22_net_[28] , \_22_net_[27] , \_22_net_[26] , \_22_net_[25] ,
         \_22_net_[24] , \_22_net_[23] , \_22_net_[22] , \_22_net_[21] ,
         \_22_net_[20] , \_22_net_[19] , \_22_net_[18] , \_22_net_[17] ,
         \_22_net_[16] , \_22_net_[15] , \_22_net_[14] , \_22_net_[13] ,
         \_22_net_[12] , \_24_net_[31] , \_24_net_[30] , \_24_net_[29] ,
         \_24_net_[28] , \_24_net_[27] , \_24_net_[26] , \_24_net_[25] ,
         \_24_net_[24] , \_24_net_[23] , \_24_net_[22] , \_24_net_[21] ,
         \_24_net_[20] , \_24_net_[19] , \_24_net_[18] , \_24_net_[17] ,
         \_24_net_[16] , \_24_net_[15] , \_24_net_[14] , \_24_net_[13] ,
         \_26_net_[31] , \_26_net_[30] , \_26_net_[29] , \_26_net_[28] ,
         \_26_net_[27] , \_26_net_[26] , \_26_net_[25] , \_26_net_[24] ,
         \_26_net_[23] , \_26_net_[22] , \_26_net_[21] , \_26_net_[20] ,
         \_26_net_[19] , \_26_net_[18] , \_26_net_[17] , \_26_net_[16] ,
         \_26_net_[15] , \_26_net_[14] , \_28_net_[31] , \_28_net_[30] ,
         \_28_net_[29] , \_28_net_[28] , \_28_net_[27] , \_28_net_[26] ,
         \_28_net_[25] , \_28_net_[24] , \_28_net_[23] , \_28_net_[22] ,
         \_28_net_[21] , \_28_net_[20] , \_28_net_[19] , \_28_net_[18] ,
         \_28_net_[17] , \_28_net_[16] , \_28_net_[15] , \_30_net_[31] ,
         \_30_net_[30] , \_30_net_[29] , \_30_net_[28] , \_30_net_[27] ,
         \_30_net_[26] , \_30_net_[25] , \_30_net_[24] , \_30_net_[23] ,
         \_30_net_[22] , \_30_net_[21] , \_30_net_[20] , \_30_net_[19] ,
         \_30_net_[18] , \_30_net_[17] , \_30_net_[16] , \_32_net_[31] ,
         \_32_net_[30] , \_32_net_[29] , \_32_net_[28] , \_32_net_[27] ,
         \_32_net_[26] , \_32_net_[25] , \_32_net_[24] , \_32_net_[23] ,
         \_32_net_[22] , \_32_net_[21] , \_32_net_[20] , \_32_net_[19] ,
         \_32_net_[18] , \_32_net_[17] , \_34_net_[31] , \_34_net_[30] ,
         \_34_net_[29] , \_34_net_[28] , \_34_net_[27] , \_34_net_[26] ,
         \_34_net_[25] , \_34_net_[24] , \_34_net_[23] , \_34_net_[22] ,
         \_34_net_[21] , \_34_net_[20] , \_34_net_[19] , \_34_net_[18] ,
         \_36_net_[31] , \_36_net_[30] , \_36_net_[29] , \_36_net_[28] ,
         \_36_net_[27] , \_36_net_[26] , \_36_net_[25] , \_36_net_[24] ,
         \_36_net_[23] , \_36_net_[22] , \_36_net_[21] , \_36_net_[20] ,
         \_36_net_[19] , \_38_net_[31] , \_38_net_[30] , \_38_net_[29] ,
         \_38_net_[28] , \_38_net_[27] , \_38_net_[26] , \_38_net_[25] ,
         \_38_net_[24] , \_38_net_[23] , \_38_net_[22] , \_38_net_[21] ,
         \_38_net_[20] , \_40_net_[31] , \_40_net_[30] , \_40_net_[29] ,
         \_40_net_[28] , \_40_net_[27] , \_40_net_[26] , \_40_net_[25] ,
         \_40_net_[24] , \_40_net_[23] , \_40_net_[22] , \_40_net_[21] ,
         \_42_net_[31] , \_42_net_[30] , \_42_net_[29] , \_42_net_[28] ,
         \_42_net_[27] , \_42_net_[26] , \_42_net_[25] , \_42_net_[24] ,
         \_42_net_[23] , \_42_net_[22] , \_44_net_[31] , \_44_net_[30] ,
         \_44_net_[29] , \_44_net_[28] , \_44_net_[27] , \_44_net_[26] ,
         \_44_net_[25] , \_44_net_[24] , \_44_net_[23] , \_46_net_[31] ,
         \_46_net_[30] , \_46_net_[29] , \_46_net_[28] , \_46_net_[27] ,
         \_46_net_[26] , \_46_net_[25] , \_46_net_[24] , \_48_net_[31] ,
         \_48_net_[30] , \_48_net_[29] , \_48_net_[28] , \_48_net_[27] ,
         \_48_net_[26] , \_48_net_[25] , \_50_net_[31] , \_50_net_[30] ,
         \_50_net_[29] , \_50_net_[28] , \_50_net_[27] , \_50_net_[26] ,
         \_52_net_[31] , \_52_net_[30] , \_52_net_[29] , \_52_net_[28] ,
         \_52_net_[27] , \_54_net_[31] , \_54_net_[30] , \_54_net_[29] ,
         \_54_net_[28] , \_56_net_[31] , \_56_net_[30] , \_56_net_[29] ,
         \_58_net_[31] , \_58_net_[30] , \_60_net_[31] ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30;

  ADD_N32_31 \FAINST[1].ADD_  ( .A({\_0_net_[31] , \_0_net_[30] , 
        \_0_net_[29] , \_0_net_[28] , \_0_net_[27] , \_0_net_[26] , 
        \_0_net_[25] , \_0_net_[24] , \_0_net_[23] , \_0_net_[22] , 
        \_0_net_[21] , \_0_net_[20] , \_0_net_[19] , \_0_net_[18] , 
        \_0_net_[17] , \_0_net_[16] , \_0_net_[15] , \_0_net_[14] , 
        \_0_net_[13] , \_0_net_[12] , \_0_net_[11] , \_0_net_[10] , 
        \_0_net_[9] , \_0_net_[8] , \_0_net_[7] , \_0_net_[6] , \_0_net_[5] , 
        \_0_net_[4] , \_0_net_[3] , \_0_net_[2] , \_0_net_[1] , 1'b0}), .B({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .S({
        \w[2][31] , \w[2][30] , \w[2][29] , \w[2][28] , \w[2][27] , \w[2][26] , 
        \w[2][25] , \w[2][24] , \w[2][23] , \w[2][22] , \w[2][21] , \w[2][20] , 
        \w[2][19] , \w[2][18] , \w[2][17] , \w[2][16] , \w[2][15] , \w[2][14] , 
        \w[2][13] , \w[2][12] , \w[2][11] , \w[2][10] , \w[2][9] , \w[2][8] , 
        \w[2][7] , \w[2][6] , \w[2][5] , \w[2][4] , \w[2][3] , \w[2][2] , 
        \w[2][1] , SYNOPSYS_UNCONNECTED__0}) );
  ADD_N32_30 \FAINST[2].ADD_  ( .A({\_2_net_[31] , \_2_net_[30] , 
        \_2_net_[29] , \_2_net_[28] , \_2_net_[27] , \_2_net_[26] , 
        \_2_net_[25] , \_2_net_[24] , \_2_net_[23] , \_2_net_[22] , 
        \_2_net_[21] , \_2_net_[20] , \_2_net_[19] , \_2_net_[18] , 
        \_2_net_[17] , \_2_net_[16] , \_2_net_[15] , \_2_net_[14] , 
        \_2_net_[13] , \_2_net_[12] , \_2_net_[11] , \_2_net_[10] , 
        \_2_net_[9] , \_2_net_[8] , \_2_net_[7] , \_2_net_[6] , \_2_net_[5] , 
        \_2_net_[4] , \_2_net_[3] , \_2_net_[2] , 1'b0, 1'b0}), .B({\w[2][31] , 
        \w[2][30] , \w[2][29] , \w[2][28] , \w[2][27] , \w[2][26] , \w[2][25] , 
        \w[2][24] , \w[2][23] , \w[2][22] , \w[2][21] , \w[2][20] , \w[2][19] , 
        \w[2][18] , \w[2][17] , \w[2][16] , \w[2][15] , \w[2][14] , \w[2][13] , 
        \w[2][12] , \w[2][11] , \w[2][10] , \w[2][9] , \w[2][8] , \w[2][7] , 
        \w[2][6] , \w[2][5] , \w[2][4] , \w[2][3] , \w[2][2] , \w[2][1] , 1'b0}), .CI(1'b0), .S({\w[3][31] , \w[3][30] , \w[3][29] , \w[3][28] , \w[3][27] , 
        \w[3][26] , \w[3][25] , \w[3][24] , \w[3][23] , \w[3][22] , \w[3][21] , 
        \w[3][20] , \w[3][19] , \w[3][18] , \w[3][17] , \w[3][16] , \w[3][15] , 
        \w[3][14] , \w[3][13] , \w[3][12] , \w[3][11] , \w[3][10] , \w[3][9] , 
        \w[3][8] , \w[3][7] , \w[3][6] , \w[3][5] , \w[3][4] , \w[3][3] , 
        \w[3][2] , \w[3][1] , SYNOPSYS_UNCONNECTED__1}) );
  ADD_N32_29 \FAINST[3].ADD_  ( .A({\_4_net_[31] , \_4_net_[30] , 
        \_4_net_[29] , \_4_net_[28] , \_4_net_[27] , \_4_net_[26] , 
        \_4_net_[25] , \_4_net_[24] , \_4_net_[23] , \_4_net_[22] , 
        \_4_net_[21] , \_4_net_[20] , \_4_net_[19] , \_4_net_[18] , 
        \_4_net_[17] , \_4_net_[16] , \_4_net_[15] , \_4_net_[14] , 
        \_4_net_[13] , \_4_net_[12] , \_4_net_[11] , \_4_net_[10] , 
        \_4_net_[9] , \_4_net_[8] , \_4_net_[7] , \_4_net_[6] , \_4_net_[5] , 
        \_4_net_[4] , \_4_net_[3] , 1'b0, 1'b0, 1'b0}), .B({\w[3][31] , 
        \w[3][30] , \w[3][29] , \w[3][28] , \w[3][27] , \w[3][26] , \w[3][25] , 
        \w[3][24] , \w[3][23] , \w[3][22] , \w[3][21] , \w[3][20] , \w[3][19] , 
        \w[3][18] , \w[3][17] , \w[3][16] , \w[3][15] , \w[3][14] , \w[3][13] , 
        \w[3][12] , \w[3][11] , \w[3][10] , \w[3][9] , \w[3][8] , \w[3][7] , 
        \w[3][6] , \w[3][5] , \w[3][4] , \w[3][3] , \w[3][2] , \w[3][1] , 1'b0}), .CI(1'b0), .S({\w[4][31] , \w[4][30] , \w[4][29] , \w[4][28] , \w[4][27] , 
        \w[4][26] , \w[4][25] , \w[4][24] , \w[4][23] , \w[4][22] , \w[4][21] , 
        \w[4][20] , \w[4][19] , \w[4][18] , \w[4][17] , \w[4][16] , \w[4][15] , 
        \w[4][14] , \w[4][13] , \w[4][12] , \w[4][11] , \w[4][10] , \w[4][9] , 
        \w[4][8] , \w[4][7] , \w[4][6] , \w[4][5] , \w[4][4] , \w[4][3] , 
        \w[4][2] , \w[4][1] , SYNOPSYS_UNCONNECTED__2}) );
  ADD_N32_28 \FAINST[4].ADD_  ( .A({\_6_net_[31] , \_6_net_[30] , 
        \_6_net_[29] , \_6_net_[28] , \_6_net_[27] , \_6_net_[26] , 
        \_6_net_[25] , \_6_net_[24] , \_6_net_[23] , \_6_net_[22] , 
        \_6_net_[21] , \_6_net_[20] , \_6_net_[19] , \_6_net_[18] , 
        \_6_net_[17] , \_6_net_[16] , \_6_net_[15] , \_6_net_[14] , 
        \_6_net_[13] , \_6_net_[12] , \_6_net_[11] , \_6_net_[10] , 
        \_6_net_[9] , \_6_net_[8] , \_6_net_[7] , \_6_net_[6] , \_6_net_[5] , 
        \_6_net_[4] , 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[4][31] , \w[4][30] , 
        \w[4][29] , \w[4][28] , \w[4][27] , \w[4][26] , \w[4][25] , \w[4][24] , 
        \w[4][23] , \w[4][22] , \w[4][21] , \w[4][20] , \w[4][19] , \w[4][18] , 
        \w[4][17] , \w[4][16] , \w[4][15] , \w[4][14] , \w[4][13] , \w[4][12] , 
        \w[4][11] , \w[4][10] , \w[4][9] , \w[4][8] , \w[4][7] , \w[4][6] , 
        \w[4][5] , \w[4][4] , \w[4][3] , \w[4][2] , \w[4][1] , 1'b0}), .CI(
        1'b0), .S({\w[5][31] , \w[5][30] , \w[5][29] , \w[5][28] , \w[5][27] , 
        \w[5][26] , \w[5][25] , \w[5][24] , \w[5][23] , \w[5][22] , \w[5][21] , 
        \w[5][20] , \w[5][19] , \w[5][18] , \w[5][17] , \w[5][16] , \w[5][15] , 
        \w[5][14] , \w[5][13] , \w[5][12] , \w[5][11] , \w[5][10] , \w[5][9] , 
        \w[5][8] , \w[5][7] , \w[5][6] , \w[5][5] , \w[5][4] , \w[5][3] , 
        \w[5][2] , \w[5][1] , SYNOPSYS_UNCONNECTED__3}) );
  ADD_N32_27 \FAINST[5].ADD_  ( .A({\_8_net_[31] , \_8_net_[30] , 
        \_8_net_[29] , \_8_net_[28] , \_8_net_[27] , \_8_net_[26] , 
        \_8_net_[25] , \_8_net_[24] , \_8_net_[23] , \_8_net_[22] , 
        \_8_net_[21] , \_8_net_[20] , \_8_net_[19] , \_8_net_[18] , 
        \_8_net_[17] , \_8_net_[16] , \_8_net_[15] , \_8_net_[14] , 
        \_8_net_[13] , \_8_net_[12] , \_8_net_[11] , \_8_net_[10] , 
        \_8_net_[9] , \_8_net_[8] , \_8_net_[7] , \_8_net_[6] , \_8_net_[5] , 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[5][31] , \w[5][30] , \w[5][29] , 
        \w[5][28] , \w[5][27] , \w[5][26] , \w[5][25] , \w[5][24] , \w[5][23] , 
        \w[5][22] , \w[5][21] , \w[5][20] , \w[5][19] , \w[5][18] , \w[5][17] , 
        \w[5][16] , \w[5][15] , \w[5][14] , \w[5][13] , \w[5][12] , \w[5][11] , 
        \w[5][10] , \w[5][9] , \w[5][8] , \w[5][7] , \w[5][6] , \w[5][5] , 
        \w[5][4] , \w[5][3] , \w[5][2] , \w[5][1] , 1'b0}), .CI(1'b0), .S({
        \w[6][31] , \w[6][30] , \w[6][29] , \w[6][28] , \w[6][27] , \w[6][26] , 
        \w[6][25] , \w[6][24] , \w[6][23] , \w[6][22] , \w[6][21] , \w[6][20] , 
        \w[6][19] , \w[6][18] , \w[6][17] , \w[6][16] , \w[6][15] , \w[6][14] , 
        \w[6][13] , \w[6][12] , \w[6][11] , \w[6][10] , \w[6][9] , \w[6][8] , 
        \w[6][7] , \w[6][6] , \w[6][5] , \w[6][4] , \w[6][3] , \w[6][2] , 
        \w[6][1] , SYNOPSYS_UNCONNECTED__4}) );
  ADD_N32_26 \FAINST[6].ADD_  ( .A({\_10_net_[31] , \_10_net_[30] , 
        \_10_net_[29] , \_10_net_[28] , \_10_net_[27] , \_10_net_[26] , 
        \_10_net_[25] , \_10_net_[24] , \_10_net_[23] , \_10_net_[22] , 
        \_10_net_[21] , \_10_net_[20] , \_10_net_[19] , \_10_net_[18] , 
        \_10_net_[17] , \_10_net_[16] , \_10_net_[15] , \_10_net_[14] , 
        \_10_net_[13] , \_10_net_[12] , \_10_net_[11] , \_10_net_[10] , 
        \_10_net_[9] , \_10_net_[8] , \_10_net_[7] , \_10_net_[6] , 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[6][31] , \w[6][30] , \w[6][29] , 
        \w[6][28] , \w[6][27] , \w[6][26] , \w[6][25] , \w[6][24] , \w[6][23] , 
        \w[6][22] , \w[6][21] , \w[6][20] , \w[6][19] , \w[6][18] , \w[6][17] , 
        \w[6][16] , \w[6][15] , \w[6][14] , \w[6][13] , \w[6][12] , \w[6][11] , 
        \w[6][10] , \w[6][9] , \w[6][8] , \w[6][7] , \w[6][6] , \w[6][5] , 
        \w[6][4] , \w[6][3] , \w[6][2] , \w[6][1] , 1'b0}), .CI(1'b0), .S({
        \w[7][31] , \w[7][30] , \w[7][29] , \w[7][28] , \w[7][27] , \w[7][26] , 
        \w[7][25] , \w[7][24] , \w[7][23] , \w[7][22] , \w[7][21] , \w[7][20] , 
        \w[7][19] , \w[7][18] , \w[7][17] , \w[7][16] , \w[7][15] , \w[7][14] , 
        \w[7][13] , \w[7][12] , \w[7][11] , \w[7][10] , \w[7][9] , \w[7][8] , 
        \w[7][7] , \w[7][6] , \w[7][5] , \w[7][4] , \w[7][3] , \w[7][2] , 
        \w[7][1] , SYNOPSYS_UNCONNECTED__5}) );
  ADD_N32_25 \FAINST[7].ADD_  ( .A({\_12_net_[31] , \_12_net_[30] , 
        \_12_net_[29] , \_12_net_[28] , \_12_net_[27] , \_12_net_[26] , 
        \_12_net_[25] , \_12_net_[24] , \_12_net_[23] , \_12_net_[22] , 
        \_12_net_[21] , \_12_net_[20] , \_12_net_[19] , \_12_net_[18] , 
        \_12_net_[17] , \_12_net_[16] , \_12_net_[15] , \_12_net_[14] , 
        \_12_net_[13] , \_12_net_[12] , \_12_net_[11] , \_12_net_[10] , 
        \_12_net_[9] , \_12_net_[8] , \_12_net_[7] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .B({\w[7][31] , \w[7][30] , \w[7][29] , \w[7][28] , 
        \w[7][27] , \w[7][26] , \w[7][25] , \w[7][24] , \w[7][23] , \w[7][22] , 
        \w[7][21] , \w[7][20] , \w[7][19] , \w[7][18] , \w[7][17] , \w[7][16] , 
        \w[7][15] , \w[7][14] , \w[7][13] , \w[7][12] , \w[7][11] , \w[7][10] , 
        \w[7][9] , \w[7][8] , \w[7][7] , \w[7][6] , \w[7][5] , \w[7][4] , 
        \w[7][3] , \w[7][2] , \w[7][1] , 1'b0}), .CI(1'b0), .S({\w[8][31] , 
        \w[8][30] , \w[8][29] , \w[8][28] , \w[8][27] , \w[8][26] , \w[8][25] , 
        \w[8][24] , \w[8][23] , \w[8][22] , \w[8][21] , \w[8][20] , \w[8][19] , 
        \w[8][18] , \w[8][17] , \w[8][16] , \w[8][15] , \w[8][14] , \w[8][13] , 
        \w[8][12] , \w[8][11] , \w[8][10] , \w[8][9] , \w[8][8] , \w[8][7] , 
        \w[8][6] , \w[8][5] , \w[8][4] , \w[8][3] , \w[8][2] , \w[8][1] , 
        SYNOPSYS_UNCONNECTED__6}) );
  ADD_N32_24 \FAINST[8].ADD_  ( .A({\_14_net_[31] , \_14_net_[30] , 
        \_14_net_[29] , \_14_net_[28] , \_14_net_[27] , \_14_net_[26] , 
        \_14_net_[25] , \_14_net_[24] , \_14_net_[23] , \_14_net_[22] , 
        \_14_net_[21] , \_14_net_[20] , \_14_net_[19] , \_14_net_[18] , 
        \_14_net_[17] , \_14_net_[16] , \_14_net_[15] , \_14_net_[14] , 
        \_14_net_[13] , \_14_net_[12] , \_14_net_[11] , \_14_net_[10] , 
        \_14_net_[9] , \_14_net_[8] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .B({\w[8][31] , \w[8][30] , \w[8][29] , \w[8][28] , \w[8][27] , 
        \w[8][26] , \w[8][25] , \w[8][24] , \w[8][23] , \w[8][22] , \w[8][21] , 
        \w[8][20] , \w[8][19] , \w[8][18] , \w[8][17] , \w[8][16] , \w[8][15] , 
        \w[8][14] , \w[8][13] , \w[8][12] , \w[8][11] , \w[8][10] , \w[8][9] , 
        \w[8][8] , \w[8][7] , \w[8][6] , \w[8][5] , \w[8][4] , \w[8][3] , 
        \w[8][2] , \w[8][1] , 1'b0}), .CI(1'b0), .S({\w[9][31] , \w[9][30] , 
        \w[9][29] , \w[9][28] , \w[9][27] , \w[9][26] , \w[9][25] , \w[9][24] , 
        \w[9][23] , \w[9][22] , \w[9][21] , \w[9][20] , \w[9][19] , \w[9][18] , 
        \w[9][17] , \w[9][16] , \w[9][15] , \w[9][14] , \w[9][13] , \w[9][12] , 
        \w[9][11] , \w[9][10] , \w[9][9] , \w[9][8] , \w[9][7] , \w[9][6] , 
        \w[9][5] , \w[9][4] , \w[9][3] , \w[9][2] , \w[9][1] , 
        SYNOPSYS_UNCONNECTED__7}) );
  ADD_N32_23 \FAINST[9].ADD_  ( .A({\_16_net_[31] , \_16_net_[30] , 
        \_16_net_[29] , \_16_net_[28] , \_16_net_[27] , \_16_net_[26] , 
        \_16_net_[25] , \_16_net_[24] , \_16_net_[23] , \_16_net_[22] , 
        \_16_net_[21] , \_16_net_[20] , \_16_net_[19] , \_16_net_[18] , 
        \_16_net_[17] , \_16_net_[16] , \_16_net_[15] , \_16_net_[14] , 
        \_16_net_[13] , \_16_net_[12] , \_16_net_[11] , \_16_net_[10] , 
        \_16_net_[9] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B({\w[9][31] , \w[9][30] , \w[9][29] , \w[9][28] , \w[9][27] , 
        \w[9][26] , \w[9][25] , \w[9][24] , \w[9][23] , \w[9][22] , \w[9][21] , 
        \w[9][20] , \w[9][19] , \w[9][18] , \w[9][17] , \w[9][16] , \w[9][15] , 
        \w[9][14] , \w[9][13] , \w[9][12] , \w[9][11] , \w[9][10] , \w[9][9] , 
        \w[9][8] , \w[9][7] , \w[9][6] , \w[9][5] , \w[9][4] , \w[9][3] , 
        \w[9][2] , \w[9][1] , 1'b0}), .CI(1'b0), .S({\w[10][31] , \w[10][30] , 
        \w[10][29] , \w[10][28] , \w[10][27] , \w[10][26] , \w[10][25] , 
        \w[10][24] , \w[10][23] , \w[10][22] , \w[10][21] , \w[10][20] , 
        \w[10][19] , \w[10][18] , \w[10][17] , \w[10][16] , \w[10][15] , 
        \w[10][14] , \w[10][13] , \w[10][12] , \w[10][11] , \w[10][10] , 
        \w[10][9] , \w[10][8] , \w[10][7] , \w[10][6] , \w[10][5] , \w[10][4] , 
        \w[10][3] , \w[10][2] , \w[10][1] , SYNOPSYS_UNCONNECTED__8}) );
  ADD_N32_22 \FAINST[10].ADD_  ( .A({\_18_net_[31] , \_18_net_[30] , 
        \_18_net_[29] , \_18_net_[28] , \_18_net_[27] , \_18_net_[26] , 
        \_18_net_[25] , \_18_net_[24] , \_18_net_[23] , \_18_net_[22] , 
        \_18_net_[21] , \_18_net_[20] , \_18_net_[19] , \_18_net_[18] , 
        \_18_net_[17] , \_18_net_[16] , \_18_net_[15] , \_18_net_[14] , 
        \_18_net_[13] , \_18_net_[12] , \_18_net_[11] , \_18_net_[10] , 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({
        \w[10][31] , \w[10][30] , \w[10][29] , \w[10][28] , \w[10][27] , 
        \w[10][26] , \w[10][25] , \w[10][24] , \w[10][23] , \w[10][22] , 
        \w[10][21] , \w[10][20] , \w[10][19] , \w[10][18] , \w[10][17] , 
        \w[10][16] , \w[10][15] , \w[10][14] , \w[10][13] , \w[10][12] , 
        \w[10][11] , \w[10][10] , \w[10][9] , \w[10][8] , \w[10][7] , 
        \w[10][6] , \w[10][5] , \w[10][4] , \w[10][3] , \w[10][2] , \w[10][1] , 
        1'b0}), .CI(1'b0), .S({\w[11][31] , \w[11][30] , \w[11][29] , 
        \w[11][28] , \w[11][27] , \w[11][26] , \w[11][25] , \w[11][24] , 
        \w[11][23] , \w[11][22] , \w[11][21] , \w[11][20] , \w[11][19] , 
        \w[11][18] , \w[11][17] , \w[11][16] , \w[11][15] , \w[11][14] , 
        \w[11][13] , \w[11][12] , \w[11][11] , \w[11][10] , \w[11][9] , 
        \w[11][8] , \w[11][7] , \w[11][6] , \w[11][5] , \w[11][4] , \w[11][3] , 
        \w[11][2] , \w[11][1] , SYNOPSYS_UNCONNECTED__9}) );
  ADD_N32_21 \FAINST[11].ADD_  ( .A({\_20_net_[31] , \_20_net_[30] , 
        \_20_net_[29] , \_20_net_[28] , \_20_net_[27] , \_20_net_[26] , 
        \_20_net_[25] , \_20_net_[24] , \_20_net_[23] , \_20_net_[22] , 
        \_20_net_[21] , \_20_net_[20] , \_20_net_[19] , \_20_net_[18] , 
        \_20_net_[17] , \_20_net_[16] , \_20_net_[15] , \_20_net_[14] , 
        \_20_net_[13] , \_20_net_[12] , \_20_net_[11] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[11][31] , 
        \w[11][30] , \w[11][29] , \w[11][28] , \w[11][27] , \w[11][26] , 
        \w[11][25] , \w[11][24] , \w[11][23] , \w[11][22] , \w[11][21] , 
        \w[11][20] , \w[11][19] , \w[11][18] , \w[11][17] , \w[11][16] , 
        \w[11][15] , \w[11][14] , \w[11][13] , \w[11][12] , \w[11][11] , 
        \w[11][10] , \w[11][9] , \w[11][8] , \w[11][7] , \w[11][6] , 
        \w[11][5] , \w[11][4] , \w[11][3] , \w[11][2] , \w[11][1] , 1'b0}), 
        .CI(1'b0), .S({\w[12][31] , \w[12][30] , \w[12][29] , \w[12][28] , 
        \w[12][27] , \w[12][26] , \w[12][25] , \w[12][24] , \w[12][23] , 
        \w[12][22] , \w[12][21] , \w[12][20] , \w[12][19] , \w[12][18] , 
        \w[12][17] , \w[12][16] , \w[12][15] , \w[12][14] , \w[12][13] , 
        \w[12][12] , \w[12][11] , \w[12][10] , \w[12][9] , \w[12][8] , 
        \w[12][7] , \w[12][6] , \w[12][5] , \w[12][4] , \w[12][3] , \w[12][2] , 
        \w[12][1] , SYNOPSYS_UNCONNECTED__10}) );
  ADD_N32_20 \FAINST[12].ADD_  ( .A({\_22_net_[31] , \_22_net_[30] , 
        \_22_net_[29] , \_22_net_[28] , \_22_net_[27] , \_22_net_[26] , 
        \_22_net_[25] , \_22_net_[24] , \_22_net_[23] , \_22_net_[22] , 
        \_22_net_[21] , \_22_net_[20] , \_22_net_[19] , \_22_net_[18] , 
        \_22_net_[17] , \_22_net_[16] , \_22_net_[15] , \_22_net_[14] , 
        \_22_net_[13] , \_22_net_[12] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[12][31] , \w[12][30] , 
        \w[12][29] , \w[12][28] , \w[12][27] , \w[12][26] , \w[12][25] , 
        \w[12][24] , \w[12][23] , \w[12][22] , \w[12][21] , \w[12][20] , 
        \w[12][19] , \w[12][18] , \w[12][17] , \w[12][16] , \w[12][15] , 
        \w[12][14] , \w[12][13] , \w[12][12] , \w[12][11] , \w[12][10] , 
        \w[12][9] , \w[12][8] , \w[12][7] , \w[12][6] , \w[12][5] , \w[12][4] , 
        \w[12][3] , \w[12][2] , \w[12][1] , 1'b0}), .CI(1'b0), .S({\w[13][31] , 
        \w[13][30] , \w[13][29] , \w[13][28] , \w[13][27] , \w[13][26] , 
        \w[13][25] , \w[13][24] , \w[13][23] , \w[13][22] , \w[13][21] , 
        \w[13][20] , \w[13][19] , \w[13][18] , \w[13][17] , \w[13][16] , 
        \w[13][15] , \w[13][14] , \w[13][13] , \w[13][12] , \w[13][11] , 
        \w[13][10] , \w[13][9] , \w[13][8] , \w[13][7] , \w[13][6] , 
        \w[13][5] , \w[13][4] , \w[13][3] , \w[13][2] , \w[13][1] , 
        SYNOPSYS_UNCONNECTED__11}) );
  ADD_N32_19 \FAINST[13].ADD_  ( .A({\_24_net_[31] , \_24_net_[30] , 
        \_24_net_[29] , \_24_net_[28] , \_24_net_[27] , \_24_net_[26] , 
        \_24_net_[25] , \_24_net_[24] , \_24_net_[23] , \_24_net_[22] , 
        \_24_net_[21] , \_24_net_[20] , \_24_net_[19] , \_24_net_[18] , 
        \_24_net_[17] , \_24_net_[16] , \_24_net_[15] , \_24_net_[14] , 
        \_24_net_[13] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[13][31] , \w[13][30] , \w[13][29] , 
        \w[13][28] , \w[13][27] , \w[13][26] , \w[13][25] , \w[13][24] , 
        \w[13][23] , \w[13][22] , \w[13][21] , \w[13][20] , \w[13][19] , 
        \w[13][18] , \w[13][17] , \w[13][16] , \w[13][15] , \w[13][14] , 
        \w[13][13] , \w[13][12] , \w[13][11] , \w[13][10] , \w[13][9] , 
        \w[13][8] , \w[13][7] , \w[13][6] , \w[13][5] , \w[13][4] , \w[13][3] , 
        \w[13][2] , \w[13][1] , 1'b0}), .CI(1'b0), .S({\w[14][31] , 
        \w[14][30] , \w[14][29] , \w[14][28] , \w[14][27] , \w[14][26] , 
        \w[14][25] , \w[14][24] , \w[14][23] , \w[14][22] , \w[14][21] , 
        \w[14][20] , \w[14][19] , \w[14][18] , \w[14][17] , \w[14][16] , 
        \w[14][15] , \w[14][14] , \w[14][13] , \w[14][12] , \w[14][11] , 
        \w[14][10] , \w[14][9] , \w[14][8] , \w[14][7] , \w[14][6] , 
        \w[14][5] , \w[14][4] , \w[14][3] , \w[14][2] , \w[14][1] , 
        SYNOPSYS_UNCONNECTED__12}) );
  ADD_N32_18 \FAINST[14].ADD_  ( .A({\_26_net_[31] , \_26_net_[30] , 
        \_26_net_[29] , \_26_net_[28] , \_26_net_[27] , \_26_net_[26] , 
        \_26_net_[25] , \_26_net_[24] , \_26_net_[23] , \_26_net_[22] , 
        \_26_net_[21] , \_26_net_[20] , \_26_net_[19] , \_26_net_[18] , 
        \_26_net_[17] , \_26_net_[16] , \_26_net_[15] , \_26_net_[14] , 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .B({\w[14][31] , \w[14][30] , \w[14][29] , \w[14][28] , 
        \w[14][27] , \w[14][26] , \w[14][25] , \w[14][24] , \w[14][23] , 
        \w[14][22] , \w[14][21] , \w[14][20] , \w[14][19] , \w[14][18] , 
        \w[14][17] , \w[14][16] , \w[14][15] , \w[14][14] , \w[14][13] , 
        \w[14][12] , \w[14][11] , \w[14][10] , \w[14][9] , \w[14][8] , 
        \w[14][7] , \w[14][6] , \w[14][5] , \w[14][4] , \w[14][3] , \w[14][2] , 
        \w[14][1] , 1'b0}), .CI(1'b0), .S({\w[15][31] , \w[15][30] , 
        \w[15][29] , \w[15][28] , \w[15][27] , \w[15][26] , \w[15][25] , 
        \w[15][24] , \w[15][23] , \w[15][22] , \w[15][21] , \w[15][20] , 
        \w[15][19] , \w[15][18] , \w[15][17] , \w[15][16] , \w[15][15] , 
        \w[15][14] , \w[15][13] , \w[15][12] , \w[15][11] , \w[15][10] , 
        \w[15][9] , \w[15][8] , \w[15][7] , \w[15][6] , \w[15][5] , \w[15][4] , 
        \w[15][3] , \w[15][2] , \w[15][1] , SYNOPSYS_UNCONNECTED__13}) );
  ADD_N32_17 \FAINST[15].ADD_  ( .A({\_28_net_[31] , \_28_net_[30] , 
        \_28_net_[29] , \_28_net_[28] , \_28_net_[27] , \_28_net_[26] , 
        \_28_net_[25] , \_28_net_[24] , \_28_net_[23] , \_28_net_[22] , 
        \_28_net_[21] , \_28_net_[20] , \_28_net_[19] , \_28_net_[18] , 
        \_28_net_[17] , \_28_net_[16] , \_28_net_[15] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B({\w[15][31] , \w[15][30] , \w[15][29] , \w[15][28] , \w[15][27] , 
        \w[15][26] , \w[15][25] , \w[15][24] , \w[15][23] , \w[15][22] , 
        \w[15][21] , \w[15][20] , \w[15][19] , \w[15][18] , \w[15][17] , 
        \w[15][16] , \w[15][15] , \w[15][14] , \w[15][13] , \w[15][12] , 
        \w[15][11] , \w[15][10] , \w[15][9] , \w[15][8] , \w[15][7] , 
        \w[15][6] , \w[15][5] , \w[15][4] , \w[15][3] , \w[15][2] , \w[15][1] , 
        1'b0}), .CI(1'b0), .S({\w[16][31] , \w[16][30] , \w[16][29] , 
        \w[16][28] , \w[16][27] , \w[16][26] , \w[16][25] , \w[16][24] , 
        \w[16][23] , \w[16][22] , \w[16][21] , \w[16][20] , \w[16][19] , 
        \w[16][18] , \w[16][17] , \w[16][16] , \w[16][15] , \w[16][14] , 
        \w[16][13] , \w[16][12] , \w[16][11] , \w[16][10] , \w[16][9] , 
        \w[16][8] , \w[16][7] , \w[16][6] , \w[16][5] , \w[16][4] , \w[16][3] , 
        \w[16][2] , \w[16][1] , SYNOPSYS_UNCONNECTED__14}) );
  ADD_N32_16 \FAINST[16].ADD_  ( .A({\_30_net_[31] , \_30_net_[30] , 
        \_30_net_[29] , \_30_net_[28] , \_30_net_[27] , \_30_net_[26] , 
        \_30_net_[25] , \_30_net_[24] , \_30_net_[23] , \_30_net_[22] , 
        \_30_net_[21] , \_30_net_[20] , \_30_net_[19] , \_30_net_[18] , 
        \_30_net_[17] , \_30_net_[16] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({
        \w[16][31] , \w[16][30] , \w[16][29] , \w[16][28] , \w[16][27] , 
        \w[16][26] , \w[16][25] , \w[16][24] , \w[16][23] , \w[16][22] , 
        \w[16][21] , \w[16][20] , \w[16][19] , \w[16][18] , \w[16][17] , 
        \w[16][16] , \w[16][15] , \w[16][14] , \w[16][13] , \w[16][12] , 
        \w[16][11] , \w[16][10] , \w[16][9] , \w[16][8] , \w[16][7] , 
        \w[16][6] , \w[16][5] , \w[16][4] , \w[16][3] , \w[16][2] , \w[16][1] , 
        1'b0}), .CI(1'b0), .S({\w[17][31] , \w[17][30] , \w[17][29] , 
        \w[17][28] , \w[17][27] , \w[17][26] , \w[17][25] , \w[17][24] , 
        \w[17][23] , \w[17][22] , \w[17][21] , \w[17][20] , \w[17][19] , 
        \w[17][18] , \w[17][17] , \w[17][16] , \w[17][15] , \w[17][14] , 
        \w[17][13] , \w[17][12] , \w[17][11] , \w[17][10] , \w[17][9] , 
        \w[17][8] , \w[17][7] , \w[17][6] , \w[17][5] , \w[17][4] , \w[17][3] , 
        \w[17][2] , \w[17][1] , SYNOPSYS_UNCONNECTED__15}) );
  ADD_N32_15 \FAINST[17].ADD_  ( .A({\_32_net_[31] , \_32_net_[30] , 
        \_32_net_[29] , \_32_net_[28] , \_32_net_[27] , \_32_net_[26] , 
        \_32_net_[25] , \_32_net_[24] , \_32_net_[23] , \_32_net_[22] , 
        \_32_net_[21] , \_32_net_[20] , \_32_net_[19] , \_32_net_[18] , 
        \_32_net_[17] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[17][31] , 
        \w[17][30] , \w[17][29] , \w[17][28] , \w[17][27] , \w[17][26] , 
        \w[17][25] , \w[17][24] , \w[17][23] , \w[17][22] , \w[17][21] , 
        \w[17][20] , \w[17][19] , \w[17][18] , \w[17][17] , \w[17][16] , 
        \w[17][15] , \w[17][14] , \w[17][13] , \w[17][12] , \w[17][11] , 
        \w[17][10] , \w[17][9] , \w[17][8] , \w[17][7] , \w[17][6] , 
        \w[17][5] , \w[17][4] , \w[17][3] , \w[17][2] , \w[17][1] , 1'b0}), 
        .CI(1'b0), .S({\w[18][31] , \w[18][30] , \w[18][29] , \w[18][28] , 
        \w[18][27] , \w[18][26] , \w[18][25] , \w[18][24] , \w[18][23] , 
        \w[18][22] , \w[18][21] , \w[18][20] , \w[18][19] , \w[18][18] , 
        \w[18][17] , \w[18][16] , \w[18][15] , \w[18][14] , \w[18][13] , 
        \w[18][12] , \w[18][11] , \w[18][10] , \w[18][9] , \w[18][8] , 
        \w[18][7] , \w[18][6] , \w[18][5] , \w[18][4] , \w[18][3] , \w[18][2] , 
        \w[18][1] , SYNOPSYS_UNCONNECTED__16}) );
  ADD_N32_14 \FAINST[18].ADD_  ( .A({\_34_net_[31] , \_34_net_[30] , 
        \_34_net_[29] , \_34_net_[28] , \_34_net_[27] , \_34_net_[26] , 
        \_34_net_[25] , \_34_net_[24] , \_34_net_[23] , \_34_net_[22] , 
        \_34_net_[21] , \_34_net_[20] , \_34_net_[19] , \_34_net_[18] , 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[18][31] , \w[18][30] , 
        \w[18][29] , \w[18][28] , \w[18][27] , \w[18][26] , \w[18][25] , 
        \w[18][24] , \w[18][23] , \w[18][22] , \w[18][21] , \w[18][20] , 
        \w[18][19] , \w[18][18] , \w[18][17] , \w[18][16] , \w[18][15] , 
        \w[18][14] , \w[18][13] , \w[18][12] , \w[18][11] , \w[18][10] , 
        \w[18][9] , \w[18][8] , \w[18][7] , \w[18][6] , \w[18][5] , \w[18][4] , 
        \w[18][3] , \w[18][2] , \w[18][1] , 1'b0}), .CI(1'b0), .S({\w[19][31] , 
        \w[19][30] , \w[19][29] , \w[19][28] , \w[19][27] , \w[19][26] , 
        \w[19][25] , \w[19][24] , \w[19][23] , \w[19][22] , \w[19][21] , 
        \w[19][20] , \w[19][19] , \w[19][18] , \w[19][17] , \w[19][16] , 
        \w[19][15] , \w[19][14] , \w[19][13] , \w[19][12] , \w[19][11] , 
        \w[19][10] , \w[19][9] , \w[19][8] , \w[19][7] , \w[19][6] , 
        \w[19][5] , \w[19][4] , \w[19][3] , \w[19][2] , \w[19][1] , 
        SYNOPSYS_UNCONNECTED__17}) );
  ADD_N32_13 \FAINST[19].ADD_  ( .A({\_36_net_[31] , \_36_net_[30] , 
        \_36_net_[29] , \_36_net_[28] , \_36_net_[27] , \_36_net_[26] , 
        \_36_net_[25] , \_36_net_[24] , \_36_net_[23] , \_36_net_[22] , 
        \_36_net_[21] , \_36_net_[20] , \_36_net_[19] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .B({\w[19][31] , \w[19][30] , \w[19][29] , 
        \w[19][28] , \w[19][27] , \w[19][26] , \w[19][25] , \w[19][24] , 
        \w[19][23] , \w[19][22] , \w[19][21] , \w[19][20] , \w[19][19] , 
        \w[19][18] , \w[19][17] , \w[19][16] , \w[19][15] , \w[19][14] , 
        \w[19][13] , \w[19][12] , \w[19][11] , \w[19][10] , \w[19][9] , 
        \w[19][8] , \w[19][7] , \w[19][6] , \w[19][5] , \w[19][4] , \w[19][3] , 
        \w[19][2] , \w[19][1] , 1'b0}), .CI(1'b0), .S({\w[20][31] , 
        \w[20][30] , \w[20][29] , \w[20][28] , \w[20][27] , \w[20][26] , 
        \w[20][25] , \w[20][24] , \w[20][23] , \w[20][22] , \w[20][21] , 
        \w[20][20] , \w[20][19] , \w[20][18] , \w[20][17] , \w[20][16] , 
        \w[20][15] , \w[20][14] , \w[20][13] , \w[20][12] , \w[20][11] , 
        \w[20][10] , \w[20][9] , \w[20][8] , \w[20][7] , \w[20][6] , 
        \w[20][5] , \w[20][4] , \w[20][3] , \w[20][2] , \w[20][1] , 
        SYNOPSYS_UNCONNECTED__18}) );
  ADD_N32_12 \FAINST[20].ADD_  ( .A({\_38_net_[31] , \_38_net_[30] , 
        \_38_net_[29] , \_38_net_[28] , \_38_net_[27] , \_38_net_[26] , 
        \_38_net_[25] , \_38_net_[24] , \_38_net_[23] , \_38_net_[22] , 
        \_38_net_[21] , \_38_net_[20] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .B({\w[20][31] , \w[20][30] , \w[20][29] , \w[20][28] , 
        \w[20][27] , \w[20][26] , \w[20][25] , \w[20][24] , \w[20][23] , 
        \w[20][22] , \w[20][21] , \w[20][20] , \w[20][19] , \w[20][18] , 
        \w[20][17] , \w[20][16] , \w[20][15] , \w[20][14] , \w[20][13] , 
        \w[20][12] , \w[20][11] , \w[20][10] , \w[20][9] , \w[20][8] , 
        \w[20][7] , \w[20][6] , \w[20][5] , \w[20][4] , \w[20][3] , \w[20][2] , 
        \w[20][1] , 1'b0}), .CI(1'b0), .S({\w[21][31] , \w[21][30] , 
        \w[21][29] , \w[21][28] , \w[21][27] , \w[21][26] , \w[21][25] , 
        \w[21][24] , \w[21][23] , \w[21][22] , \w[21][21] , \w[21][20] , 
        \w[21][19] , \w[21][18] , \w[21][17] , \w[21][16] , \w[21][15] , 
        \w[21][14] , \w[21][13] , \w[21][12] , \w[21][11] , \w[21][10] , 
        \w[21][9] , \w[21][8] , \w[21][7] , \w[21][6] , \w[21][5] , \w[21][4] , 
        \w[21][3] , \w[21][2] , \w[21][1] , SYNOPSYS_UNCONNECTED__19}) );
  ADD_N32_11 \FAINST[21].ADD_  ( .A({\_40_net_[31] , \_40_net_[30] , 
        \_40_net_[29] , \_40_net_[28] , \_40_net_[27] , \_40_net_[26] , 
        \_40_net_[25] , \_40_net_[24] , \_40_net_[23] , \_40_net_[22] , 
        \_40_net_[21] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[21][31] , \w[21][30] , \w[21][29] , \w[21][28] , \w[21][27] , 
        \w[21][26] , \w[21][25] , \w[21][24] , \w[21][23] , \w[21][22] , 
        \w[21][21] , \w[21][20] , \w[21][19] , \w[21][18] , \w[21][17] , 
        \w[21][16] , \w[21][15] , \w[21][14] , \w[21][13] , \w[21][12] , 
        \w[21][11] , \w[21][10] , \w[21][9] , \w[21][8] , \w[21][7] , 
        \w[21][6] , \w[21][5] , \w[21][4] , \w[21][3] , \w[21][2] , \w[21][1] , 
        1'b0}), .CI(1'b0), .S({\w[22][31] , \w[22][30] , \w[22][29] , 
        \w[22][28] , \w[22][27] , \w[22][26] , \w[22][25] , \w[22][24] , 
        \w[22][23] , \w[22][22] , \w[22][21] , \w[22][20] , \w[22][19] , 
        \w[22][18] , \w[22][17] , \w[22][16] , \w[22][15] , \w[22][14] , 
        \w[22][13] , \w[22][12] , \w[22][11] , \w[22][10] , \w[22][9] , 
        \w[22][8] , \w[22][7] , \w[22][6] , \w[22][5] , \w[22][4] , \w[22][3] , 
        \w[22][2] , \w[22][1] , SYNOPSYS_UNCONNECTED__20}) );
  ADD_N32_10 \FAINST[22].ADD_  ( .A({\_42_net_[31] , \_42_net_[30] , 
        \_42_net_[29] , \_42_net_[28] , \_42_net_[27] , \_42_net_[26] , 
        \_42_net_[25] , \_42_net_[24] , \_42_net_[23] , \_42_net_[22] , 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({
        \w[22][31] , \w[22][30] , \w[22][29] , \w[22][28] , \w[22][27] , 
        \w[22][26] , \w[22][25] , \w[22][24] , \w[22][23] , \w[22][22] , 
        \w[22][21] , \w[22][20] , \w[22][19] , \w[22][18] , \w[22][17] , 
        \w[22][16] , \w[22][15] , \w[22][14] , \w[22][13] , \w[22][12] , 
        \w[22][11] , \w[22][10] , \w[22][9] , \w[22][8] , \w[22][7] , 
        \w[22][6] , \w[22][5] , \w[22][4] , \w[22][3] , \w[22][2] , \w[22][1] , 
        1'b0}), .CI(1'b0), .S({\w[23][31] , \w[23][30] , \w[23][29] , 
        \w[23][28] , \w[23][27] , \w[23][26] , \w[23][25] , \w[23][24] , 
        \w[23][23] , \w[23][22] , \w[23][21] , \w[23][20] , \w[23][19] , 
        \w[23][18] , \w[23][17] , \w[23][16] , \w[23][15] , \w[23][14] , 
        \w[23][13] , \w[23][12] , \w[23][11] , \w[23][10] , \w[23][9] , 
        \w[23][8] , \w[23][7] , \w[23][6] , \w[23][5] , \w[23][4] , \w[23][3] , 
        \w[23][2] , \w[23][1] , SYNOPSYS_UNCONNECTED__21}) );
  ADD_N32_9 \FAINST[23].ADD_  ( .A({\_44_net_[31] , \_44_net_[30] , 
        \_44_net_[29] , \_44_net_[28] , \_44_net_[27] , \_44_net_[26] , 
        \_44_net_[25] , \_44_net_[24] , \_44_net_[23] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[23][31] , 
        \w[23][30] , \w[23][29] , \w[23][28] , \w[23][27] , \w[23][26] , 
        \w[23][25] , \w[23][24] , \w[23][23] , \w[23][22] , \w[23][21] , 
        \w[23][20] , \w[23][19] , \w[23][18] , \w[23][17] , \w[23][16] , 
        \w[23][15] , \w[23][14] , \w[23][13] , \w[23][12] , \w[23][11] , 
        \w[23][10] , \w[23][9] , \w[23][8] , \w[23][7] , \w[23][6] , 
        \w[23][5] , \w[23][4] , \w[23][3] , \w[23][2] , \w[23][1] , 1'b0}), 
        .CI(1'b0), .S({\w[24][31] , \w[24][30] , \w[24][29] , \w[24][28] , 
        \w[24][27] , \w[24][26] , \w[24][25] , \w[24][24] , \w[24][23] , 
        \w[24][22] , \w[24][21] , \w[24][20] , \w[24][19] , \w[24][18] , 
        \w[24][17] , \w[24][16] , \w[24][15] , \w[24][14] , \w[24][13] , 
        \w[24][12] , \w[24][11] , \w[24][10] , \w[24][9] , \w[24][8] , 
        \w[24][7] , \w[24][6] , \w[24][5] , \w[24][4] , \w[24][3] , \w[24][2] , 
        \w[24][1] , SYNOPSYS_UNCONNECTED__22}) );
  ADD_N32_8 \FAINST[24].ADD_  ( .A({\_46_net_[31] , \_46_net_[30] , 
        \_46_net_[29] , \_46_net_[28] , \_46_net_[27] , \_46_net_[26] , 
        \_46_net_[25] , \_46_net_[24] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[24][31] , \w[24][30] , 
        \w[24][29] , \w[24][28] , \w[24][27] , \w[24][26] , \w[24][25] , 
        \w[24][24] , \w[24][23] , \w[24][22] , \w[24][21] , \w[24][20] , 
        \w[24][19] , \w[24][18] , \w[24][17] , \w[24][16] , \w[24][15] , 
        \w[24][14] , \w[24][13] , \w[24][12] , \w[24][11] , \w[24][10] , 
        \w[24][9] , \w[24][8] , \w[24][7] , \w[24][6] , \w[24][5] , \w[24][4] , 
        \w[24][3] , \w[24][2] , \w[24][1] , 1'b0}), .CI(1'b0), .S({\w[25][31] , 
        \w[25][30] , \w[25][29] , \w[25][28] , \w[25][27] , \w[25][26] , 
        \w[25][25] , \w[25][24] , \w[25][23] , \w[25][22] , \w[25][21] , 
        \w[25][20] , \w[25][19] , \w[25][18] , \w[25][17] , \w[25][16] , 
        \w[25][15] , \w[25][14] , \w[25][13] , \w[25][12] , \w[25][11] , 
        \w[25][10] , \w[25][9] , \w[25][8] , \w[25][7] , \w[25][6] , 
        \w[25][5] , \w[25][4] , \w[25][3] , \w[25][2] , \w[25][1] , 
        SYNOPSYS_UNCONNECTED__23}) );
  ADD_N32_7 \FAINST[25].ADD_  ( .A({\_48_net_[31] , \_48_net_[30] , 
        \_48_net_[29] , \_48_net_[28] , \_48_net_[27] , \_48_net_[26] , 
        \_48_net_[25] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[25][31] , \w[25][30] , \w[25][29] , 
        \w[25][28] , \w[25][27] , \w[25][26] , \w[25][25] , \w[25][24] , 
        \w[25][23] , \w[25][22] , \w[25][21] , \w[25][20] , \w[25][19] , 
        \w[25][18] , \w[25][17] , \w[25][16] , \w[25][15] , \w[25][14] , 
        \w[25][13] , \w[25][12] , \w[25][11] , \w[25][10] , \w[25][9] , 
        \w[25][8] , \w[25][7] , \w[25][6] , \w[25][5] , \w[25][4] , \w[25][3] , 
        \w[25][2] , \w[25][1] , 1'b0}), .CI(1'b0), .S({\w[26][31] , 
        \w[26][30] , \w[26][29] , \w[26][28] , \w[26][27] , \w[26][26] , 
        \w[26][25] , \w[26][24] , \w[26][23] , \w[26][22] , \w[26][21] , 
        \w[26][20] , \w[26][19] , \w[26][18] , \w[26][17] , \w[26][16] , 
        \w[26][15] , \w[26][14] , \w[26][13] , \w[26][12] , \w[26][11] , 
        \w[26][10] , \w[26][9] , \w[26][8] , \w[26][7] , \w[26][6] , 
        \w[26][5] , \w[26][4] , \w[26][3] , \w[26][2] , \w[26][1] , 
        SYNOPSYS_UNCONNECTED__24}) );
  ADD_N32_6 \FAINST[26].ADD_  ( .A({\_50_net_[31] , \_50_net_[30] , 
        \_50_net_[29] , \_50_net_[28] , \_50_net_[27] , \_50_net_[26] , 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .B({\w[26][31] , \w[26][30] , \w[26][29] , \w[26][28] , 
        \w[26][27] , \w[26][26] , \w[26][25] , \w[26][24] , \w[26][23] , 
        \w[26][22] , \w[26][21] , \w[26][20] , \w[26][19] , \w[26][18] , 
        \w[26][17] , \w[26][16] , \w[26][15] , \w[26][14] , \w[26][13] , 
        \w[26][12] , \w[26][11] , \w[26][10] , \w[26][9] , \w[26][8] , 
        \w[26][7] , \w[26][6] , \w[26][5] , \w[26][4] , \w[26][3] , \w[26][2] , 
        \w[26][1] , 1'b0}), .CI(1'b0), .S({\w[27][31] , \w[27][30] , 
        \w[27][29] , \w[27][28] , \w[27][27] , \w[27][26] , \w[27][25] , 
        \w[27][24] , \w[27][23] , \w[27][22] , \w[27][21] , \w[27][20] , 
        \w[27][19] , \w[27][18] , \w[27][17] , \w[27][16] , \w[27][15] , 
        \w[27][14] , \w[27][13] , \w[27][12] , \w[27][11] , \w[27][10] , 
        \w[27][9] , \w[27][8] , \w[27][7] , \w[27][6] , \w[27][5] , \w[27][4] , 
        \w[27][3] , \w[27][2] , \w[27][1] , SYNOPSYS_UNCONNECTED__25}) );
  ADD_N32_5 \FAINST[27].ADD_  ( .A({\_52_net_[31] , \_52_net_[30] , 
        \_52_net_[29] , \_52_net_[28] , \_52_net_[27] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B({\w[27][31] , \w[27][30] , \w[27][29] , \w[27][28] , \w[27][27] , 
        \w[27][26] , \w[27][25] , \w[27][24] , \w[27][23] , \w[27][22] , 
        \w[27][21] , \w[27][20] , \w[27][19] , \w[27][18] , \w[27][17] , 
        \w[27][16] , \w[27][15] , \w[27][14] , \w[27][13] , \w[27][12] , 
        \w[27][11] , \w[27][10] , \w[27][9] , \w[27][8] , \w[27][7] , 
        \w[27][6] , \w[27][5] , \w[27][4] , \w[27][3] , \w[27][2] , \w[27][1] , 
        1'b0}), .CI(1'b0), .S({\w[28][31] , \w[28][30] , \w[28][29] , 
        \w[28][28] , \w[28][27] , \w[28][26] , \w[28][25] , \w[28][24] , 
        \w[28][23] , \w[28][22] , \w[28][21] , \w[28][20] , \w[28][19] , 
        \w[28][18] , \w[28][17] , \w[28][16] , \w[28][15] , \w[28][14] , 
        \w[28][13] , \w[28][12] , \w[28][11] , \w[28][10] , \w[28][9] , 
        \w[28][8] , \w[28][7] , \w[28][6] , \w[28][5] , \w[28][4] , \w[28][3] , 
        \w[28][2] , \w[28][1] , SYNOPSYS_UNCONNECTED__26}) );
  ADD_N32_4 \FAINST[28].ADD_  ( .A({\_54_net_[31] , \_54_net_[30] , 
        \_54_net_[29] , \_54_net_[28] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({
        \w[28][31] , \w[28][30] , \w[28][29] , \w[28][28] , \w[28][27] , 
        \w[28][26] , \w[28][25] , \w[28][24] , \w[28][23] , \w[28][22] , 
        \w[28][21] , \w[28][20] , \w[28][19] , \w[28][18] , \w[28][17] , 
        \w[28][16] , \w[28][15] , \w[28][14] , \w[28][13] , \w[28][12] , 
        \w[28][11] , \w[28][10] , \w[28][9] , \w[28][8] , \w[28][7] , 
        \w[28][6] , \w[28][5] , \w[28][4] , \w[28][3] , \w[28][2] , \w[28][1] , 
        1'b0}), .CI(1'b0), .S({\w[29][31] , \w[29][30] , \w[29][29] , 
        \w[29][28] , \w[29][27] , \w[29][26] , \w[29][25] , \w[29][24] , 
        \w[29][23] , \w[29][22] , \w[29][21] , \w[29][20] , \w[29][19] , 
        \w[29][18] , \w[29][17] , \w[29][16] , \w[29][15] , \w[29][14] , 
        \w[29][13] , \w[29][12] , \w[29][11] , \w[29][10] , \w[29][9] , 
        \w[29][8] , \w[29][7] , \w[29][6] , \w[29][5] , \w[29][4] , \w[29][3] , 
        \w[29][2] , \w[29][1] , SYNOPSYS_UNCONNECTED__27}) );
  ADD_N32_3 \FAINST[29].ADD_  ( .A({\_56_net_[31] , \_56_net_[30] , 
        \_56_net_[29] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[29][31] , 
        \w[29][30] , \w[29][29] , \w[29][28] , \w[29][27] , \w[29][26] , 
        \w[29][25] , \w[29][24] , \w[29][23] , \w[29][22] , \w[29][21] , 
        \w[29][20] , \w[29][19] , \w[29][18] , \w[29][17] , \w[29][16] , 
        \w[29][15] , \w[29][14] , \w[29][13] , \w[29][12] , \w[29][11] , 
        \w[29][10] , \w[29][9] , \w[29][8] , \w[29][7] , \w[29][6] , 
        \w[29][5] , \w[29][4] , \w[29][3] , \w[29][2] , \w[29][1] , 1'b0}), 
        .CI(1'b0), .S({\w[30][31] , \w[30][30] , \w[30][29] , \w[30][28] , 
        \w[30][27] , \w[30][26] , \w[30][25] , \w[30][24] , \w[30][23] , 
        \w[30][22] , \w[30][21] , \w[30][20] , \w[30][19] , \w[30][18] , 
        \w[30][17] , \w[30][16] , \w[30][15] , \w[30][14] , \w[30][13] , 
        \w[30][12] , \w[30][11] , \w[30][10] , \w[30][9] , \w[30][8] , 
        \w[30][7] , \w[30][6] , \w[30][5] , \w[30][4] , \w[30][3] , \w[30][2] , 
        \w[30][1] , SYNOPSYS_UNCONNECTED__28}) );
  ADD_N32_2 \FAINST[30].ADD_  ( .A({\_58_net_[31] , \_58_net_[30] , 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .B({\w[30][31] , \w[30][30] , \w[30][29] , 
        \w[30][28] , \w[30][27] , \w[30][26] , \w[30][25] , \w[30][24] , 
        \w[30][23] , \w[30][22] , \w[30][21] , \w[30][20] , \w[30][19] , 
        \w[30][18] , \w[30][17] , \w[30][16] , \w[30][15] , \w[30][14] , 
        \w[30][13] , \w[30][12] , \w[30][11] , \w[30][10] , \w[30][9] , 
        \w[30][8] , \w[30][7] , \w[30][6] , \w[30][5] , \w[30][4] , \w[30][3] , 
        \w[30][2] , \w[30][1] , 1'b0}), .CI(1'b0), .S({\w[31][31] , 
        \w[31][30] , \w[31][29] , \w[31][28] , \w[31][27] , \w[31][26] , 
        \w[31][25] , \w[31][24] , \w[31][23] , \w[31][22] , \w[31][21] , 
        \w[31][20] , \w[31][19] , \w[31][18] , \w[31][17] , \w[31][16] , 
        \w[31][15] , \w[31][14] , \w[31][13] , \w[31][12] , \w[31][11] , 
        \w[31][10] , \w[31][9] , \w[31][8] , \w[31][7] , \w[31][6] , 
        \w[31][5] , \w[31][4] , \w[31][3] , \w[31][2] , \w[31][1] , 
        SYNOPSYS_UNCONNECTED__29}) );
  ADD_N32_1 \FAINST[31].ADD_  ( .A({\_60_net_[31] , 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .B({\w[31][31] , \w[31][30] , \w[31][29] , 
        \w[31][28] , \w[31][27] , \w[31][26] , \w[31][25] , \w[31][24] , 
        \w[31][23] , \w[31][22] , \w[31][21] , \w[31][20] , \w[31][19] , 
        \w[31][18] , \w[31][17] , \w[31][16] , \w[31][15] , \w[31][14] , 
        \w[31][13] , \w[31][12] , \w[31][11] , \w[31][10] , \w[31][9] , 
        \w[31][8] , \w[31][7] , \w[31][6] , \w[31][5] , \w[31][4] , \w[31][3] , 
        \w[31][2] , \w[31][1] , 1'b0}), .CI(1'b0), .S({O[31:1], 
        SYNOPSYS_UNCONNECTED__30}) );
  AND U2 ( .A(A[5]), .B(B[4]), .Z(\_8_net_[9] ) );
  AND U3 ( .A(A[5]), .B(B[3]), .Z(\_8_net_[8] ) );
  AND U4 ( .A(A[5]), .B(B[2]), .Z(\_8_net_[7] ) );
  AND U5 ( .A(A[5]), .B(B[1]), .Z(\_8_net_[6] ) );
  AND U6 ( .A(A[5]), .B(B[0]), .Z(\_8_net_[5] ) );
  AND U7 ( .A(A[5]), .B(B[26]), .Z(\_8_net_[31] ) );
  AND U8 ( .A(A[5]), .B(B[25]), .Z(\_8_net_[30] ) );
  AND U9 ( .A(A[5]), .B(B[24]), .Z(\_8_net_[29] ) );
  AND U10 ( .A(A[5]), .B(B[23]), .Z(\_8_net_[28] ) );
  AND U11 ( .A(A[5]), .B(B[22]), .Z(\_8_net_[27] ) );
  AND U12 ( .A(A[5]), .B(B[21]), .Z(\_8_net_[26] ) );
  AND U13 ( .A(A[5]), .B(B[20]), .Z(\_8_net_[25] ) );
  AND U14 ( .A(A[5]), .B(B[19]), .Z(\_8_net_[24] ) );
  AND U15 ( .A(A[5]), .B(B[18]), .Z(\_8_net_[23] ) );
  AND U16 ( .A(A[5]), .B(B[17]), .Z(\_8_net_[22] ) );
  AND U17 ( .A(A[5]), .B(B[16]), .Z(\_8_net_[21] ) );
  AND U18 ( .A(A[5]), .B(B[15]), .Z(\_8_net_[20] ) );
  AND U19 ( .A(A[5]), .B(B[14]), .Z(\_8_net_[19] ) );
  AND U20 ( .A(A[5]), .B(B[13]), .Z(\_8_net_[18] ) );
  AND U21 ( .A(A[5]), .B(B[12]), .Z(\_8_net_[17] ) );
  AND U22 ( .A(A[5]), .B(B[11]), .Z(\_8_net_[16] ) );
  AND U23 ( .A(A[5]), .B(B[10]), .Z(\_8_net_[15] ) );
  AND U24 ( .A(A[5]), .B(B[9]), .Z(\_8_net_[14] ) );
  AND U25 ( .A(A[5]), .B(B[8]), .Z(\_8_net_[13] ) );
  AND U26 ( .A(A[5]), .B(B[7]), .Z(\_8_net_[12] ) );
  AND U27 ( .A(A[5]), .B(B[6]), .Z(\_8_net_[11] ) );
  AND U28 ( .A(A[5]), .B(B[5]), .Z(\_8_net_[10] ) );
  AND U29 ( .A(B[5]), .B(A[4]), .Z(\_6_net_[9] ) );
  AND U30 ( .A(B[4]), .B(A[4]), .Z(\_6_net_[8] ) );
  AND U31 ( .A(B[3]), .B(A[4]), .Z(\_6_net_[7] ) );
  AND U32 ( .A(B[2]), .B(A[4]), .Z(\_6_net_[6] ) );
  AND U33 ( .A(B[1]), .B(A[4]), .Z(\_6_net_[5] ) );
  AND U34 ( .A(B[0]), .B(A[4]), .Z(\_6_net_[4] ) );
  AND U35 ( .A(A[4]), .B(B[27]), .Z(\_6_net_[31] ) );
  AND U36 ( .A(B[26]), .B(A[4]), .Z(\_6_net_[30] ) );
  AND U37 ( .A(B[25]), .B(A[4]), .Z(\_6_net_[29] ) );
  AND U38 ( .A(B[24]), .B(A[4]), .Z(\_6_net_[28] ) );
  AND U39 ( .A(B[23]), .B(A[4]), .Z(\_6_net_[27] ) );
  AND U40 ( .A(B[22]), .B(A[4]), .Z(\_6_net_[26] ) );
  AND U41 ( .A(B[21]), .B(A[4]), .Z(\_6_net_[25] ) );
  AND U42 ( .A(B[20]), .B(A[4]), .Z(\_6_net_[24] ) );
  AND U43 ( .A(B[19]), .B(A[4]), .Z(\_6_net_[23] ) );
  AND U44 ( .A(B[18]), .B(A[4]), .Z(\_6_net_[22] ) );
  AND U45 ( .A(B[17]), .B(A[4]), .Z(\_6_net_[21] ) );
  AND U46 ( .A(B[16]), .B(A[4]), .Z(\_6_net_[20] ) );
  AND U47 ( .A(B[15]), .B(A[4]), .Z(\_6_net_[19] ) );
  AND U48 ( .A(B[14]), .B(A[4]), .Z(\_6_net_[18] ) );
  AND U49 ( .A(B[13]), .B(A[4]), .Z(\_6_net_[17] ) );
  AND U50 ( .A(B[12]), .B(A[4]), .Z(\_6_net_[16] ) );
  AND U51 ( .A(B[11]), .B(A[4]), .Z(\_6_net_[15] ) );
  AND U52 ( .A(B[10]), .B(A[4]), .Z(\_6_net_[14] ) );
  AND U53 ( .A(B[9]), .B(A[4]), .Z(\_6_net_[13] ) );
  AND U54 ( .A(B[8]), .B(A[4]), .Z(\_6_net_[12] ) );
  AND U55 ( .A(B[7]), .B(A[4]), .Z(\_6_net_[11] ) );
  AND U56 ( .A(B[6]), .B(A[4]), .Z(\_6_net_[10] ) );
  AND U57 ( .A(A[31]), .B(B[0]), .Z(\_60_net_[31] ) );
  AND U58 ( .A(B[1]), .B(A[30]), .Z(\_58_net_[31] ) );
  AND U59 ( .A(A[30]), .B(B[0]), .Z(\_58_net_[30] ) );
  AND U60 ( .A(B[2]), .B(A[29]), .Z(\_56_net_[31] ) );
  AND U61 ( .A(B[1]), .B(A[29]), .Z(\_56_net_[30] ) );
  AND U62 ( .A(A[29]), .B(B[0]), .Z(\_56_net_[29] ) );
  AND U63 ( .A(B[3]), .B(A[28]), .Z(\_54_net_[31] ) );
  AND U64 ( .A(B[2]), .B(A[28]), .Z(\_54_net_[30] ) );
  AND U65 ( .A(B[1]), .B(A[28]), .Z(\_54_net_[29] ) );
  AND U66 ( .A(A[28]), .B(B[0]), .Z(\_54_net_[28] ) );
  AND U67 ( .A(B[4]), .B(A[27]), .Z(\_52_net_[31] ) );
  AND U68 ( .A(B[3]), .B(A[27]), .Z(\_52_net_[30] ) );
  AND U69 ( .A(B[2]), .B(A[27]), .Z(\_52_net_[29] ) );
  AND U70 ( .A(B[1]), .B(A[27]), .Z(\_52_net_[28] ) );
  AND U71 ( .A(A[27]), .B(B[0]), .Z(\_52_net_[27] ) );
  AND U72 ( .A(B[5]), .B(A[26]), .Z(\_50_net_[31] ) );
  AND U73 ( .A(B[4]), .B(A[26]), .Z(\_50_net_[30] ) );
  AND U74 ( .A(B[3]), .B(A[26]), .Z(\_50_net_[29] ) );
  AND U75 ( .A(B[2]), .B(A[26]), .Z(\_50_net_[28] ) );
  AND U76 ( .A(B[1]), .B(A[26]), .Z(\_50_net_[27] ) );
  AND U77 ( .A(A[26]), .B(B[0]), .Z(\_50_net_[26] ) );
  AND U78 ( .A(B[6]), .B(A[3]), .Z(\_4_net_[9] ) );
  AND U79 ( .A(B[5]), .B(A[3]), .Z(\_4_net_[8] ) );
  AND U80 ( .A(B[4]), .B(A[3]), .Z(\_4_net_[7] ) );
  AND U81 ( .A(B[3]), .B(A[3]), .Z(\_4_net_[6] ) );
  AND U82 ( .A(B[2]), .B(A[3]), .Z(\_4_net_[5] ) );
  AND U83 ( .A(B[1]), .B(A[3]), .Z(\_4_net_[4] ) );
  AND U84 ( .A(B[0]), .B(A[3]), .Z(\_4_net_[3] ) );
  AND U85 ( .A(A[3]), .B(B[28]), .Z(\_4_net_[31] ) );
  AND U86 ( .A(B[27]), .B(A[3]), .Z(\_4_net_[30] ) );
  AND U87 ( .A(B[26]), .B(A[3]), .Z(\_4_net_[29] ) );
  AND U88 ( .A(B[25]), .B(A[3]), .Z(\_4_net_[28] ) );
  AND U89 ( .A(B[24]), .B(A[3]), .Z(\_4_net_[27] ) );
  AND U90 ( .A(B[23]), .B(A[3]), .Z(\_4_net_[26] ) );
  AND U91 ( .A(B[22]), .B(A[3]), .Z(\_4_net_[25] ) );
  AND U92 ( .A(B[21]), .B(A[3]), .Z(\_4_net_[24] ) );
  AND U93 ( .A(B[20]), .B(A[3]), .Z(\_4_net_[23] ) );
  AND U94 ( .A(B[19]), .B(A[3]), .Z(\_4_net_[22] ) );
  AND U95 ( .A(B[18]), .B(A[3]), .Z(\_4_net_[21] ) );
  AND U96 ( .A(B[17]), .B(A[3]), .Z(\_4_net_[20] ) );
  AND U97 ( .A(B[16]), .B(A[3]), .Z(\_4_net_[19] ) );
  AND U98 ( .A(B[15]), .B(A[3]), .Z(\_4_net_[18] ) );
  AND U99 ( .A(B[14]), .B(A[3]), .Z(\_4_net_[17] ) );
  AND U100 ( .A(B[13]), .B(A[3]), .Z(\_4_net_[16] ) );
  AND U101 ( .A(B[12]), .B(A[3]), .Z(\_4_net_[15] ) );
  AND U102 ( .A(B[11]), .B(A[3]), .Z(\_4_net_[14] ) );
  AND U103 ( .A(B[10]), .B(A[3]), .Z(\_4_net_[13] ) );
  AND U104 ( .A(B[9]), .B(A[3]), .Z(\_4_net_[12] ) );
  AND U105 ( .A(B[8]), .B(A[3]), .Z(\_4_net_[11] ) );
  AND U106 ( .A(B[7]), .B(A[3]), .Z(\_4_net_[10] ) );
  AND U107 ( .A(B[6]), .B(A[25]), .Z(\_48_net_[31] ) );
  AND U108 ( .A(B[5]), .B(A[25]), .Z(\_48_net_[30] ) );
  AND U109 ( .A(B[4]), .B(A[25]), .Z(\_48_net_[29] ) );
  AND U110 ( .A(B[3]), .B(A[25]), .Z(\_48_net_[28] ) );
  AND U111 ( .A(B[2]), .B(A[25]), .Z(\_48_net_[27] ) );
  AND U112 ( .A(B[1]), .B(A[25]), .Z(\_48_net_[26] ) );
  AND U113 ( .A(A[25]), .B(B[0]), .Z(\_48_net_[25] ) );
  AND U114 ( .A(B[7]), .B(A[24]), .Z(\_46_net_[31] ) );
  AND U115 ( .A(B[6]), .B(A[24]), .Z(\_46_net_[30] ) );
  AND U116 ( .A(B[5]), .B(A[24]), .Z(\_46_net_[29] ) );
  AND U117 ( .A(B[4]), .B(A[24]), .Z(\_46_net_[28] ) );
  AND U118 ( .A(B[3]), .B(A[24]), .Z(\_46_net_[27] ) );
  AND U119 ( .A(B[2]), .B(A[24]), .Z(\_46_net_[26] ) );
  AND U120 ( .A(B[1]), .B(A[24]), .Z(\_46_net_[25] ) );
  AND U121 ( .A(A[24]), .B(B[0]), .Z(\_46_net_[24] ) );
  AND U122 ( .A(B[8]), .B(A[23]), .Z(\_44_net_[31] ) );
  AND U123 ( .A(B[7]), .B(A[23]), .Z(\_44_net_[30] ) );
  AND U124 ( .A(B[6]), .B(A[23]), .Z(\_44_net_[29] ) );
  AND U125 ( .A(B[5]), .B(A[23]), .Z(\_44_net_[28] ) );
  AND U126 ( .A(B[4]), .B(A[23]), .Z(\_44_net_[27] ) );
  AND U127 ( .A(B[3]), .B(A[23]), .Z(\_44_net_[26] ) );
  AND U128 ( .A(B[2]), .B(A[23]), .Z(\_44_net_[25] ) );
  AND U129 ( .A(B[1]), .B(A[23]), .Z(\_44_net_[24] ) );
  AND U130 ( .A(A[23]), .B(B[0]), .Z(\_44_net_[23] ) );
  AND U131 ( .A(B[9]), .B(A[22]), .Z(\_42_net_[31] ) );
  AND U132 ( .A(B[8]), .B(A[22]), .Z(\_42_net_[30] ) );
  AND U133 ( .A(B[7]), .B(A[22]), .Z(\_42_net_[29] ) );
  AND U134 ( .A(B[6]), .B(A[22]), .Z(\_42_net_[28] ) );
  AND U135 ( .A(B[5]), .B(A[22]), .Z(\_42_net_[27] ) );
  AND U136 ( .A(B[4]), .B(A[22]), .Z(\_42_net_[26] ) );
  AND U137 ( .A(B[3]), .B(A[22]), .Z(\_42_net_[25] ) );
  AND U138 ( .A(B[2]), .B(A[22]), .Z(\_42_net_[24] ) );
  AND U139 ( .A(B[1]), .B(A[22]), .Z(\_42_net_[23] ) );
  AND U140 ( .A(A[22]), .B(B[0]), .Z(\_42_net_[22] ) );
  AND U141 ( .A(B[10]), .B(A[21]), .Z(\_40_net_[31] ) );
  AND U142 ( .A(B[9]), .B(A[21]), .Z(\_40_net_[30] ) );
  AND U143 ( .A(B[8]), .B(A[21]), .Z(\_40_net_[29] ) );
  AND U144 ( .A(B[7]), .B(A[21]), .Z(\_40_net_[28] ) );
  AND U145 ( .A(B[6]), .B(A[21]), .Z(\_40_net_[27] ) );
  AND U146 ( .A(B[5]), .B(A[21]), .Z(\_40_net_[26] ) );
  AND U147 ( .A(B[4]), .B(A[21]), .Z(\_40_net_[25] ) );
  AND U148 ( .A(B[3]), .B(A[21]), .Z(\_40_net_[24] ) );
  AND U149 ( .A(B[2]), .B(A[21]), .Z(\_40_net_[23] ) );
  AND U150 ( .A(B[1]), .B(A[21]), .Z(\_40_net_[22] ) );
  AND U151 ( .A(A[21]), .B(B[0]), .Z(\_40_net_[21] ) );
  AND U152 ( .A(B[11]), .B(A[20]), .Z(\_38_net_[31] ) );
  AND U153 ( .A(B[10]), .B(A[20]), .Z(\_38_net_[30] ) );
  AND U154 ( .A(B[9]), .B(A[20]), .Z(\_38_net_[29] ) );
  AND U155 ( .A(B[8]), .B(A[20]), .Z(\_38_net_[28] ) );
  AND U156 ( .A(B[7]), .B(A[20]), .Z(\_38_net_[27] ) );
  AND U157 ( .A(B[6]), .B(A[20]), .Z(\_38_net_[26] ) );
  AND U158 ( .A(B[5]), .B(A[20]), .Z(\_38_net_[25] ) );
  AND U159 ( .A(B[4]), .B(A[20]), .Z(\_38_net_[24] ) );
  AND U160 ( .A(B[3]), .B(A[20]), .Z(\_38_net_[23] ) );
  AND U161 ( .A(B[2]), .B(A[20]), .Z(\_38_net_[22] ) );
  AND U162 ( .A(B[1]), .B(A[20]), .Z(\_38_net_[21] ) );
  AND U163 ( .A(A[20]), .B(B[0]), .Z(\_38_net_[20] ) );
  AND U164 ( .A(B[12]), .B(A[19]), .Z(\_36_net_[31] ) );
  AND U165 ( .A(B[11]), .B(A[19]), .Z(\_36_net_[30] ) );
  AND U166 ( .A(B[10]), .B(A[19]), .Z(\_36_net_[29] ) );
  AND U167 ( .A(B[9]), .B(A[19]), .Z(\_36_net_[28] ) );
  AND U168 ( .A(B[8]), .B(A[19]), .Z(\_36_net_[27] ) );
  AND U169 ( .A(B[7]), .B(A[19]), .Z(\_36_net_[26] ) );
  AND U170 ( .A(B[6]), .B(A[19]), .Z(\_36_net_[25] ) );
  AND U171 ( .A(B[5]), .B(A[19]), .Z(\_36_net_[24] ) );
  AND U172 ( .A(B[4]), .B(A[19]), .Z(\_36_net_[23] ) );
  AND U173 ( .A(B[3]), .B(A[19]), .Z(\_36_net_[22] ) );
  AND U174 ( .A(B[2]), .B(A[19]), .Z(\_36_net_[21] ) );
  AND U175 ( .A(B[1]), .B(A[19]), .Z(\_36_net_[20] ) );
  AND U176 ( .A(A[19]), .B(B[0]), .Z(\_36_net_[19] ) );
  AND U177 ( .A(B[13]), .B(A[18]), .Z(\_34_net_[31] ) );
  AND U178 ( .A(B[12]), .B(A[18]), .Z(\_34_net_[30] ) );
  AND U179 ( .A(B[11]), .B(A[18]), .Z(\_34_net_[29] ) );
  AND U180 ( .A(B[10]), .B(A[18]), .Z(\_34_net_[28] ) );
  AND U181 ( .A(B[9]), .B(A[18]), .Z(\_34_net_[27] ) );
  AND U182 ( .A(B[8]), .B(A[18]), .Z(\_34_net_[26] ) );
  AND U183 ( .A(B[7]), .B(A[18]), .Z(\_34_net_[25] ) );
  AND U184 ( .A(B[6]), .B(A[18]), .Z(\_34_net_[24] ) );
  AND U185 ( .A(B[5]), .B(A[18]), .Z(\_34_net_[23] ) );
  AND U186 ( .A(B[4]), .B(A[18]), .Z(\_34_net_[22] ) );
  AND U187 ( .A(B[3]), .B(A[18]), .Z(\_34_net_[21] ) );
  AND U188 ( .A(B[2]), .B(A[18]), .Z(\_34_net_[20] ) );
  AND U189 ( .A(B[1]), .B(A[18]), .Z(\_34_net_[19] ) );
  AND U190 ( .A(A[18]), .B(B[0]), .Z(\_34_net_[18] ) );
  AND U191 ( .A(B[14]), .B(A[17]), .Z(\_32_net_[31] ) );
  AND U192 ( .A(B[13]), .B(A[17]), .Z(\_32_net_[30] ) );
  AND U193 ( .A(B[12]), .B(A[17]), .Z(\_32_net_[29] ) );
  AND U194 ( .A(B[11]), .B(A[17]), .Z(\_32_net_[28] ) );
  AND U195 ( .A(B[10]), .B(A[17]), .Z(\_32_net_[27] ) );
  AND U196 ( .A(B[9]), .B(A[17]), .Z(\_32_net_[26] ) );
  AND U197 ( .A(B[8]), .B(A[17]), .Z(\_32_net_[25] ) );
  AND U198 ( .A(B[7]), .B(A[17]), .Z(\_32_net_[24] ) );
  AND U199 ( .A(B[6]), .B(A[17]), .Z(\_32_net_[23] ) );
  AND U200 ( .A(B[5]), .B(A[17]), .Z(\_32_net_[22] ) );
  AND U201 ( .A(B[4]), .B(A[17]), .Z(\_32_net_[21] ) );
  AND U202 ( .A(B[3]), .B(A[17]), .Z(\_32_net_[20] ) );
  AND U203 ( .A(B[2]), .B(A[17]), .Z(\_32_net_[19] ) );
  AND U204 ( .A(B[1]), .B(A[17]), .Z(\_32_net_[18] ) );
  AND U205 ( .A(A[17]), .B(B[0]), .Z(\_32_net_[17] ) );
  AND U206 ( .A(B[15]), .B(A[16]), .Z(\_30_net_[31] ) );
  AND U207 ( .A(B[14]), .B(A[16]), .Z(\_30_net_[30] ) );
  AND U208 ( .A(B[13]), .B(A[16]), .Z(\_30_net_[29] ) );
  AND U209 ( .A(B[12]), .B(A[16]), .Z(\_30_net_[28] ) );
  AND U210 ( .A(B[11]), .B(A[16]), .Z(\_30_net_[27] ) );
  AND U211 ( .A(B[10]), .B(A[16]), .Z(\_30_net_[26] ) );
  AND U212 ( .A(B[9]), .B(A[16]), .Z(\_30_net_[25] ) );
  AND U213 ( .A(B[8]), .B(A[16]), .Z(\_30_net_[24] ) );
  AND U214 ( .A(B[7]), .B(A[16]), .Z(\_30_net_[23] ) );
  AND U215 ( .A(B[6]), .B(A[16]), .Z(\_30_net_[22] ) );
  AND U216 ( .A(B[5]), .B(A[16]), .Z(\_30_net_[21] ) );
  AND U217 ( .A(B[4]), .B(A[16]), .Z(\_30_net_[20] ) );
  AND U218 ( .A(B[3]), .B(A[16]), .Z(\_30_net_[19] ) );
  AND U219 ( .A(B[2]), .B(A[16]), .Z(\_30_net_[18] ) );
  AND U220 ( .A(B[1]), .B(A[16]), .Z(\_30_net_[17] ) );
  AND U221 ( .A(A[16]), .B(B[0]), .Z(\_30_net_[16] ) );
  AND U222 ( .A(B[7]), .B(A[2]), .Z(\_2_net_[9] ) );
  AND U223 ( .A(B[6]), .B(A[2]), .Z(\_2_net_[8] ) );
  AND U224 ( .A(B[5]), .B(A[2]), .Z(\_2_net_[7] ) );
  AND U225 ( .A(B[4]), .B(A[2]), .Z(\_2_net_[6] ) );
  AND U226 ( .A(B[3]), .B(A[2]), .Z(\_2_net_[5] ) );
  AND U227 ( .A(B[2]), .B(A[2]), .Z(\_2_net_[4] ) );
  AND U228 ( .A(B[1]), .B(A[2]), .Z(\_2_net_[3] ) );
  AND U229 ( .A(A[2]), .B(B[29]), .Z(\_2_net_[31] ) );
  AND U230 ( .A(B[28]), .B(A[2]), .Z(\_2_net_[30] ) );
  AND U231 ( .A(B[0]), .B(A[2]), .Z(\_2_net_[2] ) );
  AND U232 ( .A(B[27]), .B(A[2]), .Z(\_2_net_[29] ) );
  AND U233 ( .A(B[26]), .B(A[2]), .Z(\_2_net_[28] ) );
  AND U234 ( .A(B[25]), .B(A[2]), .Z(\_2_net_[27] ) );
  AND U235 ( .A(B[24]), .B(A[2]), .Z(\_2_net_[26] ) );
  AND U236 ( .A(B[23]), .B(A[2]), .Z(\_2_net_[25] ) );
  AND U237 ( .A(B[22]), .B(A[2]), .Z(\_2_net_[24] ) );
  AND U238 ( .A(B[21]), .B(A[2]), .Z(\_2_net_[23] ) );
  AND U239 ( .A(B[20]), .B(A[2]), .Z(\_2_net_[22] ) );
  AND U240 ( .A(B[19]), .B(A[2]), .Z(\_2_net_[21] ) );
  AND U241 ( .A(B[18]), .B(A[2]), .Z(\_2_net_[20] ) );
  AND U242 ( .A(B[17]), .B(A[2]), .Z(\_2_net_[19] ) );
  AND U243 ( .A(B[16]), .B(A[2]), .Z(\_2_net_[18] ) );
  AND U244 ( .A(B[15]), .B(A[2]), .Z(\_2_net_[17] ) );
  AND U245 ( .A(B[14]), .B(A[2]), .Z(\_2_net_[16] ) );
  AND U246 ( .A(B[13]), .B(A[2]), .Z(\_2_net_[15] ) );
  AND U247 ( .A(B[12]), .B(A[2]), .Z(\_2_net_[14] ) );
  AND U248 ( .A(B[11]), .B(A[2]), .Z(\_2_net_[13] ) );
  AND U249 ( .A(B[10]), .B(A[2]), .Z(\_2_net_[12] ) );
  AND U250 ( .A(B[9]), .B(A[2]), .Z(\_2_net_[11] ) );
  AND U251 ( .A(B[8]), .B(A[2]), .Z(\_2_net_[10] ) );
  AND U252 ( .A(B[16]), .B(A[15]), .Z(\_28_net_[31] ) );
  AND U253 ( .A(B[15]), .B(A[15]), .Z(\_28_net_[30] ) );
  AND U254 ( .A(B[14]), .B(A[15]), .Z(\_28_net_[29] ) );
  AND U255 ( .A(B[13]), .B(A[15]), .Z(\_28_net_[28] ) );
  AND U256 ( .A(B[12]), .B(A[15]), .Z(\_28_net_[27] ) );
  AND U257 ( .A(B[11]), .B(A[15]), .Z(\_28_net_[26] ) );
  AND U258 ( .A(B[10]), .B(A[15]), .Z(\_28_net_[25] ) );
  AND U259 ( .A(B[9]), .B(A[15]), .Z(\_28_net_[24] ) );
  AND U260 ( .A(B[8]), .B(A[15]), .Z(\_28_net_[23] ) );
  AND U261 ( .A(B[7]), .B(A[15]), .Z(\_28_net_[22] ) );
  AND U262 ( .A(B[6]), .B(A[15]), .Z(\_28_net_[21] ) );
  AND U263 ( .A(B[5]), .B(A[15]), .Z(\_28_net_[20] ) );
  AND U264 ( .A(B[4]), .B(A[15]), .Z(\_28_net_[19] ) );
  AND U265 ( .A(B[3]), .B(A[15]), .Z(\_28_net_[18] ) );
  AND U266 ( .A(B[2]), .B(A[15]), .Z(\_28_net_[17] ) );
  AND U267 ( .A(B[1]), .B(A[15]), .Z(\_28_net_[16] ) );
  AND U268 ( .A(A[15]), .B(B[0]), .Z(\_28_net_[15] ) );
  AND U269 ( .A(B[17]), .B(A[14]), .Z(\_26_net_[31] ) );
  AND U270 ( .A(B[16]), .B(A[14]), .Z(\_26_net_[30] ) );
  AND U271 ( .A(B[15]), .B(A[14]), .Z(\_26_net_[29] ) );
  AND U272 ( .A(B[14]), .B(A[14]), .Z(\_26_net_[28] ) );
  AND U273 ( .A(B[13]), .B(A[14]), .Z(\_26_net_[27] ) );
  AND U274 ( .A(B[12]), .B(A[14]), .Z(\_26_net_[26] ) );
  AND U275 ( .A(B[11]), .B(A[14]), .Z(\_26_net_[25] ) );
  AND U276 ( .A(B[10]), .B(A[14]), .Z(\_26_net_[24] ) );
  AND U277 ( .A(B[9]), .B(A[14]), .Z(\_26_net_[23] ) );
  AND U278 ( .A(B[8]), .B(A[14]), .Z(\_26_net_[22] ) );
  AND U279 ( .A(B[7]), .B(A[14]), .Z(\_26_net_[21] ) );
  AND U280 ( .A(B[6]), .B(A[14]), .Z(\_26_net_[20] ) );
  AND U281 ( .A(B[5]), .B(A[14]), .Z(\_26_net_[19] ) );
  AND U282 ( .A(B[4]), .B(A[14]), .Z(\_26_net_[18] ) );
  AND U283 ( .A(B[3]), .B(A[14]), .Z(\_26_net_[17] ) );
  AND U284 ( .A(B[2]), .B(A[14]), .Z(\_26_net_[16] ) );
  AND U285 ( .A(B[1]), .B(A[14]), .Z(\_26_net_[15] ) );
  AND U286 ( .A(A[14]), .B(B[0]), .Z(\_26_net_[14] ) );
  AND U287 ( .A(B[18]), .B(A[13]), .Z(\_24_net_[31] ) );
  AND U288 ( .A(B[17]), .B(A[13]), .Z(\_24_net_[30] ) );
  AND U289 ( .A(B[16]), .B(A[13]), .Z(\_24_net_[29] ) );
  AND U290 ( .A(B[15]), .B(A[13]), .Z(\_24_net_[28] ) );
  AND U291 ( .A(B[14]), .B(A[13]), .Z(\_24_net_[27] ) );
  AND U292 ( .A(B[13]), .B(A[13]), .Z(\_24_net_[26] ) );
  AND U293 ( .A(B[12]), .B(A[13]), .Z(\_24_net_[25] ) );
  AND U294 ( .A(B[11]), .B(A[13]), .Z(\_24_net_[24] ) );
  AND U295 ( .A(B[10]), .B(A[13]), .Z(\_24_net_[23] ) );
  AND U296 ( .A(B[9]), .B(A[13]), .Z(\_24_net_[22] ) );
  AND U297 ( .A(B[8]), .B(A[13]), .Z(\_24_net_[21] ) );
  AND U298 ( .A(B[7]), .B(A[13]), .Z(\_24_net_[20] ) );
  AND U299 ( .A(B[6]), .B(A[13]), .Z(\_24_net_[19] ) );
  AND U300 ( .A(B[5]), .B(A[13]), .Z(\_24_net_[18] ) );
  AND U301 ( .A(B[4]), .B(A[13]), .Z(\_24_net_[17] ) );
  AND U302 ( .A(B[3]), .B(A[13]), .Z(\_24_net_[16] ) );
  AND U303 ( .A(B[2]), .B(A[13]), .Z(\_24_net_[15] ) );
  AND U304 ( .A(B[1]), .B(A[13]), .Z(\_24_net_[14] ) );
  AND U305 ( .A(A[13]), .B(B[0]), .Z(\_24_net_[13] ) );
  AND U306 ( .A(B[19]), .B(A[12]), .Z(\_22_net_[31] ) );
  AND U307 ( .A(B[18]), .B(A[12]), .Z(\_22_net_[30] ) );
  AND U308 ( .A(B[17]), .B(A[12]), .Z(\_22_net_[29] ) );
  AND U309 ( .A(B[16]), .B(A[12]), .Z(\_22_net_[28] ) );
  AND U310 ( .A(B[15]), .B(A[12]), .Z(\_22_net_[27] ) );
  AND U311 ( .A(B[14]), .B(A[12]), .Z(\_22_net_[26] ) );
  AND U312 ( .A(B[13]), .B(A[12]), .Z(\_22_net_[25] ) );
  AND U313 ( .A(B[12]), .B(A[12]), .Z(\_22_net_[24] ) );
  AND U314 ( .A(B[11]), .B(A[12]), .Z(\_22_net_[23] ) );
  AND U315 ( .A(B[10]), .B(A[12]), .Z(\_22_net_[22] ) );
  AND U316 ( .A(B[9]), .B(A[12]), .Z(\_22_net_[21] ) );
  AND U317 ( .A(B[8]), .B(A[12]), .Z(\_22_net_[20] ) );
  AND U318 ( .A(B[7]), .B(A[12]), .Z(\_22_net_[19] ) );
  AND U319 ( .A(B[6]), .B(A[12]), .Z(\_22_net_[18] ) );
  AND U320 ( .A(B[5]), .B(A[12]), .Z(\_22_net_[17] ) );
  AND U321 ( .A(B[4]), .B(A[12]), .Z(\_22_net_[16] ) );
  AND U322 ( .A(B[3]), .B(A[12]), .Z(\_22_net_[15] ) );
  AND U323 ( .A(B[2]), .B(A[12]), .Z(\_22_net_[14] ) );
  AND U324 ( .A(B[1]), .B(A[12]), .Z(\_22_net_[13] ) );
  AND U325 ( .A(A[12]), .B(B[0]), .Z(\_22_net_[12] ) );
  AND U326 ( .A(B[20]), .B(A[11]), .Z(\_20_net_[31] ) );
  AND U327 ( .A(B[19]), .B(A[11]), .Z(\_20_net_[30] ) );
  AND U328 ( .A(B[18]), .B(A[11]), .Z(\_20_net_[29] ) );
  AND U329 ( .A(B[17]), .B(A[11]), .Z(\_20_net_[28] ) );
  AND U330 ( .A(B[16]), .B(A[11]), .Z(\_20_net_[27] ) );
  AND U331 ( .A(B[15]), .B(A[11]), .Z(\_20_net_[26] ) );
  AND U332 ( .A(B[14]), .B(A[11]), .Z(\_20_net_[25] ) );
  AND U333 ( .A(B[13]), .B(A[11]), .Z(\_20_net_[24] ) );
  AND U334 ( .A(B[12]), .B(A[11]), .Z(\_20_net_[23] ) );
  AND U335 ( .A(B[11]), .B(A[11]), .Z(\_20_net_[22] ) );
  AND U336 ( .A(B[10]), .B(A[11]), .Z(\_20_net_[21] ) );
  AND U337 ( .A(B[9]), .B(A[11]), .Z(\_20_net_[20] ) );
  AND U338 ( .A(B[8]), .B(A[11]), .Z(\_20_net_[19] ) );
  AND U339 ( .A(B[7]), .B(A[11]), .Z(\_20_net_[18] ) );
  AND U340 ( .A(B[6]), .B(A[11]), .Z(\_20_net_[17] ) );
  AND U341 ( .A(B[5]), .B(A[11]), .Z(\_20_net_[16] ) );
  AND U342 ( .A(B[4]), .B(A[11]), .Z(\_20_net_[15] ) );
  AND U343 ( .A(B[3]), .B(A[11]), .Z(\_20_net_[14] ) );
  AND U344 ( .A(B[2]), .B(A[11]), .Z(\_20_net_[13] ) );
  AND U345 ( .A(B[1]), .B(A[11]), .Z(\_20_net_[12] ) );
  AND U346 ( .A(A[11]), .B(B[0]), .Z(\_20_net_[11] ) );
  AND U347 ( .A(B[21]), .B(A[10]), .Z(\_18_net_[31] ) );
  AND U348 ( .A(B[20]), .B(A[10]), .Z(\_18_net_[30] ) );
  AND U349 ( .A(B[19]), .B(A[10]), .Z(\_18_net_[29] ) );
  AND U350 ( .A(B[18]), .B(A[10]), .Z(\_18_net_[28] ) );
  AND U351 ( .A(B[17]), .B(A[10]), .Z(\_18_net_[27] ) );
  AND U352 ( .A(B[16]), .B(A[10]), .Z(\_18_net_[26] ) );
  AND U353 ( .A(B[15]), .B(A[10]), .Z(\_18_net_[25] ) );
  AND U354 ( .A(B[14]), .B(A[10]), .Z(\_18_net_[24] ) );
  AND U355 ( .A(B[13]), .B(A[10]), .Z(\_18_net_[23] ) );
  AND U356 ( .A(B[12]), .B(A[10]), .Z(\_18_net_[22] ) );
  AND U357 ( .A(B[11]), .B(A[10]), .Z(\_18_net_[21] ) );
  AND U358 ( .A(B[10]), .B(A[10]), .Z(\_18_net_[20] ) );
  AND U359 ( .A(B[9]), .B(A[10]), .Z(\_18_net_[19] ) );
  AND U360 ( .A(B[8]), .B(A[10]), .Z(\_18_net_[18] ) );
  AND U361 ( .A(B[7]), .B(A[10]), .Z(\_18_net_[17] ) );
  AND U362 ( .A(B[6]), .B(A[10]), .Z(\_18_net_[16] ) );
  AND U363 ( .A(B[5]), .B(A[10]), .Z(\_18_net_[15] ) );
  AND U364 ( .A(B[4]), .B(A[10]), .Z(\_18_net_[14] ) );
  AND U365 ( .A(B[3]), .B(A[10]), .Z(\_18_net_[13] ) );
  AND U366 ( .A(B[2]), .B(A[10]), .Z(\_18_net_[12] ) );
  AND U367 ( .A(B[1]), .B(A[10]), .Z(\_18_net_[11] ) );
  AND U368 ( .A(A[10]), .B(B[0]), .Z(\_18_net_[10] ) );
  AND U369 ( .A(B[0]), .B(A[9]), .Z(\_16_net_[9] ) );
  AND U370 ( .A(B[22]), .B(A[9]), .Z(\_16_net_[31] ) );
  AND U371 ( .A(B[21]), .B(A[9]), .Z(\_16_net_[30] ) );
  AND U372 ( .A(B[20]), .B(A[9]), .Z(\_16_net_[29] ) );
  AND U373 ( .A(B[19]), .B(A[9]), .Z(\_16_net_[28] ) );
  AND U374 ( .A(B[18]), .B(A[9]), .Z(\_16_net_[27] ) );
  AND U375 ( .A(B[17]), .B(A[9]), .Z(\_16_net_[26] ) );
  AND U376 ( .A(B[16]), .B(A[9]), .Z(\_16_net_[25] ) );
  AND U377 ( .A(B[15]), .B(A[9]), .Z(\_16_net_[24] ) );
  AND U378 ( .A(B[14]), .B(A[9]), .Z(\_16_net_[23] ) );
  AND U379 ( .A(B[13]), .B(A[9]), .Z(\_16_net_[22] ) );
  AND U380 ( .A(B[12]), .B(A[9]), .Z(\_16_net_[21] ) );
  AND U381 ( .A(B[11]), .B(A[9]), .Z(\_16_net_[20] ) );
  AND U382 ( .A(B[10]), .B(A[9]), .Z(\_16_net_[19] ) );
  AND U383 ( .A(B[9]), .B(A[9]), .Z(\_16_net_[18] ) );
  AND U384 ( .A(B[8]), .B(A[9]), .Z(\_16_net_[17] ) );
  AND U385 ( .A(B[7]), .B(A[9]), .Z(\_16_net_[16] ) );
  AND U386 ( .A(B[6]), .B(A[9]), .Z(\_16_net_[15] ) );
  AND U387 ( .A(B[5]), .B(A[9]), .Z(\_16_net_[14] ) );
  AND U388 ( .A(B[4]), .B(A[9]), .Z(\_16_net_[13] ) );
  AND U389 ( .A(B[3]), .B(A[9]), .Z(\_16_net_[12] ) );
  AND U390 ( .A(B[2]), .B(A[9]), .Z(\_16_net_[11] ) );
  AND U391 ( .A(A[9]), .B(B[1]), .Z(\_16_net_[10] ) );
  AND U392 ( .A(B[1]), .B(A[8]), .Z(\_14_net_[9] ) );
  AND U393 ( .A(B[0]), .B(A[8]), .Z(\_14_net_[8] ) );
  AND U394 ( .A(B[23]), .B(A[8]), .Z(\_14_net_[31] ) );
  AND U395 ( .A(B[22]), .B(A[8]), .Z(\_14_net_[30] ) );
  AND U396 ( .A(B[21]), .B(A[8]), .Z(\_14_net_[29] ) );
  AND U397 ( .A(B[20]), .B(A[8]), .Z(\_14_net_[28] ) );
  AND U398 ( .A(B[19]), .B(A[8]), .Z(\_14_net_[27] ) );
  AND U399 ( .A(B[18]), .B(A[8]), .Z(\_14_net_[26] ) );
  AND U400 ( .A(B[17]), .B(A[8]), .Z(\_14_net_[25] ) );
  AND U401 ( .A(B[16]), .B(A[8]), .Z(\_14_net_[24] ) );
  AND U402 ( .A(B[15]), .B(A[8]), .Z(\_14_net_[23] ) );
  AND U403 ( .A(B[14]), .B(A[8]), .Z(\_14_net_[22] ) );
  AND U404 ( .A(B[13]), .B(A[8]), .Z(\_14_net_[21] ) );
  AND U405 ( .A(B[12]), .B(A[8]), .Z(\_14_net_[20] ) );
  AND U406 ( .A(B[11]), .B(A[8]), .Z(\_14_net_[19] ) );
  AND U407 ( .A(B[10]), .B(A[8]), .Z(\_14_net_[18] ) );
  AND U408 ( .A(B[9]), .B(A[8]), .Z(\_14_net_[17] ) );
  AND U409 ( .A(B[8]), .B(A[8]), .Z(\_14_net_[16] ) );
  AND U410 ( .A(B[7]), .B(A[8]), .Z(\_14_net_[15] ) );
  AND U411 ( .A(B[6]), .B(A[8]), .Z(\_14_net_[14] ) );
  AND U412 ( .A(B[5]), .B(A[8]), .Z(\_14_net_[13] ) );
  AND U413 ( .A(B[4]), .B(A[8]), .Z(\_14_net_[12] ) );
  AND U414 ( .A(B[3]), .B(A[8]), .Z(\_14_net_[11] ) );
  AND U415 ( .A(A[8]), .B(B[2]), .Z(\_14_net_[10] ) );
  AND U416 ( .A(B[2]), .B(A[7]), .Z(\_12_net_[9] ) );
  AND U417 ( .A(B[1]), .B(A[7]), .Z(\_12_net_[8] ) );
  AND U418 ( .A(B[0]), .B(A[7]), .Z(\_12_net_[7] ) );
  AND U419 ( .A(B[24]), .B(A[7]), .Z(\_12_net_[31] ) );
  AND U420 ( .A(B[23]), .B(A[7]), .Z(\_12_net_[30] ) );
  AND U421 ( .A(B[22]), .B(A[7]), .Z(\_12_net_[29] ) );
  AND U422 ( .A(B[21]), .B(A[7]), .Z(\_12_net_[28] ) );
  AND U423 ( .A(B[20]), .B(A[7]), .Z(\_12_net_[27] ) );
  AND U424 ( .A(B[19]), .B(A[7]), .Z(\_12_net_[26] ) );
  AND U425 ( .A(B[18]), .B(A[7]), .Z(\_12_net_[25] ) );
  AND U426 ( .A(B[17]), .B(A[7]), .Z(\_12_net_[24] ) );
  AND U427 ( .A(B[16]), .B(A[7]), .Z(\_12_net_[23] ) );
  AND U428 ( .A(B[15]), .B(A[7]), .Z(\_12_net_[22] ) );
  AND U429 ( .A(B[14]), .B(A[7]), .Z(\_12_net_[21] ) );
  AND U430 ( .A(B[13]), .B(A[7]), .Z(\_12_net_[20] ) );
  AND U431 ( .A(B[12]), .B(A[7]), .Z(\_12_net_[19] ) );
  AND U432 ( .A(B[11]), .B(A[7]), .Z(\_12_net_[18] ) );
  AND U433 ( .A(B[10]), .B(A[7]), .Z(\_12_net_[17] ) );
  AND U434 ( .A(B[9]), .B(A[7]), .Z(\_12_net_[16] ) );
  AND U435 ( .A(B[8]), .B(A[7]), .Z(\_12_net_[15] ) );
  AND U436 ( .A(B[7]), .B(A[7]), .Z(\_12_net_[14] ) );
  AND U437 ( .A(B[6]), .B(A[7]), .Z(\_12_net_[13] ) );
  AND U438 ( .A(B[5]), .B(A[7]), .Z(\_12_net_[12] ) );
  AND U439 ( .A(B[4]), .B(A[7]), .Z(\_12_net_[11] ) );
  AND U440 ( .A(A[7]), .B(B[3]), .Z(\_12_net_[10] ) );
  AND U441 ( .A(B[3]), .B(A[6]), .Z(\_10_net_[9] ) );
  AND U442 ( .A(B[2]), .B(A[6]), .Z(\_10_net_[8] ) );
  AND U443 ( .A(B[1]), .B(A[6]), .Z(\_10_net_[7] ) );
  AND U444 ( .A(B[0]), .B(A[6]), .Z(\_10_net_[6] ) );
  AND U445 ( .A(B[25]), .B(A[6]), .Z(\_10_net_[31] ) );
  AND U446 ( .A(B[24]), .B(A[6]), .Z(\_10_net_[30] ) );
  AND U447 ( .A(B[23]), .B(A[6]), .Z(\_10_net_[29] ) );
  AND U448 ( .A(B[22]), .B(A[6]), .Z(\_10_net_[28] ) );
  AND U449 ( .A(B[21]), .B(A[6]), .Z(\_10_net_[27] ) );
  AND U450 ( .A(B[20]), .B(A[6]), .Z(\_10_net_[26] ) );
  AND U451 ( .A(B[19]), .B(A[6]), .Z(\_10_net_[25] ) );
  AND U452 ( .A(B[18]), .B(A[6]), .Z(\_10_net_[24] ) );
  AND U453 ( .A(B[17]), .B(A[6]), .Z(\_10_net_[23] ) );
  AND U454 ( .A(B[16]), .B(A[6]), .Z(\_10_net_[22] ) );
  AND U455 ( .A(B[15]), .B(A[6]), .Z(\_10_net_[21] ) );
  AND U456 ( .A(B[14]), .B(A[6]), .Z(\_10_net_[20] ) );
  AND U457 ( .A(B[13]), .B(A[6]), .Z(\_10_net_[19] ) );
  AND U458 ( .A(B[12]), .B(A[6]), .Z(\_10_net_[18] ) );
  AND U459 ( .A(B[11]), .B(A[6]), .Z(\_10_net_[17] ) );
  AND U460 ( .A(B[10]), .B(A[6]), .Z(\_10_net_[16] ) );
  AND U461 ( .A(B[9]), .B(A[6]), .Z(\_10_net_[15] ) );
  AND U462 ( .A(B[8]), .B(A[6]), .Z(\_10_net_[14] ) );
  AND U463 ( .A(B[7]), .B(A[6]), .Z(\_10_net_[13] ) );
  AND U464 ( .A(B[6]), .B(A[6]), .Z(\_10_net_[12] ) );
  AND U465 ( .A(B[5]), .B(A[6]), .Z(\_10_net_[11] ) );
  AND U466 ( .A(A[6]), .B(B[4]), .Z(\_10_net_[10] ) );
  AND U467 ( .A(B[8]), .B(A[1]), .Z(\_0_net_[9] ) );
  AND U468 ( .A(B[7]), .B(A[1]), .Z(\_0_net_[8] ) );
  AND U469 ( .A(B[6]), .B(A[1]), .Z(\_0_net_[7] ) );
  AND U470 ( .A(B[5]), .B(A[1]), .Z(\_0_net_[6] ) );
  AND U471 ( .A(B[4]), .B(A[1]), .Z(\_0_net_[5] ) );
  AND U472 ( .A(B[3]), .B(A[1]), .Z(\_0_net_[4] ) );
  AND U473 ( .A(B[2]), .B(A[1]), .Z(\_0_net_[3] ) );
  AND U474 ( .A(B[30]), .B(A[1]), .Z(\_0_net_[31] ) );
  AND U475 ( .A(B[29]), .B(A[1]), .Z(\_0_net_[30] ) );
  AND U476 ( .A(B[1]), .B(A[1]), .Z(\_0_net_[2] ) );
  AND U477 ( .A(B[28]), .B(A[1]), .Z(\_0_net_[29] ) );
  AND U478 ( .A(B[27]), .B(A[1]), .Z(\_0_net_[28] ) );
  AND U479 ( .A(B[26]), .B(A[1]), .Z(\_0_net_[27] ) );
  AND U480 ( .A(B[25]), .B(A[1]), .Z(\_0_net_[26] ) );
  AND U481 ( .A(B[24]), .B(A[1]), .Z(\_0_net_[25] ) );
  AND U482 ( .A(B[23]), .B(A[1]), .Z(\_0_net_[24] ) );
  AND U483 ( .A(B[22]), .B(A[1]), .Z(\_0_net_[23] ) );
  AND U484 ( .A(B[21]), .B(A[1]), .Z(\_0_net_[22] ) );
  AND U485 ( .A(B[20]), .B(A[1]), .Z(\_0_net_[21] ) );
  AND U486 ( .A(B[19]), .B(A[1]), .Z(\_0_net_[20] ) );
  AND U487 ( .A(B[0]), .B(A[1]), .Z(\_0_net_[1] ) );
  AND U488 ( .A(B[18]), .B(A[1]), .Z(\_0_net_[19] ) );
  AND U489 ( .A(B[17]), .B(A[1]), .Z(\_0_net_[18] ) );
  AND U490 ( .A(B[16]), .B(A[1]), .Z(\_0_net_[17] ) );
  AND U491 ( .A(B[15]), .B(A[1]), .Z(\_0_net_[16] ) );
  AND U492 ( .A(B[14]), .B(A[1]), .Z(\_0_net_[15] ) );
  AND U493 ( .A(B[13]), .B(A[1]), .Z(\_0_net_[14] ) );
  AND U494 ( .A(B[12]), .B(A[1]), .Z(\_0_net_[13] ) );
  AND U495 ( .A(B[11]), .B(A[1]), .Z(\_0_net_[12] ) );
  AND U496 ( .A(B[10]), .B(A[1]), .Z(\_0_net_[11] ) );
  AND U497 ( .A(A[1]), .B(B[9]), .Z(\_0_net_[10] ) );
endmodule


module FA_993 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1;

  XOR U1 ( .A(A), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(B), .Z(n1) );
endmodule


module FA_994 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_995 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_996 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_997 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_998 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_999 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1000 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1001 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1002 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1003 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1004 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1005 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1006 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1007 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1008 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1009 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1010 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1011 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1012 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1013 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1014 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1015 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1016 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1017 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1018 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1019 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1020 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1021 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1022 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;
  wire   n1, n2, n3, n4;

  XOR U1 ( .A(B), .B(n1), .Z(S) );
  XOR U2 ( .A(CI), .B(n2), .Z(CO) );
  AND U3 ( .A(n1), .B(n3), .Z(n2) );
  XNOR U4 ( .A(n4), .B(B), .Z(n3) );
  IV U5 ( .A(CI), .Z(n4) );
  XOR U6 ( .A(A), .B(CI), .Z(n1) );
endmodule


module FA_1023 ( A, B, CI, S, CO );
  input A, B, CI;
  output S, CO;


  XOR U1 ( .A(B), .B(A), .Z(S) );
  AND U2 ( .A(A), .B(B), .Z(CO) );
endmodule


module ADD_N32_0 ( A, B, CI, S, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input CI;
  output CO;

  wire   [31:1] C;

  FA_1023 \FAINST[1].FA_  ( .A(A[1]), .B(B[1]), .CI(1'b0), .S(S[1]), .CO(C[2])
         );
  FA_1022 \FAINST[2].FA_  ( .A(A[2]), .B(B[2]), .CI(C[2]), .S(S[2]), .CO(C[3])
         );
  FA_1021 \FAINST[3].FA_  ( .A(A[3]), .B(B[3]), .CI(C[3]), .S(S[3]), .CO(C[4])
         );
  FA_1020 \FAINST[4].FA_  ( .A(A[4]), .B(B[4]), .CI(C[4]), .S(S[4]), .CO(C[5])
         );
  FA_1019 \FAINST[5].FA_  ( .A(A[5]), .B(B[5]), .CI(C[5]), .S(S[5]), .CO(C[6])
         );
  FA_1018 \FAINST[6].FA_  ( .A(A[6]), .B(B[6]), .CI(C[6]), .S(S[6]), .CO(C[7])
         );
  FA_1017 \FAINST[7].FA_  ( .A(A[7]), .B(B[7]), .CI(C[7]), .S(S[7]), .CO(C[8])
         );
  FA_1016 \FAINST[8].FA_  ( .A(A[8]), .B(B[8]), .CI(C[8]), .S(S[8]), .CO(C[9])
         );
  FA_1015 \FAINST[9].FA_  ( .A(A[9]), .B(B[9]), .CI(C[9]), .S(S[9]), .CO(C[10]) );
  FA_1014 \FAINST[10].FA_  ( .A(A[10]), .B(B[10]), .CI(C[10]), .S(S[10]), .CO(
        C[11]) );
  FA_1013 \FAINST[11].FA_  ( .A(A[11]), .B(B[11]), .CI(C[11]), .S(S[11]), .CO(
        C[12]) );
  FA_1012 \FAINST[12].FA_  ( .A(A[12]), .B(B[12]), .CI(C[12]), .S(S[12]), .CO(
        C[13]) );
  FA_1011 \FAINST[13].FA_  ( .A(A[13]), .B(B[13]), .CI(C[13]), .S(S[13]), .CO(
        C[14]) );
  FA_1010 \FAINST[14].FA_  ( .A(A[14]), .B(B[14]), .CI(C[14]), .S(S[14]), .CO(
        C[15]) );
  FA_1009 \FAINST[15].FA_  ( .A(A[15]), .B(B[15]), .CI(C[15]), .S(S[15]), .CO(
        C[16]) );
  FA_1008 \FAINST[16].FA_  ( .A(A[16]), .B(B[16]), .CI(C[16]), .S(S[16]), .CO(
        C[17]) );
  FA_1007 \FAINST[17].FA_  ( .A(A[17]), .B(B[17]), .CI(C[17]), .S(S[17]), .CO(
        C[18]) );
  FA_1006 \FAINST[18].FA_  ( .A(A[18]), .B(B[18]), .CI(C[18]), .S(S[18]), .CO(
        C[19]) );
  FA_1005 \FAINST[19].FA_  ( .A(A[19]), .B(B[19]), .CI(C[19]), .S(S[19]), .CO(
        C[20]) );
  FA_1004 \FAINST[20].FA_  ( .A(A[20]), .B(B[20]), .CI(C[20]), .S(S[20]), .CO(
        C[21]) );
  FA_1003 \FAINST[21].FA_  ( .A(A[21]), .B(B[21]), .CI(C[21]), .S(S[21]), .CO(
        C[22]) );
  FA_1002 \FAINST[22].FA_  ( .A(A[22]), .B(B[22]), .CI(C[22]), .S(S[22]), .CO(
        C[23]) );
  FA_1001 \FAINST[23].FA_  ( .A(A[23]), .B(B[23]), .CI(C[23]), .S(S[23]), .CO(
        C[24]) );
  FA_1000 \FAINST[24].FA_  ( .A(A[24]), .B(B[24]), .CI(C[24]), .S(S[24]), .CO(
        C[25]) );
  FA_999 \FAINST[25].FA_  ( .A(A[25]), .B(B[25]), .CI(C[25]), .S(S[25]), .CO(
        C[26]) );
  FA_998 \FAINST[26].FA_  ( .A(A[26]), .B(B[26]), .CI(C[26]), .S(S[26]), .CO(
        C[27]) );
  FA_997 \FAINST[27].FA_  ( .A(A[27]), .B(B[27]), .CI(C[27]), .S(S[27]), .CO(
        C[28]) );
  FA_996 \FAINST[28].FA_  ( .A(A[28]), .B(B[28]), .CI(C[28]), .S(S[28]), .CO(
        C[29]) );
  FA_995 \FAINST[29].FA_  ( .A(A[29]), .B(B[29]), .CI(C[29]), .S(S[29]), .CO(
        C[30]) );
  FA_994 \FAINST[30].FA_  ( .A(A[30]), .B(B[30]), .CI(C[30]), .S(S[30]), .CO(
        C[31]) );
  FA_993 \FAINST[31].FA_  ( .A(A[31]), .B(B[31]), .CI(C[31]), .S(S[31]) );
endmodule


module matrixMult_N_M_3_N3_M32 ( clk, rst, x, y, o );
  input [31:0] x;
  input [31:0] y;
  output [31:0] o;
  input clk, rst;

  wire   [31:0] xy;
  wire   [31:0] oi;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;
  assign o[0] = 1'b0;

  MULT_N32 MULT_ ( .A({x[31:1], 1'b0}), .B({1'b0, y[30:0]}), .O({xy[31:1], 
        SYNOPSYS_UNCONNECTED__0}) );
  ADD_N32_0 ADD_ ( .A({xy[31:1], 1'b0}), .B({o[31:1], 1'b0}), .CI(1'b0), .S({
        oi[31:1], SYNOPSYS_UNCONNECTED__1}) );
  DFF \o_reg[1]  ( .D(oi[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[1]) );
  DFF \o_reg[2]  ( .D(oi[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[2]) );
  DFF \o_reg[3]  ( .D(oi[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[3]) );
  DFF \o_reg[4]  ( .D(oi[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[4]) );
  DFF \o_reg[5]  ( .D(oi[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[5]) );
  DFF \o_reg[6]  ( .D(oi[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[6]) );
  DFF \o_reg[7]  ( .D(oi[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[7]) );
  DFF \o_reg[8]  ( .D(oi[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[8]) );
  DFF \o_reg[9]  ( .D(oi[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[9]) );
  DFF \o_reg[10]  ( .D(oi[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[10]) );
  DFF \o_reg[11]  ( .D(oi[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[11]) );
  DFF \o_reg[12]  ( .D(oi[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[12]) );
  DFF \o_reg[13]  ( .D(oi[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[13]) );
  DFF \o_reg[14]  ( .D(oi[14]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[14]) );
  DFF \o_reg[15]  ( .D(oi[15]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[15]) );
  DFF \o_reg[16]  ( .D(oi[16]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[16]) );
  DFF \o_reg[17]  ( .D(oi[17]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[17]) );
  DFF \o_reg[18]  ( .D(oi[18]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[18]) );
  DFF \o_reg[19]  ( .D(oi[19]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[19]) );
  DFF \o_reg[20]  ( .D(oi[20]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[20]) );
  DFF \o_reg[21]  ( .D(oi[21]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[21]) );
  DFF \o_reg[22]  ( .D(oi[22]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[22]) );
  DFF \o_reg[23]  ( .D(oi[23]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[23]) );
  DFF \o_reg[24]  ( .D(oi[24]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[24]) );
  DFF \o_reg[25]  ( .D(oi[25]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[25]) );
  DFF \o_reg[26]  ( .D(oi[26]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[26]) );
  DFF \o_reg[27]  ( .D(oi[27]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[27]) );
  DFF \o_reg[28]  ( .D(oi[28]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[28]) );
  DFF \o_reg[29]  ( .D(oi[29]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[29]) );
  DFF \o_reg[30]  ( .D(oi[30]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[30]) );
  DFF \o_reg[31]  ( .D(oi[31]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o[31]) );
endmodule

