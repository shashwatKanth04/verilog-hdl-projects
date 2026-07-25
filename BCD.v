`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 15:32:14
// Design Name: 
// Module Name: BCD
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


module BCD(output [3:0]S, output cout, input cin, input [3:0]x,y);

wire [3:0]z;
wire co,t1,t2;

AddSub_4bit add1 (.S(z),.cout(co), .a(y),.b(x),.ctrl(cin));
assign S[0] = z[0];

and a1(t1,z[3],z[2]),
a2(t2,z[3],z[1]);
or o1(cout,t1,t2,co);


wire c1,c2,c3;
HA ha1(.a(z[1]),.b(cout),.s(S[1]),.c(c1));
FA fa1(.a(z[2]),.b(cout),.cin(c1),.s(S[2]),.cout(c2));
HA ha2(.a(z[3]),.b(c2),.s(S[3]),.c(c3));


endmodule
