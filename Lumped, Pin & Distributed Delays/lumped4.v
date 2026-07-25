module andg(output y, input a,b);
assign #3 y=a&b;
endmodule

module tb_andg;
wire y;
reg a,b;
andg a0(y,a,b);
initial begin
$monitor("time=%0d, y=%0b, a=%0b, b=%0b",$time,y,a,b);
a=1'b0;b=1'b1; #5
a=1'b1;b=1'b1; #5
a=1'b1;b=1'b0; #5
#500 $finish;
end
initial begin
$dumpfile("and.vcd");
$dumpvars();
end
endmodule
