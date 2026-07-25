module hamming(output [2:0]y, input [3:0]a,b);
function out;
input [3:0]x;
input [3:0]z;
reg [2:0]xorg;
integer i;
begin
xorg=x^z;
out=0;
for(i=0;i<=4;i=i+1)begin
if(xorg[i])
out=out+1;
end
end
endfunction
assign y=out(a,b);
endmodule