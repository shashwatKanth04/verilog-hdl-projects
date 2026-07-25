module Mul_8bit(input [7:0]A, input [7:0]B, output [15:0]Y);

assign Y = A*B;

endmodule

module tb_8bit_mul();
reg [7:0]A, B;
wire [15:0] Y;

Mul_8bit uut(A,B,Y);

initial begin

    $monitor("time = %0d, number A is %0b, number B is %0b, output Y is %0b", $time, A,B,Y);

    A = 8'b00000000; B = 8'b00000000;
    #200
    $finish;
end

always #2 A = A+1;
always #20 B = B+1;

initial begin
    $dumpfile("multi_8.vcd");
    $dumpvars();
end


endmodule