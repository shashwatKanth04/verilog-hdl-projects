module gray_code_fsm(input clk,rst,output reg [2:0]gray);
reg[2:0] current, next;
parameter [2:0] S0=0,S1=1,S2=3,S3=2,S4=6,S5=7,S6=5,S7=4;
always @(posedge clk) begin
    if(rst)
    current<=S0;
    else 
    current<=next;
end
    always @(*) begin
        case(current)
        S0: next<=S1;
        S1: next<=S2;
        S2: next<=S3;
        S3: next<=S4;
        S4: next<=S5;
        S5: next<=S6;
        S6: next<=S7;
        S7: next<=S0;
        default: next<=S0;
        endcase
    end

    always @(*)
    gray<=current;
endmodule

module tb_gray;
wire [2:0]gray;
reg clk,rst;
gray_code_fsm f1(clk,rst,gray);

initial begin
    $monitor("Time=%0d | gray=%0b | rst=%0b | current=%0b",$time,gray,rst,f1.current);
    clk=0;rst=1;
    #10 rst=0;
    #100 $finish;
end

always #5 clk=~clk;
endmodule

