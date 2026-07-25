`timescale 1ns / 1ns

module h_add_sub(
    input a,
    input b,
    output sum,
    output carry,
    output diff,
    output borrow
    );
    assign sum= a^b;
    assign carry=a&b;
    assign diff=a^b;
    assign borrow=~a&b;
    
endmodule
