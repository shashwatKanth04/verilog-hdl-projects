module demux14(output [3:0]y, input [1:0]s,input i);
wire t1,t2,t3,t4,t5,t6;

and a1(y[0],i,~s[0],~s[1]);
and a2(y[1],i,s[0],~s[1]);
and a3(y[2],i,~s[0],s[1]);
and a4(y[3],i,s[0],s[1]);

endmodule
