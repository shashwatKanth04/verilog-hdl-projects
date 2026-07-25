module mux41(output y, input [3:0]i,input [1:0]s);
wire t1,t2,t3,t4;

nand n1(t1,i[0],~s[0],~s[1]);
nand n2(t2,i[1],s[0],~s[1]);
nand n3(t3,i[2],s[0],~s[1]);
nand n4(t4,i[3],s[0],s[1]);

nand n5(y,t1,t2,t3,t4);
endmodule
