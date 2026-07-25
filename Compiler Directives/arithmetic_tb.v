`timescale 1ns/1ps
`include "arithmetic_defines.vh"
`include "bit_arithmetic.v"
module arithmetic_tb;

    reg  [`DATA_WIDTH-1:0] a, b;
    wire [`DATA_WIDTH-1:0] result;
    bit_arithmetic uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        `ifdef OP_ADD
            $display("--- Mode: ADDITION (a + b) ---");
        `elsif OP_SUB
            $display("--- Mode: SUBTRACTION (a - b) ---");
        `elsif OP_INC
            $display("--- Mode: INCREMENT (a + 1) ---");
        `endif
        $monitor("Input A: %d, Input B: %d | Result: %d", a, b, result);
        a = 8'd20; b = 8'd5;
        #10;
        a = 8'd100; b = 8'd40;
        #10;
        $finish;
    end
endmodule
