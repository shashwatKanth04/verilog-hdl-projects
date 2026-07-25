`timescale 1ns/1ps

module dual_port12(
    input [7:0] data_a, data_b, 
    input [5:0] addr_a, addr_b, 
    input we_a, we_b, 
    input clk, 
    output reg [7:0] q_a, q_b
);

reg [7:0] ram [63:0]; 

always @(posedge clk) begin
    if (we_a && we_b && (addr_a == addr_b)) begin
        ram[addr_a] <= data_a;
    end else begin
        if (we_a) ram[addr_a] <= data_a;
        if (we_b) ram[addr_b] <= data_b;
    end
    if (!we_a) q_a <= ram[addr_a];
    if (!we_b) q_b <= ram[addr_b];
end

endmodule

module dual_port_tb12;
    reg [7:0] data_a, data_b;
    reg [5:0] addr_a, addr_b;
    reg we_a, we_b;
    reg clk;
    wire [7:0] q_a, q_b;

    dual_port12 uut (data_a, data_b, addr_a, addr_b, we_a, we_b, clk, q_a, q_b);

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dual_port_tb);

        addr_a = 6'd10;
        addr_b = 6'd10; 
        we_a = 1'b1;
        we_b = 1'b1;
        data_a = 8'hAA; 
        data_b = 8'hBB; 
        #10; 
        we_a = 1'b0;
        we_b = 1'b0;
        #10;
        $display("Conflict Test: Address 10 contains %h (Expected AA)", q_a);
        
        if (q_a == 8'hAA) 
            $display("SUCCESS: Port A Priority maintained.");
        else 
            $display("FAILURE: Conflict logic failed.");

        #20 $finish;
    end
endmodule