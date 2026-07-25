module mux4_1(                                                                                                                                                                 
    input a, b, c, d,
    input s0, s1,
    output y
);

    assign y = s1 ? (s0 ? d : c) : (s0 ? b : a);
endmodule

module mux16_1(
    output y,
    input [15:0]a,
    input [3:0]s
);

    wire t1, t2, t3, t4;

    mux4_1 m1(a[0], a[1], a[2], a[3], s[3], s[2], t1); 
    mux4_1 m2(a[4], a[5], a[6], a[7], s[3], s[2], t2);
    mux4_1 m3(a[8], a[9], a[10], a[11], s[3], s[2], t3);
    mux4_1 m4(a[12], a[13], a[14], a[15], s[3], s[2], t4);

    mux4_1 m5(t1, t2, t3, t4, s[1], s[0], y);

endmodule