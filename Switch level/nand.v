module mynand(out,a,b);
output out;
input a,b;
supply1 vdd;
supply0 gnd;

wire w1;
pmos p1(out,vdd,a);
nmos n1(w1,gnd,b);
pmos p2(out,vdd,b);
nmos n2(out,w1,a);
endmodule

module tb_mynand;
wire out;
reg a,b;
mynand m1(out,a,b);

initial begin
$monitor("a=%0b | b=%0b | out=%0b",a,b,out);
a=0;b=0; #5
a=0;b=1; #5
a=1;b=0; #5
a=1;b=1; #5
$finish;
end
endmodule