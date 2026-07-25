module multiplication_table(
    output reg [7:0] m1, m2, 
    input [3:0] a, b
);

    // Task definition
    task multable;
        input [3:0] val_in;   
        output [7:0] val_out; 
        integer i;
        begin
            for(i = 1; i <= 10; i = i + 1) begin

                $display("%0d X %0d = %0d", val_in, i, val_in * i);
            end
            val_out = val_in * 10;
        end
    endtask

    always @(*) begin
        multable(a, m1);

    end

endmodule

module tb_multiplication_table;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] m1, m2;

    // Instantiate the module
    multiplication_table m3(m1, m2, a, b);

    initial begin
        a = 4; 
        #10;       
        a = 2; 
        #10;        
        $finish;
    end
    initial begin
$dumpfile("dump1.vcd");
$dumpvars();
end
endmodule
