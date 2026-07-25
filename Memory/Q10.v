module parameterized_rom #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8,
    parameter FILE_NAME = "data.txt"  
)(
    input clk,
    input [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] data_out
);


    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];

    initial begin
        $readmemh(FILE_NAME, mem);
    end

    always @(posedge clk) begin
        data_out <= mem[addr];
    end
endmodule


`timescale 1ns/1ps

module rom_verification_tb;
    reg clk;
    initial clk = 0;
    always #5 clk = ~clk;

    // --- Instance 1: Small ROM (4x8) ---
    reg [1:0] addr1;
    wire [7:0] data1;
    parameterized_rom #(
        .ADDR_WIDTH(2), 
        .DATA_WIDTH(8), 
        .FILE_NAME("Q10a.txt")
    ) rom_small (clk, addr1, data1);

    // --- Instance 2: Large ROM (16x16) ---
    reg [3:0] addr2;
    wire [15:0] data2;
    parameterized_rom #(
        .ADDR_WIDTH(4), 
        .DATA_WIDTH(16), 
        .FILE_NAME("Q10b.txt")
    ) rom_large (clk, addr2, data2);

    initial begin
        $display("--- Testing Scalable ROMs ---");
        
        // Test Small ROM
        addr1 = 2'b00;
        #15 addr1 = 2'b01;
        #10 $display("Small ROM Addr 1: %h", data1);

        // Test Large ROM
        addr2 = 4'h0;
        #15 addr2 = 4'hF;
        #10 $display("Large ROM Addr F: %h", data2);

        $finish;
    end
endmodule
