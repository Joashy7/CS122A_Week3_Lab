module button (
    input wire clk,
    input wire button,
    output logic [3:0] duty_cycle
);
    typedef enum logic [3:0]{START, S0, S1, S2} state_t;

    state_t state = START;

    initial begin
       duty_cycle = 0; 
    end

    always_ff @(posedge clk) begin
        case (state)
            START:state <= S0;
            S0:state <= state_t'(button ? S1 : S0);
            S1:state <= state_t'(!button ? S2 : S1);
            S2:state <= state_t'(S0);
            default: state <= START;
        endcase
    end

    always_comb begin
        if (state == S2) begin
            if (duty_cycle >= 9)
                duty_cycle = 0;
            else
                duty_cycle = duty_cycle + 1;
        end
    end
endmodule