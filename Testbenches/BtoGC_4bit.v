module BtoGC_4bit (output w,x,y,z,
input a,b,c,d);

assign w = a;
assign x = a^b;
assign y = b^c;
assign z = c^d;

endmodule

module tb_btogc();
reg a,b,c,d;
wire w,x,y,z;
BtoGC_4bit b1(w,x,y,z,a,b,c,d);

initial begin
$monitor("Time = %0d, w = %0b, x = %0b, y = %0b, z = %0b, a = %0b, b = %0b, c = %0b, d = %0b", $time, w,x,y,z,a,b,c,d);

a =1'b0; b=1'b0; c=1'b0; d=1'b0;
#100
$finish;
end
always #5 a = ~a;
always #10 b = ~b;
always #20 c = ~c;
always #40 d = ~d;

initial begin
$dumpfile("BtoGC.vcd");
$dumpvars();
end

endmodule