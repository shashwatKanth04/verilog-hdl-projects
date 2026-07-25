module Nbit_xor #(parameter N=8)(output [N-1:0]y, input [N-1:0]a,b);

genvar i;
generate
  for(i=0;i<N;i=i+1)
    xor (y[i],a[i],b[i]);
endgenerate
endmodule

module tb_Nbit_xor #(parameter N=8);
wire [N-1:0]y;
reg [N-1:0]a;
reg [N-1:0]b;

Nbit_xor x1(y,a,b);

initial begin
$monitor("a=%0b b=%0b |y=%0b",a,b,y);
  a=8'b1011111;b=8'b1110000;
  #5 a=8'b0110000;b=8'b1111111;
end
endmodule
