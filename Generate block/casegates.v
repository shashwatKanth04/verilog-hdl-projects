module caseG #(parameter MODE=0)(output y, input a,b);
generate
case(MODE)
0: begin:andg
assign y=a&b;
end
1: begin:org
assign y=a|b;
end
2: begin:xorg
assign y=a^b;
end
default:begin:out
assign y=1'b0;
end
endcase
endgenerate
endmodule

module case_tb;
wire y;
reg a,b;
caseG dut(y,a,b);
initial begin
$monitor("y=%0b | a=%0b | b=%0b",y,a,b);
a=1'b0;b=1'b1;
#5 a=1'b1;b=1'b0;
#5 a=1'b0;b=1'b1;
$finish;
end
endmodule
