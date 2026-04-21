module button (
    input wire clk,
    input wire button,
    output logic [3:0] duty_cycle
);
    typedef enum logic [2:0]{START, S0, S1} state_t;

    state_t state = START;

    always @(posedge clk) begin
        case (state)
            START: begin state = S0; duty_cycle = 0; end
            S0: begin
                if (button) begin
                    state = state_t'(S1);
                    if (duty_cycle > 9) duty_cycle = 0;
                    else duty_cycle = duty_cycle + 1;
                end
            end
            S1:state = state_t'(button ? S1 : S0);
            default: state = START;
        endcase
    end

endmodule