`timescale 1ns / 1ps


module rca(
    output [3:0]s,
    output cout,
    input [3:0]a,
    input [3:0]b,
    input cin
    );
    wire c0,c1,c2;
   
    wire t1,t2,t3;
    
    xor x1(t1,a[0],b[0]);
    xor x2(s[0],t1,cin);
    and a1(t2,a[0],b[0]);
    and a2(t3,t1,cin);
    or o1(c0,t2,t3);
    
    wire t4,t5,t6;
    
    xor x3(t4,s[1],b[1]);
    xor x4(s[1],t4,c0);
    and a3(t5,a[1],b[1]);
    and a4(t6,t4,c0);
    or o2(c1,t5,t6);
    
    wire t7,t8,t9;
    
    xor x5(t7,a,b);
    xor x6(s[2],t7,c1);
    and a5(t8,a[2],b[2]);
    and a6(t9,t7,c1);
    or o3(c2,t8,t9);
    
    wire t10,t11,t12;
    
    xor x7(t10,a[3],b[3]);
    xor x8(s[3],t10,c2);
    and a7(t11,a[3],b[3]);
    and a8(t12,t10,c2);
    or o4(cout,t12,t11);
    
endmodule
