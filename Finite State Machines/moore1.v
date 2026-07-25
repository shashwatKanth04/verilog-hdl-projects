module moore1(output z, input rst,clk,x);

parameter [2:0]S0=0,S1=1,S2=2,S3=3,S4=4;
reg [2:0]current;
always @(posedge clk) begin
    if(rst)
    current<=S0;
    else begin
        case(current)
        S0: begin
            if(x==1'b1)
            current<=S1;
            else
            current<=S0;
        end
        S1: begin
            if(x==1'b1)
            current<=S1;
            else
            current<=S2;
        end
        S2: begin
            if(x==1'b1)
            current<=S3;
            else
            current<=S0;
        end
        S3: begin
            if(x==1'b1)
            current<=S4;
            else
            current<=S2;
        end
        S4: begin
            if(x==1'b1)
            current<=S1;
            else
            current<=S2;
        end
        default: current<=S0;
        endcase
    end
end
        assign z=(current==S4)?1:0;
endmodule

module tb_moore1;
    wire z;
    reg x, rst, clk;

    // Instantiate module
    moore1 m1(.z(z), .rst(rst), .clk(clk), .x(x));

    // Clock Generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        $monitor(" rst=%b | x=%b | current_state=%d | z=%b",  rst, x, m1.current, z);
        clk = 0; rst = 1; x = 0;
        
        // Release Reset
        #10 rst = 0;

        // Sequence: 1 -> 0 -> 1 -> 1
        @(negedge clk) x = 1; // Transitions to S1
        @(negedge clk) x = 0; // Transitions to S2
        @(negedge clk) x = 1; // Transitions to S3
        @(negedge clk) x = 1; // Transitions to S4 (z becomes 1 here)
        
        // Wait one more cycle to see the output at S4
        @(negedge clk) x = 0; // Transitions back to S2
        
        #20 $finish;
    end
endmodule
