`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 16:56:22
// Design Name: 
// Module Name: Comp_4bit
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


module Comp_4bit(input [3:0]x,k, input c0, output V,N,Z);
wire c1,c2,c3,c4, s0,s1,s2,s3;
wire [3:0]y;
not n1(y[0], k[0]),
n2(y[1], k[1]),
n3(y[2], k[2]),
n4(y[3], k[3]);


FA f1(s0, c1, x[0],y[0],c0),
f2(s1, c2, x[1],y[1],c1),
f3(s2, c3, x[2],y[2],c2),
f4(s3, c4, x[3],y[3],c3);

xor xo1(V, c4,3);
nor no1(Z, s3,s2,s1,s0);
assign N = s3;

endmodule
