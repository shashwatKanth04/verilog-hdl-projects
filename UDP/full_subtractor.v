primitive full_sub_diff(diff,a,b,bin);
output diff;
input a,b,bin;
table
//a b bin : diff;
  0 0 0 : 0;
  0 0 1 : 1;
  0 1 0 : 1;
  0 1 1 : 0;
  1 0 0 : 1;
  1 0 1 : 0;
  1 1 0 : 0;
  1 1 1 : 1;
endtable
endprimitive

primitive full_sub_borrow(borrow,a,b,bin);
output borrow; input a,b,bin;
table
//a b bin : borrow;
  0 0 0 : 0;
  0 0 1 : 1;
  0 1 0 : 1;
  0 1 1 : 1;
  1 0 0 : 0;
  1 0 1 : 0;
  1 1 0 : 0;
  1 1 1 : 1;
endtable
endprimitive

module full_sub(output diff, borrow, input a,b,bin);
full_sub_diff d1(diff,a,b,bin);
full_sub_borrow d2(borrow,a,b,bin);
endmodule

module tb_full_sub;
reg a,b,bin;
wire diff,borrow;

full_sub d3(diff,borrow,a,b,bin);

initial begin
$monitor("Time=%0d | a=%0b b=%0b bin=%0b| diff =%0b borrow=%0b", $time,a,b,bin,diff,borrow);
  a=0; b=0; bin=0;
end

always #20 a=~a;
always #10 b=~b;
always #5 bin=~bin;

initial begin # 50 $finish; end

endmodule