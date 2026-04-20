`include "src/button.sv"
`include "src/clock_divider.sv"
`include "src/decoder.sv"

module top (
    input wire clk,
    input wire button,
    output logic [3:0]duty_cycle,
    output logic [6:0] seg7
);

logic slowed_clk;

clock_divider clock_divider (.clk(clk), .clk_divided(slowed_clk));
button button_press (.clk(clk), .button(button), .duty_cycle(duty_cycle));
decoder decoder (.clk(clk), .bcd(duty_cycle), .seg7(seg7));

endmodule