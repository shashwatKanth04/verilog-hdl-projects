module max3(output y, input a,b,c)
function output out;
input x,y,z;
begin
out=(x>y)?((x>z)?x:z):((y>z)?y:z);
end 
endfunction

assign y=out(a,b,c);
endmodule