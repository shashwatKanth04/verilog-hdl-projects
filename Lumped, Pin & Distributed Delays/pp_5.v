module pp_5(output reg gr,le,eq, input a,b );
specify
(a*>gr)=2;
(b*>gr)=2;
endspecify
initial begin
gr=0;le=0;eq=0;
end
always @(*) begin
if(a>b)
gr=1;
else if(a<b)
le=1;
else 
eq=1;
end
endmodule

module tb_comp;
wire gr,le,eq;
reg a,b;
pp_5 t1(gr,le,eq,a,b);

initial begin
$monitor("Time=%0d | A = %0b | B = %0b | GR = %0b | LE = %0b | EQ = %0b",$time,a,b,gr,le,eq);
a=1'b0;b=1'b1; #5
a=1'b1;b=1'b1; #5
a=1'b1;b=1'b0; #5
#50 $finish;
end
initial begin
$dumpfile("pp_5.vcd");
$dumpvars();
end

endmodule