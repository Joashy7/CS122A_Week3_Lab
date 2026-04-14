module top (
    input logic clk,
    input wire button1,
    input wire button2,
    output logic out
);
    typedef enum logic [3:0]{START, S0, S1, S2, S3} state_t;

    state_t state = START;

    always @(posedge clk) begin
        case (state)
            START:state = S0;
            S0:state = state_t'(but1 ? S1 : S0);
            S1:state = state_t'(!but1 ? S1 : S2);
            S2:state = state_t'(but1 ? S3 : S2);
            S3:state = state_t'(!but1 ? S3 : S0);
            default: state = START;
        endcase
    end

    always_comb begin
        case(state)
            S0: out = 0;
            S2: out = 1;
        endcase 
    end

endmodule