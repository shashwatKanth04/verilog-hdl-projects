module bcd_7_seg_rom(
    input wire [3:0] b_in,
    output reg [6:0] s_out
);

always@(*) begin
    case(b_in)
        4'h0: s_out = 7'b1111110;
        4'h1: s_out = 7'b0110000;
        4'h2: s_out = 7'b1101101;
        4'h3: s_out = 7'b1111001;
        4'h4: s_out = 7'b0110011;
        4'h5: s_out = 7'b1011011;
        4'h6: s_out = 7'b1011111;
        4'h7: s_out = 7'b1110000;
        4'h8: s_out = 7'b1111111;
        default: s_out= 7'b0000000;

    endcase
end
endmodule

module tb_bcd;
wire [6:0] s_out;
reg [3:0] b_in;
integer i;
bcd_7_seg_rom r1(b_in,s_out);
initial begin
    $monitor("time=%0d | b_in=%0b | s_out=%0b", $time,b_in,s_out);
    for (i = 0; i < 16; i = i + 1) begin
            b_in = i;
            $display(" %b  | %b", b_in, s_out);
        end
        $finish;
end
endmodule