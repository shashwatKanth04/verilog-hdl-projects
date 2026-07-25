 module pulse_gen(output reg pulse, input [7:0]count);

task pulse;
input  [7:0]t1;
output pulse;
integer i;
for(i=0;i<=t1;i=i+1)
begin
pulse=1;
#(t1) pulse=0;
#(t1) pulse=1;
end
endtask

always @(*) begin
clock(count,pulse);
end
endmodule

module tb_clock;
wire clk;
reg [7:0]c;
pulse_gen g1(clk,c);

initial begin
$monitor("Clk=%0b | Time=%0d",clk,$time);
c=8'h0f;
#100 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars();
end
endmodule