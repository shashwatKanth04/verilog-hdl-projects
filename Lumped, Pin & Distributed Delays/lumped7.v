module mux(output y, input i0,i1,sel);
assign #2 y=(sel?i1:i0);
endmodule

module tb_mux1;
wire y;
reg i0,i1,sel;
mux m0(y,i0,i1,sel);
initial begin
$monitor("time=%0d, y=%0b, i0=%0b, i1=%0b,sel=%0b",$time,y,i0,i1,sel);
i0=1'b0;i1=1'b1;sel=1'b0; #5
i0=1'b0;i1=1'b1;sel=1'b1; #5
$finish;
end

initial begin
$dumpfile("mux.vcd");
$dumpvars();
end
endmodule

