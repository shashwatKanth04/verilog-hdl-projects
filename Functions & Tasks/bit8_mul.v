module bit8_mul(output reg [7:0]mul1,mul2 ,input [3:0]a,b,c,d);

task multiply;
input [3:0]a,b;
output [7:0]mul;
begin
mul=a*b;
end
endtask

always @(*) begin
multiply(a,b,mul1);
multiply(c,d,mul2);
end
endmodule

`timescale 1ns / 1ps

module bit8_mul_tb;
    reg [3:0] a, b, c, d;
    wire [7:0] mul1; 
    wire [7:0]mul2;
    bit8_mul uut (mul1,mul2,a,b,c,d);

    initial begin
        $monitor("Time=%0t | a=%d b=%d -> mul1=%d | c=%d d=%d -> mul2=%d", $time, a, b, mul1, c, d, mul2);
        a = 4'd2; b = 4'd3; c = 4'd5; d = 4'd1;
        #10;
        a = 4'hf; b = 4'h1; c = 4'h8; d = 4'h8;
        #10;
        a = 4'd10; b = 4'd5; c = 4'd7; d = 4'd9;
        #10;

        $finish;
    end
      
endmodule
