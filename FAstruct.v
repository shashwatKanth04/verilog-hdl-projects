`timescale 1ns / 1ps

module mynot(output t1, input s);
assign t1=~s;
endmodule

module myand(output t2, input );
wire
assign t1=a^b;
endmodule

module myand(output wire t2,input a,b);
assign t2=a&b;
endmodule

module myor(output wire y, input t3,t2);
assign y=t3|t2;
endmodule

module myha(output wire s,c, input a,b);
assign s=a^b;
assign c=a&b;
endmodule

module myfa(output wire sum,cout, input wire a,b,cin);
wire t1,t2,t3;
myha ha0(t1,t2,a,b);
myha ha1(t3,cout,t2,cin);
myor x1(sum,t1,t3);
endmodule








