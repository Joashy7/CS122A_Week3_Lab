`include "src/top.sv"
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

module top_tb;

/** declare tb signals below */
logic clk_tb;
wire but1;
wire but2;
logic out;

/** declare module(s) below */
top dut (                  // declare an inst of top called "dut" (device under test)
    /** hook up tb signals to dut signals */
    .clk(clk_tb)           // connect dut's clk wire to clk_tb
    .button1(but1)
    .button2(but2)
);

localparam CLK_PERIOD = 2 /** clk period */;
always #(CLK_PERIOD/2) clk_tb=~clk_tb;          // toggle clk_tb every #(CLK_PERIOD/2) ticks

initial begin
    $dumpfile("build/top.vcd"); // intermediate file for waveform generation
    $dumpvars(0, top_tb);       // capture all signals under top_tb
end

task checkLED(); begin
if (out) begin
        $display("LED State: On");
    end else begin
        $display ("LED State: Off");
    end
end
endtask

task testPress(); begin
    clk_tb<=1'b1;       // sets clk_tb to 1
    but1 = 1;
    checkLED();
    #5; 
    but1 = 0;
    checkLED();
end
endtask

task testPressTwice(); begin
    clk_tb<=1'b1;       // sets clk_tb to 1
    but1 = 1;
    checkLED();
    #5; 
    but1 = 0;
    checkLED();
    #5;
    but1 = 1;
    checkLED();
    #5; 
    but1 = 0;
    checkLED();
end
endtask

initial begin
    /** testbench logic goes below */
    testPress();     
    testPressTwice();
    //#(CLK_PERIOD*100);    // waits for CLK_PERIOD * 100 ticks
    $finish;            // end simulation, otherwise it runs indefinitely
end

endmodule
