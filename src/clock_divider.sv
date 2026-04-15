module clock_divider (
    input logic clk;
    input wire rst;

    output wire led
);

logic [63:0] clk_div_counter;
wire clk_0s25;

assign clk_0s25 = clk_div_counter[22]; // assuming 25MHz toggle roughly every 0.25s

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_div_counter <= 0;
    end else begin
        clk_div_counter <= clk_div_counter + 1;
    end
end

endmodule