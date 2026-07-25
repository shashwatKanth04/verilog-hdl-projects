 module bit_reverser(input [7:0]a, output [7:0]out);
    function [7:0]reverse;
        input [7:0]a;
        integer i;
        begin
            for (i=7; i>=0; i=i-1)
            begin
            reverse[i]=a[7-i];
        end
        end
    endfunction
    assign out=reverse(a);
endmodule
