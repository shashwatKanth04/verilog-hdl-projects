`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 13:26:05
// Design Name: 
// Module Name: evenparity
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


module evenparity(
    input a,
    input b,
    input c,
    input d,
    output Pe
    );
    assign Pe= ~(a^b^c^d);
    
endmodule
