`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 13:00:23
// Design Name: 
// Module Name: priority4_2
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


module priority4_2(
    input a,
    input b,
    output [3:0] y
    );
    
    assign y[0]= ~a&~b;
    assign y[1]=~a&b;
    assign y[2]=a&~b;
    assign y[3]=a&b;
    
endmodule
