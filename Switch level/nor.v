module mynor(output out,input a,b);
supply0 gnd;
supply1 vdd;
wire w1;
pmos p1(w1,vdd,b);
pmos p2(out,w1,a);
nmos n1(out,gnd,a);
nmos n2(out,gnd,b);
endmodule


module tb_myor;
wire out;
reg a,b;
mynor m1(out,a,b);

initial begin
$monitor("a=%0b | b=%0b | out=%0b",a,b,out);
a=0;b=0; #5
a=0;b=1; #5
a=1;b=0; #5
a=1;b=1; #5
$finish;
end
endmodule