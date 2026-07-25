`timescale 1ns/1ps

module rw8x8_a_sync (
    output reg [7:0] dout,
    input wire [2:0] address,
    input wire WE,RE,
    input wire [7:0] din,
    input clk
);

    // 8x8 memory array (8 locations, each 8 bits wide)
    reg [7:0] RW [0:7];

    always @ (posedge clk) begin
        if (WE) begin
            RW[address] <= din;
        end 
    end
    always @ (address)begin
        if (RE) begin
            dout = RW[address];
        end else begin
            dout = 8'b0;
        end
    end
endmodule


`timescale 1ns/1ps

module tb_rw8x8_a_sync;
    reg [2:0] address;
    reg WE,RE;
    reg [7:0] din;
    reg clk;
    wire [7:0] dout;

    rw8x8_a_sync dut (
        .dout(dout),
        .address(address),
        .WE(WE),
        .din(din),
        .clk(clk),
        .RE(RE)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        $monitor("Time=%0t | Clk=%b | WE=%b | RE =%b | Addr=%b | Data_in=%b | Data_out=%b",$time, clk, WE, RE, address, din, dout);

        WE = 0; RE = 0; address = 0; din = 0;

        #13;
$display("Writing starts");
        WE = 1; address = 3'd0; din = 8'd32  ; #10;
        WE = 1; address = 3'd1; din = 8'd1  ; #10;
        WE = 1; address = 3'd2; din = 8'd255; #10;
        WE = 1; address = 3'd7; din = 8'd67 ; #10;
        WE = 0; #10;

$display("Read starts");
        RE = 1; address = 3'd0; #10;
        RE = 1; address = 3'd1; #10;
        RE = 1; address = 3'd2; #10;
        RE = 1; address = 3'd3; #10;
        RE = 1; address = 3'd4; #10;
        RE = 1; address = 3'd5; #10;
        RE = 1; address = 3'd6; #10;
        RE = 1; address = 3'd7; #10;

        #20 $finish;
    end
    initial begin
        $dumpfile("rw8x8_a_sync.vcd");
        $dumpvars(0, tb_rw8x8_a_sync);
    end
endmodule