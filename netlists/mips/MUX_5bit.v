module MUX_5bit(    
    data1_in,
    data2_in,
    select,
    data_out
);

input [4:0] data1_in, data2_in;
input select;
output [4:0] data_out;

assign data_out = (select) ? data2_in : data1_in;

endmodule
