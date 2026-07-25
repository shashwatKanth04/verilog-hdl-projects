// 1.FULL ADDER 
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

//2.4x4 CSA Multiplier 
module multiplier_4x4_csa (
    input  [3:0] m, 
    input  [3:0] q,
    output [7:0] p  
);
    // Partial Product Generation: pp[row][bit]
    wire p00 = m[0]&q[0], p01 = m[1]&q[0], p02 = m[2]&q[0], p03 = m[3]&q[0];
    wire p10 = m[0]&q[1], p11 = m[1]&q[1], p12 = m[2]&q[1], p13 = m[3]&q[1];
    wire p20 = m[0]&q[2], p21 = m[1]&q[2], p22 = m[2]&q[2], p23 = m[3]&q[2];
    wire p30 = m[0]&q[3], p31 = m[1]&q[3], p32 = m[2]&q[3], p33 = m[3]&q[3];

    //  Row 1 Addition
    wire s10, s11, s12, s13, c10, c11, c12, c13;
    full_adder fa1_0(p01, p10, 1'b0, s10, c10);
    full_adder fa1_1(p02, p11, 1'b0, s11, c11);
    full_adder fa1_2(p03, p12, 1'b0, s12, c12);
    full_adder fa1_3(1'b0, p13, 1'b0, s13, c13);

    // Row 2 Addition 
    wire s20, s21, s22, s23, c20, c21, c22, c23;
    full_adder fa2_0(s11, p20, c10, s20, c20);
    full_adder fa2_1(s12, p21, c11, s21, c21);
    full_adder fa2_2(s13, p22, c12, s22, c22);
    full_adder fa2_3(1'b0, p23, c13, s23, c23);

    // Row 3 
    wire s30, s31, s32, s33, c30, c31, c32, c33;
    full_adder fa3_0(s21, p30, c20, s30, c30);
    full_adder fa3_1(s22, p31, c21, s31, c31);
    full_adder fa3_2(s23, p32, c22, s32, c32);
    full_adder fa3_3(1'b0, p33, c23, s33, c33);

    // --- (Ripple Stage) ---
    wire rc1, rc2, rc3;
    assign p[0] = p00;
    assign p[1] = s10;
    assign p[2] = s20;
    assign p[3] = s30;
    full_adder fa_f0(s31, c30, 1'b0, p[4], rc1);
    full_adder fa_f1(s32, c31, rc1,  p[5], rc2);
    full_adder fa_f2(s33, c32, rc2,  p[6], rc3);
    full_adder fa_f3(1'b0, c33, rc3,  p[7],    );

endmodule

// --- Testbench ---
module tb_csa;
    reg [3:0] m, q;
    wire [7:0] p;

    multiplier_4x4_csa uut(m, q, p);

    initial begin
        m = 15; q = 15; #10;
        $display("Result: %d * %d = %d", m, q, p);
        m = 14; q = 2; #10;
        $display("Result: %d * %d = %d", m, q, p);
        m = 11; q = 11; #10;
        $display("Result: %d * %d = %d", m, q, p);
        m = 6; q = 0; #10;
        $display("Result: %d * %d = %d", m, q, p);
        $finish;
    end
endmodule
