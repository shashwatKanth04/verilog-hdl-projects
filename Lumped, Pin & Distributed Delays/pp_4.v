module d_ff_neg(output reg q,qbar, input d,clk,rst);
specify
(d=>q)=5;
(d=>qbar)=5;
(clk=>q)=6;
(clk=>qbar)=7;
(rst=>q)=2;
(rst=>qbar)=3;
endspecify
always @(negedge clk) begin
if(rst)
begin
 q<=0;
 qbar<=~q;
 end
else
begin
 q<=d;
 qbar<=~q;
 end
end
endmodule

module tb_dff;
wire q,qbar;
reg d,clk,rst;

d_ff_neg d1(q,qbar,d,clk,rst);

initial begin
$monitor("Time=%0d | d=%0b rst=%0b | q=%0b qbar=%0b", $time,d,rst,q,qbar);
rst=1;d=1; clk=0;
#5 rst=0;
#10 d=0;
#50 $finish;
end
always #5 clk=~clk;

endmodule
