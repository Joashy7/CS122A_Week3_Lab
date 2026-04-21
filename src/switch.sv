module switch (
    input wire switch,
    input wire [3:0]duty_cycle_blue,
    input wire [3:0]duty_cycle_red,
    output logic [3:0]display_duty_cycle
);

assign display_duty_cycle = switch ? duty_cycle_blue : duty_cycle_red;

endmodule