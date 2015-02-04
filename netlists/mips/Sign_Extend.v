/* =============================================================================
 *
 * Name           : Sign_Extend.v
 * Author         : Hakki Caner Kirmizi
 * Date           : 2010-5-1
 * Description    : A module that gets an 16-bit signed integer as input and
 *					extends it to a 32-bit signed integer
 *                  
 * =============================================================================
*/

module Signed_Extend(
    data_in,
    data_out
);

input	[15:0]	data_in;
output	[31:0]	data_out;

assign data_out = {{16{data_in[15]}}, data_in};
	
endmodule