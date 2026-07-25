module inv(output out,input in);
assign #2 out= ~in;
endmodule

module tb_inv;
wire out;
reg in;
inv i0(out,in);
initial begin
$monitor("time=0%0d, out=%0b,in=%0b",$time,out,in);
in=1'b1; #5
in=1'b0; #5
$finish;
end
initial begin
$dumpfile("inv.vcd");
$dumpvars();
end
endmodule
