odule johnson_counter(output reg [7:0]q, input clk,rst);
always @(posedge clk) begin
  if(rst)
    q<=8'b0;
  else
    q<={q[6:0],~q[7]};
end
endmodule

module tb_rc;
wire [7:0]q;
reg clk,rst;
johnson_counter r1(q,clk,rst);

initial clk=0;
initial begin
$monitor("q=%0b | rst=%0b",q,rst);
rst=1;
#10 rst=0;
#200 $finish;
end
always #5 clk=~clk;

endmodule