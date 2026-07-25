`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 11:51:38
// Design Name: 
// Module Name: demux1_4
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


module demux1_4(
    input a,
    input [1:0] s,
    output [3:0] y
    );
    assign y[0]=a&~s[0]&~s[1];
    assign y[1]=a&s[0]&~s[1];
    assign y[2]=a&~s[0]&s[1];
    assign y[3]=a&s[0]&s[1];
endmodule
