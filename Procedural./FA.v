`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 12:10:38
// Design Name: 
// Module Name: FA
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


module FA(output s, cout, input a,b,cin);

wire t1, t2, t3;
HA h1(.a(a), .b(b), .s(t1), .c(t2));
HA h2(.a(t1), .b(cin), .c(t3), .s(s));
or o1(cout,t2,t3);
endmodule
