`include "src/button.sv"
`timescale 1ns/1ps         // Set tick to 1ns. Set sim resolution to 1ps.

/**
 * Note:
 *  The TB below is only an example of a testbench written in SV.
 *  Adapt this for your lab assignments as you see fit.
 *  An example clk signal has been added to show what a signal decl and usage looks like.
 *     You are welcome to delete the clk signal if it's not needed.
 *     For instance, purely combinational circuits do not need clks.
 *     So for labs without sequential elements, you can remove them.
 */

module button_tb();

/** declare tb signals below */
logic clk_tb;
reg button;
reg out;

/** declare module(s) below */
button dut (                  // declare an inst of top called "dut" (device under test)
    /** hook up tb signals to dut signals */
    .clk(clk_tb),           // connect dut's clk wire to clk_tb
    .button(button),
    .duty_cycle(out)
);

localparam CLK_PERIOD = 2 /** clk period */;
always #(CLK_PERIOD/2) clk_tb=~clk_tb;          // toggle clk_tb every #(CLK_PERIOD/2) ticks

initial begin
    $dumpfile("build/button.vcd"); // intermediate file for waveform generation
    $dumpvars(0, button_tb);       // capture all signals under top_tb
end

initial begin
    clk_tb <= 0;

    repeat (12) begin
        button = 1;
        $display(out);
        #(CLK_PERIOD*10);

        button = 0;
        $display(out);
        #(CLK_PERIOD*10);
    end
    $finish;            // end simulation, otherwise it runs indefinitely
end

endmodule
