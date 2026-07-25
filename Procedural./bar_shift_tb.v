module bar_shift(
    input [7:0] d_in,
    input [2:0] shift_n,
    output [7:0] d_out
);

wire [7:0] s1;
wire [7:0] s2;

assign s1 = (shift_n[2]) ? {4'b0, d_in[7:4]} : d_in;
assign s2 = (shift_n[1]) ? {2'b0, s1[7:2]} : s1;
assign d_out = (shift_n[0]) ? {1'b0, s2[7:1]} : s2;

endmodule


module bar_shift_tb;
    reg [7:0] data_in;
    reg [2:0] shift_amt;
    wire [7:0] data_out;

    // Instantiate the shifter
    bar_shift uut (
        .d_in(data_in),
        .shift_n(shift_amt),
        .d_out(data_out)
    );

    initial begin
    

        $monitor("%b |  %d   | %b", data_in, shift_amt, data_out);

        // Test Cases
        data_in = 8'b10111010; 
        
        shift_amt = 3'd0; #10; // No shift
        shift_amt = 3'd1; #10; // Shift right by 1
        shift_amt = 3'd2; #10; // Shift right by 2
        shift_amt = 3'd4; #10; // Shift right by 4
        shift_amt = 3'd7; #10; // Shift right by 7
        
        data_in = 8'b11111111;
        shift_amt = 3'd3; #10; // Shift 255 right by 3

        $finish;
    end

    initial begin
        $dumpfile("bar_shift_tb.vcd");
        $dumpvars();
    end
endmodule