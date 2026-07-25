module parity_calc(output reg par_even, par_odd,input [7:0]a);

task parity;
input [7:0]a1;
output pe,po;
begin
pe=^a1;
po=~(^a1);
end
endtask

always @(*)
parity(a,par_even,par_odd);
endmodule

module tb_parity;
wire pe,po;
reg [7:0]a;
parity_calc p1(pe,po,a);

initial begin
$monitor("a=%0b | pe=%0b | po=%0b",a,pe,po);
a=8'b0110010;
#5 a=8'b0110000;
#10 $finish;
end
endmodule