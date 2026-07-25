module fib_task(
    output reg [15:0] f,
    input [7:0] a, b
);

    task fibonacci;
        input [7:0] start_a;
        input [7:0] start_b;
        output [15:0] f_out;
        
        reg [15:0] temp_a;
        reg [15:0] temp_b;
        integer i;
        begin
            temp_a = start_a;
            temp_b = start_b;
            
            for (i = 0; i < 10; i = i + 1) begin
                f_out = temp_a + temp_b;
                temp_a = temp_b;
                temp_b = f_out;
                $display("Iteration %0d: %0d", i, f_out);
            end
        end
    endtask

    always @(*) begin
        fibonacci(a, b, f);
    end
endmodule

module tb_fibonacci;
    wire [15:0] f;
    reg [7:0] a, b;

    fib_task f1(f, a, b);

    initial begin
        $monitor("At time %t, Final Output f = %d", $time, f);
        
        a = 8'd0; b = 8'd1;
        #10;
        a = 8'd1; b = 8'd2;
        #10;
        
        $finish;
    end
endmodule
