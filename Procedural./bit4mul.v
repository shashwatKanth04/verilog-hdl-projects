module mul4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] r
);

    assign r = A * B;
endmodule

module mul4_tb;
reg [3:0] A, B;
wire [7:0] r;

mul4 uut(A, B, r);

initial begin
        $monitor("A=%d B=%d | Product=%d (%b)", A, B, r, r);
        A = 4'd5; B = 4'd3;  #10; // 15
        A = 4'd10; B = 4'd2; #10; // 20
        A = 4'd15; B = 4'd15; #10; // 225
        $finish;
    end
    initial begin
        $dumpfile("mul4.vcd");
        $dumpvars();
         $finish;
    end
    
    endmodule
