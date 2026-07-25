module fulladder(output sum, carry_out, input a,b,c);
supply0 gnd;
supply1 vdd;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;

pmos p1(w1,vdd,a);
pmos p2(w2,w1,a);
pmos p3(w3,w2,b);
pmos p4(w1,vdd,b);
pmos p5(w3,w1,c);
pmos p6(carry_out,vdd,w3);
pmos p7(w7,vdd,a);
pmos p8(w7,vdd,b);
pmos p9(w7,vdd,c);
pmos p10(w8,w7,w3);
pmos p11(w9,w7,a);
pmos p12(w10,w9,b);
pmos p13(w8,w10,c);
pmos p14(sum,vdd,w8);
nmos n1(w3,w5,c);
nmos n2(w3,w6,a);
nmos n3(w5,gnd,a);
nmos n4(w5,gnd,b);
nmos n5(w6,gnd,b);
nmos n6(carry_out,gnd,w3);
nmos n7(w8,w11,w3);
nmos n8(w11,gnd,a);
nmos n9(w11,gnd,b);
nmos n10(w11,gnd,c);
nmos n11(w8,w12,a);
nmos n12(w12,w13,b);
nmos n13(w13,gnd,c);
nmos n14(sum,gnd,w8);
endmodule

module tb_fulladd;
wire sum, carry_out;
reg a,b,c;
fulladder a1(sum,carry_out,a,b,c);
initial begin
$monitor("sum=%0b | carry_out=%0b | a=%0b | b=%0b | c=%0b",sum,carry_out,a,b,c);
a=0;b=0;c=1; #5
a=0;b=1;c=1; #5
a=1;b=0;c=0; #5
a=1;b=1;c=1; #5
#100
$finish;
end
endmodule

