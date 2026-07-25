module decoder38(output [7:0]i, input [0:2]y);
assign i[0]=(~y[0]&~y[1]&~y[2]);
assign i[1]=(~y[0]&~y[1]&y[2]);
assign i[2]=(~y[0]&y[1]&~y[2]);
assign i[3]=(~y[0]&y[1]&y[2]);
assign i[4]=(y[0]&~y[1]&~y[2]);
assign i[5]=(y[0]&~y[1]&y[2]);
assign i[6]=(y[0]&y[1]&~y[2]);
assign i[7]=(y[0]&y[1]&y[2]);
endmodule

module tb_decoder;
reg [2:0]y;
wire [7:0]i;
decoder38 d0(i,y);
initial begin
    y[1]=1'b0;
    y[0]=1'b0;
    y[2]=1'b0;
$monitor("time=%0d | y=%0d | i=%0b", $time,y,i);
#100
$finish;
end

always #10 y[0]=~y[0];
always #20 y[1]=~y[1];
always #40 y[2]=~y[2];

initial begin
$dumpfile("decoder.vcd");
$dumpvars();
end
endmodule
