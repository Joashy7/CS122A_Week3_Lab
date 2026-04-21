module clock_divider (
    input logic clk,
    output wire clk_divided
);

logic [63:0] clk_div_counter = 0;
wire clk_0s25;

assign clk_0s25 = clk_div_counter[22]; // assuming 25MHz toggle roughly every 0.25s
//assign clk_0s25 = clk_div_counter[2];

assign clk_divided = clk_0s25;

always_ff @(posedge clk) begin
    clk_div_counter <= clk_div_counter + 1;
end

endmodule