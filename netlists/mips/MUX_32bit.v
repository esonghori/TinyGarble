module MUX_32bit(    
    data1_in,
    data2_in,
    select,
    data_out
);

input [31:0] data1_in, data2_in;
input select;
output [31:0] data_out;

assign data_out = (select) ? data2_in : data1_in;

endmodule
