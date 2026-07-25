module mux41(output y, input [3:0]i, input [1:0]s);
assign y = s[1] ? (s[0] ? i[3]:i[2]) : (s[0]?i[1]:i[0]);
endmodule

module tb_mux41;
wire y;
reg [3:0]i;
reg [1:0]s;

mux41 m1(y,i,s);
initial begin
    i = 4'b0000;
    s[0]=0;
    s[1]=0;  
    $monitor("time=%d | y=%0b |  i= %0b | sel=%0b", $time, y,i,s);
    #1000
    $finish;
end

always #15 s[0] = ~s[0];
always #20 s[1] = ~s[1];
always #5 i[0] = ~i[0];
always #10 i[1] = ~i[1];
always #25 i[2] = ~i[2];
always #30 i[3] = ~i[3];

initial begin
    $dumpfile("mux41.vcd");
    $dumpvars();
end
endmodule