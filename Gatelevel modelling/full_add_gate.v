`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2026 09:55:52
// Design Name: 
// Module Name: full_add_gate
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


module full_add_gate(
    output s,
    output cout,
    input a,
    input b,
    input cin
    );
    wire t1,t2,t3;
    
    
    xor x1(t1,a,b);
    xor x2(s,t1,cin);
    and a1(t2,t1,cin);
    and a2(t3,a,b);
    or o1(cout,t2,t3);
   
    
endmodule
