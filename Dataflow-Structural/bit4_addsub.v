`timescale 1ns / 1ps


module bit4_addsub(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output carry,
    input cin,
    output [3:0] diff,
    output borrow,
    input bin
    );
    assign {carry,sum}=a+b+cin;
    assign {borrow,diff}=a-b-bin;
endmodule

module tb_addsub;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire cout;

bit4_addsub dut(a,b,sum,cout,cin,diff,borrow,bin);
initial begin
file =$fopen("E:\test_vectors.txt","r");
$monitor("time=%0d | a=%0b | b=%0b | cin=%0b | sum=%0b | carry=%0b",$time,a,b,cin,sum,cout);
a=4'b0000;b=4'b0001;cin=1'b0;
#10 a=4'b0000;b=4'b0001;cin=1'b0;
#10 a=4'b0110;b=4'b1001;cin=1'b0;
#10 a=4'b0100;b=4'b1101;cin=1'b0;
#10 a=4'b0010;b=4'b1000;cin=1'b0;
#10 $finish;
end
endmodule


