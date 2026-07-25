`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 12:06:50
// Design Name: 
// Module Name: decoder38
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


module decoder38(
    input a,
    input b,
    input c,
    output [7:0] y
    );
    
    assign y[0]=~a&~b&~c;
    assign y[1]=~a&~b&c;
    assign y[2]=~a&b&~c;
    assign y[3]=~a&b&c;
    assign y[4]=a&~b&~c;
    assign y[5]=a&~b&c;
    assign y[6]=a&b&~c;
    assign y[7]=a&b&c;
endmodule
