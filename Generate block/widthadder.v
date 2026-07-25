module fulladder(output sum,carry, input a,b,cin);
assign sum=a^b^cin;
assign carry=((a^b)&cin)|(a&b);
endmodule
module rca #(parameter WIDTH=16)(output [WIDTH-1:0]sum, output cout, input [WIDTH-1:0]a,input [WIDTH-1:0]b, input cin);
wire [WIDTH:0]carry;
assign carry[0]=cin;

genvar i;
generate
for(i=0;i<WIDTH;i=i+1)begin:rca8
fulladder fa(sum[i],carry[i+1],a[i],b[i],carry[i]);
end
endgenerate
assign cout=carry[WIDTH];
endmodule

module tb_rca;
wire cout;
wire [15:0]sum;
reg [15:0]a,b;
reg cin;
rca r(sum,cout,a,b,cin);
initial begin
$monitor("sum=%0d | carry=%0b | a=%0d | b=%0d | cin=%0b", sum,cout,a,b,cin);
a=16'b0110000;b=16'b1011011;cin=0;
#5 a=16'b0110010;b=16'b1111011;cin=1;
#5 a=16'hff;b=16'hff;cin=1;
#100 $finish;
end
endmodule