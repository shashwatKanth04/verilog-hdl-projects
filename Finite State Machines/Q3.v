`timescale 1ns/100ps

module parking_gate (
    input clk,
    input rst,
    input [1:0] coin, // 01=5, 10=10, 11=20, 00=None
    output reg gate   // 1 = Open, 0 = Closed
);

    localparam S0 = 2'b00, // 0 units
               S1 = 2'b01, // 5 units
               S2 = 2'b10, // 10 units
               S3 = 2'b11; // 15 units

    reg [1:0] current_state, next_state;
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end


    always @(*) begin
        next_state = current_state;
        gate = 1'b0; 

        case (current_state)
            S0: begin
                if (coin == 2'b01)      next_state = S1; 
                else if (coin == 2'b10) next_state = S2; 
                else if (coin == 2'b11) begin
                    next_state = S0; 
                    gate = 1'b1; 
                end
            end

            S1: begin
                if (coin == 2'b01)      next_state = S2; 
                else if (coin == 2'b10) next_state = S3; 
                else if (coin == 2'b11) begin
                    next_state = S0; 
                    gate = 1'b1; 
                end
            end

            S2: begin
                if (coin == 2'b01)      next_state = S3; 
                else if (coin == 2'b10) begin
                    next_state = S0;
                    gate = 1'b1; 
                end
                else if (coin == 2'b11) begin
                    next_state = S0;
                    gate = 1'b1; 
                end
            end

            S3: begin
                if (coin != 2'b00) begin
                    next_state = S0;
                    gate = 1'b1;
                end
            end
            
            default: next_state = S0;
        endcase
    end

endmodule

`timescale 1ns/100ps

module tb_parking_gate;

    // Inputs to DUT
    reg clk;
    reg rst;
    reg [1:0] coin;

    wire gate;

    // Instantiate the Parking Gate module
    parking_gate dut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .gate(gate)
    );

    initial clk = 0;
    always #5 clk = ~clk;


    task insert_coin(input [1:0] val);
        begin
            @(posedge clk);
            #1 coin = val;  
            @(posedge clk);
            #1 coin = 2'b00; 
        end
    endtask

  
    initial begin
        rst = 1;
        coin = 2'b00;
        #20;
        rst = 0;
        #10;


        $display("Test Case 1: Inserting 10, then 10...");
        insert_coin(2'b10); 
        insert_coin(2'b10);
        #20;

        $display("Test Case 2: Inserting 5, 5, 5, then 10...");
        insert_coin(2'b01); 
        insert_coin(2'b01); 
        insert_coin(2'b01); 
        insert_coin(2'b10); 
        #20;
 
        $display("Test Case 3: Inserting 20 directly...");
        insert_coin(2'b11); 
        #20;

        $display("Test Case 4: Testing Reset...");
        insert_coin(2'b10); 
        #5 rst = 1;         
        #10 rst = 0;
        insert_coin(2'b01); 
        #20;

        $display("Simulation Finished.");
        $finish;
    end

    initial begin
        $monitor("Time=%0t | Balance_State=%b | Coin_In=%b | Gate_Open=%b", 
                 $time, dut.current_state, coin, gate);
    end

endmodule