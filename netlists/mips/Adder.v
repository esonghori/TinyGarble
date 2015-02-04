/* =============================================================================
 *
 * Name           : Adder.v
 * Author         : Hakki Caner Kirmizi
 * Date           : 2010-5-1
 * Description    : A module that sums up two 32-bit input and assigns to 
 * 					32-bit output
 *                  
 * =============================================================================
*/

module Adder
#
(
	parameter W = 32
)
(
    data1_in,
    data2_in,
    data_out
);


input   [W-1:0]  data1_in;
input   [W-1:0]  data2_in;
output  [W-1:0]  data_out;

ADD
#(
	.N(W)
)
ADD_1
(
	.A(data1_in),
	.B(data2_in),
	.CI(1'b0),
	.S(data_out), 
	.CO()
);

/*reg [31:0] data_out;

always @(data1_in or data2_in) 
begin
	data_out = data1_in + data2_in;
end*/
  
endmodule