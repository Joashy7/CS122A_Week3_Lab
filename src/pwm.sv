module pwm (
    input wire clk,
    input wire [3:0] duty_cycle,
    output logic out
);

logic [3:0] count = 0;

always_ff @(posedge clk) begin
    if (count >= 9)
        count <= 0;
    else
        count <= count + 1;
end

assign out = (count < duty_cycle);

endmodule