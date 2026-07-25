module BitwiseOP(
    input  [7:0]A,B,
    output reg [7:0]O,
    input  [1:0]sel
);

task AND;
    input [7:0]a,b;
    output [7:0]o;
    begin
     o = a&b;
    end
endtask

task NOR;
    input [7:0]a,b;
    output [7:0]o;
    begin
     o = ~(a|b);
    end
endtask

task XOR;
    input [7:0]a,b;
    output [7:0]o;
    begin
    o = a^b;
    end
endtask

task NOT;
    input [7:0]a;
    output [7:0]o;
    begin
     o = ~a;
    end
endtask

always@(*) begin
    case(sel)
    2'b00 : AND(A,B,O);
    2'b01 : NOR(A,B,O);
    2'b10 : XOR(A,B,O);
    2'b11 : NOT(A,O);
    default: O = 8'b0;
    endcase
end

endmodule

module tb_bitwise();
reg [7:0]X,Y;
reg[1:0]s;
wire [7:0]Z;

BitwiseOP uut(X,Y,Z,s);

initial begin
    $display("Time\t sel\t A\t B\t Output");
    $monitor("%0t\t %b\t %b\t %b\t %b", $time, s, X, Y, Z);    
    s = 2'b00;
    X = 8'd23; Y = 8'd222; #15;
    X = 8'd35; Y = 8'd12; #15;
    
    s = 2'b01;
    X = 8'd2; Y = 8'd10; #15;
    X = 8'd55; Y = 8'd143; #15;
    
    s = 2'b10;
    X = 8'd223; Y = 8'd87; #15;
    X = 8'd23; Y = 8'd1; #15;
    
    s = 2'b11;
    X = 8'd211; #15;
    X = 8'd103; #15;

    $finish;
end

endmodule