module myxor(output out, input a,b);
supply0 gnd;
supply1 vdd;
wire w1,w2,w3,w4;
pmos p1(w1,vdd,a);
pmos p2(out,w1,~b);
pmos p3(w2,vdd,~a);
pmos p4(out,w2,b);
nmos n1(out,w3,a);
nmos n2(w3,gnd,b);
nmos n3(out,w4,~a);
nmos n4(w4,gnd,~b);
endmodule


module tb_myor;
wire out;
reg a,b;
myxor m1(out,a,b);

initial begin
$monitor("a=%0b | b=%0b | out=%0b",a,b,out);
a=0;b=0; #5
a=0;b=1; #5
a=1;b=0; #5
a=1;b=1; #5
$finish;
end
endmodule
