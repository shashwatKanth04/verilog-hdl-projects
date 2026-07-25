`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 12:42:23
// Design Name: 
// Module Name: encoder42
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


module encoder42(
    input a,
    input b,
    input c,
    input d,
    output [1:0] y
    );
    assign y[0]=a|b;
    assign y[1]=c|d;
endmodule
