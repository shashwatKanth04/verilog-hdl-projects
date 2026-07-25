module ring_counter(output reg [3:0]q, input clk,rst);
always @(posedge clk) begin
  if(rst)
    q<=4'b0001;
  else
    q<={q[2:0],q[3]};
end
endmodule

module tb_rc;
wire [3:0]q;
reg clk,rst;
ring_counter r1(q,clk,rst);

initial clk=0;
initial begin
$monitor("q=%0b | rst=%0b clk=%0b",q,rst,clk);
rst=1;
#10 rst=0;
#100 $finish;
end
always #5 clk=~clk;

endmodule