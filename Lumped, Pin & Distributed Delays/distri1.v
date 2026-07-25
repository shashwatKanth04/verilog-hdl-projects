module inv1(output reg out,input in);
always @(in) 
out=  #2 ~in;
endmodule

module inv1_tb();
wire out;
reg in;

inv1 i(out,in);

initial begin
  $monitor("time  = %0t, a= %1b,out = %1b",$time,in,out);
  in = 1'b0; #5;
  in = 1'b1; #10;
  $finish;
end

initial begin
  $dumpfile("inv1.vcd");
  $dumpvars();
end
endmodule