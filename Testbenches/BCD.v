module HA(output s, c, input a,b);

xor x1(s,a,b);
and a1(c,a,b);
endmodule

module FA(output s, cout, input a,b,cin);

wire t1, t2, t3;
HA h1(.a(a), .b(b), .s(t1), .c(t2));
HA h2(.a(t1), .b(cin), .c(t3), .s(s));
or o1(cout,t2,t3);
endmodule


module AddSub_4bit(output [3:0]S, output cout, input [3:0]a,b, input ctrl);
wire t0,t1,t2,t3, c0,c1,c2;

xor x1(t0, b[0], ctrl),
x2(t1, b[1], ctrl),
x3(t2, b[2], ctrl),
x4(t3, b[3], ctrl);


FA f0(.a(a[0]),.b(t0),.cin(ctrl),.s(S[0]),.cout(c0)),
f1(.a(a[1]),.b(t1),.cin(c0),.s(S[1]),.cout(c1)),
f2(.a(a[2]),.b(t2),.cin(c1),.s(S[2]),.cout(c2)),
f3(.a(a[3]),.b(t3),.cin(c2),.s(S[3]),.cout(cout));

endmodule

module BCD(output [3:0]S, output cout, input cin, input [3:0]x,y);

wire [3:0]z;
wire co,t1,t2;

AddSub_4bit add1 (.S(z),.cout(co), .a(y),.b(x),.ctrl(cin));
assign S[0] = z[0];

and a1(t1,z[3],z[2]);
and a2(t2,z[3],z[1]);
or o1(cout,t1,t2,co);


wire c1,c2,c3;
HA ha1(.a(z[1]),.b(cout),.s(S[1]),.c(c1));
FA fa1(.a(z[2]),.b(cout),.cin(c1),.s(S[2]),.cout(c2));
HA ha2(.a(z[3]),.b(c2),.s(S[3]),.c(c3));
endmodule

module tb_BCD();
reg [3:0] X,Y;
reg Cin;
wire [3:0]S;
wire Cout;

BCD uut(S,Cout,Cin,X,Y);

initial begin

    $monitor("X %0b, Y %0b, Cin %0b, S %0b, Cout %0b", X, Y, Cin, S, Cout);
     X = 0; Y = 0; Cin = 0;
     #500
     $finish;

end

always #2 X = X+1;
always #8 Y = Y+1;
always #32 Cin = ~Cin;


endmodule