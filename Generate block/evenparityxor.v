module evenparity #(parameter N=4)(output y, input [N-1:0]a);
wire[N-1:0]xorg;
assign xorg[0]=a[0];
genvar i;
generate
for(i=1;i<N;i=i+1)begin:xorgt
 assign xorg[i]=xorg[i-1]^a[i];
 end
 endgenerate
 assign y=xorg[N-1];

 endmodule

module tb_evenparity #(parameter N=4);
wire y;
reg [N-1:0]a;
evenparity dut(y,a);
initial begin
$monitor("y=%0b | a=%0b", y,a);
a=4'b0001; #5
a=4'b1010; #5
a=4'b0010; #5
$finish;
end
endmodule
