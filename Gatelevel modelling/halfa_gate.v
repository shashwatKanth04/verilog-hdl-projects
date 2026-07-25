`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 09:48:59
// Design Name: 
// Module Name: halfa_gate
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


module halfa_gate(
    output s,
    output c,
    input a,
    input b
    );
   
    xor x1(s,a,b);
    and a1(c,a,b);
    
endmodule
