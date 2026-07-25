`include "mux_defines.vh"

module mux (
    `ifdef MUX_2_1
        input [`DATA_WIDTH-1:0] in0, in1,
        input sel,
    `elsif MUX_4_1
        input [`DATA_WIDTH-1:0] in0, in1, in2, in3,
        input [1:0] sel,
    `elsif MUX_8_1
        input [`DATA_WIDTH-1:0] in0, in1, in2, in3, in4, in5, in6, in7,
        input [2:0] sel,
    `endif
    output reg [`DATA_WIDTH-1:0] out
);

    always @(*) begin
        `ifdef MUX_2_1
            case(sel)
                1'b0: out = in0;
                1'b1: out = in1;
            endcase
        `elsif MUX_4_1
            case(sel)
                2'b00: out = in0;
                2'b01: out = in1;
                2'b10: out = in2;
                2'b11: out = in3;
            endcase
        `elsif MUX_8_1
            case(sel)
                3'b000: out = in0;
                3'b001: out = in1;
                3'b010: out = in2;
                3'b011: out = in3;
                3'b100: out = in4;
                3'b101: out = in5;
                3'b110: out = in6;
                3'b111: out = in7;
            endcase
        `endif
    end
endmodule