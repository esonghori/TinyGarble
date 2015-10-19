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


module sha3_comb
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

  input             clk;
  input 				    rst;
  input	  [287:0]		g_input;
  input   [287:0]   e_input;
  output  [1599:0]	o;
  wire	  [63:0]		rc [24/CC-1:0]; /* round constant */
  wire	  [1599:0]	round_in [24/CC-1:0];
  wire 	  [1599:0]	round_out [24/CC-1:0];
    
	
  assign round_in[0] = {e_input, g_input};
	assign o = round_out[24/CC-1];

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
		if(q==0)
			rconst rconst_ 
			(
				.i({{(24/CC-q-1){1'b0}}, 1'b1}),
				.rc(rc[q])
			);
		else if(q==24/CC-1)
			rconst rconst_ 
			(
				.i({1'b1, {(q){1'b0}}}),
				.rc(rc[q])
			);
		else
			rconst rconst_ 
			(
				.i({{(24/CC-q-1){1'b0}}, 1'b1, {(q){1'b0}}}),
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
