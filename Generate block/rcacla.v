

module full_adder (output sum,cout, input a,b,cin);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule


module rca #(parameter N=4)(output [N-1:0]sum, output cout, input [N-1:0]a,input [N-1:0]b, input cin);
wire [N:0]carry;
assign carry[0]=cin;

genvar i;
generate
for(i=0;i<N;i=i+1)begin:rca8
full_adder fa(sum[i],carry[i+1],a[i],b[i],carry[i]);
end
endgenerate
assign cout=carry[N];
endmodule


module cla_4bit (input  [3:0] A, B,input Cin, output [3:0] Sum,output cout);

wire [3:0] G, P;
wire [4:0] C;


assign G = A & B;
assign P = A ^ B;
assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);


assign Sum  = P ^ C[3:0];
assign cout = C[4];

endmodule

module rcacla #(parameter ARCH=1)(output [3:0]sum,output cout, input [3:0]a,b, input cin);
generate
case(ARCH)
0: begin:rca1
rca r1(sum,cout,a,b,cin);
end
1: begin:cla1
cla_4bit c1(a,b,cin,sum,cout);
end
endcase
endgenerate
endmodule

module tb_arch;
wire [3:0]sum;
wire cout;
reg [3:0]a,b;
reg cin;
rcacla dut(sum,cout,a,b,cin);
initial begin
$monitor("sum=%0b | cout=%0b | a=%0b | b=%0b | cin=%0b",sum,cout,a,b,cin);
a=4'b0001;b=4'b0101;cin=1'b0; #5
a=4'b1001;b=4'b1111;cin=1'b1; #5
$finish;
end
endmodule
