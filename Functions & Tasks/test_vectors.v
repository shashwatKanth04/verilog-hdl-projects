module parity_calc(output reg par_even, par_odd,input [7:0]a);

task parity;
input [7:0]a1;
output pe,po;
begin
pe=^a1;
po=~(^a1);
end
endtask

always @(*)
parity(a,par_even,par_odd);
endmodule

module tb_parity_calc;
    reg [7:0] test_a;
    wire p_even, p_odd;

    parity_calc dut (
        .par_even(p_even), 
        .par_odd(p_odd), 
        .a(test_a)
    );

    task apply_test_vectors;
        begin           
            test_a <= 8'b00000000; #10; 
            $display("Input: %b | Even: %b | Odd: %b", test_a, p_even, p_odd);
            test_a <= 8'b00000001; #10;
            $display("Input: %b | Even: %b | Odd: %b", test_a, p_even, p_odd);
            test_a <= 8'b10101010; #10; 
            $display("Input: %b | Even: %b | Odd: %b", test_a, p_even, p_odd);
            test_a <= 8'b11111111; #10;
            $display("Input: %b | Even: %b | Odd: %b", test_a, p_even, p_odd);
        end
    endtask

    initial begin
        apply_test_vectors;
        apply_test_vectors;
        apply_test_vectors;
        $finish;
    end

endmodule
