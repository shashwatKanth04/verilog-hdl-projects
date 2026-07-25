module inverter #(parameter INV_ENABLE=1) (output y,input a);

generate
if(INV_ENABLE)begin:inverterg
assign y=~a;
end else
begin assign y=a;
end
endgenerate
endmodule

module tb_invertert;
wire y;
reg a;
inverter dut(y,a);
initial begin
$monitor("y=%0b | a=%0b",y,a);
a=1'b0; #5
a=1'b1; #5;
end
endmodule