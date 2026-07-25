module Comparator_2Bit(
    input [1:0]a,b,
    output  AB, BA, ab
    );
    assign AB = (a>b);
    assign BA = (b>a);
    assign ab = (a==b);
endmodule


module Comparator_4Bit(
input [3:0]a,b,
output AB,BA,ab
);
wire g_l, h_l, e_l; //g - > a>b.  //h->b>a. //e -> a=b.
wire g_h, h_h, e_h;

    Comparator_2Bit low (.a(a[1:0]), .b(b[1:0]), .AB(g_l), .BA(h_l), .ab(e_l));
    Comparator_2Bit high (.a(a[3:2]), .b(b[3:2]), .AB(g_h), .BA(h_h), .ab(e_h));


    assign AB = g_h | (e_h & g_l);
    assign BA = h_h | (e_h & h_l);
    assign ab = e_h & e_l;

endmodule 

module tb_comp_8bit();
reg [3:0]A,B;
wire AB, BA, ab;

Comparator_4Bit c4(A,B,AB,BA,ab);

initial begin
    A = 4'b0000; B = 4'b0000;

    $monitor("Time=%0d, a = %0d, b = %0d, A>B = %0b, B>A = %0b, A=B =%0b", $time, A,B,AB,BA,ab);

 A = 4'b0110; B = 4'b0011;
#15; A = 4'b1010; B = 4'b1001;
#15; A = 4'b0110; B = 4'b1101;
#15; A = 4'b0100; B = 4'b1011;
#15; A = 4'b1110; B = 4'b1110;
#15; A = 4'b0001; B = 4'b1001;
#15; A = 4'b1011; B = 4'b1011;

    #100 $finish;
end

endmodule