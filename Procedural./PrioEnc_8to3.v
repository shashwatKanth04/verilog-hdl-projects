module PrioEnc_8to3(output [2:0]y,
input [7:0]d);

assign y[0]=d[7] | (d[5] & ~d[6]) | (d[3] & ~d[4] & ~d[6]) | (d[1] & ~d[2] & ~d[4] & ~d[6]);
assign y[1]=(d[6] | d[7]) | ((d[2] | d[3]) & ~d[4] & ~d[5]);
assign y[2]=d[4]|d[5]|d[6]|d[7];
endmodule

module tb_prioenc();

reg [7:0]d;
wire [2:0]y;
PrioEnc_8to3 p0(y,d);
initial begin
$monitor("time =%0d  |  Input d=0%b| Output y=0%b",$time, d, y);
d=8'b00000000;
#200
$finish;
end
always #1 d=d+1;



initial begin
$dumpfile("prio.vcd");
$dumpvars();
end



endmodule