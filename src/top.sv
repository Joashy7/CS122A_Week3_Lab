`include "src/button.sv"
`include "src/clock_divider.sv"


module top (
    input wire clk,
    input wire button,
    output logic led
);

logic slowed_clk;
logic pressed;

clock_divider clock_divider (.clk(clk), .clk_divided(slowed_clk));
button button_press (.clk(clk), .button1(button), .out(pressed));

assign led = pressed;

endmodule