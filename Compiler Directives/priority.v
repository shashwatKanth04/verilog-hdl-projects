
`define WIDTH_8            
`define ENCODING_BINARY     
// `define ENCODING_ONEHOT
`define DEBUG              

`ifdef WIDTH_4
    `define WIDTH 4
    `define OUT_WIDTH 2
`elsif WIDTH_8
    `define WIDTH 8
    `define OUT_WIDTH 3
`else
    `define WIDTH 16
    `define OUT_WIDTH 4
`endif

module priority_encoder (
    input  [`WIDTH-1:0] in_vector,
    output reg [`OUT_WIDTH-1:0] out_code,
    output reg valid
);
    integer i;
    always @(*) begin
        out_code = 0;
        valid = 0;
        for (i = `WIDTH - 1; i >= 0; i = i - 1) begin
            if (in_vector[i] && !valid) begin
                valid = 1;
                `ifdef ENCODING_BINARY
                    out_code = i[`OUT_WIDTH-1:0];
                `elsif ENCODING_ONEHOT
                    out_code = (1 << i);
                `endif
                
                `ifdef DEBUG
                    $display("[DEBUG] Input: %b | Index: %0d | Out: %b", in_vector, i, out_code);
                `endif
            end
        end
    end
endmodule


module tb_priority_encoder;

    reg [`WIDTH-1:0] in_vector;
    wire [`OUT_WIDTH-1:0] out_code;
    wire valid;
    priority_encoder uut (
        .in_vector(in_vector),
        .out_code(out_code),
        .valid(valid)
    );

    initial begin
        $display("--- Testing %0d-bit Priority Encoder ---", `WIDTH);
        $display("Mode: %s", `ifdef ENCODING_BINARY "BINARY" `else "ONE-HOT" `endif);
        $display("---------------------------------------");
        in_vector = 0; #10;
        $display("Input: %b | Valid: %b | Out: %b", in_vector, valid, out_code);
        in_vector = 8'b0000_0001; #10;
        $display("Input: %b | Valid: %b | Out: %b", in_vector, valid, out_code);
        in_vector = 8'b0100_1010; #10;
        $display("Input: %b | Valid: %b | Out: %b (Priority should be bit 6)", in_vector, valid, out_code);
        in_vector = 8'b1000_0000; #10;
        $display("Input: %b | Valid: %b | Out: %b", in_vector, valid, out_code);

        $finish;
    end
endmodule