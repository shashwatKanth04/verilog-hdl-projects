module lumped(output out, input m,n,p,q);
wire e,f;
assign f=p&q;
assign e=m&n;
assign #15 out=e&f;


endmodule
