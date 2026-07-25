module and_pp(output out,input a,b);
specify
(a=>out) =(2, 3);
(b=>out) =(2, 3);
endspecify
and g1 (out,a,b);

endmodule

module and_pp_tb();

wire out;
reg a,b;

and_pp tb(out,a,b);
initial begin
$monitor("time=0%0d, out=%0b,a=%0b,b=%0b",$time,out,a,b);
a=1'b1; b = 1'b0; #5
a=1'b0; b = 1'b1; #5
a=1'b1; b = 1'b1; #5
$finish;
end
initial begin
$dumpfile("pp_1.vcd");
$dumpvars();
end
endmodule