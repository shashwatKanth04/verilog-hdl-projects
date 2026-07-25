`define N 4            
`define GATE_TYPE_AND
`define GATE_TYPE_OR
`define GATE_TYPE_XOR

module gates_block (
    input  [`N-1:0] A,
    input  [`N-1:0] B,
    output [`N-1:0] Y
);
    `ifdef GATE_TYPE_AND
        assign Y = A & B;   
    `elsif GATE_TYPE_OR
        assign Y = A | B;    
    `elsif GATE_TYPE_XOR
        assign Y = A ^ B;  
    `else
        assign Y = {`N{1'b0}}; 
    `endif

endmodule

module tb_gates_block;
    reg  [`N-1:0] A_in;
    reg  [`N-1:0] B_in;
    wire [`N-1:0] Y_out;
    gates_block uut (
        .A(A_in),
        .B(B_in),
        .Y(Y_out)
    );
    initial begin
        $display("--- Testing %0d-bit Logic Block ---", `N);
        `ifdef GATE_TYPE_AND $display("Mode: BITWISE AND"); `endif
        `ifdef GATE_TYPE_OR  $display("Mode: BITWISE OR");  `endif
        `ifdef GATE_TYPE_XOR $display("Mode: BITWISE XOR"); `endif
        $display("---------------------------------");
        A_in = 4'b1010; B_in = 4'b1100;
        #10;
        $display("A:%b  B:%b | Y:%b", A_in, B_in, Y_out);
        A_in = 4'b1111; B_in = 4'b0000;
        #10;
        $display("A:%b  B:%b | Y:%b", A_in, B_in, Y_out);
        A_in = 4'b0101; B_in = 4'b1010;
        #10;
        $display("A:%b  B:%b | Y:%b", A_in, B_in, Y_out);

        $finish;
    end
endmodule