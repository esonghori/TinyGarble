module encoder
#(
	parameter logS=4
)
(
	g_input,
  e_input,
	o
);
	
	localparam S = 2**logS;
	input [S/2-1:0] g_input;
  input [S/2-1:0] e_input;
	output [logS-1:0] o;

  wire [S-1:0] in;

  assign in[S/2-1:0] = g_input;
  assign in[S-1:S/2] = e_input;

  encoder_
  #(
    .logS(logS)
  )
  encoder0
  (
    .in(in),
    .o(o)
  );

endmodule


module encoder_
#(
  parameter logS=4
)
(
  in,
  o
);
  
  localparam S = 2**logS;
  input [S-1:0] in;
  output [logS-1:0] o;

  generate 
    if(logS == 1)
    begin
      assign o = in[1];
    end
    else
    begin
    
      wire [logS-1:0] o0;
      wire [logS-1:0] o1;


      encoder_ 
      #(
        .logS(logS-1)
      )
      encoder0
      (
        .in(in[S/2-1:0]),
        .o(o0[logS-2:0])
      );
      
      encoder_ 
      #(
        .logS(logS-1)
      )
      encoder1
      (
        .in(in[S-1:S/2]),
        .o(o1[logS-2:0])
      );
      
      assign o = {|in[S-1:S/2], o0[logS-2:0]|o1[logS-2:0]};
    end
  endgenerate

endmodule