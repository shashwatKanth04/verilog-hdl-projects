primitive parity_gen_even(gen,a,b,c,d);
output gen;
input a,b,c,d;
table
//a b c d : gen;
  0 0 0 0 : 0;  
  0 0 0 1 : 1;
  0 0 1 0 : 1;
  0 0 1 1 : 0;
  0 1 0 0 : 1;
  0 1 0 1 : 0;
  0 1 1 0 : 0;
  0 1 1 1 : 1;
  1 0 0 0 : 1;
  1 0 0 1 : 0;
  1 0 1 0 : 0;
  1 0 1 1 : 1;
  1 1 0 0 : 0;
  1 1 0 1 : 1;
  1 1 1 0 : 1;
  1 1 1 1 : 0;
endtable
endprimitive

module tb_evn_parity_gen;
wire gen;
reg a,b,c,d;
parity_gen_even u1(gen,a,b,c,d);

initial begin
a=0;b=0;c=0;d=0;
$monitor("Time=%0d | a=%0b b=%0b c=%0b d=%0b | gen=%0b",$time,a,b,c,d,gen);
#100 $finish;
end

always #5 d=~d;
always #10 c=~c;
always #20 b=~b;
always #40 a=~a;

endmodule
  