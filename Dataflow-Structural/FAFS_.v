`timescale 1ns / 1ns

module FAFS_(
    input a,
    input b,
    input cin,
    input bin,
    output sum,
    output carry,
    output diff,
    output borrow
   
    );
    assign sum= a^b^cin;
    assign carry=(a&b)|(b&cin)|(a&cin);
    assign diff=a^b^bin;
    assign borrow=(~a&b)|(~a|bin)|(b&bin);
endmodule
