module pp_3(output out, input a,b);

 xor #(2,3) x1(out, a,b);

endmodule

module pp3_tb();

wire out;
reg a,b;

pp_3 tb(out,a,b);
initial begin
$monitor("time=0%0d, out=%0b,a=%0b,b=%0b",$time,out,a,b);
a=1'b1; b = 1'b0; #5
a=1'b0; b = 1'b1; #5
a=1'b1; b = 1'b1; #5
$finish;
end
initial begin
$dumpfile("pp_3.vcd");
$dumpvars();
end
endmodule