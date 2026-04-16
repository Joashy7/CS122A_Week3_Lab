`include "src/button.sv"
`include "src/clock_divider.sv"


module top (
    input wire clk,
    input wire button,
    output logic led,
    output logic seg7
);

logic slowed_clk;
logic pressed;

clock_divider clock_divider (.clk(clk), .clk_divided(slowed_clk));
button button_press (.clk(clk), .button(button), .out(pressed));

assign led = pressed;
assign seg7 = 1;

endmodule