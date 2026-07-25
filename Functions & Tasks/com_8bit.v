module comp_8bit  (
    input [7:0]A,B,
    output   c
);

function comp;
input [7:0] a,b;
begin
  if(a==b)
        comp = 1'b1;
  else
        comp = 1'b0;
end  
endfunction
assign c = comp(A,B);
endmodule

module tb_comp_8bit();
    reg [7:0] A,B;
    wire t;

    comp_8bit uut(
        .A(A),
        .B(B),
        .c(t)
    );

    initial begin
        $display("Time\t A\t B\t Match");

        $monitor("%0t\t %b\t %b\t %b", $time, A, B, t);

        A = 8'd10; B = 8'd20;    #10;

        A = 8'd55; B = 8'd55;    #10;

        A = 8'd0;  B = 8'd0;     #10;

        A = 8'd128; B = 8'd129;  #10;

        $finish;
    end
endmodule