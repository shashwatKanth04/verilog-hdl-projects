module updown4(output reg [3:0]count, input clk,reset,mode);
always @(posedge clk or posedge reset)begin
if(reset==1)begin
count<=4'b0000;
end
else begin
if(mode==1'b0)begin
count<=count + 1;
end
else begin
count<=count - 1;
end
end
end
endmodule

module tb_updown;
reg clk,reset,mode;
wire [3:0]count;
updown4 dut(count,clk,reset,mode);
always #5 clk=~clk;
initial begin
$monitor("time=%0d | count=%0d | clk=%0b | reset=%0b | mode=%0b",$time,count,clk,reset,mode);
reset=1;
clk=0;
mode=0;
#10 reset=0;
#100 mode=1;
#200
$finish;
end
initial begin

$dumpfile("counter.vcd");
$dumpvars();
end
endmodule

