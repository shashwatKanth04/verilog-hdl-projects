module or1(output y1,y2,y3,input a,b);
or #5 o1(y1,a,b);
or #10 o2(y2,a,b);
or #15 o3(y3,a,b);
endmodule

module tb_org;
wire y1,y2,y3;
reg a,b;
or1 a0(y1,y2,y3,a,b);
initial begin
$monitor("time=%0d, y1=%0b,y2=%0b,y3=%0b, a=%0b, b=%0b",$time,y1,y2,y3,a,b);
a=1'b0;b=1'b1; #5
a=1'b1;b=1'b1; #5
a=1'b1;b=1'b0; #5
#500 $finish;
end
initial begin
$dumpfile("or.vcd");
$dumpvars();
end
endmodule
