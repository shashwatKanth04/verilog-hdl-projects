`timescale 1ns/100ps

module vending_machine (
    input clk,
    input rst,
    input [2:0] coin,
    output reg dispense
);

    reg [3:0] current_balance, next_balance;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_balance <= 4'd0;
        else
            current_balance <= next_balance;
    end

    always @(*) begin
        next_balance = current_balance;
        dispense = 1'b0;
        case (coin)
            3'b001: begin // Insert 1
                if (current_balance + 1 >= 10) begin
                    dispense = 1'b1;
                    next_balance = 4'd0; 
                end else 
                    next_balance = current_balance + 1;
            end
            
            3'b010: begin 
                if (current_balance + 2 >= 10) begin
                    dispense = 1'b1;
                    next_balance = 4'd0;
                end else 
                    next_balance = current_balance + 2;
            end
            
            3'b100: begin 
                if (current_balance + 5 >= 10) begin
                    dispense = 1'b1;
                    next_balance = 4'd0;
                end else 
                    next_balance = current_balance + 5;
            end
            
            default: next_balance = current_balance;
        endcase
    end
endmodule



module tb_vending_machine;
    reg clk, rst;
    reg [2:0] coin;
    wire dispense;

    vending_machine dut (clk, rst, coin, dispense);

    initial clk = 0;
    always #5 clk = ~clk;

    task insert(input [2:0] val);
        begin
            @(posedge clk); #1 coin = val;
            @(posedge clk); #1 coin = 3'b000;
        end
    endtask

    initial begin
        rst = 1; coin = 0; #15 rst = 0;
        $display("Testing sequence: 5, 2, 2, 1...");
        insert(3'b100);
        insert(3'b010); 
        insert(3'b010); 
        insert(3'b001); 
        
        #20;
        

        $display("Testing sequence: 5, 5...");
        insert(3'b100); 
        insert(3'b100); 

        #50; $finish;
    end

    initial begin
        $monitor("Time=%0t | Balance=%d | Coin=%b | Dispense=%b", $time, dut.current_balance, coin, dispense);
    end
endmodule