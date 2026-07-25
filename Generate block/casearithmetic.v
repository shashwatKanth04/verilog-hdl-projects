module arithmetic #(parameter OP=2)(output y, input a,b);
generate
case(OP)
0: begin:add
assign y=a+b;
end
1: begin:sub
assign y=a-b;
end
2:begin:mul
assign y=a*b;
end
endcase
endgenerate
endmodule

module tb_arth;
wire y;
reg a,b;
arithmetic dut(y,a,b);
initial begin
$monitor("y=%0b | a=%0b | b=%0b",y,a,b);
a=1'b0;b=1'b1; #5
a=1'b1;b=1'b1; #5
$finish;
end
endmodule

