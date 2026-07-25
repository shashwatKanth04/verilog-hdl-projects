`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 11:48:42
// Design Name: 
// Module Name: demux21
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


module demux21(
    input a,
    input s,
    output y0,
    output y1
    );
    assign y1=s&a;
    assign y0=~s&a;
endmodule
