module xnor_g(input A,B, output OUTPUT);

supply1 Vdd;
supply0 Gnd;

wire ba,bb, t1,t2, b1,b2;

not n1(ba, A),
n2(bb,B);

pmos xn1(t1, Vdd, A);
pmos xn2(t2, Vdd, ba);
pmos xn3(OUTPUT, t1, B);
pmos xn4(OUTPUT, t2, bb);

nmos xn5(b1, OUTPUT, A);
nmos xn6(b2, OUTPUT, ba);
nmos xn7(Gnd, b2, b);
nmos xn8(Gnd, b1, bb);

endmodule

module tb_xor_g();
    reg A, B;
    wire OUT;

    xnor_g uut (.A(A), .B(B), .OUTPUT(OUT));

    initial begin
        $display("Time\t A B | Output");
        $display("--------------------");
        $monitor("%0t\t %b %b | %b", $time, A, B, OUT);

        A = 0; B = 0; #10; // Case 00 -> 0
        A = 0; B = 1; #10; // Case 01 -> 1
        A = 1; B = 0; #10; // Case 10 -> 1
        A = 1; B = 1; #10; // Case 11 -> 0

        $finish;
    end
endmodule