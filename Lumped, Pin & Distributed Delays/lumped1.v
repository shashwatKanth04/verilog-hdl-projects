module lumped(output out, input m,n,p,q);
wire e,f;
assign #8 f=p&q;
assign #11 e=m&n;
assign #4 out=e&f;
endmodule

