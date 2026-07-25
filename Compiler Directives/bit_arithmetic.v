`include "arithmetic_defines.vh"
module bit_arithmetic (
    input  [`DATA_WIDTH-1:0] a,
    input  [`DATA_WIDTH-1:0] b,
    output reg [`DATA_WIDTH-1:0] result
);
    always @(*) begin
        `ifdef OP_ADD
            result = a + b;
        `elsif OP_SUB
            result = a - b;
        `elsif OP_INC
            result = a + 1;
        `else
            result = {`DATA_WIDTH{1'b0}};
        `endif
    end
endmodule
