module buffif0_1(output y, input [1:0]i, input s);
bufif0 b0(y,i[0],s);
bufif1 b1(y,i[1],s);
endmodule
