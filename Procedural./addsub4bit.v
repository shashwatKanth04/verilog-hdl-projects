module addsub4bit(output [3:0]sum,[3:0]diff,cout, input [3:0]a,[3:0]b,input cin,bin)

assign sum[0]=(a[0]^b[0]^cin);
assign sum[1]=(a[1]^b[1]^cin);
assign sum[2]=(a[2]^b[2]^cin);
assign sum[3]=(a[3]^b[3]^cin);
assign cout=
endmodule

module tb_addsub;
wire [3:0]y;
reg [3:0]a;
reg [3:0]b;
reg cin;
addsub4bit as0(sum,cout,a,b,cin);
initial begin
    a=4'b0000;
    b=4'b0000;
    cin=1'b0;
    monitor("time=%0d | sum=%0b | cout=%0b | a=%0b | b=%0b | cin=%0b",$time,sum,cout,a,b,cin);
    #1000
    $finish

    initial begin
        $dumpfile("addsub4bit")



