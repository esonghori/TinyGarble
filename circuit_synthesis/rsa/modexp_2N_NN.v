module modexp_2N_NN
#(
  parameter N   = 8, //number of bits
  parameter CC  = 2*N*N  //2*N to 2*N*N
)
(
  clk,
  rst,
  g_init,  // {m}
  e_init,  // {e, n}
  o   // o = m^e mode n 
);

  input      clk;
  input      rst;
  input   [N-1:0]    g_init;
  input   [2*N-1:0]  e_init;
  output  [N-1:0]    o;

  reg   first_one;
  reg   mul_pow;
  
  reg   [CC/(2*N)-1:0] start_reg; 
  reg   [N-1:0] ereg; 
  reg   [N-1:0] creg;
  reg   [N-1:0] mreg;
  reg   [N-1:0] nreg;

  wire  [CC/(2*N)-1:0] start_in;
  wire  [CC/(2*N)-1:0] start_in_shift;
  wire  [N-1:0] ein; 
  
  wire  [N-1:0] y;  
  wire  [N-1:0] x;
  wire  [N-1:0] mod_mult_o;
  
  wire  [N-1:0] ereg_next;
  wire  [N-1:0] creg_next;
  wire [N-1:0] w1, w2, w3;

  assign o = creg_next;
  assign start_in = start_reg;
  assign ein = ereg;

  generate
  if(CC/(2*N) > 1)
  begin
    assign start_in_shift = {start_in[CC/(2*N)-2:0] , start_in[CC/(2*N)-1]};
  end
  else
  begin
    assign start_in_shift = {start_in[CC/(2*N)-1]};
  end 
  endgenerate


  assign creg_next = w1;

  MUX 
  #(
    .N(N)
  )
  MUX_4
  (
    .A(mod_mult_o),
    .B(creg),
    .S(((first_one & ein[N-1] & mul_pow)|(first_one & ~mul_pow))),
    .O(w1)
  );  

  assign ereg_next = w2;
  
  MUX 
  #(
    .N(N)
  )
  MUX_6
  (
    .A({ein[N-2:0], 1'b0}),
    .B(ereg),
    .S(mul_pow),
    .O(w2)
  );  

  always@(posedge clk or posedge rst)
  begin
    if(rst)
    begin
      mreg <= g_init;
      creg <= g_init;
      nreg <= e_init[N-1:0];
      ereg <= e_init[2*N-1:N];
      first_one <= 0;
      mul_pow <= 0;
      start_reg <= 1'b1;
    end
    else
    begin
      mreg <= mreg;
      nreg <= nreg;

      start_reg <= start_in_shift;
    
      if(start_in[CC/(2*N)-1])
        mul_pow <= ~mul_pow;

      ereg <= ereg_next;
      creg <= creg_next;
    
      if(start_in[CC/(2*N)-1])
      begin
        if(ein[N-1] & mul_pow)
        begin
          first_one <= 1;
        end
      end
    end
  end

  assign x = creg;
  assign w3 = creg;
  
  MUX 
  #(
    .N(N)
  )
  MUX_9
  (
    .A(mreg),
    .B(w3),
    .S(mul_pow),
    .O(y)
  );  



  modmult
  #(
    .N(N),
    .CC(CC/(2*N))
  )
  modmult_1
  (
    .clk(clk),
    .rst(rst),
    .start(start_in[0]),
    .x(x),
    .y(y),
    .n(nreg),
    .o(mod_mult_o)
  );

endmodule
