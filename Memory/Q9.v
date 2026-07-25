module ROM_PARA #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
) (
    input clk,
    input [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] data_out
);

//Memory Array Declared Now.
reg [DATA_WIDTH-1:0] mem[0:(1<<ADDR_WIDTH)-1];

initial begin
    $readmemh("data.txt",mem);
end

//Synchronous Clock Read
always @(posedge clk) begin
    data_out <= mem[addr];   //Non Blocking assignments inside always block ( Seauential Circuit)
end
    
endmodule

`timescale 1ns/1ps

module ROM_PARA_tb;
reg clk;
reg [3:0] addr;
wire [7:0] data_out;

ROM_PARA #(.ADDR_WIDTH(4), .DATA_WIDTH(8)) dut (
        .clk(clk),
        .addr(addr),
        .data_out(data_out)
    );

//Generate Clock Now. 
initial clk = 0;
always #5 clk = ~clk;  //Negative Pulse of Clock.


initial begin
        $display("--- Starting ROM Verification ---");
        addr = 0;
        for (integer i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            addr = i;
            @(posedge clk); 
            #1; //Eliminate Debouncing. 
            $display("Time: %0t | Addr: %h | Data Read: %h", $time, addr, data_out);
        end

        $finish;
    end
endmodule
