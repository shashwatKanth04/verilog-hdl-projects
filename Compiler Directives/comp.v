`define BIT_WIDTH 8   
`define ENABLE_EQ      
`define ENABLE_GT       
`define ENABLE_LT     

module configurable_comparator (
    input  [`BIT_WIDTH-1:0] A,
    input  [`BIT_WIDTH-1:0] B
    `ifdef ENABLE_EQ , output a_eq_b `endif
    `ifdef ENABLE_GT , output a_gt_b `endif
    `ifdef ENABLE_LT , output a_lt_b `endif
);
    `ifdef ENABLE_EQ
        assign a_eq_b = (A == B);
    `endif

    `ifdef ENABLE_GT
        assign a_gt_b = (A > B);
    `endif

    `ifdef ENABLE_LT
        assign a_lt_b = (A < B);
    `endif
endmodule

module tb_comparator; 
    reg [`BIT_WIDTH-1:0] A;
    reg [`BIT_WIDTH-1:0] B;
    `ifdef ENABLE_EQ wire eq; `endif
    `ifdef ENABLE_GT wire gt; `endif
    `ifdef ENABLE_LT wire lt; `endif
    configurable_comparator uut (
        .A(A),
        .B(B)
        `ifdef ENABLE_EQ , .a_eq_b(eq) `endif
        `ifdef ENABLE_GT , .a_gt_b(gt) `endif
        `ifdef ENABLE_LT , .a_lt_b(lt) `endif
    );

    initial begin
        $display("--- Starting %0d-bit Comparator Test ---", `BIT_WIDTH);
        $display("Enabled Logic: %s %s %s", 
            `ifdef ENABLE_EQ "EQ" `else "" `endif,
            `ifdef ENABLE_GT "GT" `else "" `endif,
            `ifdef ENABLE_LT "LT" `else "" `endif);
        $display("---------------------------------------");

        A = 10; B = 10;
        #10;
        $display("A:%d B:%d | Result -> %s%s%s", A, B,
            `ifdef ENABLE_EQ $sformatf("EQ:%b ", eq) `else "" `endif,
            `ifdef ENABLE_GT $sformatf("GT:%b ", gt) `else "" `endif,
            `ifdef ENABLE_LT $sformatf("LT:%b ", lt) `else "" `endif);
        A = 25; B = 5;
        #10;
        $display("A:%d B:%d | Result -> %s%s%s", A, B,
            `ifdef ENABLE_EQ $sformatf("EQ:%b ", eq) `else "" `endif,
            `ifdef ENABLE_GT $sformatf("GT:%b ", gt) `else "" `endif,
            `ifdef ENABLE_LT $sformatf("LT:%b ", lt) `else "" `endif);
        A = 3; B = 12;
        #10;
        $display("A:%d B:%d  | Result -> %s%s%s", A, B,
            `ifdef ENABLE_EQ $sformatf("EQ:%b ", eq) `else "" `endif,
            `ifdef ENABLE_GT $sformatf("GT:%b ", gt) `else "" `endif,
            `ifdef ENABLE_LT $sformatf("LT:%b ", lt) `else "" `endif);

        $finish;
    end
endmodule