module decoder (
    input wire clk,
    /** Input Ports */
    input wire [3:0] bcd,

    /** Output Ports */
    output logic [6:0] seg7
);

/** Logic */
always @(posedge clk) begin
    case (bcd) 
        0: seg7 <= 7'b1111110;
        1: seg7 <= 7'b0110000;
        2: seg7 <= 7'b1101101;
        3: seg7 <= 7'b1111001;
        4: seg7 <= 7'b0110011;
        5: seg7 <= 7'b1011011;
        6: seg7 <= 7'b1011111;
        7: seg7 <= 7'b1110000;
        8: seg7 <= 7'b1111111;
        9: seg7 <= 7'b1111011;
        10: seg7 <= 7'b1110111;
        11: seg7 <= 7'b0011111;
        12: seg7 <= 7'b1001110;
        13: seg7 <= 7'b0111101;
        14: seg7 <= 7'b1001111;
        15: seg7 <= 7'b1000111;
        default: seg7 <=7'b0000001;
    endcase
end

endmodule