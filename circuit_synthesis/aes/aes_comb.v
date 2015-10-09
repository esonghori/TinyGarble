module aes_comb
#(
	parameter CC=1
)
(
	clk,
	rst,
	g_input,
	e_input,
	o
);
	localparam		NR = 10;
	input					clk;
	input					rst;
  input 	[128*NR/CC-1:0]	g_input;
  input 	[127:0] 		e_input;
  output	[127:0] 		o;




  wire  [128*NR/CC-1:0] key;
  wire  [127:0]     msg;
  wire  [127:0]     out;
	wire 	[127:0] 		keyi[NR/CC-1:0];
  wire 	[127:0] 		w0[NR/CC-1:0];
  wire 	[127:0] 		w1[NR/CC-1:0];
  wire 	[127:0] 		w2[NR/CC-1:0];
  wire 	[127:0] 		w3[NR/CC-1:0];


  assign  key = g_input;   
  assign  msg = e_input;
  assign  o = out;

  genvar i;

	generate 
	for(i=0;i<NR/CC;i=i+1)
	begin:KEYI
		assign keyi[i] = key[128*(i+1)-1:128*i];
	end
	endgenerate

	assign w0[0] = msg;

    generate 
	for(i=0;i<NR;i=i+1)
	begin:ADDROUNDKEY
		AddRoundKey a(.x(w0[i]), .y(keyi[i]), .z(w1[i]));
	end
	endgenerate


	AddRoundKey a(.x(w3[NR-1]), .y(keyi[NR-1]), .z(out));

	generate 
	for(i=0;i<NR;i=i+1)
	begin:SUBBYTES
		SubBytes a(.x(w1[i]), .z(w2[i]));
	end
	endgenerate

	generate 
	for(i=0;i<NR;i=i+1)
	begin:SHIFTROWS
		ShiftRows 	c(.x(w2[i]), .z(w3[i]));
	end
	endgenerate

	generate 
	for(i=0;i<NR-1;i=i+1)
	begin:MIXCOLUMNS
		MixColumns 	d(.x(w3[i]), .z(w0[i+1]));
	end
	endgenerate


endmodule
