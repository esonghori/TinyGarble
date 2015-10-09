
module shift_reg(clk, rst, g_init, e_init, g_input, e_input, o);

  input clk, rst;
  input g_input, e_input;

  input [7:0] g_init;
  input [7:0] e_init;
  output [31:0] o;

  reg [31:0] shift_register;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      shift_register <= {8'h00, 8'hFF, g_init, e_init};
    end else if (g_input && ~e_input) begin
      shift_register[31:0] <= {1'b0, shift_register[31:1]}; 
    end else if (~g_input && e_input) begin
      shift_register[31:0] <= {shift_register[30:0], 1'b0};
    end
  end

  assign o = shift_register;

endmodule
