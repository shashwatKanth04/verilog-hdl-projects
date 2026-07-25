`timescale 1ns/1ps

module ram_sync_8x8 #(
    parameter ADDR_WIDTH = 3, 
    parameter DATA_WIDTH = 8  
)(
    input  wire clk,
    input  wire [ADDR_WIDTH-1:0] address, 
    input  wire [DATA_WIDTH-1:0] din,     
    input  wire WE,RE,                                          
    output reg  [DATA_WIDTH-1:0] dout     
);

    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH) - 1];

    always @(posedge clk) begin
        if (WE) begin
            mem[address] <= din;
        end 
        else if (RE) begin
            dout <= mem[address];
        end
    end

endmodule

`timescale 1ns/1ps

module tb_ram_sync_8x8;

    parameter ADDR_WIDTH = 3; 
    parameter DATA_WIDTH = 8;

    reg clk;
    reg [ADDR_WIDTH-1:0] address;
    reg [DATA_WIDTH-1:0] din;
    reg WE;
    reg RE;
    wire [DATA_WIDTH-1:0] dout;

    ram_sync_8x8 #(.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) dut (.clk(clk),.address(address),.din(din),.WE(WE),.RE(RE),.dout(dout));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | WE=%b | RE=%b | Addr=%d | Din=%h | Dout=%h",$time, WE, RE, address, din, dout);
        
        address = 0; din = 0; WE = 0; RE = 0;
        #13;
        
        WE = 1; address = 3'd0; din = 8'h11; #10;
        WE = 1; address = 3'd1; din = 8'h22; #10;
        WE = 1; address = 3'd7; din = 8'hFF; #10;
        WE = 0; #10;

        RE = 1; address = 3'd0; #10;
        RE = 1; address = 3'd1; #10;
        RE = 1; address = 3'd7; #10;
        RE = 0; #10;

        $finish;
    end

    initial begin
        $dumpfile("ram_sync_8x8.vcd");
        $dumpvars(0, tb_ram_sync_8x8);
    end

endmodule