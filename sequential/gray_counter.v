module gray_counter(output reg [3:0]g,input clk,rst);
reg [3:0]b;

always @(posedge clk) begin
  if(rst) begin
  b<=4'b0;
  g<=4'b0;
  end
else begin
  b<=b+1;
  g<={b[3],b[3]^b[2],b[2]^b[1],b[1]^b[0]};
end
end
endmodule

module tb_gray;
wire [3:0]g;
reg clk,rst;

gray_counter g1(g,clk,rst);

initial begin
$monitor("g=%0b | rst=%0b",g,rst);
clk=0;
rst=1;
#10 rst=0;
#200 $finish;
end
always #5 clk=~clk;
endmodule