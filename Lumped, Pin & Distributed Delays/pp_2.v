module pp_2(output out, input a,b);
specify
 (a=>out)=(1:2:3,3:2:1);
 (b=>out)=(1:2:3,3:2:1);
 endspecify
 nand n1(out, a,b);

endmodule

module pp2_tb();

wire out;
reg a,b;

pp_2 tb(out,a,b);
initial begin
$monitor("time=0%0d, out=%0b,a=%0b,b=%0b",$time,out,a,b);
a=1'b1; b = 1'b0; #5
a=1'b0; b = 1'b1; #5
a=1'b1; b = 1'b1; #5
$finish;
end
initial begin
$dumpfile("pp_2.vcd");
$dumpvars();
end
endmodule