`include "src/top.sv"
`default_nettype none

module top_tb;
logic clk;
logic button;
wire [3:0]duty_cycle;
wire [6:0] seg7;
wire led;

top UUT
(
    .clk(clk),
    .button(button),
    .duty_cycle(duty_cycle),
    .seg7(seg7),
    .led(led)
);

localparam CLK_PERIOD = 2 /** clk period */;
always #(CLK_PERIOD/2) clk = ~clk; // toggle clk every sim tick

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    clk <= 0;

    repeat (12) begin
        button = 1;
        #(CLK_PERIOD*10);

        button = 0;
        #(CLK_PERIOD*10);
    end

    $finish;
end

endmodule
`default_nettype wire