//a positive-edge-sensitive D flip-flop
primitive dff_edge(q, d, clk, rst_n);

input d, clk, rst_n;
output q;
reg q;      

//initialize q to 0
initial
    q = 0;              
//define state table
table
//inputs are in the same order as the input list
// d    clk   rst_n : q  : q+;    
   0    r  1     : ?  : 0;    
   1    r  1     : ?  : 1;     
   1    p  1     : 1  : 1;     
   0    p  1     : 0  : 0;
   ?    n  1     : ?  : -;     
   ?    (??)  0     : ?  : 0;     
   ?    ?     0     : ?  : 0;
   ?    ?     (01)  : ?  : -;
   (??) ?     1     : ?  : -;     
endtable
endprimitive

module johnson_counter(output [4:1]y, input clk,rst_n);
dff_edge d1(y[1],~y[4],clk,rst_n);
dff_edge d2(y[2],y[1],clk,rst_n);
dff_edge d3(y[3],y[2],clk,rst_n);
dff_edge d4(y[4],y[3],clk,rst_n);
endmodule

//test bench for the 4-bit johnson counter
module johnson_counter_tb;
reg clk, rst_n;            //inputs are reg for tb
wire [4:1]y;       //outputs are wire for tb
johnson_counter inst1(y,clk,rst_n);     //instantiate the module
initial
$monitor ("count = %b", y[4:1]);

initial                    //define clk
begin
    clk = 1'b0;
end
initial                    //define reset
begin
    #0 rst_n = 1'b0;
    #5 rst_n = 1'b1;
    #200 $finish;
end
always #5 clk=~clk;

endmodule
