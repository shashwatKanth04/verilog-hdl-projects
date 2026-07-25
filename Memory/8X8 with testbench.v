// --- DESIGN MODULE ---
module rom_8x8(
    input  [2:0] address, 
    output [7:0] data_out
);
    reg [7:0] memory [0:7];

    initial begin
        memory[0] = 8'd0;  memory[1] = 8'd2;
        memory[2] = 8'd4;  memory[3] = 8'd6;
        memory[4] = 8'd8;  memory[5] = 8'd10;
        memory[6] = 8'd12; memory[7] = 8'd14;
    end

    assign data_out = memory[address];
endmodule // Make sure this is here!

// --- TESTBENCH ---
`timescale 1ns / 1ps
module tb_rom_8x8;
    reg [2:0] address;
    wire [7:0] data_out;

    // Instantiate UUT
    rom_8x8 uut (
        .address(address), 
        .data_out(data_out)
    );

    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            address = i;
            #10;
            $display("Addr: %d | Data: %d", address, data_out);
        end
        $finish;
    end
endmodule
