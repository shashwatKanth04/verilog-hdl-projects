module evenz(
    input clk, reset, data,
    output reg z
);

parameter S_EVEN = 1'b0;
parameter S_ODD  = 1'b1;
 reg current_state, next_state;
always@(posedge clk or posedge reset) begin
  if(reset) begin
    current_state <= S_EVEN;
  end   
    else begin
     current_state <= next_state;
    end
end

always @(*) begin
  case(current_state)
  S_EVEN : next_state = data ?S_ODD:S_EVEN;
  S_ODD : next_state = data ?S_EVEN:S_ODD;

  default: next_state=S_EVEN;
  endcase
end

always @(*) begin
        if (current_state == S_ODD)
            z = 1'b1; 
        else
            z = 1'b0; 
end
    endmodule

    `timescale 1ns / 1ps

module evenz_tb;

    
    reg clk;
    reg rst;
    reg data;
    wire z;

    evenz uut (
        .clk(clk),
        .reset(rst),
        .data(data),
        .z(z)
    );

  
    always #5 clk = ~clk;


    task send_bits;
        input [2:0] bits;
        integer i;
        begin
            for (i = 0; i < 3; i = i + 1) begin
                data = bits[i];
                @(posedge clk);
            end
            
            #1; 
            $display("Input: %b | Even Parity Bit: %b", bits, z);
            
    
            rst = 1; #10; rst = 0;
        end
    endtask

    initial begin

        clk = 0; rst = 1; data = 0;
        #15 rst = 0;

        $display("Testing Even Parity Checker (Moore):");
        
        
        send_bits(3'b101); // 2 ones -> Even -> Parity 0
        send_bits(3'b111); // 3 ones -> Odd  -> Parity 1
        send_bits(3'b000); // 0 ones -> Even -> Parity 0
        send_bits(3'b100); // 1 one  -> Odd  -> Parity 1

        #20 $finish;
    end

endmodule
