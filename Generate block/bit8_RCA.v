module fulladder(output sum,carry, input a,b,cin);
assign sum=a^b^cin;
assign carry=((a^b)&cin)|(a&b);
endmodule

module rca #(parameter N=8)(output [N-1:0]sum, output cout, input [N-1:0]a,input [N-1:0]b, input cin);
wire [N:0]carry;
assign carry[0]=cin;

genvar i;
generate
for(i=0;i<N;i=i+1)begin:rca8
fulladder fa(sum[i],carry[i+1],a[i],b[i],carry[i]);
end
endgenerate
assign cout=carry[N];
endmodule

module tb_rca;
wire cout;
wire [7:0]sum;
reg [7:0]a,b;
reg cin;
rca r(sum,cout,a,b,cin);
initial begin
$monitor("sum=%0d | carry=%0b | a=%0d | b=%0d | cin=%0b", sum,cout,a,b,cin);
a=8'b0110000;b=8'b1011011;cin=0;
#5 a=8'b0110010;b=8'b1111011;cin=1;
#5 a=8'hff;b=8'hff;cin=1;
#100 $finish;
end
endmodule