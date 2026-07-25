`timescale 1ns/1ps

module rwr8x8_async (
    output reg [7:0] dout,
    input wire [2:0] address,
    input wire WE,RE,reset,
    input wire [7:0] din,
    input clk
);

    // 8x8 memory array (8 locations, each 8 bits wide)
    reg [7:0] RW [0:7];

    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            dout <= 8'b0;
        end else begin
        if (WE) begin
            RW[address] <= din;
        end 
        if (RE) begin
            dout <= RW[address];
        end
        end
    end
endmodule


`timescale 1ns/1ps

module tb_rwr8x8_async;
    reg [2:0] address;
    reg WE,RE,reset;
    reg [7:0] din;
    reg clk;
    wire [7:0] dout;
    integer i;

    rwr8x8_async dut (
        .dout(dout),
        .address(address),
        .WE(WE),
        .din(din),
        .clk(clk),
        .RE(RE),
        .reset(reset)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

$monitor("Time=%0t | Reset=%b | WE=%b | RE=%b | Addr=%d | din=%d | dout=%d", $time, reset, WE, RE, address, din, dout);
    WE = 0; RE = 0; address = 0; din = 0;
        reset = 1; #15; 
        reset = 0; #5;

        $display("Writing");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk); 
            WE = 1; address = i; din = i + 10; 
        end
        @(negedge clk) WE = 0;


        $display("Reading");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            RE = 1; address = i;
        end
        @(negedge clk) RE = 0;

        
        $display("Triggering Asynchronous Reset");
        #3; reset = 1;
        #5; reset = 0;
        
        $display("Verifying All Locations are 0");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            RE = 1; address = i;
            #1;
            if (dout !== 8'b0) 
                $display("Address %d not reset! Dout = %d", i, dout);
            else
                $display("Address %d is 0", i);
        end
        #10 $finish;
    end
    initial begin
        $dumpfile("rwr8x8_async.vcd");
        $dumpvars(0, tb_rwr8x8_async);
    end
endmodule