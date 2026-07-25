primitive add_sub_out(out,a,b,c,ctrl);
output out;
input a,b,c,ctrl;
table
//a b c ctrl : out;
  0 0 0 0 : 0;  
  0 0 0 1 : 0;
  0 0 1 0 : 1;
  0 0 1 1 : 1;
  0 1 0 0 : 1;
  0 1 0 1 : 1;
  0 1 1 0 : 0;
  0 1 1 1 : 0;
  1 0 0 0 : 1;
  1 0 0 1 : 1;
  1 0 1 0 : 0;
  1 0 1 1 : 0;
  1 1 0 0 : 0;
  1 1 0 1 : 0;
  1 1 1 0 : 1;
  1 1 1 1 : 1;
endtable
endprimitive

primitive add_sub_cout(cout,a,b,c,ctrl);
output cout;
input a,b,c,ctrl;
table
//a b c ctrl : cout;
  0 0 0 0 : 0;  
  0 0 0 1 : 0;
  0 0 1 0 : 1;
  0 0 1 1 : 1;
  0 1 0 0 : 1;
  0 1 0 1 : 1;
  0 1 1 0 : 1;
  0 1 1 1 : 1;
  1 0 0 0 : 0;
  1 0 0 1 : 0;
  1 0 1 0 : 1;
  1 0 1 1 : 0;
  1 1 0 0 : 1;
  1 1 0 1 : 0;
  1 1 1 0 : 1;
  1 1 1 1 : 1;
endtable
endprimitive

module add_sub(output out,cout, input a,b,c,ctrl);
add_sub_out a1(out,a,b,c,ctrl);
add_sub_cout a2(cout,a,b,c,ctrl);
endmodule

module tb_add_sub;
wire out,cout;
reg a,b,c,ctrl;
add_sub a3(out,cout,a,b,c,ctrl);

initial begin
$monitor("Time=%0d | a=%0b b=%0b c=%0b | ctrl(0=add,1=sub)=%0b | cout=%0b out=%0b", $time, a,b,c,ctrl,cout,out);
a=0;b=0;c=0;ctrl=0;
#100 $finish;
end

always #5 ctrl=~ctrl;
always #10 c=~c;
always #20 b=~b;
always #40 a=~a;

endmodule