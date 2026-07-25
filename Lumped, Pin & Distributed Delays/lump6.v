module ha(output sum,carry, input a,b);
assign #5 sum= a^b;
assign #5 carry= a&b;
endmodule

module tb_ha;
wire sum,carry;
reg a,b;
ha h1(sum,carry,a,b);
initial begin
$monitor("time=%0d,a=%0b,b=%0b, sum=%0b, carry=%0b",$time,a,b,sum,carry);
a=1'b0;b=1'b1; #5
a=1'b1;b=1'b1; #10
$finish;
end

initial begin
$dumpfile("ha.vcd");
$dumpvars();
end
endmodule


