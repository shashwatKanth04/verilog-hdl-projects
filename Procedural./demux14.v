module demux41(output [3:0]y, input [1:0]s, input i);
assign y[0]=(~s[1]&&~s[0]&&i);
assign y[1]=(~s[1]&&~s[0]&&i);
assign y[2]=(~s[1]&&~s[0]&&i);
assign y[3]=(~s[1]&&~s[0]&&i);
endmodule

module tb_demux41;
wire [3:0]y;
reg [1:0]s;
reg i;
demux41 d0(y,s,i);
initial begin
    $monitor("time=%0d | y=%0b | s=%0b | i=%0b", $time,y,s,i);
    s=0;
    i=1'b0;
    #100
    $finish;
end
always #5 s[0]=~s[0];
always #10 s[1]=~s[1];
initial begin
$dumpfile("demux.vcd");
$dumpvars();
end
endmodule

