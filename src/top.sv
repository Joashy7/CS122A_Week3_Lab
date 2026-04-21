`include "src/button.sv"
`include "src/clock_divider.sv"
`include "src/decoder.sv"
`include "src/pwm.sv"
`include "src/switch.sv"

module top (
    input wire clk,
    input wire button1,
    input wire button2,
    input wire switch,
    output logic [6:0] seg7,
    output logic led_blue,
    output logic led_red,
    output logic dp
);

logic slowed_clk;
logic [3:0]duty_cycle_blue;
logic [3:0]duty_cycle_red;
logic [3:0]displayed_duty_cycle;

clock_divider clock_divider (.clk(clk), .clk_divided(slowed_clk));
button button_press_blue (.clk(slowed_clk), .button(button1), .duty_cycle(duty_cycle_blue));
button button_press_red (.clk(slowed_clk), .button(button2), .duty_cycle(duty_cycle_red));
pwm pwm_blue (.clk(clk), .duty_cycle(duty_cycle_blue), .out(led_blue));
pwm pwm_red (.clk(clk), .duty_cycle(duty_cycle_red), .out(led_red));
switch display_switch (.switch(switch), .duty_cycle_blue(duty_cycle_blue), .duty_cycle_red(duty_cycle_red), .display_duty_cycle(displayed_duty_cycle));
decoder decoder (.clk(clk), .bcd(displayed_duty_cycle), .seg7(seg7));

assign dp = !switch;

endmodule
