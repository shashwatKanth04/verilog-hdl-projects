module fact(output reg [31:0]out, input [3:0]a);

function [31:0]factorial;
        input [3:0] x;
        integer i;
        integer temp; 
        begin
            temp = 1; 
            for (i = 1; i <= x; i = i + 1) begin
                temp = temp * i;
            end
            factorial = temp;
            end
            endfunction
             always @(*) out=factorial(a);
             endmodule
          
