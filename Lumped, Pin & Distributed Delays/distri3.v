module fa(output sum, cout,input a,b,cin);
wire s,c1,c2;
xor #5 y1(s,a,b);
xor #5 x2(sum,s,cin);

and #5 a1(c1,a,b);
and #5 a2(c2,s,cin);
or #5 a3(cout,c1,c2);

endmodule


module tb_fa();
wire s,cout;
reg a,b,cin;

fa f1(s,cout,a,b,cin);
initial begin
$monitor("time=%0d,a=%0b,b=%0b,cin=%0b, sum=%0b, cout=%0b",$time,a,b,cin, s,cout);
a=1'b0;b=1'b1; cin = 1'b0; #10
a=1'b0;b=1'b1; cin = 1'b1; #10
a=1'b1;b=1'b1; cin = 1'b1; #10
a=1'b0;b=1'b1; cin = 1'b0; #10
a=1'b0;b=1'b0; cin = 1'b0; #10

$finish;
end

initial begin
$dumpfile("fa.vcd");
$dumpvars();
end
endmodule