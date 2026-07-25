primitive dff_edge(q, d, clk, rst);
    input d, clk, rst;
    output q; reg q;
    initial q = 0;
    table
    // d    clk     rst : q : q+
       0    (01)    0     : ? : 0;   
       1    (01)    0     : ? : 1;   
       ?    (10)    0     : ? : -;  
       ?    ?       1     : ? : 0;   
       ?    ?      (10)   : ? : -;   
       (??) ?       0     : ? : -;  
    endtable
endprimitive

module down_counter_3b(output [2:0]q, input clk,rst);
dff_edge d1(q[0],~q[0],clk,rst);
dff_edge d2(q[1],~q[1],q[0],rst);
dff_edge d3(q[2],~q[2],q[1],rst);
endmodule

module tb_down_counter;
wire [2:0]q;
reg clk, rst;

down_counter_3b d4(q,clk,rst);

initial begin
clk=0;
$monitor("Time=%0d | q=%0d | rst=%0b",$time,q,rst);
#100 $finish;
end

initial begin
rst=1'b1;
#10 rst=1'b0;
end

always #5 clk=~clk;
endmodule