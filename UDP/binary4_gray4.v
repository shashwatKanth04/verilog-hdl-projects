primitive gray_g3(g3,b3,b2,b1,b0);
output g3;
input b3,b2,b1,b0;
table
//a b c d : g3;
  0 0 0 0 : 0;  
  0 0 0 1 : 0;
  0 0 1 0 : 0;
  0 0 1 1 : 0;
  0 1 0 0 : 0;
  0 1 0 1 : 0;
  0 1 1 0 : 0;
  0 1 1 1 : 0;
  1 0 0 0 : 1;
  1 0 0 1 : 1;
  1 0 1 0 : 1;
  1 0 1 1 : 1;
  1 1 0 0 : 1;
  1 1 0 1 : 1;
  1 1 1 0 : 1;
  1 1 1 1 : 1;
endtable
endprimitive

primitive gray_g2(g2,b3,b2,b1,b0);
output g2;
input b3,b2,b1,b0;
table
//a b c d : g2;
  0 0 0 0 : 0;  
  0 0 0 1 : 0;
  0 0 1 0 : 0;
  0 0 1 1 : 0;
  0 1 0 0 : 1;
  0 1 0 1 : 1;
  0 1 1 0 : 1;
  0 1 1 1 : 1;
  1 0 0 0 : 1;
  1 0 0 1 : 1;
  1 0 1 0 : 1;
  1 0 1 1 : 1;
  1 1 0 0 : 0;
  1 1 0 1 : 0;
  1 1 1 0 : 0;
  1 1 1 1 : 0;
endtable
endprimitive

primitive gray_g1(g1,b3,b2,b1,b0);
output g1;
input b3,b2,b1,b0;
table
//a b c d : g1;
  0 0 0 0 : 0;  
  0 0 0 1 : 0;
  0 0 1 0 : 1;
  0 0 1 1 : 1;
  0 1 0 0 : 1;
  0 1 0 1 : 1;
  0 1 1 0 : 0;
  0 1 1 1 : 0;
  1 0 0 0 : 0;
  1 0 0 1 : 0;
  1 0 1 0 : 1;
  1 0 1 1 : 1;
  1 1 0 0 : 1;
  1 1 0 1 : 1;
  1 1 1 0 : 0;
  1 1 1 1 : 0;
endtable
endprimitive

primitive gray_g0(g0,b3,b2,b1,b0);
output g0;
input b3,b2,b1,b0;
table
//a b c d : g0;
  0 0 0 0 : 0;  
  0 0 0 1 : 1;
  0 0 1 0 : 1;
  0 0 1 1 : 0;
  0 1 0 0 : 0;
  0 1 0 1 : 1;
  0 1 1 0 : 1;
  0 1 1 1 : 0;
  1 0 0 0 : 0;
  1 0 0 1 : 1;
  1 0 1 0 : 1;
  1 0 1 1 : 0;
  1 1 0 0 : 0;
  1 1 0 1 : 1;
  1 1 1 0 : 1;
  1 1 1 1 : 0;
endtable
endprimitive

module binary4_gray4(output [3:0]g, input [3:0]b);
gray_g3 g1(g[3],b[3],b[2],b[1],b[0]);
gray_g2 g2(g[2],b[3],b[2],b[1],b[0]);
gray_g1 g3(g[1],b[3],b[2],b[1],b[0]);
gray_g0 g4(g[0],b[3],b[2],b[1],b[0]);
endmodule

module tb_btog;
wire [3:0]g;
reg [3:0]b;
binary4_gray4 b1(g,b);

initial begin
$monitor("Time=%0d | binary=%0d | gray=%0d",$time,b,g);
b=4'b0000;
#100 $finish;
end

always #5 b[0]=~b[0];
always #10 b[1]=~b[1];
always #20 b[2]=~b[2];
always #40 b[3]=~b[3];

endmodule