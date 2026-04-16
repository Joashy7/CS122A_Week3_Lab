`include "src/top.sv"
`default_nettype none

module top_tb;
logic clk;
logic button;
wire led;

top UUT
(
    .clk(clk),
    .button(button),
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

    button = 0;
    #(CLK_PERIOD*3);

    button = 1;
    #(CLK_PERIOD*3);

    button = 0;
    #(CLK_PERIOD*3);

    button = 1;
    #(CLK_PERIOD*3);

    button = 0;
    #(CLK_PERIOD*3);

    button = 1;
    #(CLK_PERIOD*3);

    button = 0;
    #(CLK_PERIOD*3);

    $finish;
end

endmodule
`default_nettype wire