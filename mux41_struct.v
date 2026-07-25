`timescale 1ns / 1ps

module mux21(output a,b,sel, output y);
assign out= sel?b:a;
endmodule

module mux4(output y, input[3:0]i, input[1:0]s);
wire w1,w2;

mux21 m1(.a(i[0]),.b(i[1]),.sel(s[0]),.out(w1));
mux21 m2(.a(i[2]),.b(i[3]),.sel(s[0]),.out(w2));
mux21 m3(.a(w1),.b(w2),.sel(s[1]),.out(out));
endmodule





































