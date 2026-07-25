`timescale 1ns/1ps

module rw8x8_sync (
    output reg [7:0] dout,
    input wire [2:0] address,
    input wire WE,
    input wire [7:0] din,
    input clk
);

    // 8x8 memory array (8 locations, each 8 bits wide)
    reg [7:0] RW [0:7];

    always @ (posedge clk) begin
        if (WE) begin
            RW[address] <= din;
        end else begin
            dout <= RW[address];
        end
    end
endmodule


`timescale 1ns/1ps

module tb_rw8x8_sync;
    reg [2:0] address;
    reg WE;
    reg [7:0] din;
    reg clk;
    wire [7:0] dout;

    rw8x8_sync dut (
        .dout(dout),
        .address(address),
        .WE(WE),
        .din(din),
        .clk(clk)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        $monitor("Time=%0t | Clk=%b | WE=%b | Addr=%b | Data_in=%b | Data_out=%b",
                  $time, clk, WE, address, din, dout);

        WE = 0; address = 0; din = 0;

        #13;
$display("Writing starts");
        WE = 1; address = 3'd0; din = 8'd0  ; #10;
        WE = 1; address = 3'd1; din = 8'd1  ; #10;
        WE = 1; address = 3'd2; din = 8'd255; #10;
        WE = 1; address = 3'd3; din = 8'd3  ; #10;
        WE = 1; address = 3'd4; din = 8'd33 ; #10;
        WE = 1; address = 3'd5; din = 8'd111; #10;
        WE = 1; address = 3'd6; din = 8'd20 ; #10;
        WE = 1; address = 3'd7; din = 8'd67 ; #10;

$display("Read starts");
        WE = 0; address = 3'd0; #10;
        WE = 0; address = 3'd1; #10;
        WE = 0; address = 3'd2; #10;
        WE = 0; address = 3'd3; #10;
        WE = 0; address = 3'd4; #10;
        WE = 0; address = 3'd5; #10;
        WE = 0; address = 3'd6; #10;
        WE = 0; address = 3'd7; #10;

        #200 $finish;
    end
    initial begin
        $dumpfile("rw8x8_sync.vcd");
        $dumpvars(0, tb_rw8x8_sync);
        $finish;

    end
endmodule