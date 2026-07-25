`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 12:56:00
// Design Name: 
// Module Name: AddSub_4bit
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


module AddSub_4bit(output [3:0]S, output cout, input [3:0]a,[3:0]b, input ctrl);
wire t0,t1,t2,t3, c0,c1,c2;

xor x1(t0, b[0], ctrl),
x2(t1, b[1], ctrl),
x3(t2, b[2], ctrl),
x4(t3, b[3], ctrl);


FA f0(.a(a[0]),.b(t0),.cin(ctrl),.s(S[0]),.cout(c0)),
f1(.a(a[1]),.b(t1),.cin(c0),.s(S[1]),.cout(c1)),
f2(.a(a[2]),.b(t2),.cin(c1),.s(S[2]),.cout(c2)),
f3(.a(a[3]),.b(t3),.cin(c2),.s(S[3]),.cout(cout));

endmodule
