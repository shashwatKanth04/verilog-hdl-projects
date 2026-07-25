primitive dff_edge(q, d, clk, rst_n);
    input d, clk, rst_n;
    output q; reg q;
    initial q = 0;
    table
    // d    clk     rst_n : q : q+
       0    (01)    1     : ? : 0;   
       1    (01)    1     : ? : 1;   
       ?    (10)    1     : ? : -;  
       ?    ?       0     : ? : 0;   
       ?    ?      (01)   : ? : -;   
       (??) ?       1     : ? : -;  
    endtable
endprimitive


primitive dff_preset(q, d, clk, rst_n);
    input d, clk, rst_n;
    output q; reg q;
    initial q = 1;
    table
    // d    clk     rst_n : q : q+
       0    (01)    1     : ? : 0;
       1    (01)    1     : ? : 1;
       ?    (10)    1     : ? : -;
       ?    ?       0     : ? : 1;  
       ?    ?      (01)   : ? : -;
       (??) ?       1     : ? : -;
    endtable
endprimitive

module ring_counter(output [4:1]y, input clk, rst_n);
    dff_preset d1(y[1], y[4], clk, rst_n); 
    dff_edge   d2(y[2], y[1], clk, rst_n);
    dff_edge   d3(y[3], y[2], clk, rst_n);
    dff_edge   d4(y[4], y[3], clk, rst_n);
endmodule

module ring_counter_tb;
    reg clk, rst_n;
    wire [4:1] y;

    ring_counter inst1(y, clk, rst_n);

    initial begin
        $monitor("Time: %4t | rst_n: %b | count: %b", $time, rst_n, y);
        clk = 0;
        rst_n = 0;
        #7 rst_n = 1;  
        #100 $finish;
    end

    always #5 clk = ~clk;
endmodule
