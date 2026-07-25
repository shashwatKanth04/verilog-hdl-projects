`timescale 1ns/1ps
`include "mux_defines.vh"
`include "mux.v"
module mux_tb;
    reg [`DATA_WIDTH-1:0] i0, i1, i2, i3, i4, i5, i6, i7;  
    `ifdef MUX_2_1
        reg sel;
    `elsif MUX_4_1
        reg [1:0] sel;
    `elsif MUX_8_1
        reg [2:0] sel;
    `endif
    
    wire [`DATA_WIDTH-1:0] out;
    mux uut (
        `ifdef MUX_2_1
            .in0(i0), .in1(i1), .sel(sel),
        `elsif MUX_4_1
            .in0(i0), .in1(i1), .in2(i2), .in3(i3), .sel(sel),
        `elsif MUX_8_1
            .in0(i0), .in1(i1), .in2(i2), .in3(i3), 
            .in4(i4), .in5(i5), .in6(i6), .in7(i7), .sel(sel),
        `endif
        .out(out)
    );

    initial begin
        {i0, i1, i2, i3, i4, i5, i6, i7} = {8'd0, 8'd10, 8'd20, 8'd30, 8'd40, 8'd50, 8'd60, 8'd70};
        sel = 0;
        $display("Testing MUX_WIDTH: %0d", `MUX_WIDTH);
        for (integer i = 0; i < `MUX_WIDTH; i = i + 1) begin
            sel = i;
            #10;
            $display("Sel: %d | Out: %d", sel, out);
        end
        $finish;
    end
endmodule
