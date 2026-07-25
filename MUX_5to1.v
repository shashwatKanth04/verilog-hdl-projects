`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 12:40:45
// Design Name: 
// Module Name: MUX_5to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_5to1(output Y, input h,i,j,k,l,s0,s1,s2);
wire m,n,o;

MUX_2to1 m0(.a(h),.b(i),.s(s0),.y(m));
MUX_2to1 m1(.a(j),.b(k),.s(s0),.y(n));
MUX_2to1 m2(.a(m),.b(n),.s(s1),.y(o));
MUX_2to1 m3(.a(o),.b(l),.s(s2),.y(Y));

endmodule
