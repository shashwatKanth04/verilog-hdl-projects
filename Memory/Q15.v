`timescale 1ns/1ps

module param_dual_port #(
    parameter DATA_WIDTH = 8,   
    parameter ADDR_WIDTH = 6    
)(
    input                     clk,
    input                     we_a,     
    input      [ADDR_WIDTH-1:0] addr_a, 
    input      [DATA_WIDTH-1:0] data_a, 
    output reg [DATA_WIDTH-1:0] q_a,
    input                     we_b,     
    input      [ADDR_WIDTH-1:0] addr_b, 
    input      [DATA_WIDTH-1:0] data_b, 
    output reg [DATA_WIDTH-1:0] q_b   
);

    localparam DEPTH = 1 << ADDR_WIDTH;
    reg [DATA_WIDTH-1:0] ram [0:DEPTH-1]; 

    always @(posedge clk) begin
        if (we_a)
            ram[addr_a] <= data_a;
        q_a <= ram[addr_a];
    end

    always @(posedge clk) begin
        if (we_b)
            ram[addr_b] <= data_b;
        q_b <= ram[addr_b];
    end

endmodule

`timescale 1ns/1ps

module param_dual_port_tb;
    parameter D_WIDTH = 12; 
    parameter A_WIDTH = 4;
    reg clk;
    reg we_a, we_b;
    reg [A_WIDTH-1:0] addr_a, addr_b;
    reg [D_WIDTH-1:0] data_a, data_b;
    wire [D_WIDTH-1:0] q_a, q_b;
    param_dual_port #(
        .DATA_WIDTH(D_WIDTH),
        .ADDR_WIDTH(A_WIDTH)
    ) uut (
        .clk(clk),
        .we_a(we_a), .addr_a(addr_a), .data_a(data_a), .q_a(q_a),
        .we_b(we_b), .addr_b(addr_b), .data_b(data_b), .q_b(q_b)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        we_a = 0; we_b = 0;
        addr_a = 0; addr_b = 0;
        data_a = 0; data_b = 0;
        #10;
        $display("--- Writing Data ---");
        we_a = 1; addr_a = 4'h5; data_a = 12'hAAA;
        we_b = 1; addr_b = 4'hE; data_b = 12'hBBB;
        #10;
        $display("--- Reading Data ---");
        we_a = 0; we_b = 0;
        addr_a = 4'h5;
        addr_b = 4'hE;
        #10; 
        $display("Time: %0t | Port A (Addr 5): %h (Exp: AAA)", $time, q_a);
        $display("Time: %0t | Port B (Addr E): %h (Exp: BBB)", $time, q_b);

        if (q_a === 12'hAAA && q_b === 12'hBBB)
            $display("RESULT: PASSED");
        else
            $display("RESULT: FAILED");

        #20 $finish;
    end

endmodule