module compound(output z, input a,b,c,d,e);
supply0 gnd;
supply1 vdd;
wire w1,w2,w3,w4;
pmos p1(w1,vdd,d);
pmos p2(w2,w1,e);
pmos p3(z,w2,a);
pmos p4(w3,vdd,c);
pmos p5(z,w3,b);
nmos n1(z,w4,b);
nmos n2(z,w4,c);
nmos n3(w4,gnd,e);
nmos n4(w4,gnd,d);
nmos n5(w4,gnd,a);
endmodule

module tb_compound;
wire z;
reg a,b,c,d,e;
compound m1(z,a,b,c,d,e);

initial begin
$monitor("a=%0b | b=%0b | c=%0b | d=%0b | e=%0b |z=%0b",a,b,c,d,e,z);
a=0;b=0;c=0;d=1;e=0; #5
a=0;b=0;c=0;d=1;e=1; #5
a=0;b=0;c=0;d=1;e=0; #5
a=1;b=0;c=1;d=1;e=1; #5
#100 
$finish;
end
endmodule

