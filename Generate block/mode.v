module andor #(parameter MODE=1) (output y, input a,b);
generate
if(!MODE)begin
assign y=a&b;
end else begin
assign y=a|b;
end
endgenerate
endmodule

module tb_dut;
wire y;
reg a,b;
andor dut(y,a,b);
initial begin 
$monitor("y=%0b | a=%0b | b=%0b",y,a,b);
a=1'b0;b=1'b1;
#5 a=1'b1;b=1'b1;
#5 a=1'b0;b=1'b0;
$finish;
end
endmodule
