`timescale 1ns/1ps

module rw16x8_sync (
    output reg [7:0] dout,
    input wire [3:0] address,
    input wire WE,RE,
    input wire [7:0] din,
    input clk
);

    // 16x8 memory array (16 locations, each 8 bits wide)
    reg [7:0] RW [0:15];

    always @ (posedge clk) begin
        if (WE) begin
            RW[address] <= din;
        end
        else if (RE) begin
            dout <= RW[address];
        end
        else if (WE && RE) begin
        $display("Invalid condition");
        end
        else begin
        $display("No operation");
        end
    end
endmodule


`timescale 1ns/1ps

module tb_rw16x8_sync;
    reg [3:0] address;
    reg WE, RE;
    reg [7:0] din;
    reg clk;
    wire [7:0] dout;

    rw16x8_sync dut (
        .dout(dout),
        .address(address),
        .WE(WE),
        .RE(RE),
        .din(din),
        .clk(clk)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("rw16x8_sync.vcd");
        $dumpvars(0, tb_rw16x8_sync);
        
        // Initial state
        WE = 0; RE = 0; address = 0; din = 0;

        #13; //sampling offset
        
        $monitor("Writing | addr = %b | din = %b", address, din);
        WE = 1; RE = 0; 
        address = 4'd0; din = 8'd10; #10;
        address = 4'd1; din = 8'd20; #10;
        address = 4'd15; din = 8'd255; #10; // Testing the last address
        
        $monitor("Read | addr = %b| dout = %b", address, dout);
        WE = 0; RE = 1;
        address = 4'd0; din = 8'd10; #10;
        address = 4'd1; din = 8'd20; #10;
        address = 4'd15; din = 8'd255; #10;

        $monitor("Both on ");
        WE = 1; RE = 1;
        address = 4'd0; din = 8'd10; #10;
        address = 4'd1; din = 8'd20; #10;
        address = 4'd15; din = 8'd255; #10;

        $monitor("Both off");
        WE = 0; RE = 0;
        address = 4'd0; din = 8'd10; #10;
        address = 4'd1; din = 8'd20; #10;
        address = 4'd15; din = 8'd255; #10;

        #150 $finish;
    end
endmodule