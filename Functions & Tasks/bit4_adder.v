module bit4_adder(output reg [3:0]sum1,sum2, output reg c1,c2 ,input [3:0]a,b,c,d,input cin);

task adder;
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;
begin
{cout,sum}=a+b+cin;
end
endtask

always @(*) begin
adder(a,b,cin,sum1,c1);
adder(c,d,cin,sum2,c2);
end
endmodule

`timescale 1ns / 1ps

module bit4_adder_tb;
    reg [3:0] a, b, c, d;
    reg cin;
    wire [3:0] sum1, sum2;
    wire c1, c2;

    bit4_adder uut (
        .sum1(sum1), 
        .sum2(sum2), 
        .c1(c1), 
        .c2(c2), 
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .cin(cin)
    );

    initial begin
        $monitor("Time=%0t | cin=%b | a=%d b=%d -> sum1=%d c1=%b | c=%d d=%d -> sum2=%d c2=%b", $time, cin, a, b, sum1, c1, c, d, sum2, c2);
        a = 4'd2; b = 4'd3; c = 4'd5; d = 4'd1; cin = 0;
        #10;
        cin = 1;
        #10;
        a = 4'hf; b = 4'h1; c = 4'h8; d = 4'h8; cin = 0;
        #10;
        a = 4'd10; b = 4'd5; c = 4'd7; d = 4'd9; cin = 1;
        #10;

        $finish;
    end
      
endmodule
