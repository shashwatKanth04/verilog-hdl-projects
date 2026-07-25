`timescale 1ns/1ps

module simple_dual_port(
    input clk,
    input we_a,
    input [5:0] addr_a,
    input [7:0] data_a,
    input [5:0] addr_b,
    output reg [7:0] q_b
);

reg [7:0] ram [63:0]; 

always @(posedge clk) begin
    if (we_a) begin
        ram[addr_a] <= data_a;
    end
    q_b <= ram[addr_b];
end

endmodule

module simple_dual_port_tb;
    reg clk, we_a;
    reg [5:0] addr_a, addr_b;
    reg [7:0] data_a;
    wire [7:0] q_b;

    simple_dual_port uut (clk, we_a, addr_a, data_a, addr_b, q_b);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        we_a = 0; addr_a = 0; addr_b = 0; data_a = 0;
        #10;

        we_a = 1; addr_a = 6'd5; data_a = 8'hA1;
        #10;
        
        we_a = 1; addr_a = 6'd6; data_a = 8'hB2;
        addr_b = 6'd5; 
        #10;
        
        $display("Time %0t: Read Port B (Addr 5) = %h", $time, q_b);
        if (q_b == 8'hA1) 
            $display("Verification Successful: Simultaneous Read/Write working.");

        #10 $finish;
    end
endmodule