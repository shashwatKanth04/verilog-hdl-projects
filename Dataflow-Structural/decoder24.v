`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 11:58:23
// Design Name: 
// Module Name: decoder24
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


module decoder24(
    input a,
    input b,
    output [3:0] y
    );
    assign y[0]=~a&~b;
    assign y[1]=~a&b;
    assign y[2]=a&~b;
    assign y[3]=a&b;
    
endmodule
