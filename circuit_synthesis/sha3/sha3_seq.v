/*
 * Copyright 2013, Homer Hsing <homer.hsing@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


module sha3_seq
#(
	parameter CC=24
)
(
	clk,
  rst,
	g_init,
  e_init,
	o
);

  input             clk;
  input 						rst;
  input	  [287:0]		g_init;
  input   [287:0]   e_init;
  output  [1599:0]	o;
  
	reg 							init;
  reg		[CC-1:0]		rc_i; /* select round constant */
	reg		[24-1:0]		rc_j[24/CC-1:0]; /* select round constant */
	wire	[63:0]			rc[24/CC-1:0]; /* round constant */
  wire	[1599:0]		round_in[24/CC-1:0];
  wire 	[1599:0]		round_out[24/CC-1:0];
	reg 	[1599:0]		round_reg;   

    
	always @ (posedge clk or posedge rst)
	begin
		if (rst) 	
		begin
			init <= 0;
			rc_i <= 0;
			round_reg <= {e_init, g_init};
		end
		else     
		begin
			init <= 1;
			rc_i <= {rc_i[CC-2:0], ~init};
			round_reg <= round_out[24/CC-1];
		end
    end

  assign round_in[0] = round_reg;
	assign o = round_out[24/CC-1];

    integer k,t;
	always@(*)
	begin
		for(k=0;k<24/CC;k=k+1)
		begin
			rc_j[k] = 0;
			for(t=0;t<CC;t=t+1)
			begin
				rc_j[k][(24/CC)*t+k] = rc_i[t];
			end
		end
	end

	genvar q;
	
	generate
	for(q=1;q<24/CC;q=q+1)
	begin:ASSROUND
		assign round_in[q] = round_out[q-1];
	end
	endgenerate
	
	
	generate
	for(q=0;q<24/CC;q=q+1)
	begin:RCONST
		rconst rconst_ 
		(
			.i(rc_j[q]),
			.rc(rc[q])
		);
	end
	endgenerate
	

	generate
	for(q=0;q<24/CC;q=q+1)
	begin:ROUND
	round 
		round_ 
		(
			.in(round_in[q]), 
			.round_const(rc[q]), 
			.out(round_out[q])
		);
	end
	endgenerate
	
endmodule
