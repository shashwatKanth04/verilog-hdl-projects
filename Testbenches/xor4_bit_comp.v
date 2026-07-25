module xor_4_bit_compare (
    input  [3:0] A,
    input  [3:0] B,
    output reg AgtB, // A > B
    output reg AltB, // A < B
    output reg AeqB  // A = B
);

    integer i;
    reg found;

    always @(*) begin
        // Default values
        AgtB = 1'b0;
        AltB = 1'b0;
        AeqB = 1'b0;
        found = 1'b0;

        // Compare from MSB (3) to LSB (0)
        for (i = 3; i >= 0; i = i - 1) begin
            if (!found) begin
                if (A[i] ^ B[i]) begin // If bits are different
                    if (A[i] > B[i]) 
                        AgtB = 1'b1;
                    else 
                        AltB = 1'b1;
                    
                    found = 1'b1; // Stop comparing once difference is found
                end
            end
        end

        // If no differences were found, they are equal
        if (!found) begin
            AeqB = 1'b1;
        end
    end

endmodule


module xor_4_bit_compare_tb;
    reg [3:0] A, B;
    wire AgtB, AltB, AeqB;

    xor_4_bit_compare uut (
        .A(A), .B(B), 
        .AgtB(AgtB), .AltB(AltB), .AeqB(AeqB)
    );

    initial begin
        $monitor("A=%b B=%b | A>B=%b A<B=%b A=B=%b", A, B, AgtB, AltB, AeqB);
        
        A = 4'b1010; B = 4'b1010; #10; // Equal
        A = 4'b1100; B = 4'b1011; #10; // A > B
        A = 4'b0111; B = 4'b1000; #10; // A < B
        A = 4'b1111; B = 4'b0000; #10; // A > B
        
        $finish;

    end
    initial begin
        $dumpfile("xor4_bit.vcd");
        $dumpvars();

    end

endmodule